Return-Path: <f.fainelli@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::241; helo=mail-ot0-x241.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VqNjNCf2"; 
 dkim-atps=neutral
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z5FDX6pPmzDrVf
 for <openbmc@lists.ozlabs.org>; Tue, 26 Dec 2017 10:09:16 +1100 (AEDT)
Received: by mail-ot0-x241.google.com with SMTP id h9so30217576oti.0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Dec 2017 15:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1j3lCWn0h1ld4tYViAz8RuK6NXBPm0OLnepSTxJFYvo=;
 b=VqNjNCf2AQMNiwkX6P2v0E2SjdX/h+FRLl+HQXCrR0qNSz2TDaJV1ta3M/4c04zTCh
 a5EKJr+oidSr2E6Pz2i0YJm97LuzJDwHtTTJYOj0XqHSsBL7cJpy1la7dXma6i61UBUE
 6QybZDRKuW11kOIobl3wqe1dqFvFVCXxWRpXvI1aU6Xewebrrcfpo3cNm4zUbzXxoiYy
 XH7jbOHYyq2jTbvB2lQAxT9b5GQ1lvulxdolNHjavxJMGzzpM6VfThyuX0HOC+7J5NIj
 sDxhWJ01KWNmzixw3/IMegsaRoCSliGooxr6teEXi3zCKdOT/VI5GlWrI7La+1W+RH9r
 zqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1j3lCWn0h1ld4tYViAz8RuK6NXBPm0OLnepSTxJFYvo=;
 b=J+knhPccoLhmLQkHfl8+cQj2sgTjgHKoK1faR5+giCFgdVTFIJvg8j6wR4xkZb3Poz
 c8VpjZJQxn6zEgJUyEaiLtvt43AZR9FqHpw0LZMGmI0+LvymmAOOfUZoMewVAasezyL4
 0jUNcQ98cVHwty152FGqS8bl7CMLgZkvDd8jKU2CrOwLzpz0y4DNVeOcr5CJIoIL8cEl
 RCYboZXhj9e2EBmazF3mRFwaIHunahfmNIqdUL5MBL3pNXWyrB1ExRC7lFMMTy+qq3Pt
 65bH4gOfuDZelmidUng1UnMMIWLRwDP9HlHPSLFnuphUKjnRaUhGcC1OiPFzLmT0nCxc
 HRKA==
X-Gm-Message-State: AKGB3mKisC1CeM0m09TUNWrpbYL2gURy3Z0ab95z7kzff+kvV599e1ks
 z7+vR/iEyseJpIywzP5wLtw=
X-Google-Smtp-Source: ACJfBoumqK7wgK0/RNRGwXi8L4LvGkY4JE76gLq0pEDO5jmaItwOI6wsQDibPJf85KEL6zyX4xSw4Q==
X-Received: by 10.157.67.8 with SMTP id s8mr18276619ote.51.1514243352233;
 Mon, 25 Dec 2017 15:09:12 -0800 (PST)
Received: from [192.168.1.2] (ip68-109-195-31.pv.oc.cox.net. [68.109.195.31])
 by smtp.googlemail.com with ESMTPSA id
 79sm474716oth.14.2017.12.25.15.09.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Dec 2017 15:09:11 -0800 (PST)
Subject: Re: [patch v15 1/4] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-2-git-send-email-oleksandrs@mellanox.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <13433849-cb7d-e2c0-4ce9-d91a6012d7d7@gmail.com>
Date: Mon, 25 Dec 2017 15:09:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1514202808-29747-2-git-send-email-oleksandrs@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Dec 2017 23:09:18 -0000

Le 12/25/17 à 03:53, Oleksandr Shamray a écrit :
> Initial patch for JTAG driver
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.
> 
> Driver exposes set of IOCTL to user space for:
> - XFER:
> - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>   number of clocks).
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
> 
> Driver core provides set of internal APIs for allocation and
> registration:
> - jtag_register;
> - jtag_unregister;
> - jtag_alloc;
> - jtag_free;
> 
> Platform driver on registration with jtag-core creates the next
> entry in dev folder:
> /dev/jtagX

