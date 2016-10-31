Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6c6417VxzDvRg
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 12:22:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3t6c634h0xz9ryZ;
 Mon, 31 Oct 2016 12:22:03 +1100 (AEDT)
Subject: Re: [PATCH linux v6 18/18] drivers/fsi: Add SCOM FSI client device
 driver
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1477865379-11566-19-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <9b22edbb-f00e-32fc-e65f-9e5fb7cf6bf1@ozlabs.org>
Date: Mon, 31 Oct 2016 09:22:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477865379-11566-19-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Oct 2016 01:22:04 -0000

Hi Chris,

> Create a simple SCOM engine device driver that reads and writes
> across an FSI bus.

Looking good. Is this functional at the moment?

A few comments:

> +static struct list_head scom_devices;
> +static atomic_t scom_idx = ATOMIC_INIT(0);
> +static int scom_probe(struct device *);

You don't need this forward declaration anymore

> +static int get_scom(struct scom_device *scom_dev, uint64_t *value,
> +			uint32_t addr)
> +{
> +	uint32_t result, data;
> +	int rc;
> +
> +	udelay(SCOM_FSI2PIB_DELAY);

Why this udelay()? Does put_scom() not need it too then? If it's a
matter of scom engine state, should we adjust this based on the last
operation?

If it's necessary, can you add a short comment?

> +static loff_t scom_llseek(struct file *filep, loff_t offset, int whence)
> +{
> +	if (whence != 0)  /* SEEK_SET */
> +		return -EINVAL;
> +
> +	filep->f_pos = offset;
> +	return offset;
> +}

I think you can drop this and use .llseek = no_seek_end_llseek instead
(and then you get SEEK_CUR support too).

> +static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
> +			loff_t *offset)
> +{
> +	int rc = 0;
> +	struct miscdevice *mdev =
> +				(struct miscdevice *)filep->private_data;
> +	struct scom_device *scom = to_scom_dev(mdev);
> +	struct device *dev = &scom->fsi_dev->dev;
> +	uint64_t val;
> +
> +	if (len != sizeof(uint64_t))
> +		return -EINVAL;
> +
> +	rc = get_scom(scom, &val, *offset);
> +	if (rc) {
> +		dev_dbg(dev, "get_scom fail:%d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = copy_to_user(buf, &val, len);
> +	if (rc)
> +		dev_dbg(dev, "copy to user failed:%d\n", rc);
> +
> +	return rc ? rc : len;
> +}

What are the semantics of offset after reading & writing? Should two
reads (with no intervening llseek) read the same address, or subsequent
addresses?

> +static ssize_t scom_write(struct file *filep, const char __user *buf,
> +			size_t len, loff_t *offset)
> +{
> +	int rc = 0;

No need to initialise this (and in scom_read too).

> +	struct miscdevice *mdev =
> +				(struct miscdevice *)filep->private_data;
> +	struct scom_device *scom = to_scom_dev(mdev);
> +	struct device *dev = &scom->fsi_dev->dev;
> +	uint64_t val;
> +
> +	if (len != sizeof(uint64_t))
> +		return -EINVAL;
> +
> +	rc = copy_from_user(&val, buf, len);
> +	if (rc) {
> +		dev_dbg(dev, "copy from user failed:%d\n", rc);
> +		return -EINVAL;
> +	}

You don't want to squash that return value; just return rc there.

> +
> +	rc = put_scom(scom, val, *offset);
> +	if (rc)
> +		dev_dbg(dev, "put_scom failed with:%d\n", rc);
> +
> +
> +	return rc ? rc : len;
> +}
> +
> +static const struct file_operations scom_fops = {
> +	.owner	= THIS_MODULE,
> +	.llseek	= scom_llseek,
> +	.read	= scom_read,
> +	.write	= scom_write,
> +};
> +
> +static int scom_probe(struct device *dev)
> +{
> +	struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +	struct scom_device *scom = NULL;

No need to initialise this either.

> +
> +	scom = devm_kzalloc(dev, sizeof(*scom), GFP_KERNEL);
> +	if (!scom)
> +		return -ENOMEM;
> +
> +	snprintf(scom->name, sizeof(scom->name),
> +			"scom%d", atomic_inc_return(&scom_idx));
> +	scom->fsi_dev = fsi_dev;
> +	scom->mdev.minor = MISC_DYNAMIC_MINOR;
> +	scom->mdev.fops = &scom_fops;
> +	scom->mdev.name = scom->name;
> +	scom->mdev.parent = dev;
> +	list_add(&scom->link, &scom_devices);
> +
> +	return misc_register(&scom->mdev);
> +}
> +
> +static struct fsi_device_id scom_ids[] = {
> +	{
> +		.engine_type = FSI_ENGID_SCOM,
> +		.version = FSI_VERSION_ANY,
> +	},
> +	{ 0 }
> +};
> +
> +static struct fsi_driver scom_drv = {
> +	.id_table = scom_ids,
> +	.drv = {
> +		.name = "scom",
> +		.bus = &fsi_bus_type,
> +		.probe = scom_probe,
> +	}
> +};
> +
> +static int scom_init(void)
> +{
> +	INIT_LIST_HEAD(&scom_devices);
> +	return fsi_driver_register(&scom_drv);
> +}
> +
> +static void scom_exit(void)
> +{
> +	struct list_head *pos;
> +	struct scom_device *scom = NULL;

... or this.

> +
> +	list_for_each(pos, &scom_devices) {
> +		scom = list_entry(pos, struct scom_device, link);
> +		misc_deregister(&scom->mdev);
> +		devm_kfree(&scom->fsi_dev->dev, scom);
> +	}
> +	fsi_driver_unregister(&scom_drv);
> +}
> +
> +module_init(scom_init);
> +module_exit(scom_exit);
> +MODULE_LICENSE("GPL");

Cheers,


Jeremy
