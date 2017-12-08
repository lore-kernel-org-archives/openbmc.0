Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytM4R65PQzDrqH
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 16:54:30 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2017 21:54:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,376,1508828400"; d="scan'208";a="14176882"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO haiyuewaMOBL1)
 ([10.239.196.41])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2017 21:54:25 -0800
From: "Haiyue Wang" <haiyue.wang@linux.intel.com>
To: "'Joel Stanley'" <joel@jms.id.au>, "'Andrew Jeffery'" <andrew@aj.id.au>,
 "'Jeremy Kerr'" <jk@ozlabs.org>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <1512700492-22384-1-git-send-email-haiyue.wang@linux.intel.com>
 <CACPK8XfF1zSL-gF2eUWVyt3x4C1yHSqgLN5+gHH-vDTp4RomSA@mail.gmail.com>
In-Reply-To: <CACPK8XfF1zSL-gF2eUWVyt3x4C1yHSqgLN5+gHH-vDTp4RomSA@mail.gmail.com>
Subject: RE: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC driver
Date: Fri, 8 Dec 2017 13:54:24 +0800
Message-ID: <000401d36fe9$013e7590$03bb60b0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Content-Language: en-us
Thread-Index: AQGMrIk0dHknVINADY+HTS9zGZF0lwHX1CNxo7e3tqA=
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGVhYjQ1ZWUtZmVlMS00OWY5LThmZDMtNWNmYzU1MTY1MmM1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJUcTU3ajljTm9pQzUzdmIxVUVkYXhrR2xuVUFFOUlzK0o0TW1hWExzRkNcL0V2M1FOZk8xVHU0d0pScll6WENQdyJ9
x-ctpclassification: CTP_IC
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Fri, 08 Dec 2017 05:54:32 -0000

Great notes, will update a new patch later, thanks Joel.

I implemented the kcs by referenced the upstream bt driver. And the =
upstream maintainer is as bellowing,
I hope the openbmc expert to review my patch firstly, will send to the =
maintainer soon. :-)

./scripts/get_maintainer.pl drivers/char/ipmi/bt-bmc.c
Corey Minyard <minyard@acm.org> (supporter:IPMI SUBSYSTEM)
openipmi-developer@lists.sourceforge.net (moderated list:IPMI SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)


-----Original Message-----
From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel =
Stanley
Sent: Friday, December 8, 2017 11:25
To: Haiyue Wang <haiyue.wang@linux.intel.com>; Andrew Jeffery =
<andrew@aj.id.au>; Jeremy Kerr <jk@ozlabs.org>; C=C3=A9dric Le Goater =
<clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC =
driver

Hello!

On Fri, Dec 8, 2017 at 1:04 PM, Haiyue Wang =
<haiyue.wang@linux.intel.com> wrote:
> This patch adds a simple device driver to expose the KCS interface on=20
> Aspeed SOC (AST2500) as a character device. Such SOC is commonly used=20
> as BMC (BaseBoard Management Controllers) and this driver implements=20
> the BMC side of the KCS interface.
>
> The KCS (Keyboard Controller Style) interface is used to perform=20
> in-band IPMI communication between a host and its BMC.
>
> The device name defaults to '/dev/ipmi-kcsX', X=3D1,2,3,4.
>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>

Thanks for the patch! This looks like a good start.