Just some general comment, I am really surprised to see that there is
not a whole lot of generic code, actually, there is none, which tries to
manage the JTAG devices command queue, e.g: ala OpenOCD. All that this
is doing here is create a special character device with a bunch of
custom ioctl(), which means that a lot of code is going to be put within
in individual drivers. Have you given some thoughts on how you would
expand this framework for non ASPEED JTAG adapters? For instance, one
expectation is to see a bit-banged GPIO master, since that's quite
common, what would it look like here? How much code would I have to write?

[snip]

> +
> +void *jtag_priv(struct jtag *jtag)
> +{
> +	return jtag->priv;
> +}
> +EXPORT_SYMBOL_GPL(jtag_priv);

Can't you just create a static inline function in the public header for
that? This is usually what subsystems do, I can understand why you would
not want to expose struct jtag to other parts of the kernel, but still,
this looks ugly, so maybe consider splitting the header between provider
and consumer?

> +
> +static long jtag_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	struct jtag *jtag = file->private_data;
> +	struct jtag_run_test_idle idle;
> +	struct jtag_xfer xfer;
> +	u8 *xfer_data;
> +	u32 data_size;
> +	u32 value;
> +	int err;
> +
> +	if (!arg)
> +		return -EINVAL;
> +
> +	switch (cmd) {
> +	case JTAG_GIOCFREQ:
> +
> +		if (jtag->ops->freq_get)
> +			err = jtag->ops->freq_get(jtag, &value);
> +		else
> +			err = -EOPNOTSUPP;
> +		if (err)
> +			break;
> +
> +		if (put_user(value, (__u32 *)arg))
> +			err = -EFAULT;
> +		break;
> +
> +	case JTAG_SIOCFREQ:
> +		if (get_user(value, (__u32 *)arg))
> +			return -EFAULT;
> +		if (value == 0)
> +			return -EINVAL;
> +
> +		if (jtag->ops->freq_set)
> +			err = jtag->ops->freq_set(jtag, value);
> +		else
> +			err = -EOPNOTSUPP;

You should check that before get_user()

> +		break;
> +
> +	case JTAG_IOCRUNTEST:
> +		if (copy_from_user(&idle, (void *)arg,
> +				   sizeof(struct jtag_run_test_idle)))
> +			return -EFAULT;
> +
> +		if (idle.endstate > JTAG_STATE_PAUSEDR)
> +			return -EINVAL;
> +
> +		if (jtag->ops->idle)
> +			err = jtag->ops->idle(jtag, &idle);
> +		else
> +			err = -EOPNOTSUPP;
> +		break;

Same here.

> +
> +	case JTAG_IOCXFER:
> +		if (copy_from_user(&xfer, (void *)arg,
> +				   sizeof(struct jtag_xfer)))
> +			return -EFAULT;
> +
> +		if (xfer.length >= JTAG_MAX_XFER_DATA_LEN)
> +			return -EINVAL;
> +
> +		if (xfer.type > JTAG_SDR_XFER)
> +			return -EINVAL;
> +
> +		if (xfer.direction > JTAG_WRITE_XFER)
> +			return -EINVAL;
> +
> +		if (xfer.endstate > JTAG_STATE_PAUSEDR)
> +			return -EINVAL;
> +
> +		data_size = DIV_ROUND_UP(xfer.length, BITS_PER_BYTE);
> +		xfer_data = memdup_user(u64_to_user_ptr(xfer.tdio), data_size);
> +
> +		if (!xfer_data)
> +			return -EFAULT;
> +
> +		if (jtag->ops->xfer) {
> +			err = jtag->ops->xfer(jtag, &xfer, xfer_data);
> +		} else {
> +			kfree(xfer_data);
> +			return -EOPNOTSUPP;
> +		}

Why don't you move all of the code here into a function which will make
the error handling consistent? Also, checking whether the jtag adapter
implements ops->xfer should probably be done before you do the
memdup_user().

> +
> +		if (err) {
> +			kfree(xfer_data);
> +			return -EFAULT;
> +		}
> +
> +		err = copy_to_user(u64_to_user_ptr(xfer.tdio),
> +				   (void *)(xfer_data), data_size);
> +
> +		if (err) {
> +			kfree(xfer_data);
> +			return -EFAULT;
> +		}
> +
> +		kfree(xfer_data);
> +		if (copy_to_user((void *)arg, &xfer, sizeof(struct jtag_xfer)))
> +			return -EFAULT;
> +		break;
> +
> +	case JTAG_GIOCSTATUS:
> +		if (jtag->ops->status_get)
> +			err = jtag->ops->status_get(jtag, &value);
> +		else
> +			err = -EOPNOTSUPP;
> +		if (err)
> +			break;
> +
> +		err = put_user(value, (__u32 *)arg);
> +		if (err)
> +			err = -EFAULT;
> +		break;
> +	case JTAG_SIOCMODE:
> +		if (get_user(value, (__u32 *)arg))
> +			return -EFAULT;
> +		if (value == 0)
> +			return -EINVAL;
> +
> +		if (jtag->ops->mode_set)
> +			err = jtag->ops->mode_set(jtag, value);
> +		else
> +			err = -EOPNOTSUPP;
> +		break;

Same here, this can be checked before get_user().

> +
> +	default:
> +		return -EINVAL;
> +	}
> +	return err;
> +}
> +
> +static int jtag_open(struct inode *inode, struct file *file)
> +{
> +	struct jtag *jtag = container_of(file->private_data, struct jtag,
> +					 miscdev);
> +
> +	if (mutex_lock_interruptible(&jtag->open_lock))
> +		return -ERESTARTSYS;
> +
> +	if (jtag->opened) {
> +		mutex_unlock(&jtag->open_lock);
> +		return -EINVAL;

-EBUSY maybe?

> +	}
> +
> +	nonseekable_open(inode, file);
> +	file->private_data = jtag;
> +	jtag->opened = true;
> +	mutex_unlock(&jtag->open_lock);
> +	return 0;
> +}
> +
> +static int jtag_release(struct inode *inode, struct file *file)
> +{
> +	struct jtag *jtag = file->private_data;
> +
> +	mutex_lock(&jtag->open_lock);
> +	jtag->opened = false;
> +	mutex_unlock(&jtag->open_lock);
> +	return 0;
> +}
> +
> +static const struct file_operations jtag_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= jtag_open,
> +	.release	= jtag_release,
> +	.llseek		= noop_llseek,
> +	.unlocked_ioctl = jtag_ioctl,
> +};
> +
> +struct jtag *jtag_alloc(size_t priv_size, const struct jtag_ops *ops)
> +{
> +	struct jtag *jtag;
> +
> +	jtag = kzalloc(sizeof(*jtag) + round_up(priv_size, ARCH_DMA_MINALIGN),
> +		       GFP_KERNEL);
> +	if (!jtag)
> +		return NULL;

If you set ARCH_DMA_MINALIGN to 1 when not defined, what is this
achieving that kmalloc() is not already doing?

> +
> +	jtag->ops = ops;
> +	return jtag;
> +}
> +EXPORT_SYMBOL_GPL(jtag_alloc);
> +
> +void jtag_free(struct jtag *jtag)
> +{
> +	kfree(jtag);
> +}
> +EXPORT_SYMBOL_GPL(jtag_free);
> +
> +int jtag_register(struct jtag *jtag)
> +{
> +	char *name;
> +	int err;
> +	int id;
> +
> +	id = ida_simple_get(&jtag_ida, 0, 0, GFP_KERNEL);
> +	if (id < 0)
> +		return id;
> +
> +	jtag->id = id;
> +
> +	name = kzalloc(MAX_JTAG_NAME_LEN, GFP_KERNEL);
> +	if (!name) {
> +		err = -ENOMEM;
> +		goto err_jtag_alloc;
> +	}

Can't you use jtag->miscdev.dev here to simplify the allocation error
handling?

> +
> +	err = snprintf(name, MAX_JTAG_NAME_LEN, "jtag%d", id);
> +	if (err < 0)
> +		goto err_jtag_name;
> +
> +	mutex_init(&jtag->open_lock);
> +	jtag->miscdev.fops =  &jtag_fops;
> +	jtag->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	jtag->miscdev.name = name;
> +
> +	err = misc_register(&jtag->miscdev);
> +	if (err)
> +		dev_err(jtag->dev, "Unable to register device\n");
> +	else
> +		return 0;
> +	jtag->opened = false;
> +
> +err_jtag_name:
> +	kfree(name);
> +err_jtag_alloc:
> +	ida_simple_remove(&jtag_ida, id);
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(jtag_register);
> +
> +void jtag_unregister(struct jtag *jtag)
> +{
> +	misc_deregister(&jtag->miscdev);
> +	kfree(jtag->miscdev.name);
> +	ida_simple_remove(&jtag_ida, jtag->id);
> +}
> +EXPORT_SYMBOL_GPL(jtag_unregister);
> +
> +static void __exit jtag_exit(void)
> +{
> +	ida_destroy(&jtag_ida);
> +}
> +
> +module_exit(jtag_exit);
> +
> +MODULE_AUTHOR("Oleksandr Shamray <oleksandrs@mellanox.com>");
> +MODULE_DESCRIPTION("Generic jtag support");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/jtag.h b/include/linux/jtag.h
> new file mode 100644
> index 0000000..312c641
> --- /dev/null
> +++ b/include/linux/jtag.h
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// include/linux/jtag.h - JTAG class driver
> +//
> +// Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> +// Copyright (c) 2017 Oleksandr Shamray <oleksandrs@mellanox.com>
> +
> +#ifndef __JTAG_H
> +#define __JTAG_H
> +
> +#include <uapi/linux/jtag.h>
> +
> +#ifndef ARCH_DMA_MINALIGN
> +#define ARCH_DMA_MINALIGN 1
> +#endif

Why?

> +
> +#define jtag_u64_to_ptr(arg) ((void *)(uintptr_t)arg)
> +
> +#define JTAG_MAX_XFER_DATA_LEN 65535
> +
> +struct jtag;
> +/**
> + * struct jtag_ops - callbacks for jtag control functions:
> + *
> + * @freq_get: get frequency function. Filled by device driver
> + * @freq_set: set frequency function. Filled by device driver
> + * @status_get: set status function. Filled by device driver
> + * @idle: set JTAG to idle state function. Filled by device driver
> + * @xfer: send JTAG xfer function. Filled by device driver
> + */
> +struct jtag_ops {
> +	int (*freq_get)(struct jtag *jtag, u32 *freq);
> +	int (*freq_set)(struct jtag *jtag, u32 freq);
> +	int (*status_get)(struct jtag *jtag, u32 *state);
> +	int (*idle)(struct jtag *jtag, struct jtag_run_test_idle *idle);
> +	int (*xfer)(struct jtag *jtag, struct jtag_xfer *xfer, u8 *xfer_data);
> +	int (*mode_set)(struct jtag *jtag, u32 mode_mask);
> +};
> +
> +void *jtag_priv(struct jtag *jtag);
> +int jtag_register(struct jtag *jtag);
> +void jtag_unregister(struct jtag *jtag);
> +struct jtag *jtag_alloc(size_t priv_size, const struct jtag_ops *ops);
> +void jtag_free(struct jtag *jtag);
> +
> +#endif /* __JTAG_H */
> diff --git a/include/uapi/linux/jtag.h b/include/uapi/linux/jtag.h
> new file mode 100644
> index 0000000..cda2520
> --- /dev/null
> +++ b/include/uapi/linux/jtag.h

[snip]

> +struct jtag_xfer {
> +	__u8	type;
> +	__u8	direction;

Can these two be an enum referring to what you defined earlier?

> +	__u8	endstate;
> +	__u32	length;
> +	__u64	tdio;
> +};
-- 
Florian
