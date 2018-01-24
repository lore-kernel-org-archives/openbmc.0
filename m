Return-Path: <tcminyard@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aAxYch3W"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zRXhp4lf9zDqrL
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 04:48:41 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id m136so3199084pga.12
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 09:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WQ+RBh4x11s1JlnCD1aiNovbJ/61ccznF4TfCD9ZbJg=;
 b=aAxYch3WVp4pF2D+H9hVBRb+cROqrCBFhnLCH8DiNb6W1+on38fNtbR9O2oynMTIc2
 UU2kLza6MzCBGIj2qksjBDvoDH9X3sy/su+rIiRDSY6tObWiUGFYFOYLZ1x2c8PQIeHo
 LERm0grr0V/t8ZssFV1Hk8b9/eFFNWb5f8eyC2zmDUuNBhvxzWrNCCIGFKX1i70zVTfV
 cdLdqMVSissJMbFiHtN79hMwnPngy0y0SfCSByPiRAzY/R5SCq3Gb+IHf3d5NpEZ928R
 8Qn6bSuQY1KLKBIg7b0siA64Eo25+3SpKPXRUyrZk9yo2lTl3aePVpbbqX5bM2FM+dvE
 HwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=WQ+RBh4x11s1JlnCD1aiNovbJ/61ccznF4TfCD9ZbJg=;
 b=SOlytkaT9dJyPqeLEDrcz/o10DzYTE89PD0ZNGO8gQkBB9zRiU/7hesvjXr2v9YQxM
 dfuEKa6zAvk34if3mcx3cjzsMHY+aecRvDsH3fi2bpyNeOIvE9Z9Bt3mqT670qOZxLZ8
 m64LeuWQanGGZfLr5aOH2vMmouznRq5drtKgnycFoex+/Leh4LzET+MzOLc0XMdUP07O
 9G2sgkSIVC7VYycxaZWFuutxvsKx/b6f9bOce1LCgbpH7IywWswsE3kqNsbBEBB2V5DX
 yr7vIqdShTsS7WWdtya8Q14RHrjS8ETayx3SCZWpvXoSMG9PzurMT7P9wiLS4aauiR3r
 mAsQ==
X-Gm-Message-State: AKwxytdQW5ccsXLU9qxny4Gc2ToQkN2d5HHZA+v1X7dXHTaVH6Ua9ueW
 NxkEtsOy6DhYSUxDalQmdQ==
X-Google-Smtp-Source: AH8x226gY/lJnmfS7pqVjstm0kvBqqgXJO98y+Jm4VTK5grtB1MnDML4Nams5vV15xPxSny9rs3dnA==
X-Received: by 2002:a17:902:2be4:: with SMTP id
 l91-v6mr8714185plb.387.1516816119451; 
 Wed, 24 Jan 2018 09:48:39 -0800 (PST)
Received: from [192.168.27.3] ([47.184.168.85])
 by smtp.gmail.com with ESMTPSA id c8sm10112687pfm.130.2018.01.24.09.48.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jan 2018 09:48:38 -0800 (PST)
Reply-To: minyard@acm.org
Subject: Re: [PATCH arm/aspeed/ast2500 v2] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: Haiyue Wang <haiyue.wang@linux.intel.com>, minyard@acm.org,
 joel@jms.id.au, avifishman70@gmail.com, openbmc@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1516810009-16353-1-git-send-email-haiyue.wang@linux.intel.com>
From: Corey Minyard <tcminyard@gmail.com>
Message-ID: <f20da565-6644-3ea4-823b-a808cf613958@gmail.com>
Date: Wed, 24 Jan 2018 11:48:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1516810009-16353-1-git-send-email-haiyue.wang@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jan 2018 17:48:43 -0000

