Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0YzB3lRkzDsFl
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 19:26:27 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2017 00:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,421,1508828400"; d="scan'208";a="159684539"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO haiyuewaMOBL1)
 ([10.239.196.25])
 by orsmga004.jf.intel.com with ESMTP; 18 Dec 2017 00:26:21 -0800
From: "Haiyue Wang" <haiyue.wang@linux.intel.com>
To: "'Joel Stanley'" <joel@jms.id.au>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <1513577542-8693-1-git-send-email-haiyue.wang@linux.intel.com>
 <CACPK8XcYEXeRCred=SBEc9KrOS6BvQ3x3yUp9Bam9ZF89PgfLg@mail.gmail.com> 
In-Reply-To: 
Subject: RE: [PATCH linux dev-4.10] eSPI: add Aspeed AST2500 eSPI driver to
 boot a host with PCH runs on eSPI
Date: Mon, 18 Dec 2017 16:26:21 +0800
Message-ID: <000301d377d9$e2dcb500$a8961f00$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGt+xN1sMeYSkBTxK3ns90G8YaoMQIJVQNCAW7qWcijd/r/gA==
Content-Language: en-us
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmYzOGU3YTktODQ2My00N2JiLTg4YzItYTU3YTFjMDU5ZjYwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJhaGlVTmdJVkhsSUowckJ4VW9QaXFteWZMQ3I4bk5Zc1lYdXRvc1puR1dXVThjMVAzellrb0EyXC9laUlaYUhmNyJ9
x-ctpclassification: CTP_IC
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
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
X-List-Received-Date: Mon, 18 Dec 2017 08:26:31 -0000

Thanks Joe, I studied the regmap again, looks like that I truly overuse =
this kind of API. Will update new patch soon.
Thank you very much for help writing a driver with high performance . :)

BR,
Haiyue

-----Original Message-----
From: Haiyue Wang [mailto:haiyue.wang@linux.intel.com]=20
Sent: Monday, December 18, 2017 15:43
To: 'Joel Stanley' <joel@jms.id.au>
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH linux dev-4.10] eSPI: add Aspeed AST2500 eSPI driver =
to boot a host with PCH runs on eSPI

Thanks Joel. Sorry that I use *outlook* mail client to reply you like =
faking '>' style. :)

Please see the faked '>>' reply in mail.

BR,
Haiyue

-----Original Message-----
From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel =
Stanley
Sent: Monday, December 18, 2017 15:02
To: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10] eSPI: add Aspeed AST2500 eSPI driver =
to boot a host with PCH runs on eSPI

On Mon, Dec 18, 2017 at 4:42 PM, Haiyue Wang =
<haiyue.wang@linux.intel.com> wrote:
> The PCH (master) provides the eSPI to support connection of a BMC
> (slave) to the platform.
>
> The LPC and eSPI interfaces are mutually exclusive. Both use the same=20
> pins, but on power-up, a HW strap determines if the eSPI or the LPC=20
> bus is operational. Once selected, it=E2=80=99s not possible to change =
to the=20
> other interface.
>
> eSPI Channels and Supported Transactions:
> =
+------+---------------------+----------------------+--------------------=
+
> | CH # | Channel             | Posted Cycles        | Non-Posted =
Cycles  |
> =
+------+---------------------+----------------------+--------------------=
+
> |  0   | Peripheral          | Memory Write,        | Memory Read,     =
  |
> |      |                     | Completions          | I/O Read/Write   =
  |
> =
+------+---------------------+----------------------+--------------------=
+
> |  1   | Virtual Wire        | Virtual Wire GET/PUT | N/A              =
  |
> =
+------+---------------------+----------------------+--------------------=
+
> |  2   | Out-of-Band Message | SMBus Packet GET/PUT | N/A              =
  |
> =
+------+---------------------+----------------------+--------------------=
+
> |  3   | Flash Access        | N/A                  | Flash Read, =
Write, |
> |      |                     |                      | Erase            =
  |
> =
+------+---------------------+----------------------+--------------------=
+
> |  N/A | General             | Register Accesses    | N/A              =
  |
> =
+------+---------------------+----------------------+--------------------=
+
>
> Virtual Wire Channel (Channel 1) Overview The Virtual Wire channel=20
> uses a standard message format to communicate several types of signals =

