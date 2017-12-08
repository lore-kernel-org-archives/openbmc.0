Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0KJgsz8"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytHm25hmxzDrpX
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 14:25:06 +1100 (AEDT)
Received: by mail-lf0-x242.google.com with SMTP id e137so10440590lfg.5
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MP0vYNL/X3/BjHAV4EyBsf03uujJ7dBcKC56dTXSr3w=;
 b=G0KJgsz85+KDdaPbRYze7ZsRuPHc/YUTPounakIRx3S6g8GULXmAxfgYPq42qk+6Fo
 lBM16gkyc0NbmkpTO8EqY2+jb7W+OQLp08wtb1PF6cXDO22zPcV/t6j2BezBZPAXYkcS
 TldN/dlirt4tht2kSsRShnH03wSyzcrI4QTuAfljtLSFGZMcxjkEMLtrilevUma3hEY6
 aGu3DMOuO84X33xl4Nxkedm5Tzf6yNZeNBVayUZxxNRZ2d5scrpSxxSLzmoEI6zeOnL0
 SX2EBL2UAh4djnumP0DSicoW/Ou7q56v0VfX6FA9v1dt/rlvc7JnHSk1kAGjm2rqaddq
 AdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MP0vYNL/X3/BjHAV4EyBsf03uujJ7dBcKC56dTXSr3w=;
 b=AmdN59JQlLmp8Vnnw8rj5LN8Kq4ObRwn8I4YSoCMFnnS8UTWZ0YfUoCdM/DaNLu96J
 bPNV5K1LtDwFoegsRq+olkDMOovcJ/RSjAg7nG3zyTeKlUPM8EPT/+Lx5JWnJq9ZEtqC
 P5hTuFusuxIbxWoBW+LYvfVB+kqMcEFXaw0G+8+JjdrskD3ljzAf+Borsz9n7KKQNygs
 hmCICbpm7ma7MIOV+50ju+gUXHrm+9ky5okBGDUkj6vfhG0cPSDJrKVngdyHSOrAoHiR
 DnXlDvD+K87UZ9UljaISbOLl5FrbZ6+AQ5lYeS7z9BbjnlErEiddqHp+QXGNyhcFIjg7
 V5nA==
X-Gm-Message-State: AJaThX42yyNkHHpVyo42pwT2pRkh4ozE+5ZN+EBgsFzURURcP545kyWJ
 3RO1W40kY1JVGGgfzdwcxkbiHf0pzKVO2RoPzhM=
X-Google-Smtp-Source: AGs4zMaatXr4lmo6UzN3rBsHT8ik8uC6H/reO5q+0P5T4prglalBpi43hn09MPi2fFcvhv4pdbrRvyNFHd8OYYztb3M=
X-Received: by 10.25.198.147 with SMTP id w141mr11931221lff.84.1512703502584; 
 Thu, 07 Dec 2017 19:25:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 19:24:42 -0800 (PST)
In-Reply-To: <1512700492-22384-1-git-send-email-haiyue.wang@linux.intel.com>
References: <1512700492-22384-1-git-send-email-haiyue.wang@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 13:54:42 +1030
X-Google-Sender-Auth: B3DNEe2XXAsr4pBTlSWtsODgn6k
Message-ID: <CACPK8XfF1zSL-gF2eUWVyt3x4C1yHSqgLN5+gHH-vDTp4RomSA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC driver
To: Haiyue Wang <haiyue.wang@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@ozlabs.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 08 Dec 2017 03:25:08 -0000

Hello!

On Fri, Dec 8, 2017 at 1:04 PM, Haiyue Wang <haiyue.wang@linux.intel.com> wrote:
> This patch adds a simple device driver to expose the KCS interface on
> Aspeed SOC (AST2500) as a character device. Such SOC is commonly used
> as BMC (BaseBoard Management Controllers) and this driver implements
> the BMC side of the KCS interface.
>
> The KCS (Keyboard Controller Style) interface is used to perform in-band
> IPMI communication between a host and its BMC.
>
> The device name defaults to '/dev/ipmi-kcsX', X=1,2,3,4.
>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>

Thanks for the patch! This looks like a good start.

Can I ask that we do the review for this on the upstream list? Use
scripts/get_maintainers.pl on your patches to discover the upstream
maintainer. In addition, please cc myself and the OpenBMC list. I
encourage you to do this for any work newly submitted on upstream
drivers.

I'll give this a review now though.