Can I ask that we do the review for this on the upstream list? Use =
scripts/get_maintainers.pl on your patches to discover the upstream =
maintainer. In addition, please cc myself and the OpenBMC list. I =
encourage you to do this for any work newly submitted on upstream =
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
>  drivers/char/ipmi/kcs-bmc.c                        | 827 =
+++++++++++++++++++++
>  include/uapi/linux/kcs-bmc.h                       |  14 +
>  6 files changed, 925 insertions(+), 4 deletions(-)  create mode=20
> 100644 drivers/char/ipmi/kcs-bmc.c  create mode 100644=20
> include/uapi/linux/kcs-bmc.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt=20
> b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
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
>         ranges =3D <0x0 0x1e789000 0x1000>;
>
>         lpc_bmc: lpc-bmc@0 {

Ah, the lpc-bmc node. This is Andrew's work, please add him to CC in the =
future so he can help review.

> -               compatible =3D "aspeed,ast2500-lpc-bmc";
> +               compatible =3D "aspeed,ast2500-lpc-bmc"; "simple-mfd", =

> + "syscon";

Can you explain why we add the simple-mfd property here? The lpc device =
already has this, which enables us to have a regmap across the address =
space. If there's a further requirement then please explain it.

>                 reg =3D <0x0 0x80>;
> +               reg-io-width =3D <4>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges =3D <0x0 0x0 0x80>;
> +
> +               kcs3: kcs@3 {

It's convention that the unit name has a corresponding reg property.

It looks like you should use reg =3D <3>, which means you don't need the =
custom kcs_chan property.

> +                       compatible =3D "aspeed,ast2500-kcs-bmc";
> +                       interrupts =3D <8>;
> +                       kcs_chan =3D <3>;
> +                       kcs_regs =3D <0x2C 0x38 0x44>;

I suggest placing these register offsets in the driver.

There are a number of channel specific offsets, registers and masks that =
need to be specified. From what I can see you specify some here in the =
device tree, and others are selected in the switch statements in your =
code. It's a good goal to make a code generic with the hardware =
differences specified in the device tree, but in this case it's not =
worth it.

I suggest a data structure that contains the registers, enable bits and =
mask, address bits and mask, etc. This way you can store a pointer to =
that data structure containing all of the information, and you don't =
need the switch statements in the code.

struct kcs_channel {
      u32 idr;
      u32 odr
      u32 str;
      u32 en_reg1;
      u32 en_mask1;
      u32 en_reg2;
      u32 en_mask2;
};

static const struct kcs_channels[4] =3D
  { .idr =3D 0x2C,
    .odr =3D 0x38,
    .str =3D 0x44,
    .en_reg1 =3D LPC_HICR2,
    .en_mask1 =3D LPC_HICR2_IBFIF3

etc.

> +                       kcs_addr =3D <0xCA2>;
> +                       status =3D "okay";
> +               };
>         };
>
>         lpc_host: lpc-host@80 {

> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig=20
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
> +         Provides a driver for the KCS (Keyboard Controller Style) =
IPMI
> +         interface found on Aspeed SOCs (AST2500). The driver =
implements
> +         the BMC side of the KCS interface.
> \ No newline at end of file
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile=20
> index 0d98cd9..35272a7 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_IPMI_POWERNV) +=3D ipmi_powernv.o
>  obj-$(CONFIG_IPMI_WATCHDOG) +=3D ipmi_watchdog.o
>  obj-$(CONFIG_IPMI_POWEROFF) +=3D ipmi_poweroff.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) +=3D bt-bmc.o
> +obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) +=3D kcs-bmc.o
> \ No newline at end of file
> diff --git a/drivers/char/ipmi/kcs-bmc.c b/drivers/char/ipmi/kcs-bmc.c =

> new file mode 100644 index 0000000..720c8b7
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
> + * This is a BMC device used to communicate to the host  */
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
> + * - IDLE_STATE.  Interface is idle. System software should not be =
expecting
> + *                nor sending any data.
> + * - READ_STATE.  BMC is transferring a packet to system software. =
System
> + *                software should be in the "Read Message" state.
> + * - WRITE_STATE. BMC is receiving a packet from system software. =
System
> + *                software should be writing a command to the BMC.
> + * - ERROR_STATE. BMC has detected a protocol violation at the =
interface level,
> + *                or the transfer has been aborted. System software =
can either
> + *                use the "Get_Status" control code to request the =
nature of
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
> +/***************************** LPC Register=20
> +****************************/

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

I'll review the implementation in a later patch, once we have the =
bindings worked out.

