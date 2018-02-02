Return-Path: <tcminyard@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GgakixXk"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXf6Y2jr5zF0Zk
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 12:10:12 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id x25so653822pge.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2018 17:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=t+cyDxO/Lhdz//MXPvXyNzTEWoXfvuEpSIVHoDPO25k=;
 b=GgakixXkfDGohs0uCY6pBuCw6FU2X4jEob8KXcRQWu5VfL5EHVPcXa/X3qSKeOtH7f
 rYJ4a4psp+zseWm8fcrEYf6/f30BGapqvj/sybxt5JsixUxww2ZwR4NXtq9xABhre2Xn
 K9JXWKgVa0cj5u6bT/rnUedSzIVPNnUjn6IsVqApfXYVfx74NKlEub143qlluMIGpujN
 haDePsqPNaCsDKScXvmcos7JNFDRyIvWmTMxcRxJE/OjjzPlYyo7VQ0OqyK7Q0ppSyxQ
 D1CqUoabxPqa7S3tmWLCokFd0Xd+ZDc+67TJaa9YS+YhFKz10ogHLdgnDZ3D3EdjYkP9
 Z2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=t+cyDxO/Lhdz//MXPvXyNzTEWoXfvuEpSIVHoDPO25k=;
 b=clczkw/yBww42ReanC2HprKcsyO2cVgSrE7ZpQvnuhKrzxL253IA2R82yEt/fplHKT
 d+pefVcjdcgUJmNnzHtQ/1VhuR2MBNHvrocBRyHski5urPY6sQL1/mQtVwg6i9T6b8LA
 JQ74iWVXAKVP8vg8laAEW7AVm1mXoLe7Os4jpuCWzPRNriPCFbWryfSG0tTs3ZHHqBGY
 5c1BantjkUxQZhuv0tXu4iVoeBO576FtIal6h45tHXFCgmxfzeyl5f9lEP7HMsEk0+ua
 Qxyy1gDUNUML6qry7e+gUc+R+IkA1DuzhQ8uq4FPDc9WAV+yq+LTd3GWE6ZBhArbkjge
 rChw==
X-Gm-Message-State: AKwxyteg5Lm+aWm++d+39bero+7oYitVzZCmAPS7x8/rAeVHP80N6hmZ
 v7D9Tl6JrisTtI74JcMCVw==
X-Google-Smtp-Source: AH8x226l1BCxZfY/+8aUBUL4lqYIRG4v6cbx/agvo9BFrT/nldKmlcnDnSoJo/8fNAwgdW34WaVkzg==
X-Received: by 10.98.63.15 with SMTP id m15mr3705418pfa.221.1517533810445;
 Thu, 01 Feb 2018 17:10:10 -0800 (PST)
Received: from serve.minyard.net ([47.184.168.85])
 by smtp.gmail.com with ESMTPSA id i9sm879050pfi.154.2018.02.01.17.10.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Feb 2018 17:10:09 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id AD2B0159;
 Thu,  1 Feb 2018 19:10:07 -0600 (CST)
Reply-To: minyard@acm.org
Subject: Re: [PATCH arm/aspeed/ast2500 v4 1/2] ipmi: add a KCS IPMI BMC driver
To: Haiyue Wang <haiyue.wang@linux.intel.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Cc: andriy.shevchenko@intel.com
References: <1517531323-19427-1-git-send-email-haiyue.wang@linux.intel.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <1ec1648a-020c-a6b5-3519-48eece098716@acm.org>
Date: Thu, 1 Feb 2018 19:10:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1517531323-19427-1-git-send-email-haiyue.wang@linux.intel.com>
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
X-List-Received-Date: Fri, 02 Feb 2018 01:10:14 -0000