> between the components on the platform.
> - Sideband and GPIO Pins: System events and other dedicated signals
>   between the PCH and eSPI slave. These signals are tunneled between =
the
>   two components over eSPI.
> - Serial IRQ Interrupts: Interrupts are tunneled from the eSPI slave =
to
>   the PCH. Both edge and triggered interrupts are supported.
>
> [This patch add the basic function to boot a host whose PCH runs on=20
> eSPI]
>
> When PCH runs on eSPI mode, from BMC side, the following VW messages=20
> are done in firmware:
> 1. SLAVE_BOOT_LOAD_DONE / SLAVE_BOOT_LOAD_STATUS 2. SUS_ACK 3.=20
> OOB_RESET_ACK 4. HOST_RESET_ACK
>
> =
+----------------------+---------+---------------------------------------=
+
> |Virtual Wire          |PCH Pin  |Comments                             =
  |
> |                      |Direction|                                     =
  |
> =
+----------------------+---------+---------------------------------------=
+
> |SUS_WARN#             |Output   |PCH pin is a GPIO when eSPI is =
enabled.|
> |                      |         |eSPI controller receives as VW =
message.|
> =
+----------------------+---------+---------------------------------------=
+
> |SUS_ACK#              |Input    |PCH pin is a GPIO when eSPI is =
enabled.|
> |                      |         |eSPI controller receives as VW =
message.|
> =
+----------------------+---------+---------------------------------------=
+
> |SLAVE_BOOT_LOAD_DONE  |Input    |Sent when the BMC has completed its  =
  |
> |                      |         |boot process as an indication to     =
  |
> |                      |         |eSPI-MC to continue with the G3 to =
S0  |
> |                      |         |exit.                                =
  |
> |                      |         |The eSPI Master waits for the =
assertion|
> |                      |         |of this virtual wire before =
proceeding |
> |                      |         |with the SLP_S5# deassertion.        =
  |
> |                      |         |The intent is that it is never =
changed |
> |                      |         |except on a G3 exit - it is reset on =
a |
> |                      |         |G3 entry.                            =
  |
> =
+----------------------+---------+---------------------------------------=
+
> |SLAVE_BOOT_LOAD_STATUS|Input    |Sent upon completion of the Slave =
Boot |
> |                      |         |Load from the attached flash. A stat =
of|
> |                      |         |1 indicates that the boot code load =
was|
> |                      |         |successful and that the integrity of =
  |
> |                      |         |the image is intact.                 =
  |
> =
+----------------------+---------+---------------------------------------=
+
> |HOST_RESET_WARN       |Output   |Sent from the MC just before the =
Host  |
> |                      |         |is about to enter reset. Upon =
receiving|
> |                      |         |, the BMC must flush and quiesce its =
  |
> |                      |         |upstream Peripheral Channel request  =
  |
> |                      |         |queues and assert HOST_RESET_ACK =
VWire.|
> |                      |         |The MC subsequently completes any    =
  |
> |                      |         |outstanding posted transactions or   =
  |
> |                      |         |completions and then disables the    =
  |
> |                      |         |Peripheral Channel via a write to    =
  |
> |                      |         |the Slave's Configuration Register.  =
  |
> =
+----------------------+---------+---------------------------------------=
+
> |HOST_RESET_ACK        |Input    |ACK for the HOST_RESET_WARN message  =
  |
> =
+----------------------+---------+---------------------------------------=
+
> |OOB_RESET_WARN        |Output   |Sent from the MC just before the OOB =
  |
> |                      |         |processor is about to enter reset. =
Upon|
> |                      |         |receiving, the BMC must flush and    =
  |
> |                      |         |quiesce its OOB Channel upstream     =
  |
> |                      |         |request queues and assert =
OOB_RESET_ACK|
> |                      |         |VWire. The-MC subsequently completes =
  |
> |                      |         |any outstanding posted transactions =
or |
> |                      |         |completions and then disables the =
OOB  |
> |                      |         |Channel via a write to the Slave's   =
  |
> |                      |         |Configuration Register.              =
  |
> =
+----------------------+---------+---------------------------------------=
+
> |OOB_RESET_ACK         |Input    |ACK for OOB_RESET_WARN message       =
  |
> =
+----------------------+---------+---------------------------------------=
+
>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>  .../devicetree/bindings/misc/aspeed-espi-slave.txt |  32 +++

>> The bindings documentation should go in it's own patch.
If I didn't add this file with this patch, the ' =
./scripts/checkpatch.pl' would give a warning for ' { .compatible =3D =
"aspeed,ast2500-espi-slave" }'.