On 01/24/2018 10:06 AM, Haiyue Wang wrote:
> The KCS (Keyboard Controller Style) interface is used to perform in-band
> IPMI communication between a server host and its BMC (BaseBoard Management
> Controllers).
>
> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and AST2500)
> as a character device. Such SOCs are commonly used as BMCs and this driver
> implements the BMC side of the KCS interface.
>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>
> ---
> v1->v2
>
> - Divide the driver into two parts, one handles the BMC KCS IPMI 2.0 state;
>    the other handles the BMC KCS controller such as AST2500 IO accessing.
> - Use the spin lock APIs to handle the device file operations and BMC chip
>    IRQ inferface for accessing the same KCS BMC data structure.
> - Enhanced the phases handling of the KCS BMC.
> - Unified the IOCTL definition for IPMI BMC, it will be used by KCS and BT.
>
> ---
>   .../devicetree/bindings/ipmi/aspeed-kcs-bmc.txt    |  26 ++
>   drivers/char/ipmi/Kconfig                          |  20 +
>   drivers/char/ipmi/Makefile                         |   2 +
>   drivers/char/ipmi/kcs_bmc.c                        | 430 +++++++++++++++++++++
>   drivers/char/ipmi/kcs_bmc.h                        |  88 +++++
>   drivers/char/ipmi/kcs_bmc_aspeed.c                 | 319 +++++++++++++++
>   include/uapi/linux/ipmi_bmc.h                      |  14 +
>   7 files changed, 899 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
>   create mode 100644 drivers/char/ipmi/kcs_bmc.c
>   create mode 100644 drivers/char/ipmi/kcs_bmc.h
>   create mode 100644 drivers/char/ipmi/kcs_bmc_aspeed.c
>   create mode 100644 include/uapi/linux/ipmi_bmc.h
>
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> new file mode 100644
> index 0000000..613c34c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> @@ -0,0 +1,26 @@
> +* Aspeed KCS (Keyboard Controller Style) IPMI interface
> +
> +The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
> +(Baseboard Management Controllers) and the KCS interface can be
> +used to perform in-band IPMI communication with their host.
> +
> +Required properties:
> +- compatible : should be one of
> +    "aspeed,ast2400-kcs-bmc"
> +    "aspeed,ast2500-kcs-bmc"
> +- interrupts : interrupt generated by the controller
> +- kcs_chan : The LPC channel number in the controller
> +- kcs_addr : The host CPU IO map address
> +
> +
> +Example:
> +
> +    kcs3: kcs3@0 {
> +        compatible = "aspeed,ast2500-kcs-bmc";
> +        reg = <0x0 0x80>;
> +        interrupts = <8>;
> +        kcs_chan = <3>;
> +        kcs_addr = <0xCA2>;
> +        status = "okay";
> +    };
> +
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 3544abc..770def0 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -96,6 +96,26 @@ config IPMI_POWEROFF
>   
>   endif # IPMI_HANDLER
>   
> +config IPMI_KCS_BMC
> +	tristate 'IPMI KCS BMC Interface'
> +	help
> +	  Provides a device driver for the KCS (Keyboard Controller Style)
> +	  IPMI interface which meets the requirement of the BMC (Baseboard
> +	  Management Controllers) side for handling the IPMI request from
> +	  host system software.
> +
> +config ASPEED_KCS_IPMI_BMC
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on IPMI_KCS_BMC
> +	select REGMAP_MMIO
> +	tristate "Aspeed KCS IPMI BMC driver"
> +	help
> +	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
> +	  interface found on Aspeed SOCs (AST2400 and AST2500).
> +
> +	  The driver implements the BMC side of the KCS contorller, it
> +	  provides the access of KCS IO space for BMC side.
> +
>   config ASPEED_BT_IPMI_BMC
>   	depends on ARCH_ASPEED || COMPILE_TEST
>          depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 33b899f..10c591a 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -21,4 +21,6 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
>   obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
>   obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
>   obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
> +obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
>   obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> +obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
> \ No newline at end of file
> diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> new file mode 100644
> index 0000000..4ef3c0b
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -0,0 +1,430 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2018, Intel Corporation.
> +
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/ipmi_bmc.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +
> +#include "kcs_bmc.h"
> +
> +#define KCS_MSG_BUFSIZ    1024
> +
> +#define KCS_ZERO_DATA     0
> +
> +
> +/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
> +#define KCS_STATUS_STATE(state) (state << 6)
> +#define KCS_STATUS_STATE_MASK   KCS_STATUS_STATE(0x3)
> +#define KCS_STATUS_CMD_DAT      BIT(3)
> +#define KCS_STATUS_SMS_ATN      BIT(2)
> +#define KCS_STATUS_IBF          BIT(1)
> +#define KCS_STATUS_OBF          BIT(0)
> +
> +/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
> +enum kcs_states {
> +	IDLE_STATE  = 0,
> +	READ_STATE  = 1,
> +	WRITE_STATE = 2,
> +	ERROR_STATE = 3,
> +};
> +
> +/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
> +#define KCS_CMD_GET_STATUS      0x60
> +#define KCS_CMD_ABORT           0x60
> +#define KCS_CMD_WRITE_START     0x61
> +#define KCS_CMD_WRITE_END       0x62
> +#define KCS_CMD_READ_BYTE       0x68
> +
> +
> +static inline u8 read_data(struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> +}
> +
> +static inline void write_data(struct kcs_bmc *kcs_bmc, u8 data)
> +{
> +	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> +}
> +
> +static inline u8 read_status(struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> +}
> +
> +static inline void write_status(struct kcs_bmc *kcs_bmc, u8 data)
> +{
> +	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> +}
> +
> +static void update_status_bits(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
> +{
> +	u8 tmp;
> +
> +	tmp = read_status(kcs_bmc);
> +
> +	tmp &= ~mask;
> +	tmp |= val & mask;
> +
> +	write_status(kcs_bmc, tmp);
> +}
> +
> +static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
> +{
> +	update_status_bits(kcs_bmc, KCS_STATUS_STATE_MASK,
> +					KCS_STATUS_STATE(state));
> +}
> +
> +
> +static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
> +{
> +	u8 data;
> +
> +	switch (kcs_bmc->phase) {
> +	case KCS_PHASE_WRITE:
> +		set_state(kcs_bmc, WRITE_STATE);
> +
> +		/* set OBF before reading data */
> +		write_data(kcs_bmc, KCS_ZERO_DATA);
> +
> +		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ)
> +			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> +						read_data(kcs_bmc);
> +		break;
> +
> +	case KCS_PHASE_WRITE_END:
> +		set_state(kcs_bmc, READ_STATE);
> +
> +		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ)
> +			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> +						read_data(kcs_bmc);
> +
> +		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
> +		if (kcs_bmc->running) {

Why do you only do this when running is set?  It won't hurt anything if 
it's not
set.  As it is, you have a race if something opens the device while this 
code
runs.

Also, don't set the state to wait read until the "write" has finished 
(userland has
read the data out of the buffer.  More on that later.

> +			kcs_bmc->data_in_avail = true;
> +			wake_up_interruptible(&kcs_bmc->queue);
> +		}
> +		break;
> +
> +	case KCS_PHASE_READ:
> +		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
> +			set_state(kcs_bmc, IDLE_STATE);
> +
> +		data = read_data(kcs_bmc);
> +		if (data != KCS_CMD_READ_BYTE) {
> +			set_state(kcs_bmc, ERROR_STATE);
> +			write_data(kcs_bmc, KCS_ZERO_DATA);
> +			break;
> +		}
> +
> +		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
> +			write_data(kcs_bmc, KCS_ZERO_DATA);
> +			kcs_bmc->phase = KCS_PHASE_IDLE;
> +			break;
> +		}
> +
> +		write_data(kcs_bmc,
> +			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR1:
> +		set_state(kcs_bmc, READ_STATE);
> +
> +		/* Read the Dummy byte */
> +		read_data(kcs_bmc);
> +
> +		write_data(kcs_bmc, kcs_bmc->error);
> +		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR2:
> +		set_state(kcs_bmc, IDLE_STATE);
> +
> +		/* Read the Dummy byte */
> +		read_data(kcs_bmc);
> +
> +		write_data(kcs_bmc, KCS_ZERO_DATA);
> +		kcs_bmc->phase = KCS_PHASE_IDLE;
> +
> +		break;
> +
> +	default:
> +		set_state(kcs_bmc, ERROR_STATE);
> +
> +		/* Read the Dummy byte */
> +		read_data(kcs_bmc);
> +
> +		write_data(kcs_bmc, KCS_ZERO_DATA);
> +		break;
> +	}
> +}
> +
> +static void kcs_bmc_handle_command(struct kcs_bmc *kcs_bmc)
> +{
> +	u8 cmd;
> +
> +	set_state(kcs_bmc, WRITE_STATE);
> +
> +	/* Dummy data to generate OBF */
> +	write_data(kcs_bmc, KCS_ZERO_DATA);
> +
> +	cmd = read_data(kcs_bmc);

Shouldn't you check the phase in all the cases below and do error
handling if the phase isn't correct?

Similar thing if the device here isn't open.  You need to handle
that gracefully.

Also, you should remove data_in_avail and data_in_idx setting from
here, for reasons I will explain later.

> +	switch (cmd) {
> +	case KCS_CMD_WRITE_START:
> +		kcs_bmc->data_in_avail = false;
> +		kcs_bmc->data_in_idx   = 0;
> +		kcs_bmc->phase         = KCS_PHASE_WRITE;
> +		kcs_bmc->error         = KCS_NO_ERROR;
> +		break;
> +
> +	case KCS_CMD_WRITE_END:
> +		kcs_bmc->phase = KCS_PHASE_WRITE_END;
> +		break;
> +
> +	case KCS_CMD_ABORT:
> +		if (kcs_bmc->error == KCS_NO_ERROR)
> +			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
> +
> +		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
> +		break;
> +
> +	default:
> +		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
> +		set_state(kcs_bmc, ERROR_STATE);
> +		write_data(kcs_bmc, kcs_bmc->error);
> +		kcs_bmc->phase = KCS_PHASE_ERROR;
> +		break;
> +	}
> +}
> +
> +int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> +{
> +	unsigned long flags;
> +	int ret = 0;
> +	u8 status;
> +
> +	spin_lock_irqsave(&kcs_bmc->lock, flags);
> +
> +	status = read_status(kcs_bmc) & (KCS_STATUS_IBF | KCS_STATUS_CMD_DAT);
> +
> +	switch (status) {
> +	case KCS_STATUS_IBF | KCS_STATUS_CMD_DAT:
> +		kcs_bmc_handle_command(kcs_bmc);
> +		break;
> +
> +	case KCS_STATUS_IBF:
> +		kcs_bmc_handle_data(kcs_bmc);
> +		break;
> +
> +	default:
> +		ret = -1;
> +		break;
> +	}
> +
> +	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(kcs_bmc_handle_event);
> +
> +static inline struct kcs_bmc *file_kcs_bmc(struct file *filp)
> +{
> +	return container_of(filp->private_data, struct kcs_bmc, miscdev);
> +}
> +
> +static int kcs_bmc_open(struct inode *inode, struct file *filp)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +	int ret = 0;
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	if (!kcs_bmc->running) {
> +		kcs_bmc->running       = 1;
> +		kcs_bmc->phase         = KCS_PHASE_IDLE;
> +		kcs_bmc->data_in_avail = false;

If you do everything right, setting the phase and data_in_avail should not
be necessary here.

> +	} else {
> +		ret = -EBUSY;
> +	}
> +
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static unsigned int kcs_bmc_poll(struct file *filp, poll_table *wait)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +	unsigned int mask = 0;
> +
> +	poll_wait(filp, &kcs_bmc->queue, wait);
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	if (kcs_bmc->data_in_avail)
> +		mask |= POLLIN;
> +
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return mask;
> +}
> +
> +static ssize_t kcs_bmc_read(struct file *filp, char *buf,
> +			    size_t count, loff_t *offset)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +	ssize_t ret = -EAGAIN;
> +