On 02/01/2018 06:28 PM, Haiyue Wang wrote:
> ---
> v3->v4
> - Change to accept WRITE_START any time.
>
> v2->v3
>
> - Update the KCS phase state machine.
> - Fix the race condition of read/write.
>
> v1->v2
>
> - Divide the driver into two parts, one handles the BMC KCS IPMI 2.0 state;
>    the other handles the BMC KCS controller such as AST2500 IO accessing.
> - Use the spin lock APIs to handle the device file operations and BMC chip
>    IRQ inferface for accessing the same KCS BMC data structure.
> - Enhanced the phases handling of the KCS BMC.
> - Unified the IOCTL definition for IPMI BMC, it will be used by KCS and BT.
>
>
> Provides a device driver for the KCS (Keyboard Controller Style)
> IPMI interface which meets the requirement of the BMC (Baseboard
> Management Controllers) side for handling the IPMI request from
> host system software.

I loaded this in, tried a compile on x86_64, and got the following:

In file included from ../drivers/char/ipmi/kcs_bmc.c:15:0:
../drivers/char/ipmi/kcs_bmc.h: In function ‘kcs_bmc_priv’:
../drivers/char/ipmi/kcs_bmc.h:100:9: warning: return discards ‘const’ 
qualifier from pointer target type [-Wdiscarded-qualifiers]
   return kcs_bmc->priv;
          ^
In file included from ../include/linux/printk.h:7:0,
                  from ../include/linux/kernel.h:14,
                  from ../include/asm-generic/bug.h:18,
                  from ../arch/x86/include/asm/bug.h:82,
                  from ../include/linux/bug.h:5,
                  from ../include/linux/io.h:23,
                  from ../drivers/char/ipmi/kcs_bmc.c:7:
../drivers/char/ipmi/kcs_bmc.c: In function ‘kcs_bmc_read’:
../include/linux/kern_levels.h:5:18: warning: format ‘%u’ expects 
argument of type ‘unsigned int’, but argument 3 has type ‘size_t {aka 
long unsigned int}’ [-Wformat=]
  #define KERN_SOH "\001"  /* ASCII Start Of Header */
                   ^
../include/linux/kern_levels.h:11:18: note: in expansion of macro ‘KERN_SOH’
  #define KERN_ERR KERN_SOH "3" /* error conditions */
                   ^
../include/linux/printk.h:301:9: note: in expansion of macro ‘KERN_ERR’
   printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
          ^