>  drivers/misc/Kconfig                               |  11 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/aspeed-espi-slave.c                   | 300 =
+++++++++++++++++++++

>> Is drivers/misc the only location in the tree for this?
Currently I didn't find a good place, and under this location, there are =
' aspeed-lpc-ctrl.c' and ' aspeed-lpc-snoop.c', so I put it here as =
well.

>  4 files changed, 344 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
>  create mode 100644 drivers/misc/aspeed-espi-slave.c
>
> diff --git
> a/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
> b/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
> new file mode 100644
> index 0000000..0db889b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
> @@ -0,0 +1,32 @@
> +Aspeed eSPI Slave Controller
> +
> +Enhanced Serial Peripheral Interface (eSPI) is an interface using=20
> +pins of SPI, but runs different protocol.
> +
> +Its interface supports peripheral, virtual wire, out-of-band, and=20
> +flash sharing channels.
> +
> + -- =
https://www.intel.com/content/dam/support/us/en/documents/software/chipse=
t-software/327432-004_espi_base_specification_rev1.0.pdf
> +    Enhanced Serial Peripheral Interface (eSPI)
> +    Interface Base Specification (for Client and Server Platforms)
> +    January 2016
> +    Revision 1.0
> +
> +Required properties:
> + - compatible: must be one of:
> +       - "aspeed,ast2500-espi-slave"
> +
> + - reg: physical base address of the controller and length of memory =
mapped
> +   region
> +
> + - interrupts: interrupt generated by the controller
> +
> +Example:
> +
> +    espi: espi@1e6ee000 {
> +        compatible =3D "aspeed,ast2500-espi-slave";
> +        reg =3D <0x1e6ee000 0x100>;
> +        interrupts =3D <23>;
> +        status =3D "disabled";
> +};
> +
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig index
> 02ffdd1..8c0d791 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -766,6 +766,17 @@ config PANEL_BOOT_MESSAGE
>           An empty message will only clear the display at driver init =
time. Any other
>           printf()-formatted message is valid with newline and escape =
codes.
>
> +config ASPEED_ESPI_SLAVE
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP
> +       tristate "Aspeed ast2500 eSPI slave device"
> +       ---help---
> +         This allows host to access Baseboard Management Controller =
(BMC) over the
> +         Enhanced Serial Peripheral Interface (eSPI) bus, which =
replaces the Low Pin
> +         Count (LPC) bus.
> +
> +         Its interface supports peripheral, virtual wire, =
out-of-band, and flash
> +         sharing channels.
> +
>  config ASPEED_LPC_CTRL
>         depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && =
MFD_SYSCON
>         tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile index
> ab8af76..a648599 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)            +=3D echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)  +=3D vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         +=3D cxl/
>  obj-$(CONFIG_PANEL)             +=3D panel.o
> +obj-$(CONFIG_ASPEED_ESPI_SLAVE) +=3D aspeed-espi-slave.o
>  obj-$(CONFIG_ASPEED_LPC_CTRL)  +=3D aspeed-lpc-ctrl.o
>  obj-$(CONFIG_ASPEED_LPC_SNOOP) +=3D aspeed-lpc-snoop.o
>
> diff --git a/drivers/misc/aspeed-espi-slave.c
> b/drivers/misc/aspeed-espi-slave.c
> new file mode 100644
> index 0000000..18e5fad
> --- /dev/null
> +++ b/drivers/misc/aspeed-espi-slave.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2012-2020, ASPEED Technology Inc.
> +// Copyright (c) 2015-2017, Intel Corporation.
> +
> +#include <linux/atomic.h>
> +#include <linux/slab.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/regmap.h>
> +#include <linux/sched.h>
> +#include <linux/timer.h>
> +
> +
> +#define DEVICE_NAME     "aspeed-espi-slave"
> +
> +/***************************** eSPI Register=20
> +****************************/

>> I don't like ascii art in drivers :)
I will remove this in next patch, yes, this art is not so good. :-)