Some general notes:

 - Send your device tree bindings in a separate patch
 - Put the updates to the device tree themselves in their own patch
 - Run the patches through scripts/checkpatch.pl before submitting

> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         |  33 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  44 +-
>  drivers/char/ipmi/Kconfig                          |  10 +
>  drivers/char/ipmi/Makefile                         |   1 +
>  drivers/char/ipmi/kcs-bmc.c                        | 827 +++++++++++++++++++++
>  include/uapi/linux/kcs-bmc.h                       |  14 +
>  6 files changed, 925 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/char/ipmi/kcs-bmc.c
>  create mode 100644 include/uapi/linux/kcs-bmc.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index a97131a..1e9d119 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -62,12 +62,25 @@ BMC Node
>  --------
>
>  - compatible:  One of:
> -               "aspeed,ast2400-lpc-bmc"
> -               "aspeed,ast2500-lpc-bmc"
> +               "aspeed,ast2400-lpc-bmc", "simple-mfd", "syscon"
> +               "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon"
>
>  - reg:         contains the physical address and length values of the
>                  H8S/2168-compatible LPC controller memory region
>
> +BMC KCS Node
> +------------
> +
> +- compatible:  One of:
> +               "aspeed,ast2500-kcs-bmc"

This hardware doesn't exist on the ast2400?