../drivers/char/ipmi/kcs_bmc.c:307:3: note: in expansion of macro ‘pr_err’
    pr_err("channel=%u with too large data : %u\n",
    ^
In file included from ../drivers/char/ipmi/kcs_bmc_aspeed.c:20:0:
../drivers/char/ipmi/kcs_bmc.h: In function ‘kcs_bmc_priv’:
../drivers/char/ipmi/kcs_bmc.h:100:9: warning: return discards ‘const’ 
qualifier from pointer target type [-Wdiscarded-qualifiers]
   return kcs_bmc->priv;
          ^

So that needs to be fixed before it goes in.

Also, since you are respinning, can you make ASPEED_KCS_IPMI_BMC select 
IPMI_KCS_BMC, like:

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index bc2568a..d34f40e 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -99,16 +99,11 @@ config IPMI_POWEROFF
  endif # IPMI_HANDLER

  config IPMI_KCS_BMC
-       tristate 'IPMI KCS BMC Interface'
-       help
-         Provides a device driver for the KCS (Keyboard Controller Style)
-         IPMI interface which meets the requirement of the BMC (Baseboard
-         Management Controllers) side for handling the IPMI request from
-         host system software.
+       tristate

  config ASPEED_KCS_IPMI_BMC
         depends on ARCH_ASPEED || COMPILE_TEST
-       depends on IPMI_KCS_BMC
+       select IPMI_KCS_BMC
         select REGMAP_MMIO
         tristate "Aspeed KCS IPMI BMC driver"
         help

It doesn't make much sense to have IPMI_KCS_BMC on its own.  I was going 
to do this till I saw the compiler error.

-corey

> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>   drivers/char/ipmi/Kconfig     |   8 +
>   drivers/char/ipmi/Makefile    |   1 +
>   drivers/char/ipmi/kcs_bmc.c   | 464 ++++++++++++++++++++++++++++++++++++++++++
>   drivers/char/ipmi/kcs_bmc.h   | 106 ++++++++++
>   include/uapi/linux/ipmi_bmc.h |  14 ++
>   5 files changed, 593 insertions(+)
>   create mode 100644 drivers/char/ipmi/kcs_bmc.c
>   create mode 100644 drivers/char/ipmi/kcs_bmc.h
>   create mode 100644 include/uapi/linux/ipmi_bmc.h
>
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 3544abc..aa9bcb1 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -96,6 +96,14 @@ config IPMI_POWEROFF
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
>   config ASPEED_BT_IPMI_BMC
>   	depends on ARCH_ASPEED || COMPILE_TEST
>          depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 33b899f..2abccb3 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -21,4 +21,5 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
>   obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
>   obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
>   obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
> +obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
>   obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> new file mode 100644
> index 0000000..d1751b4
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2018, Intel Corporation.
> +
> +#define pr_fmt(fmt) "kcs-bmc: " fmt
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
> +#define KCS_MSG_BUFSIZ    1000
> +
> +#define KCS_ZERO_DATA     0
> +
> +
> +/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
> +#define KCS_STATUS_STATE(state) (state << 6)
> +#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
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
> +#define KCS_CMD_GET_STATUS_ABORT  0x60
> +#define KCS_CMD_WRITE_START       0x61
> +#define KCS_CMD_WRITE_END         0x62
> +#define KCS_CMD_READ_BYTE         0x68
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
> +	u8 tmp = read_status(kcs_bmc);
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
> +static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
> +{
> +	set_state(kcs_bmc, ERROR_STATE);
> +	read_data(kcs_bmc);
> +	write_data(kcs_bmc, KCS_ZERO_DATA);
> +
> +	kcs_bmc->phase = KCS_PHASE_ERROR;
> +	kcs_bmc->data_in_avail = false;
> +	kcs_bmc->data_in_idx = 0;
> +}
> +
> +static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
> +{
> +	u8 data;
> +
> +	switch (kcs_bmc->phase) {
> +	case KCS_PHASE_WRITE_START:
> +		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
> +
> +	case KCS_PHASE_WRITE_DATA:
> +		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
> +			set_state(kcs_bmc, WRITE_STATE);
> +			write_data(kcs_bmc, KCS_ZERO_DATA);
> +			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> +						read_data(kcs_bmc);
> +		} else {
> +			kcs_force_abort(kcs_bmc);
> +			kcs_bmc->error = KCS_LENGTH_ERROR;
> +		}
> +		break;
> +
> +	case KCS_PHASE_WRITE_END_CMD:
> +		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
> +			set_state(kcs_bmc, READ_STATE);
> +			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> +						read_data(kcs_bmc);
> +			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
> +			kcs_bmc->data_in_avail = true;
> +			wake_up_interruptible(&kcs_bmc->queue);
> +		} else {
> +			kcs_force_abort(kcs_bmc);
> +			kcs_bmc->error = KCS_LENGTH_ERROR;
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
> +		read_data(kcs_bmc);
> +		write_data(kcs_bmc, kcs_bmc->error);
> +		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR2:
> +		set_state(kcs_bmc, IDLE_STATE);
> +		read_data(kcs_bmc);
> +		write_data(kcs_bmc, KCS_ZERO_DATA);
> +		kcs_bmc->phase = KCS_PHASE_IDLE;
> +		break;
> +
> +	default:
> +		kcs_force_abort(kcs_bmc);
> +		break;
> +	}
> +}
> +
> +static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
> +{
> +	u8 cmd;
> +
> +	set_state(kcs_bmc, WRITE_STATE);
> +	write_data(kcs_bmc, KCS_ZERO_DATA);
> +
> +	cmd = read_data(kcs_bmc);
> +	switch (cmd) {
> +	case KCS_CMD_WRITE_START:
> +		kcs_bmc->phase = KCS_PHASE_WRITE_START;
> +		kcs_bmc->error = KCS_NO_ERROR;
> +		kcs_bmc->data_in_avail = false;
> +		kcs_bmc->data_in_idx = 0;
> +		break;
> +
> +	case KCS_CMD_WRITE_END:
> +		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
> +			kcs_force_abort(kcs_bmc);
> +			break;
> +		}
> +
> +		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
> +		break;
> +
> +	case KCS_CMD_GET_STATUS_ABORT:
> +		if (kcs_bmc->error == KCS_NO_ERROR)
> +			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
> +
> +		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
> +		kcs_bmc->data_in_avail = false;
> +		kcs_bmc->data_in_idx = 0;
> +		break;
> +
> +	default:
> +		kcs_force_abort(kcs_bmc);
> +		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
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
> +	if (!kcs_bmc->running) {
> +		kcs_force_abort(kcs_bmc);
> +		ret = -ENODEV;
> +		goto out_unlock;
> +	}
> +
> +	status = read_status(kcs_bmc) & (KCS_STATUS_IBF | KCS_STATUS_CMD_DAT);
> +
> +	switch (status) {
> +	case KCS_STATUS_IBF | KCS_STATUS_CMD_DAT:
> +		kcs_bmc_handle_cmd(kcs_bmc);
> +		break;
> +
> +	case KCS_STATUS_IBF:
> +		kcs_bmc_handle_data(kcs_bmc);
> +		break;
> +
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(kcs_bmc_handle_event);
> +
> +static inline struct kcs_bmc *file_to_kcs_bmc(struct file *filp)
> +{
> +	return container_of(filp->private_data, struct kcs_bmc, miscdev);
> +}
> +
> +static int kcs_bmc_open(struct inode *inode, struct file *filp)
> +{
> +	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> +	int ret = 0;
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	if (!kcs_bmc->running)
> +		kcs_bmc->running = 1;
> +	else
> +		ret = -EBUSY;
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static unsigned int kcs_bmc_poll(struct file *filp, poll_table *wait)
> +{
> +	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> +	unsigned int mask = 0;
> +
> +	poll_wait(filp, &kcs_bmc->queue, wait);
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	if (kcs_bmc->data_in_avail)
> +		mask |= POLLIN;
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	return mask;
> +}
> +
> +static ssize_t kcs_bmc_read(struct file *filp, char *buf,
> +			    size_t count, loff_t *offset)
> +{
> +	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> +	bool data_avail;
> +	size_t data_len;
> +	ssize_t ret;
> +
> +	if (!(filp->f_flags & O_NONBLOCK))
> +		wait_event_interruptible(kcs_bmc->queue,
> +					 kcs_bmc->data_in_avail);
> +
> +	mutex_lock(&kcs_bmc->mutex);
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	data_avail = kcs_bmc->data_in_avail;
> +	if (data_avail) {
> +		data_len = kcs_bmc->data_in_idx;
> +		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
> +	}
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	if (!data_avail) {
> +		ret = -EAGAIN;
> +		goto out_unlock;
> +	}
> +
> +	if (count < data_len) {
> +		pr_err("channel=%u with too large data : %u\n",
> +			kcs_bmc->channel, data_len);
> +
> +		spin_lock_irq(&kcs_bmc->lock);
> +		kcs_force_abort(kcs_bmc);
> +		spin_unlock_irq(&kcs_bmc->lock);
> +
> +		ret = -EOVERFLOW;
> +		goto out_unlock;
> +	}
> +
> +	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
> +		ret = -EFAULT;
> +		goto out_unlock;
> +	}
> +
> +	ret = data_len;
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
> +		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
> +		kcs_bmc->data_in_avail = false;
> +		kcs_bmc->data_in_idx = 0;
> +	} else {
> +		ret = -EAGAIN;
> +	}
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +out_unlock:
> +	mutex_unlock(&kcs_bmc->mutex);
> +
> +	return ret;
> +}
> +
> +static ssize_t kcs_bmc_write(struct file *filp, const char *buf,
> +			     size_t count, loff_t *offset)
> +{
> +	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> +	ssize_t ret;
> +
> +	/* a minimum response size '3' : netfn + cmd + ccode */
> +	if (count < 3 || count > KCS_MSG_BUFSIZ)
> +		return -EINVAL;
> +
> +	mutex_lock(&kcs_bmc->mutex);
> +
> +	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
> +		ret = -EFAULT;
> +		goto out_unlock;
> +	}
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
> +		kcs_bmc->phase = KCS_PHASE_READ;
> +		kcs_bmc->data_out_idx = 1;
> +		kcs_bmc->data_out_len = count;
> +		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
> +		write_data(kcs_bmc, kcs_bmc->data_out[0]);
> +		ret = count;
> +	} else {
> +		ret = -EINVAL;
> +	}
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +out_unlock:
> +	mutex_unlock(&kcs_bmc->mutex);
> +
> +	return ret;
> +}
> +
> +static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
> +			  unsigned long arg)
> +{
> +	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> +	long ret = 0;
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +
> +	switch (cmd) {
> +	case IPMI_BMC_IOCTL_SET_SMS_ATN:
> +		update_status_bits(kcs_bmc, KCS_STATUS_SMS_ATN,
> +				   KCS_STATUS_SMS_ATN);
> +		break;
> +
> +	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
> +		update_status_bits(kcs_bmc, KCS_STATUS_SMS_ATN,
> +				   0);
> +		break;
> +
> +	case IPMI_BMC_IOCTL_FORCE_ABORT:
> +		kcs_force_abort(kcs_bmc);
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
> +	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	kcs_bmc->running = 0;
> +	kcs_force_abort(kcs_bmc);
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
> +	mutex_init(&kcs_bmc->mutex);
> +	init_waitqueue_head(&kcs_bmc->queue);
> +
> +	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer)
> +		return NULL;
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
> index 0000000..f2ecbe6
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc.h
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2018, Intel Corporation.
> +
> +#ifndef __KCS_BMC_H__
> +#define __KCS_BMC_H__
> +
> +#include <linux/miscdevice.h>
> +
> +/* Different phases of the KCS BMC module :
> + *  KCS_PHASE_IDLE :
> + *            BMC should not be expecting nor sending any data.
> + *  KCS_PHASE_WRITE_START :
> + *            BMC is receiving a WRITE_START command from system software.
> + *  KCS_PHASE_WRITE_DATA :
> + *            BMC is receiving a data byte from system software.
> + *  KCS_PHASE_WRITE_END_CMD :
> + *            BMC is waiting a last data byte from system software.
> + *  KCS_PHASE_WRITE_DONE :
> + *            BMC has received the whole request from system software.
> + *  KCS_PHASE_WAIT_READ :
> + *            BMC is waiting the response from the upper IPMI service.
> + *  KCS_PHASE_READ :
> + *            BMC is transferring the response to system software.
> + *  KCS_PHASE_ABORT_ERROR1 :
> + *            BMC is waiting error status request from system software.
> + *  KCS_PHASE_ABORT_ERROR2 :
> + *            BMC is waiting for idle status afer error from system software.
> + *  KCS_PHASE_ERROR :
> + *            BMC has detected a protocol violation at the interface level.
> + */
> +enum kcs_phases {
> +	KCS_PHASE_IDLE,
> +
> +	KCS_PHASE_WRITE_START,
> +	KCS_PHASE_WRITE_DATA,
> +	KCS_PHASE_WRITE_END_CMD,
> +	KCS_PHASE_WRITE_DONE,
> +
> +	KCS_PHASE_WAIT_READ,
> +	KCS_PHASE_READ,
> +
> +	KCS_PHASE_ABORT_ERROR1,
> +	KCS_PHASE_ABORT_ERROR2,
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
> +/* IPMI 2.0 - 9.5, KCS Interface Registers
> + * @idr : Input Data Register
> + * @odr : Output Data Register
> + * @str : Status Register
> + */
> +struct kcs_ioreg {
> +	u32 idr;
> +	u32 odr;
> +	u32 str;
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
> +	struct mutex mutex;
> +	u8 *kbuffer;
> +
> +	struct miscdevice miscdev;
> +
> +	unsigned long priv[];
> +};
> +
> +static inline void *kcs_bmc_priv(const struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->priv;
> +}
> +
> +int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
> +struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv,
> +					u32 channel);
> +#endif
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