> +#define ESPI_CTRL                 0x00
> +#define      ESPI_CTRL_SW_RESET             GENMASK(31, 24)
> +#define      ESPI_CTRL_OOB_CHRDY            BIT(4)
> +#define ESPI_ISR                  0x08
> +#define      ESPI_ISR_HW_RESET              BIT(31)
> +#define      ESPI_ISR_VW_SYS_EVT1           BIT(22)
> +#define      ESPI_ISR_VW_SYS_EVT            BIT(8)
> +#define ESPI_IER                  0x0C
> +
> +#define ESPI_SYS_IER              0x94
> +#define ESPI_SYS_EVENT            0x98
> +#define ESPI_SYS_INT_T0           0x110
> +#define ESPI_SYS_INT_T1           0x114
> +#define ESPI_SYS_INT_T2           0x118
> +#define ESPI_SYS_ISR              0x11C
> +#define      ESPI_SYSEVT_HOST_RST_ACK       BIT(27)
> +#define      ESPI_SYSEVT_SLAVE_BOOT_STATUS  BIT(23)
> +#define      ESPI_SYSEVT_SLAVE_BOOT_DONE    BIT(20)
> +#define      ESPI_SYSEVT_OOB_RST_ACK        BIT(16)
> +#define      ESPI_SYSEVT_HOST_RST_WARN      BIT(8)
> +#define      ESPI_SYSEVT_OOB_RST_WARN       BIT(6)
> +#define      ESPI_SYSEVT_PLT_RST_N          BIT(5)
> +
> +#define ESPI_SYS1_IER             0x100
> +#define ESPI_SYS1_EVENT           0x104
> +#define ESPI_SYS1_INT_T0          0x120
> +#define ESPI_SYS1_INT_T1          0x124
> +#define ESPI_SYS1_INT_T2          0x128
> +#define ESPI_SYS1_ISR             0x12C
> +#define      ESPI_SYSEVT1_SUS_ACK           BIT(20)
> +#define      ESPI_SYSEVT1_SUS_WARN          BIT(0)
> +
> +
> +struct aspeed_espi_slave_data {
> +       struct regmap *map;
> +       int irq;
> +};
> +
> +static void aspeed_espi_slave_sys_event(struct aspeed_espi_slave_data
> +*priv) {
> +       u32 sts, evt;
> +
> +       if (regmap_read(priv->map, ESPI_SYS_ISR, &sts) !=3D 0 ||
> +           regmap_read(priv->map, ESPI_SYS_EVENT, &evt) !=3D 0)
> +               return;
> +
> +       if (sts & ESPI_SYSEVT_HOST_RST_WARN)
> +               regmap_update_bits_base(priv->map, ESPI_SYS_EVENT,
> +                       ESPI_SYSEVT_HOST_RST_ACK,
> +                       evt & ESPI_SYSEVT_HOST_RST_WARN
> +                               ? ESPI_SYSEVT_HOST_RST_ACK : 0,
> +                       NULL, false, true);
> +
> +       if (sts & ESPI_SYSEVT_OOB_RST_WARN)
> +               regmap_update_bits_base(priv->map, ESPI_SYS_EVENT,
> +                       ESPI_SYSEVT_OOB_RST_ACK,
> +                       evt & ESPI_SYSEVT_OOB_RST_WARN
> +                               ? ESPI_SYSEVT_OOB_RST_ACK : 0,
> +                       NULL, false, true);
> +
> +       regmap_write(priv->map, ESPI_SYS_ISR, sts); }
> +
> +static void aspeed_espi_slave_sys1_event(struct
> +aspeed_espi_slave_data *priv) {
> +       u32 sts;
> +
> +       if (regmap_read(priv->map, ESPI_SYS1_ISR, &sts) !=3D 0)
> +               return;
> +
> +       if (sts & ESPI_SYSEVT1_SUS_WARN)
> +               regmap_update_bits_base(priv->map, ESPI_SYS1_EVENT,
> +                       ESPI_SYSEVT1_SUS_ACK, ESPI_SYSEVT1_SUS_ACK,
> +                       NULL, false, true);
> +
> +       regmap_write(priv->map, ESPI_SYS1_ISR, sts); }
> +
> +static irqreturn_t aspeed_espi_slave_irq(int irq, void *arg) {
> +       u32 sts;
> +       struct aspeed_espi_slave_data *priv =3D arg;
> +
> +       if (regmap_read(priv->map, ESPI_ISR, &sts) !=3D 0)
> +               return IRQ_NONE;
> +
> +       if (sts & ESPI_ISR_HW_RESET) {
> +               regmap_update_bits_base(priv->map, ESPI_CTRL,
> +                               ESPI_CTRL_SW_RESET, 0,
> +                               NULL, false, true);
> +               regmap_update_bits_base(priv->map, ESPI_CTRL,
> +                               ESPI_CTRL_SW_RESET, =
ESPI_CTRL_SW_RESET,
> +                               NULL, false, true);
> +
> +               regmap_update_bits_base(priv->map, ESPI_SYS_EVENT,
> +                               ESPI_SYSEVT_SLAVE_BOOT_STATUS |
> +                                       ESPI_SYSEVT_SLAVE_BOOT_DONE,
> +                               ESPI_SYSEVT_SLAVE_BOOT_STATUS |
> +                                       ESPI_SYSEVT_SLAVE_BOOT_DONE,
> +                               NULL, false, true);
> +       }
> +
> +       if (sts & ESPI_ISR_VW_SYS_EVT)
> +               aspeed_espi_slave_sys_event(priv);
> +
> +       if (sts & ESPI_ISR_VW_SYS_EVT1)
> +               aspeed_espi_slave_sys1_event(priv);
> +
> +       regmap_write(priv->map, ESPI_ISR, sts);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int aspeed_espi_slave_config_irq(struct aspeed_espi_slave_data =
*priv,
> +                       struct platform_device *pdev) {
> +       int rc;
> +       struct device *dev =3D &pdev->dev;
> +
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (!priv->irq)
> +               return -ENODEV;
> +
> +       rc =3D devm_request_irq(dev, priv->irq, aspeed_espi_slave_irq,
> +                       IRQF_SHARED, DEVICE_NAME, priv);
> +       if (rc < 0) {
> +               dev_warn(dev, "Unable to request IRQ %d\n", =
priv->irq);
> +               priv->irq =3D 0;
> +               return rc;
> +       }
> +
> +       regmap_update_bits(priv->map, ESPI_CTRL,
> +                       ESPI_CTRL_OOB_CHRDY, ESPI_CTRL_OOB_CHRDY);
> +
> +       /* Setup Interrupt Type/Enable of System Event from Master
> +        *                                 T2 T1 T0
> +        *  1). HOST_RST_WARN : Dual Edge   1  0  0
> +        *  2). OOB_RST_WARN  : Dual Edge   1  0  0
> +        *  3). PLTRST_N      : Dual Edge   1  0  0
> +        */
> +#define ESPI_SYS_INT_T0_SET \
> +                       0x00000000
> +#define ESPI_SYS_INT_T1_SET \
> +                       0x00000000
> +#define ESPI_SYS_INT_T2_SET ( \
> +                       ESPI_SYSEVT_HOST_RST_WARN | \
> +                       ESPI_SYSEVT_OOB_RST_WARN  | \
> +                       ESPI_SYSEVT_PLT_RST_N) #define=20
> +ESPI_SYS_INT_SET ( \
> +                       ESPI_SYSEVT_HOST_RST_WARN | \
> +                       ESPI_SYSEVT_OOB_RST_WARN  | \
> +                       ESPI_SYSEVT_PLT_RST_N)
> +       regmap_write(priv->map, ESPI_SYS_INT_T0, ESPI_SYS_INT_T0_SET);
> +       regmap_write(priv->map, ESPI_SYS_INT_T1, ESPI_SYS_INT_T1_SET);
> +       regmap_write(priv->map, ESPI_SYS_INT_T2, ESPI_SYS_INT_T2_SET);
> +       regmap_write(priv->map, ESPI_SYS_IER,    ESPI_SYS_INT_SET);
> +
> +       /* Setup Interrupt Type/Enable of System Event 1 from Master
> +        *                                 T2 T1 T0
> +        *  1). SUS_WARN    : Rising Edge   0  0  1
> +        */
> +       regmap_write(priv->map, ESPI_SYS1_INT_T0, =
ESPI_SYSEVT1_SUS_WARN);
> +       regmap_write(priv->map, ESPI_SYS1_INT_T1, 0x00000000);
> +       regmap_write(priv->map, ESPI_SYS1_INT_T2, 0x00000000);
> +       regmap_write(priv->map, ESPI_SYS1_IER,    =
ESPI_SYSEVT1_SUS_WARN);
> +
> +       regmap_write(priv->map, ESPI_IER, 0xFFFFFFFF);
> +
> +       return rc;
> +}
> +
> +static void aspeed_espi_slave_boot_ack(struct aspeed_espi_slave_data
> +*priv) {
> +       u32 evt;
> +
> +       if (regmap_read(priv->map, ESPI_SYS_EVENT, &evt) =3D=3D 0 &&
> +           (evt & ESPI_SYSEVT_SLAVE_BOOT_STATUS) =3D=3D 0)
> +               regmap_write(priv->map, ESPI_SYS_EVENT,
> +                       evt |
> +                       ESPI_SYSEVT_SLAVE_BOOT_STATUS |
> +                       ESPI_SYSEVT_SLAVE_BOOT_DONE);
> +
> +       if (regmap_read(priv->map, ESPI_SYS1_EVENT, &evt) =3D=3D 0 &&
> +           (evt & ESPI_SYSEVT1_SUS_WARN) !=3D 0)
> +               regmap_write(priv->map, ESPI_SYS1_EVENT,
> +                       evt | ESPI_SYSEVT1_SUS_ACK); }
> +
> +
> +static int regmap_espi_slave_reg_write(void *context, unsigned int =
reg,
> +                                            unsigned int val) {
> +       void __iomem *regs =3D (void __iomem *)context;
> +
> +       writel(val, regs + reg);
> +       return 0;
> +}
> +
> +static int regmap_espi_slave_reg_read(void *context, unsigned int =
reg,
> +                                           unsigned int *val) {
> +       void __iomem *regs =3D (void __iomem *)context;
> +
> +       *val =3D readl(regs + reg);
> +       return 0;
> +}
> +
> +static const struct regmap_config aspeed_espi_slave_regmap_config =3D =
{
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .reg_write =3D regmap_espi_slave_reg_write,
> +       .reg_read =3D regmap_espi_slave_reg_read,
> +       .fast_io =3D true,
> +};
> +
> +static int aspeed_espi_slave_probe(struct platform_device *pdev) {
> +       struct aspeed_espi_slave_data *priv;
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       void __iomem *regs;
> +       int rc;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENOENT;

>> This check can be omitted as the devm_ioremap_resource will do this =
check for you.
Thanks, will remove it in next patch. This makes code clean. :-)