This function still has some issues.

You can't call copy_to_user() with a spinlock held or interrupts disabled.
To handle readers, you probably need a separate mutex.

Also, this function can return -EAGAIN even if O_NONBLOCK is not set if
kcs_bmc->data_in_avail changes between when you wait on the event
and when you check it under the lock.

You also clear data_in_avail even if the copy_to_user() fails, which is
wrong.

I believe the best way to handle this would be to have the spinlock
protect the inner workings of the state machine and a mutex handle
copying data out, setting/clearing the running flag (thus a mutex
instead of spinlock in open and release) and the ioctl settings (except
for abort where you will need to grab the spinlock).

After the wait event below, grab the mutex.  If data is not available
and O_NONBLOCK is not set, drop the mutex and retry.  Otherwise
this is the only place (besides release) that sets data_in_avail to false.
Do the copy_to_user(), grab the spinlock, clear data_in_avail and
data_in_idx, then release the lock and mutex.  If you are really
adventurous you can do this without grabbing the lock using
barriers, but it's probably not necessary here.

> +	if (!(filp->f_flags & O_NONBLOCK))
> +		wait_event_interruptible(kcs_bmc->queue,
> +					 kcs_bmc->data_in_avail);
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	if (kcs_bmc->data_in_avail) {
> +		kcs_bmc->data_in_avail = false;
> +
> +		if (count > kcs_bmc->data_in_idx)
> +			count = kcs_bmc->data_in_idx;
> +
> +		if (!copy_to_user(buf, kcs_bmc->data_in, count))
> +			ret = count;
> +		else
> +			ret = -EFAULT;
> +	}
> +
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t kcs_bmc_write(struct file *filp, const char *buf,
> +			     size_t count, loff_t *offset)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +	ssize_t ret = count;
> +
> +	if (count < 1 || count > KCS_MSG_BUFSIZ)
> +		return -EINVAL;
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
> +		if (copy_from_user(kcs_bmc->data_out, buf, count)) {
> +			spin_unlock_irq(&kcs_bmc->lock);
> +			return -EFAULT;
> +		}
> +
> +		kcs_bmc->phase = KCS_PHASE_READ;
> +		kcs_bmc->data_out_idx = 1;
> +		kcs_bmc->data_out_len = count;
> +		write_data(kcs_bmc, kcs_bmc->data_out[0]);
> +	} else if (kcs_bmc->phase == KCS_PHASE_READ) {
> +		ret = -EBUSY;
> +	} else {
> +		ret = -EINVAL;

Is there a reason you return -EINVAL here?  Why not just -EBUSY in all
cases?  Is there something that userland will need to do differently?

> +	}
> +
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
> +			  unsigned long arg)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +	long ret = 0;
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	switch (cmd) {
> +	case IPMI_BMC_IOCTL_SET_SMS_ATN:
> +		update_status_bits(kcs_bmc, KCS_STATUS_SMS_ATN,
> +						KCS_STATUS_SMS_ATN);
> +		break;
> +
> +	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
> +		update_status_bits(kcs_bmc, KCS_STATUS_SMS_ATN,
> +						0);
> +		break;
> +
> +	case IPMI_BMC_IOCTL_FORCE_ABORT:
> +		set_state(kcs_bmc, ERROR_STATE);
> +		read_data(kcs_bmc);
> +		write_data(kcs_bmc, KCS_ZERO_DATA);
> +
> +		kcs_bmc->phase = KCS_PHASE_ERROR;
> +		kcs_bmc->data_in_avail = false;
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static int kcs_bmc_release(struct inode *inode, struct file *filp)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +

What happens if the device gets closed in the middle of a transaction?  
That's
an important case to handle.  If something is in process, you need to 
abort it.

> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	kcs_bmc->running = 0;
> +
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations kcs_bmc_fops = {
> +	.owner          = THIS_MODULE,
> +	.open           = kcs_bmc_open,
> +	.read           = kcs_bmc_read,
> +	.write          = kcs_bmc_write,
> +	.release        = kcs_bmc_release,
> +	.poll           = kcs_bmc_poll,
> +	.unlocked_ioctl = kcs_bmc_ioctl,
> +};
> +
> +struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
> +{
> +	struct kcs_bmc *kcs_bmc;
> +	int rc;
> +
> +	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
> +	if (!kcs_bmc)
> +		return NULL;
> +
> +	dev_set_name(dev, "ipmi-kcs%u", channel);
> +
> +	spin_lock_init(&kcs_bmc->lock);
> +	kcs_bmc->channel = channel;
> +
> +	init_waitqueue_head(&kcs_bmc->queue);
> +	kcs_bmc->data_in  = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	if (kcs_bmc->data_in == NULL || kcs_bmc->data_out == NULL) {
> +		dev_err(dev, "Failed to allocate data buffers\n");
> +		return NULL;
> +	}
> +
> +	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	kcs_bmc->miscdev.name = dev_name(dev);
> +	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
> +
> +	return kcs_bmc;
> +}
> +EXPORT_SYMBOL(kcs_bmc_alloc);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> +MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system software");
> diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
> new file mode 100644
> index 0000000..b56c250
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc.h
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2018, Intel Corporation.
> +
> +#ifndef __KCS_BMC_H__
> +#define __KCS_BMC_H__
> +
> +#include <linux/miscdevice.h>
> +
> +/* Different phases of the KCS BMC module */
> +enum kcs_phases {
> +	/* BMC should not be expecting nor sending any data. */
> +	KCS_PHASE_IDLE,
> +
> +	/* BMC is receiving a packet from system software. */
> +	KCS_PHASE_WRITE,
> +
> +	/* BMC is waiting a last data byte from system software. */
> +	KCS_PHASE_WRITE_END,
> +
> +	/* BMC is waiting the response from the upper IPMI service. */
> +	KCS_PHASE_WAIT_READ,
> +
> +	/* BMC is transferring the response to system software. */
> +	KCS_PHASE_READ,
> +
> +	/* BMC is waiting error status request from system software. */
> +	KCS_PHASE_ABORT_ERROR1,
> +
> +	/* BMC is waiting for idle status afer error from system software. */
> +	KCS_PHASE_ABORT_ERROR2,
> +
> +	/* BMC has detected a protocol violation at the interface level. */
> +	KCS_PHASE_ERROR
> +};
> +
> +/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
> +enum kcs_errors {
> +	KCS_NO_ERROR                = 0x00,
> +	KCS_ABORTED_BY_COMMAND      = 0x01,
> +	KCS_ILLEGAL_CONTROL_CODE    = 0x02,
> +	KCS_LENGTH_ERROR            = 0x06,
> +	KCS_UNSPECIFIED_ERROR       = 0xFF
> +};
> +
> +/* IPMI 2.0 - 9.5, KCS Interface Registers */
> +struct kcs_ioreg {
> +	u32 idr; /* Input Data Register */
> +	u32 odr; /* Output Data Register */
> +	u32 str; /* Status Register */
> +};
> +
> +struct kcs_bmc {
> +	spinlock_t lock;
> +
> +	u32 channel;
> +	int running;
> +
> +	/* Setup by BMC KCS controller driver */
> +	struct kcs_ioreg ioreg;
> +	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
> +	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
> +
> +	enum kcs_phases phase;
> +	enum kcs_errors error;
> +
> +	wait_queue_head_t queue;
> +	bool data_in_avail;
> +	int  data_in_idx;
> +	u8  *data_in;
> +
> +	int  data_out_idx;
> +	int  data_out_len;
> +	u8  *data_out;
> +
> +	struct miscdevice miscdev;
> +
> +	unsigned long long priv[];
> +};
> +
> +static inline void *kcs_bmc_priv(const struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->priv;
> +}
> +
> +extern int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
> +extern struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv,
> +					u32 channel);
> +#endif
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> new file mode 100644
> index 0000000..5002de3
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2018, Intel Corporation.
> +
> +#define pr_fmt(fmt) "aspeed-kcs-bmc: " fmt
> +
> +#include <linux/atomic.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/regmap.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/timer.h>
> +
> +#include "kcs_bmc.h"
> +
> +
> +#define DEVICE_NAME     "ast-kcs-bmc"
> +
> +#define KCS_CHANNEL_MAX     4
> +
> +/* mapped to lpc-bmc@0 IO space */
> +#define LPC_HICR0            0x000
> +#define     LPC_HICR0_LPC3E          BIT(7)
> +#define     LPC_HICR0_LPC2E          BIT(6)
> +#define     LPC_HICR0_LPC1E          BIT(5)
> +#define LPC_HICR2            0x008
> +#define     LPC_HICR2_IBFIF3         BIT(3)
> +#define     LPC_HICR2_IBFIF2         BIT(2)
> +#define     LPC_HICR2_IBFIF1         BIT(1)
> +#define LPC_HICR4            0x010
> +#define     LPC_HICR4_LADR12AS       BIT(7)
> +#define     LPC_HICR4_KCSENBL        BIT(2)
> +#define LPC_LADR3H           0x014
> +#define LPC_LADR3L           0x018
> +#define LPC_LADR12H          0x01C
> +#define LPC_LADR12L          0x020
> +#define LPC_IDR1             0x024
> +#define LPC_IDR2             0x028
> +#define LPC_IDR3             0x02C
> +#define LPC_ODR1             0x030
> +#define LPC_ODR2             0x034
> +#define LPC_ODR3             0x038
> +#define LPC_STR1             0x03C
> +#define LPC_STR2             0x040
> +#define LPC_STR3             0x044
> +
> +/* mapped to lpc-host@80 IO space */
> +#define LPC_HICRB            0x080
> +#define     LPC_HICRB_IBFIF4         BIT(1)
> +#define     LPC_HICRB_LPC4E          BIT(0)
> +#define LPC_LADR4            0x090
> +#define LPC_IDR4             0x094
> +#define LPC_ODR4             0x098
> +#define LPC_STR4             0x09C
> +
> +struct aspeed_kcs_bmc {
> +	struct regmap *map;
> +};
> +
> +
> +static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> +{
> +	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	u32 val = 0;
> +	int rc;
> +
> +	rc = regmap_read(priv->map, reg, &val);
> +	WARN(rc != 0, "regmap_read() failed: %d\n", rc);
> +
> +	return rc == 0 ? (u8) val : 0;
> +}
> +
> +static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
> +{
> +	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	int rc;
> +
> +	rc = regmap_write(priv->map, reg, data);
> +	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
> +}
> +
> +
> +/*
> + * AST_usrGuide_KCS.pdf
> + * 2. Background:
> + *   we note D for Data, and C for Cmd/Status, default rules are
> + *     A. KCS1 / KCS2 ( D / C:X / X+4 )
> + *        D / C : CA0h / CA4h
> + *        D / C : CA8h / CACh
> + *     B. KCS3 ( D / C:XX2h / XX3h )
> + *        D / C : CA2h / CA3h
> + *        D / C : CB2h / CB3h
> + *     C. KCS4
> + *        D / C : CA4h / CA5h
> + */
> +static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
> +{
> +	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +
> +	switch (kcs_bmc->channel) {
> +	case 1:
> +		regmap_update_bits(priv->map, LPC_HICR4,
> +				LPC_HICR4_LADR12AS, 0);
> +		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
> +		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
> +		break;
> +
> +	case 2:
> +		regmap_update_bits(priv->map, LPC_HICR4,
> +				LPC_HICR4_LADR12AS, LPC_HICR4_LADR12AS);
> +		regmap_write(priv->map, LPC_LADR12H, addr >> 8);
> +		regmap_write(priv->map, LPC_LADR12L, addr & 0xFF);
> +		break;
> +
> +	case 3:
> +		regmap_write(priv->map, LPC_LADR3H, addr >> 8);
> +		regmap_write(priv->map, LPC_LADR3L, addr & 0xFF);
> +		break;
> +
> +	case 4:
> +		regmap_write(priv->map, LPC_LADR4, ((addr + 1) << 16) |
> +			addr);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
> +static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
> +{
> +	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +
> +	switch (kcs_bmc->channel) {
> +	case 1:
> +		if (enable) {
> +			regmap_update_bits(priv->map, LPC_HICR2,
> +					LPC_HICR2_IBFIF1, LPC_HICR2_IBFIF1);
> +			regmap_update_bits(priv->map, LPC_HICR0,
> +					LPC_HICR0_LPC1E, LPC_HICR0_LPC1E);
> +		} else {
> +			regmap_update_bits(priv->map, LPC_HICR0,
> +					LPC_HICR0_LPC1E, 0);
> +			regmap_update_bits(priv->map, LPC_HICR2,
> +					LPC_HICR2_IBFIF1, 0);
> +		}
> +		break;
> +
> +	case 2:
> +		if (enable) {
> +			regmap_update_bits(priv->map, LPC_HICR2,
> +					LPC_HICR2_IBFIF2, LPC_HICR2_IBFIF2);
> +			regmap_update_bits(priv->map, LPC_HICR0,
> +					LPC_HICR0_LPC2E, LPC_HICR0_LPC2E);
> +		} else {
> +			regmap_update_bits(priv->map, LPC_HICR0,
> +					LPC_HICR0_LPC2E, 0);
> +			regmap_update_bits(priv->map, LPC_HICR2,
> +					LPC_HICR2_IBFIF2, 0);
> +		}
> +		break;
> +
> +	case 3:
> +		if (enable) {
> +			regmap_update_bits(priv->map, LPC_HICR2,
> +					LPC_HICR2_IBFIF3, LPC_HICR2_IBFIF3);
> +			regmap_update_bits(priv->map, LPC_HICR0,
> +					LPC_HICR0_LPC3E, LPC_HICR0_LPC3E);
> +			regmap_update_bits(priv->map, LPC_HICR4,
> +					LPC_HICR4_KCSENBL, LPC_HICR4_KCSENBL);
> +		} else {
> +			regmap_update_bits(priv->map, LPC_HICR0,
> +					LPC_HICR0_LPC3E, 0);
> +			regmap_update_bits(priv->map, LPC_HICR4,
> +					LPC_HICR4_KCSENBL, 0);
> +			regmap_update_bits(priv->map, LPC_HICR2,
> +					LPC_HICR2_IBFIF3, 0);
> +		}
> +		break;
> +
> +	case 4:
> +		if (enable)
> +			regmap_update_bits(priv->map, LPC_HICRB,
> +					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
> +					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
> +		else
> +			regmap_update_bits(priv->map, LPC_HICRB,
> +					LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
> +					0);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
> +static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> +{
> +	struct kcs_bmc *kcs_bmc = arg;
> +
> +	if (!kcs_bmc_handle_event(kcs_bmc))
> +		return IRQ_HANDLED;
> +
> +	return IRQ_NONE;
> +}
> +
> +static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
> +			struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int irq;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	return devm_request_irq(dev, irq, aspeed_kcs_irq, IRQF_SHARED,
> +				dev_name(dev), kcs_bmc);
> +}
> +
> +static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] = {
> +	{ .idr = LPC_IDR1, .odr = LPC_ODR1, .str = LPC_STR1 },
> +	{ .idr = LPC_IDR2, .odr = LPC_ODR2, .str = LPC_STR2 },
> +	{ .idr = LPC_IDR3, .odr = LPC_ODR3, .str = LPC_STR3 },
> +	{ .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
> +};
> +
> +static int aspeed_kcs_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct aspeed_kcs_bmc *priv;
> +	struct kcs_bmc *kcs_bmc;
> +	u32 chan, addr;
> +	int rc;
> +
> +	rc = of_property_read_u32(dev->of_node, "kcs_chan", &chan);
> +	if ((rc != 0) || (chan == 0 || chan > KCS_CHANNEL_MAX)) {
> +		dev_err(dev, "no valid 'kcs_chan' configured\n");
> +		return -ENODEV;
> +	}
> +
> +	rc = of_property_read_u32(dev->of_node, "kcs_addr", &addr);
> +	if (rc) {
> +		dev_err(dev, "no valid 'kcs_addr' configured\n");
> +		return -ENODEV;
> +	}
> +
> +	kcs_bmc = kcs_bmc_alloc(dev, sizeof(*priv), chan);
> +	if (!kcs_bmc)
> +		return -ENOMEM;
> +
> +	priv = kcs_bmc_priv(kcs_bmc);
> +	priv->map = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->map)) {
> +		dev_err(dev, "Couldn't get regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	kcs_bmc->ioreg = ast_kcs_bmc_ioregs[chan - 1];
> +	kcs_bmc->io_inputb = aspeed_kcs_inb;
> +	kcs_bmc->io_outputb = aspeed_kcs_outb;
> +
> +	dev_set_drvdata(dev, kcs_bmc);
> +
> +	aspeed_kcs_set_address(kcs_bmc, addr);
> +	aspeed_kcs_enable_channel(kcs_bmc, true);
> +	rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
> +	if (rc)
> +		return rc;
> +
> +	rc = misc_register(&kcs_bmc->miscdev);
> +	if (rc) {
> +		dev_err(dev, "Unable to register device\n");
> +		return rc;
> +	}
> +
> +	pr_info("channel=%u address=0x%x idr=0x%x odr=0x%x str=0x%x\n",
> +		chan, addr,
> +		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
> +
> +	return 0;
> +}
> +
> +static int aspeed_kcs_remove(struct platform_device *pdev)
> +{
> +	struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
> +
> +	misc_deregister(&kcs_bmc->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ast_kcs_bmc_match[] = {
> +	{ .compatible = "aspeed,ast2400-kcs-bmc" },
> +	{ .compatible = "aspeed,ast2500-kcs-bmc" },
> +	{ }
> +};
> +
> +static struct platform_driver ast_kcs_bmc_driver = {
> +	.driver = {
> +		.name           = DEVICE_NAME,
> +		.of_match_table = ast_kcs_bmc_match,
> +	},
> +	.probe = aspeed_kcs_probe,
> +	.remove = aspeed_kcs_remove,
> +};
> +
> +module_platform_driver(ast_kcs_bmc_driver);
> +
> +MODULE_DEVICE_TABLE(of, ast_kcs_bmc_match);
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> +MODULE_DESCRIPTION("Aspeed device interface to the KCS BMC device");
> diff --git a/include/uapi/linux/ipmi_bmc.h b/include/uapi/linux/ipmi_bmc.h
> new file mode 100644
> index 0000000..2f9f97e
> --- /dev/null
> +++ b/include/uapi/linux/ipmi_bmc.h
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2018, Intel Corporation.
> +
> +#ifndef _UAPI_LINUX_IPMI_BMC_H
> +#define _UAPI_LINUX_IPMI_BMC_H
> +
> +#include <linux/ioctl.h>
> +
> +#define __IPMI_BMC_IOCTL_MAGIC        0xB1
> +#define IPMI_BMC_IOCTL_SET_SMS_ATN    _IO(__IPMI_BMC_IOCTL_MAGIC, 0x00)
> +#define IPMI_BMC_IOCTL_CLEAR_SMS_ATN  _IO(__IPMI_BMC_IOCTL_MAGIC, 0x01)
> +#define IPMI_BMC_IOCTL_FORCE_ABORT    _IO(__IPMI_BMC_IOCTL_MAGIC, 0x02)
> +
> +#endif /* _UAPI_LINUX_KCS_BMC_H */