> +
> +static int kcs_bmc_probe(struct platform_device *pdev) {
> +       struct kcs_bmc *kcs_bmc;
> +       struct device *dev;
> +       u32 chan, addr, io_regs[3];
> +       int rc;
> +
> +       if (!pdev || !pdev->dev.of_node)
> +               return -ENODEV;

Omit these checks.

> +
> +       dev =3D &pdev->dev;
> +
> +       rc =3D of_property_read_u32(dev->of_node, "kcs_chan", &chan);
> +       if (rc) {
> +               dev_err(dev, "no 'kcs_chan' configured\n");
> +               return -ENODEV;
> +       }
> +
> +       if (chan =3D=3D 0 || chan > KCS_CHANNEL_MAX) {
> +               dev_err(dev, "invalid 'kcs_chan' =3D '%u' is =
configured\n", chan);
> +               return -ENODEV;
> +       }
> +
> +       rc =3D of_property_read_u32(dev->of_node, "kcs_addr", &addr);
> +       if (rc) {
> +               dev_err(dev, "no 'kcs_addr' configured\n");
> +               return -ENODEV;
> +       }
> +
> +       rc =3D of_property_read_u32_array(dev->of_node, "kcs_regs", =
io_regs,
> +                       ARRAY_SIZE(io_regs));
> +       if (rc) {
> +               dev_err(dev, "no 'kcs_regs' configured\n");
> +               return -ENODEV;
> +       }
> +
> +       kcs_bmc =3D devm_kzalloc(dev, sizeof(*kcs_bmc), GFP_KERNEL);
> +       if (!kcs_bmc)
> +               return -ENOMEM;
> +
> +       kcs_bmc->map =3D syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(kcs_bmc->map)) {
> +               struct resource *res;
> +               void __iomem *base;
> +
> +               /*
> +                * Assume it's not the MFD-based devicetree =
description, in
> +                * which case generate a regmap ourselves
> +                */
> +               res =3D platform_get_resource(pdev, IORESOURCE_MEM, =
0);
> +               base =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base)) {
> +                       dev_err(dev, "ioremap error\n");
> +                       return PTR_ERR(base);
> +               }
> +
> +               kcs_bmc->map =3D devm_regmap_init_mmio(dev, base,
> +                                       &kcs_regmap_cfg);
> +               if (IS_ERR(kcs_bmc->map)) {
> +                       dev_err(dev, "regmap init error\n");
> +                       return PTR_ERR(base);
> +               }
> +
> +               kcs_bmc->offset =3D 0;
> +       } else {
> +               rc =3D of_property_read_u32(dev->of_node, "reg",
> +                                       &kcs_bmc->offset);
> +               if (rc) {
> +                       rc =3D =
of_property_read_u32(dev->parent->of_node, "reg",
> +                                       &kcs_bmc->offset);
> +                       if (rc) {
> +                               dev_err(dev, "no 'reg' configured\n");
> +                               return rc;
> +                       }
> +               }

Perhaps this code was copied from the BT driver? It is in place to =
support some old device tree bindings that we don't use. As your =
bindings specify a syscon, you can omit the else path of this code.

> +       }
> +
> +       spin_lock_init(&kcs_bmc->lock);
> +       kcs_bmc->chan =3D chan;
> +       kcs_bmc->idr  =3D io_regs[0];
> +       kcs_bmc->odr  =3D io_regs[1];
> +       kcs_bmc->str  =3D io_regs[2];
> +
> +       init_waitqueue_head(&kcs_bmc->queue);
> +       kcs_bmc->data_in  =3D kmalloc(KCS_MSG_BUFSIZ, GFP_KERNEL);
> +       kcs_bmc->data_out =3D kmalloc(KCS_MSG_BUFSIZ, GFP_KERNEL);

A tip: if you use devm_kzalloc, the kernel device driver infrastructure =
will free these buffers when the driver is removed, or if the probe =
fails.

> +       if (kcs_bmc->data_in =3D=3D NULL || kcs_bmc->data_out =3D=3D =
NULL) {
> +               rc =3D -ENOMEM;
> +               dev_err(dev, "KCS%u failed data_in=3D%p, =
data_out=3D%p\n",
> +                            kcs_bmc->chan,
> +                            kcs_bmc->data_in,
> +                            kcs_bmc->data_out);
> +               goto bail;
> +       }
> +
