Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szvPS0PRzzDsxX
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 14:27:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3szvPR54DKz9s5w;
 Thu, 20 Oct 2016 14:27:07 +1100 (AEDT)
Subject: Re: [PATCH linux v5 17/18] drivers/fsi: Add SCOM FSI client device
 driver
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
Message-ID: <918db920-baf4-ef79-90fe-dc00a06a2430@ozlabs.org>
Date: Thu, 20 Oct 2016 11:27:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2016 03:27:08 -0000

Hi Chris,

> diff > +static int scom_probe(struct device *);
> +
> +struct scom_op {
> +	uint64_t	data;
> +	uint32_t	addr;
> +};

You're making this a userspace interface, so this should go into the
uapi headers (and then will form part of the unchangeable Linux ABI).
However, more on the ABI below...

> +struct scom_device {
> +	struct fsi_device *fsi_dev;
> +	struct cdev *cdev;
> +};
> +
> +struct scom_device scom_dev;
> +
> +struct fsi_device_id scom_ids[] = {
> +	{
> +		.engine_type = FSI_ENGID_SCOM,
> +		.version = FSI_VERSION_ANY,
> +	},
> +	{ 0 }
> +};
> +
> +struct fsi_driver scom_drv = {
> +	.id_table = scom_ids,
> +	.drv = {
> +		.name = "scom",
> +		.bus = &fsi_bus_type,
> +		.probe = scom_probe,
> +	}
> +};

Make these static, and put after the code, just before the
module_fsi_driver. Then you won't need the forward definition of
scom_probe.

> > +static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
> +			loff_t *offset)
> +{
> +	int rc = 0;
> +	struct scom_op op;
> +	struct scom_device *scom = &scom_dev;
> +	struct device *dev = &scom->fsi_dev->dev;
> +
> +	/* todo: Retrieve device to operate on from filep->private_data */

Yep, otherwise you only get one scom interface, and crazy results if you
get probed twice. I'd suggest not leaving this until later.

> +
> +	if (len != sizeof(struct scom_op))
> +		return -EINVAL;
> +
> +	rc = copy_from_user(&op, buf, len);
> +	if (rc) {
> +		dev_dbg(dev, "copy from user failed:%d\n", rc);
> +		return -EINVAL;
> +	}
> +
> +	rc = get_scom(&op.data, op.addr);

I'm not a huge fan of that ABI to userspace. You already have the
address in the offset argument, so you can do this without needing new
uapi headers, using something like:

static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
			loff_t *offset)
{
	uint64_t val;

	/* todo: can we do 1/2/4/8 byte operations too? */
	if (len != sizeof(uint64_t))
		return -EINVAL;

	rc = get_scom(&val, offset);
	if (rc)
		return rc;

	rc = copy_to_user(&val, buf, len);

	return rc ? rc : len;
}


Also, have you thought about endianness?
	

> +static int scom_probe(struct device *dev)
> +{
> +	struct fsi_device *fsi_dev = to_fsi_dev(dev);
> +	struct scom_device *scom = &scom_dev;
> +	int rc;
> +
> +	scom->fsi_dev = fsi_dev;
> +	scom->cdev = cdev_alloc();
> +	if (!scom->cdev)
> +		return -ENOMEM;
> +
> +	scom->cdev->owner = THIS_MODULE;
> +
> +	rc = register_chrdev(0, "scom", &scom_fops);
> +	if (rc < 0) {
> +		dev_dbg(dev, "scom major allocation failed:%d\n", rc);
> +		return rc;
> +	}
> +	dev_dbg(dev, "scom major allocated:%d\n", rc);

You need to register the actual device too, right? We'll want scom0,
scom1, etc.

Cheers,


Jeremy