> +
> +- kcs_chan: The LPC channel number
> +
> +- kcs_regs: The KCS IDR,ODR,STR registers
> +
> +- kcs_addr: The host CPU IO map address
> +
> +
>  Host Node
>  ---------
>
> @@ -94,8 +107,22 @@ lpc: lpc@1e789000 {
>         ranges = <0x0 0x1e789000 0x1000>;
>
>         lpc_bmc: lpc-bmc@0 {

Ah, the lpc-bmc node. This is Andrew's work, please add him to CC in
the future so he can help review.

> -               compatible = "aspeed,ast2500-lpc-bmc";
> +               compatible = "aspeed,ast2500-lpc-bmc"; "simple-mfd", "syscon";

Can you explain why we add the simple-mfd property here? The lpc
device already has this, which enables us to have a regmap across the
address space. If there's a further requirement then please explain
it.

>                 reg = <0x0 0x80>;
> +               reg-io-width = <4>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x80>;
> +
> +               kcs3: kcs@3 {

It's convention that the unit name has a corresponding reg property.

It looks like you should use reg = <3>, which means you don't need the
custom kcs_chan property.

> +                       compatible = "aspeed,ast2500-kcs-bmc";
> +                       interrupts = <8>;
> +                       kcs_chan = <3>;
> +                       kcs_regs = <0x2C 0x38 0x44>;

I suggest placing these register offsets in the driver.

There are a number of channel specific offsets, registers and masks
that need to be specified. From what I can see you specify some here
in the device tree, and others are selected in the switch statements
in your code. It's a good goal to make a code generic with the
hardware differences specified in the device tree, but in this case
it's not worth it.

I suggest a data structure that contains the registers, enable bits
and mask, address bits and mask, etc. This way you can store a pointer
to that data structure containing all of the information, and you
don't need the switch statements in the code.

struct kcs_channel {
      u32 idr;
      u32 odr
      u32 str;
      u32 en_reg1;
      u32 en_mask1;
      u32 en_reg2;
      u32 en_mask2;
};

static const struct kcs_channels[4] =
  { .idr = 0x2C,
    .odr = 0x38,
    .str = 0x44,
    .en_reg1 = LPC_HICR2,
    .en_mask1 = LPC_HICR2_IBFIF3

etc.

> +                       kcs_addr = <0xCA2>;
> +                       status = "okay";
> +               };
>         };
>
>         lpc_host: lpc-host@80 {

> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 90f3edf..9f8589f 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -85,3 +85,13 @@ config ASPEED_BT_IPMI_BMC
>           Provides a driver for the BT (Block Transfer) IPMI interface
>           found on Aspeed SOCs (AST2400 and AST2500). The driver
>           implements the BMC side of the BT interface.
> +
> +config ASPEED_KCS_IPMI_BMC
> +       depends on ARCH_ASPEED || COMPILE_TEST
> +        depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> +       tristate "KCS IPMI bmc driver"
> +       default n

n is the default, so you don't need to specify it.

> +       help
> +         Provides a driver for the KCS (Keyboard Controller Style) IPMI
> +         interface found on Aspeed SOCs (AST2500). The driver implements
> +         the BMC side of the KCS interface.
> \ No newline at end of file
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 0d98cd9..35272a7 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
>  obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
>  obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> +obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs-bmc.o
> \ No newline at end of file
> diff --git a/drivers/char/ipmi/kcs-bmc.c b/drivers/char/ipmi/kcs-bmc.c
> new file mode 100644
> index 0000000..720c8b7
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs-bmc.c
> @@ -0,0 +1,827 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2015-2017, Intel Corporation.
> +
> +#include <linux/atomic.h>
> +#include <linux/slab.h>
> +#include <linux/kcs-bmc.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/regmap.h>
> +#include <linux/sched.h>
> +#include <linux/timer.h>
> +
> +/*
> + * This is a BMC device used to communicate to the host
> + */
> +#define DEVICE_NAME     "ipmi-kcs-host"
> +
> +
> +/* Different Phases of the KCS Module */
> +#define KCS_PHASE_IDLE          0x00
> +#define KCS_PHASE_WRITE         0x01
> +#define KCS_PHASE_WRITE_END     0x02
> +#define KCS_PHASE_READ          0x03
> +#define KCS_PHASE_ABORT         0x04
> +#define KCS_PHASE_ERROR         0x05
> +
> +/* Abort Phase */
> +#define ABORT_PHASE_ERROR1      0x01
> +#define ABORT_PHASE_ERROR2      0x02
> +
> +/* KCS Command Control codes. */
> +#define KCS_GET_STATUS          0x60
> +#define KCS_ABORT               0x60
> +#define KCS_WRITE_START         0x61
> +#define KCS_WRITE_END           0x62
> +#define KCS_READ_BYTE           0x68
> +
> +/* Status bits.:
> + * - IDLE_STATE.  Interface is idle. System software should not be expecting
> + *                nor sending any data.
> + * - READ_STATE.  BMC is transferring a packet to system software. System
> + *                software should be in the "Read Message" state.
> + * - WRITE_STATE. BMC is receiving a packet from system software. System
> + *                software should be writing a command to the BMC.
> + * - ERROR_STATE. BMC has detected a protocol violation at the interface level,
> + *                or the transfer has been aborted. System software can either
> + *                use the "Get_Status" control code to request the nature of
> + *                the error, or it can just retry the command.
> + */
> +#define KCS_IDLE_STATE           0
> +#define KCS_READ_STATE           1
> +#define KCS_WRITE_STATE          2
> +#define KCS_ERROR_STATE          3
> +
> +/* KCS Error Codes */
> +#define KCS_NO_ERROR                0x00
> +#define KCS_ABORTED_BY_COMMAND      0x01
> +#define KCS_ILLEGAL_CONTROL_CODE    0x02
> +#define KCS_LENGTH_ERROR            0x06
> +#define KCS_UNSPECIFIED_ERROR       0xFF
> +
> +
> +#define KCS_ZERO_DATA           0
> +
> +/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
> +#define KCS_STR_STATE(state)        (state << 6)
> +#define KCS_STR_STATE_MASK          KCS_STR_STATE(0x3)
> +#define KCS_STR_CMD_DAT             (1 << 3)
> +#define KCS_STR_ATN                 (1 << 2)
> +#define KCS_STR_IBF                 (1 << 1)

You can use the BIT() macro for these.

> +#define KCS_STR_OBF                 (1)
> +
> +
> +/***************************** LPC Register ****************************/

Drop the ASCII art.

> +#define LPC_HICR0            0x000
> +#define     LPC_HICR0_LPC3E          (1 << 7)
> +#define     LPC_HICR0_LPC2E          (1 << 6)
> +#define     LPC_HICR0_LPC1E          (1 << 5)

BIT() macro again.

> +#define LPC_HICR2            0x008
> +#define     LPC_HICR2_IBFIF3         (1 << 3)
> +#define     LPC_HICR2_IBFIF2         (1 << 2)
> +#define     LPC_HICR2_IBFIF1         (1 << 1)
> +#define LPC_HICR4            0x010
> +#define     LPC_HICR4_LADR12AS       (1 << 7)
> +#define     LPC_HICR4_KCSENBL        (1 << 2)
> +#define LPC_LADR3H           0x014
> +#define LPC_LADR3L           0x018
> +#define LPC_LADR12H          0x01C
> +#define LPC_LADR12L          0x020
> +
> +#define LPC_HICRB            0x000
> +#define     LPC_HICRB_IBFIF4         (1 << 1)
> +#define     LPC_HICRB_LPC4E          (1 << 0)
> +#define LPC_LADR4            0x010
> +
> +
> +#define KCS_MSG_BUFSIZ      1024
> +#define KCS_CHANNEL_MAX     4
> +

I'll review the implementation in a later patch, once we have the
bindings worked out.

> +
> +static int kcs_bmc_probe(struct platform_device *pdev)
> +{
> +       struct kcs_bmc *kcs_bmc;
> +       struct device *dev;
> +       u32 chan, addr, io_regs[3];
> +       int rc;
> +
> +       if (!pdev || !pdev->dev.of_node)
> +               return -ENODEV;

Omit these checks.

> +
> +       dev = &pdev->dev;
> +
> +       rc = of_property_read_u32(dev->of_node, "kcs_chan", &chan);
> +       if (rc) {
> +               dev_err(dev, "no 'kcs_chan' configured\n");
> +               return -ENODEV;
> +       }
> +
> +       if (chan == 0 || chan > KCS_CHANNEL_MAX) {
> +               dev_err(dev, "invalid 'kcs_chan' = '%u' is configured\n", chan);
> +               return -ENODEV;
> +       }
> +
> +       rc = of_property_read_u32(dev->of_node, "kcs_addr", &addr);
> +       if (rc) {
> +               dev_err(dev, "no 'kcs_addr' configured\n");
> +               return -ENODEV;
> +       }
> +
> +       rc = of_property_read_u32_array(dev->of_node, "kcs_regs", io_regs,
> +                       ARRAY_SIZE(io_regs));
> +       if (rc) {
> +               dev_err(dev, "no 'kcs_regs' configured\n");
> +               return -ENODEV;
> +       }
> +
> +       kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc), GFP_KERNEL);
> +       if (!kcs_bmc)
> +               return -ENOMEM;
> +
> +       kcs_bmc->map = syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(kcs_bmc->map)) {
> +               struct resource *res;
> +               void __iomem *base;
> +
> +               /*
> +                * Assume it's not the MFD-based devicetree description, in
> +                * which case generate a regmap ourselves
> +                */
> +               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +               base = devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base)) {
> +                       dev_err(dev, "ioremap error\n");
> +                       return PTR_ERR(base);
> +               }
> +
> +               kcs_bmc->map = devm_regmap_init_mmio(dev, base,
> +                                       &kcs_regmap_cfg);
> +               if (IS_ERR(kcs_bmc->map)) {
> +                       dev_err(dev, "regmap init error\n");
> +                       return PTR_ERR(base);
> +               }
> +
> +               kcs_bmc->offset = 0;
> +       } else {
> +               rc = of_property_read_u32(dev->of_node, "reg",
> +                                       &kcs_bmc->offset);
> +               if (rc) {
> +                       rc = of_property_read_u32(dev->parent->of_node, "reg",
> +                                       &kcs_bmc->offset);
> +                       if (rc) {
> +                               dev_err(dev, "no 'reg' configured\n");
> +                               return rc;
> +                       }
> +               }

Perhaps this code was copied from the BT driver? It is in place to
support some old device tree bindings that we don't use. As your
bindings specify a syscon, you can omit the else path of this code.

> +       }
> +
> +       spin_lock_init(&kcs_bmc->lock);
> +       kcs_bmc->chan = chan;
> +       kcs_bmc->idr  = io_regs[0];
> +       kcs_bmc->odr  = io_regs[1];
> +       kcs_bmc->str  = io_regs[2];
> +
> +       init_waitqueue_head(&kcs_bmc->queue);
> +       kcs_bmc->data_in  = kmalloc(KCS_MSG_BUFSIZ, GFP_KERNEL);
> +       kcs_bmc->data_out = kmalloc(KCS_MSG_BUFSIZ, GFP_KERNEL);

A tip: if you use devm_kzalloc, the kernel device driver
infrastructure will free these buffers when the driver is removed, or
if the probe fails.

> +       if (kcs_bmc->data_in == NULL || kcs_bmc->data_out == NULL) {
> +               rc = -ENOMEM;
> +               dev_err(dev, "KCS%u failed data_in=%p, data_out=%p\n",
> +                            kcs_bmc->chan,
> +                            kcs_bmc->data_in,
> +                            kcs_bmc->data_out);
> +               goto bail;
> +       }
> +
