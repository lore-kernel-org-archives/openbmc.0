Return-Path: <alistair@popple.id.au>
Received: from ipmail07.adl2.internode.on.net (ipmail07.adl2.internode.on.net
 [150.101.137.131])
 by lists.ozlabs.org (Postfix) with ESMTP id 3tH9Gk24l9zDvWr
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 10:44:14 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BXAwAs+ihYfQpSY3pcHAEBBAEBCgEBgyYLAQEBAQF3gQCFKJ8eh2yKZYQWIIJNgzYCgl8BAgEBAQEBAhMBARYvMIRhAQEBBCcTPxALFQMJFRAPARE2GYhHAxaxHD2HJg2EEAEBAQcCASSLFoJIgWoWhWEFiEmGFwyBNYlYEzWGPIZehCqBCE+HZIV+iR2EJ4QKgTwRCxyDIRyBcSo0AYdBAQEB
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail07.adl2.internode.on.net with ESMTP; 14 Nov 2016 10:14:03 +1030
From: Alistair Popple <alistair@popple.id.au>
To: openbmc@lists.ozlabs.org
Cc: christopher.lee.bostic@gmail.com, xxpetri@de.ibm.com, zahrens@us.ibm.com
Subject: Re: [PATCH linux v6 18/18] drivers/fsi: Add SCOM FSI client device
 driver
Date: Mon, 14 Nov 2016 10:44:01 +1100
Message-ID: <1518766.oRRvze06Vl@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1477865379-11566-19-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1477865379-11566-19-git-send-email-christopher.lee.bostic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Sun, 13 Nov 2016 23:44:14 -0000

Hi Chris,

Is there a similar device driver for the CFAM/FSI that I missed? That is will 
there be a chardev for read/writing FSI addresses directly (ie. a chardev to 
call fsi_device_read/write)? Probably not critical for an initial release but 
we will need one at some point as I'm pretty sure the cronus server for 
example has get/putcfam commands as some registers aren't available via SCOM.

Regards,

Alistair

On Sun, 30 Oct 2016 05:09:20 PM christopher.lee.bostic@gmail.com wrote:
> From: Chris Bostic <cbostic@us.ibm.com>
> 
> Create a simple SCOM engine device driver that reads and writes
> across an FSI bus.
> 
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
> 
> ---
> 
> V4 - Add put_scom and get_scom operations
> 
> V5 - Add character device registration and fill in read/write
>      syscalls.
> 
> V6 - Add multi scom engine support. Add list of devices.
>      Use file private data to store and hand off scom structures.
> 
>    - Add lseek, open, close
> 
>    - Remove data/address structure to pass from user space to
>      kernel.  Use offset provided by read/write and pass data
> 
>    - Added list setup in init and so did not add the macro
>      module_fsi_driver
> 
>    - Global structs made static where possible.
> 
>    - Change from char dev to use misc device api as shown
>      in examples from Jeremy Kere.
> ---
>  drivers/fsi/Kconfig    |   6 ++
>  drivers/fsi/Makefile   |   1 +
>  drivers/fsi/fsi-scom.c | 238 
+++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 245 insertions(+)
>  create mode 100644 drivers/fsi/fsi-scom.c
> 
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index b21fe3c..1fa9bc0 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -23,6 +23,12 @@ config FSI_MASTER_GPIO
>  	depends on FSI
>  	---help---
>  	This option enables a FSI master driver using GPIO lines.
> +
> +config FSI_SCOM
> +	tristate "SCOM FSI client"
> +	depends on FSI
> +	---help---
> +	This option enables the SCOM FSI client device driver.
>  endif
>  
>  endmenu
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index 2021ce5..3e31d9a 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_FSI) += fsi-core.o
>  obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
>  obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
> +obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> new file mode 100644
> index 0000000..27be082
> --- /dev/null
> +++ b/drivers/fsi/fsi-scom.c
> @@ -0,0 +1,238 @@
> +/*
> + * SCOM FSI Client device driver
> + *
> + * Copyright (C) IBM Corporation 2016
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/fsi.h>
> +#include <linux/module.h>
> +#include <linux/cdev.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>
> +#include <linux/slab.h>
> +#include <linux/miscdevice.h>
> +#include <linux/list.h>
> +
> +#define FSI_ENGID_SCOM		0x5
> +
> +#define SCOM_FSI2PIB_DELAY	50
> +
> +/* SCOM engine register set */
> +#define SCOM_DATA0_REG		0x00
> +#define SCOM_DATA1_REG		0x04
> +#define SCOM_CMD_REG		0x08
> +#define SCOM_RESET_REG		0x1C
> +
> +#define SCOM_RESET_CMD		0x80000000
> +#define SCOM_WRITE_CMD		0x80000000
> +
> +struct scom_device {
> +	struct list_head link;
> +	struct fsi_device *fsi_dev;
> +	struct miscdevice mdev;
> +	char	name[32];
> +};
> +
> +#define to_scom_dev(x)		container_of((x), struct scom_device, 
mdev)
> +
> +static struct list_head scom_devices;
> +static atomic_t scom_idx = ATOMIC_INIT(0);
> +static int scom_probe(struct device *);
> +
> +static int put_scom(struct scom_device *scom_dev, uint64_t value,
> +			uint32_t addr)
> +{
> +	int rc;
> +	uint32_t data = SCOM_RESET_CMD;
> +
> +	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_RESET_REG, &data,
> +				sizeof(uint32_t));
> +	if (rc)
> +		return rc;
> +
> +	data = (value >> 32) & 0xffffffff;
> +	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA0_REG, &data,
> +				sizeof(uint32_t));
> +	if (rc)
> +		return rc;
> +
> +	data = value & 0xffffffff;
> +	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA1_REG, &data,
> +				sizeof(uint32_t));
> +	if (rc)
> +		return rc;
> +
> +	data = SCOM_WRITE_CMD | addr;
> +	return fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
> +				sizeof(uint32_t));
> +}
> +
> +static int get_scom(struct scom_device *scom_dev, uint64_t *value,
> +			uint32_t addr)
> +{
> +	uint32_t result, data;
> +	int rc;
> +
> +	udelay(SCOM_FSI2PIB_DELAY);
> +
> +	data = addr;
> +	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
> +				sizeof(uint32_t));
> +	if (rc)
> +		return rc;
> +
> +	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA0_REG, &result,
> +				sizeof(uint32_t));
> +	if (rc)
> +		return rc;
> +
> +	*value |= (uint64_t) result << 32;
> +	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA1_REG, &result,
> +				sizeof(uint32_t));
> +	if (rc)
> +		return rc;
> +
> +	*value |= result;
> +
> +	return 0;
> +}
> +
> +static loff_t scom_llseek(struct file *filep, loff_t offset, int whence)
> +{
> +	if (whence != 0)  /* SEEK_SET */
> +		return -EINVAL;
> +
> +	filep->f_pos = offset;
> +	return offset;
> +}
> +
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
> +
> +static ssize_t scom_write(struct file *filep, const char __user *buf,
> +			size_t len, loff_t *offset)
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
> +	rc = copy_from_user(&val, buf, len);
> +	if (rc) {
> +		dev_dbg(dev, "copy from user failed:%d\n", rc);
> +		return -EINVAL;
> +	}
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
> 