> +       regs =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       priv->map =3D devm_regmap_init(dev, NULL, (__force void =
*)regs,
> +                       &aspeed_espi_slave_regmap_config);

>> Is there a reason you used a regmap for accessing these registers?

>> Often we use a regmap to cache access to a slow bus (like i2c), or to =
provide mutual exclusion when modifying the same memory mapped =
addresses. It looks like we have neither here, so you could avoid the =
overhead and use readl/writel directly?

Because before, I implemented this driver under 3.18, we have more code =
lines like ' ast_espi_write(espi_dev, ast_espi_read(espi_dev, =
AST_ESPI_SYS1_EVENT) | ESPI_SUS_ACK,
				AST_ESPI_SYS1_EVENT);'
I find that regmap has a well-defined API regmap_update_bits to help the =
code clean. And also, in the further, may be easy for adding code to =
access these registers in device ioctls for mutual exclusion.

> +       if (IS_ERR(priv->map))
> +               return PTR_ERR(priv->map);
> +
> +       rc =3D aspeed_espi_slave_config_irq(priv, pdev);
> +       if (rc) {
> +               dev_err(dev, "Failed to configure IRQ\n");
> +               return rc;
> +       }
> +
> +       aspeed_espi_slave_boot_ack(priv);
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       dev_info(dev, "eSPI slave is running!\n");
> +
> +       return 0;
> +}
> +
> +static int aspeed_espi_slave_remove(struct platform_device *pdev) {
> +       return 0;
> +}

>> If you're not doing anything in the remove callback you can omit it.
Thanks, will remove it in next patch.

> +
> +static const struct of_device_id of_espi_slave_match_table[] =3D {
> +       { .compatible =3D "aspeed,ast2500-espi-slave" },
> +       {},
> +};
> +
> +static struct platform_driver aspeed_espi_slave_driver =3D {
> +       .driver =3D {
> +               .name           =3D DEVICE_NAME,
> +               .of_match_table =3D of_espi_slave_match_table,
> +       },
> +       .probe =3D aspeed_espi_slave_probe,
> +       .remove =3D aspeed_espi_slave_remove, };
> +
> +module_platform_driver(aspeed_espi_slave_driver);
> +
> +MODULE_DEVICE_TABLE(of, of_espi_slave_match_table);=20
> +MODULE_LICENSE("GPL"); MODULE_AUTHOR("Haiyue Wang=20
> +<haiyue.wang@linux.intel.com>"); MODULE_DESCRIPTION("Linux device=20
> +interface to the eSPI slave");
> --
> 2.7.4
>
