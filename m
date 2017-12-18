Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::230; helo=mail-lf0-x230.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pJWqk6xL"; 
 dkim-atps=neutral
Received: from mail-lf0-x230.google.com (mail-lf0-x230.google.com
 [IPv6:2a00:1450:4010:c07::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0X6B35XwzDrWw
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 18:02:26 +1100 (AEDT)
Received: by mail-lf0-x230.google.com with SMTP id r143so16539462lfe.13
 for <openbmc@lists.ozlabs.org>; Sun, 17 Dec 2017 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=NVNFiTeo/4OF2B9Jj3l4bqjNKrSP27VbgFiNUunCldw=;
 b=pJWqk6xLKf7VgsgQLVW0gbMMF3tjuSnSesC3Z8V8uZzntckKtWyPV33gSb23jrcVAi
 3MDna1Tj9byzv4BN8mPe3jA6QeVPH3CiWkRH2SdzkFUGp0umJiZgOTfG2EcThdeXaRUj
 X5p33UEzCw2VyXd5t53X8iw+Hvha1AE/CFtlOgbPOLnA9DkzXCtRcEBSHQWG6/Thv0bU
 o+rdXqN1AfLGTLGm7C0Gt3Tr150+uej1zAAf5pAxXzpBABkczHHjNG0j8gYC5RRZs5Ec
 G2XlzvDFyslqWQL9T0Uz46ybFmi4g3XFJ0GgsI79dp//mZk+6iZvHujw44Qfi8vSfIki
 2ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=NVNFiTeo/4OF2B9Jj3l4bqjNKrSP27VbgFiNUunCldw=;
 b=H/R5oK90Aj2O13p/vY6bvt400+1PT/MhxpxzJtmu6Ye1KOcpFt9xr9ovhkGzfgKzc0
 YguR5r8Q7hXO55lk8v3E5EC11aUn8nFtIL6WHG6GoxbK/jnmoqbzDwbDh6sFRze95+6x
 GCNpmn5hMMyipMOoZ95nZ7oWOw95LyG0jec795jh4AdQdCGz/2Em0IRlJK/TX0JDp7lg
 Pz0/ha2F9HdQENVwOwMXUXKLyFDZZyUPRqVKZ/rBQIIq09/A5IzFKmi4NwHaazKklK7b
 0aFiigzieeBiNd0cSA45Ia5UBxBRMJflTFAJmLwSnfYcdKKTwUDUD8FMRMA7hCw2Ktpm
 bt/A==
X-Gm-Message-State: AKGB3mL5He/xYwNvWeYNVH7AokVvsDUTgw5SRYwtWjYCI9bhKmgQmsW1
 EmqGneQLIX3KNH4qVGnK6ciwcxAQAmn/XnBvNJQ=
X-Google-Smtp-Source: ACJfBoscnLMMT8mt9jttKwW+MzmXrjGaj19ogRsEnIX3rA0Ts+I/Aux7tIMA75WnAFHAt47ArYi26hpCGPU914tkhrw=
X-Received: by 10.46.89.69 with SMTP id n66mr11358866ljb.26.1513580541594;
 Sun, 17 Dec 2017 23:02:21 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Sun, 17 Dec 2017 23:02:01 -0800 (PST)
In-Reply-To: <1513577542-8693-1-git-send-email-haiyue.wang@linux.intel.com>
References: <1513577542-8693-1-git-send-email-haiyue.wang@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Dec 2017 17:32:01 +1030
X-Google-Sender-Auth: jngeOqkLFVsxm8E-Ac4PFclwDI4
Message-ID: <CACPK8XcYEXeRCred=SBEc9KrOS6BvQ3x3yUp9Bam9ZF89PgfLg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] eSPI: add Aspeed AST2500 eSPI driver to
 boot a host with PCH runs on eSPI
To: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 18 Dec 2017 07:02:27 -0000

On Mon, Dec 18, 2017 at 4:42 PM, Haiyue Wang
<haiyue.wang@linux.intel.com> wrote:
> The PCH (master) provides the eSPI to support connection of a BMC (slave)
> to the platform.
>
> The LPC and eSPI interfaces are mutually exclusive. Both use the same
> pins, but on power-up, a HW strap determines if the eSPI or the LPC bus i=
s
> operational. Once selected, it=E2=80=99s not possible to change to the ot=
her
> interface.
>
> eSPI Channels and Supported Transactions:
> +------+---------------------+----------------------+--------------------=
+
> | CH # | Channel             | Posted Cycles        | Non-Posted Cycles  =
|
> +------+---------------------+----------------------+--------------------=
+
> |  0   | Peripheral          | Memory Write,        | Memory Read,       =
|
> |      |                     | Completions          | I/O Read/Write     =
|
> +------+---------------------+----------------------+--------------------=
+
> |  1   | Virtual Wire        | Virtual Wire GET/PUT | N/A                =
|
> +------+---------------------+----------------------+--------------------=
+
> |  2   | Out-of-Band Message | SMBus Packet GET/PUT | N/A                =
|
> +------+---------------------+----------------------+--------------------=
+
> |  3   | Flash Access        | N/A                  | Flash Read, Write, =
|
> |      |                     |                      | Erase              =
|
> +------+---------------------+----------------------+--------------------=
+
> |  N/A | General             | Register Accesses    | N/A                =
|
> +------+---------------------+----------------------+--------------------=
+
>
> Virtual Wire Channel (Channel 1) Overview
> The Virtual Wire channel uses a standard message format to communicate
> several types of signals between the components on the platform.
> - Sideband and GPIO Pins: System events and other dedicated signals
>   between the PCH and eSPI slave. These signals are tunneled between the
>   two components over eSPI.
> - Serial IRQ Interrupts: Interrupts are tunneled from the eSPI slave to
>   the PCH. Both edge and triggered interrupts are supported.
>
> [This patch add the basic function to boot a host whose PCH runs on eSPI]
>
> When PCH runs on eSPI mode, from BMC side, the following VW messages are
> done in firmware:
> 1. SLAVE_BOOT_LOAD_DONE / SLAVE_BOOT_LOAD_STATUS
> 2. SUS_ACK
> 3. OOB_RESET_ACK
> 4. HOST_RESET_ACK
>
> +----------------------+---------+---------------------------------------=
+
> |Virtual Wire          |PCH Pin  |Comments                               =
|
> |                      |Direction|                                       =
|
> +----------------------+---------+---------------------------------------=
+
> |SUS_WARN#             |Output   |PCH pin is a GPIO when eSPI is enabled.=
|
> |                      |         |eSPI controller receives as VW message.=
|
> +----------------------+---------+---------------------------------------=
+
> |SUS_ACK#              |Input    |PCH pin is a GPIO when eSPI is enabled.=
|
> |                      |         |eSPI controller receives as VW message.=
|
> +----------------------+---------+---------------------------------------=
+
> |SLAVE_BOOT_LOAD_DONE  |Input    |Sent when the BMC has completed its    =
|
> |                      |         |boot process as an indication to       =
|
> |                      |         |eSPI-MC to continue with the G3 to S0  =
|
> |                      |         |exit.                                  =
|
> |                      |         |The eSPI Master waits for the assertion=
|
> |                      |         |of this virtual wire before proceeding =
|
> |                      |         |with the SLP_S5# deassertion.          =
|
> |                      |         |The intent is that it is never changed =
|
> |                      |         |except on a G3 exit - it is reset on a =
|
> |                      |         |G3 entry.                              =
|
> +----------------------+---------+---------------------------------------=
+
> |SLAVE_BOOT_LOAD_STATUS|Input    |Sent upon completion of the Slave Boot =
|
> |                      |         |Load from the attached flash. A stat of=
|
> |                      |         |1 indicates that the boot code load was=
|
> |                      |         |successful and that the integrity of   =
|
> |                      |         |the image is intact.                   =
|
> +----------------------+---------+---------------------------------------=
+
> |HOST_RESET_WARN       |Output   |Sent from the MC just before the Host  =
|
> |                      |         |is about to enter reset. Upon receiving=
|
> |                      |         |, the BMC must flush and quiesce its   =
|
> |                      |         |upstream Peripheral Channel request    =
|
> |                      |         |queues and assert HOST_RESET_ACK VWire.=
|
> |                      |         |The MC subsequently completes any      =
|
> |                      |         |outstanding posted transactions or     =
|
> |                      |         |completions and then disables the      =
|
> |                      |         |Peripheral Channel via a write to      =
|
> |                      |         |the Slave's Configuration Register.    =
|
> +----------------------+---------+---------------------------------------=
+
> |HOST_RESET_ACK        |Input    |ACK for the HOST_RESET_WARN message    =
|
> +----------------------+---------+---------------------------------------=
+
> |OOB_RESET_WARN        |Output   |Sent from the MC just before the OOB   =
|
> |                      |         |processor is about to enter reset. Upon=
|
> |                      |         |receiving, the BMC must flush and      =
|
> |                      |         |quiesce its OOB Channel upstream       =
|
> |                      |         |request queues and assert OOB_RESET_ACK=
|
> |                      |         |VWire. The-MC subsequently completes   =
|
> |                      |         |any outstanding posted transactions or =
|
> |                      |         |completions and then disables the OOB  =
|
> |                      |         |Channel via a write to the Slave's     =
|
> |                      |         |Configuration Register.                =
|
> +----------------------+---------+---------------------------------------=
+
> |OOB_RESET_ACK         |Input    |ACK for OOB_RESET_WARN message         =
|
> +----------------------+---------+---------------------------------------=
+
>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>  .../devicetree/bindings/misc/aspeed-espi-slave.txt |  32 +++

The bindings documentation should go in it's own patch.


>  drivers/misc/Kconfig                               |  11 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/aspeed-espi-slave.c                   | 300 +++++++++++++++=
++++++

Is drivers/misc the only location in the tree for this?

>  4 files changed, 344 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed-espi-sl=
ave.txt
>  create mode 100644 drivers/misc/aspeed-espi-slave.c
>
> diff --git a/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt=
 b/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
> new file mode 100644
> index 0000000..0db889b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed-espi-slave.txt
> @@ -0,0 +1,32 @@
> +Aspeed eSPI Slave Controller
> +
> +Enhanced Serial Peripheral Interface (eSPI) is an interface using pins o=
f SPI,
> +but runs different protocol.
> +
> +Its interface supports peripheral, virtual wire, out-of-band, and flash =
sharing
> +channels.
> +
> + -- https://www.intel.com/content/dam/support/us/en/documents/software/c=
hipset-software/327432-004_espi_base_specification_rev1.0.pdf
> +    Enhanced Serial Peripheral Interface (eSPI)
> +    Interface Base Specification (for Client and Server Platforms)
> +    January 2016
> +    Revision 1.0
> +
> +Required properties:
> + - compatible: must be one of:
> +       - "aspeed,ast2500-espi-slave"
> +
> + - reg: physical base address of the controller and length of memory map=
ped
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
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 02ffdd1..8c0d791 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -766,6 +766,17 @@ config PANEL_BOOT_MESSAGE
>           An empty message will only clear the display at driver init tim=
e. Any other
>           printf()-formatted message is valid with newline and escape cod=
es.
>
> +config ASPEED_ESPI_SLAVE
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP
> +       tristate "Aspeed ast2500 eSPI slave device"
> +       ---help---
> +         This allows host to access Baseboard Management Controller (BMC=
) over the
> +         Enhanced Serial Peripheral Interface (eSPI) bus, which replaces=
 the Low Pin
> +         Count (LPC) bus.
> +
> +         Its interface supports peripheral, virtual wire, out-of-band, a=
nd flash
> +         sharing channels.
> +
>  config ASPEED_LPC_CTRL
>         depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
>         tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index ab8af76..a648599 100644
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
> diff --git a/drivers/misc/aspeed-espi-slave.c b/drivers/misc/aspeed-espi-=
slave.c
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
> +/***************************** eSPI Register ***************************=
*/

I don't like ascii art in drivers :)

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
> +static void aspeed_espi_slave_sys_event(struct aspeed_espi_slave_data *p=
riv)
> +{
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
> +       regmap_write(priv->map, ESPI_SYS_ISR, sts);
> +}
> +
> +static void aspeed_espi_slave_sys1_event(struct aspeed_espi_slave_data *=
priv)
> +{
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
> +       regmap_write(priv->map, ESPI_SYS1_ISR, sts);
> +}
> +
> +static irqreturn_t aspeed_espi_slave_irq(int irq, void *arg)
> +{
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
> +                               ESPI_CTRL_SW_RESET, ESPI_CTRL_SW_RESET,
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
> +static int aspeed_espi_slave_config_irq(struct aspeed_espi_slave_data *p=
riv,
> +                       struct platform_device *pdev)
> +{
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
> +               dev_warn(dev, "Unable to request IRQ %d\n", priv->irq);
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
> +                       ESPI_SYSEVT_PLT_RST_N)
> +#define ESPI_SYS_INT_SET ( \
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
> +       regmap_write(priv->map, ESPI_SYS1_INT_T0, ESPI_SYSEVT1_SUS_WARN);
> +       regmap_write(priv->map, ESPI_SYS1_INT_T1, 0x00000000);
> +       regmap_write(priv->map, ESPI_SYS1_INT_T2, 0x00000000);
> +       regmap_write(priv->map, ESPI_SYS1_IER,    ESPI_SYSEVT1_SUS_WARN);
> +
> +       regmap_write(priv->map, ESPI_IER, 0xFFFFFFFF);
> +
> +       return rc;
> +}
> +
> +static void aspeed_espi_slave_boot_ack(struct aspeed_espi_slave_data *pr=
iv)
> +{
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
> +                       evt | ESPI_SYSEVT1_SUS_ACK);
> +}
> +
> +
> +static int regmap_espi_slave_reg_write(void *context, unsigned int reg,
> +                                            unsigned int val)
> +{
> +       void __iomem *regs =3D (void __iomem *)context;
> +
> +       writel(val, regs + reg);
> +       return 0;
> +}
> +
> +static int regmap_espi_slave_reg_read(void *context, unsigned int reg,
> +                                           unsigned int *val)
> +{
> +       void __iomem *regs =3D (void __iomem *)context;
> +
> +       *val =3D readl(regs + reg);
> +       return 0;
> +}
> +
> +static const struct regmap_config aspeed_espi_slave_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .reg_write =3D regmap_espi_slave_reg_write,
> +       .reg_read =3D regmap_espi_slave_reg_read,
> +       .fast_io =3D true,
> +};
> +
> +static int aspeed_espi_slave_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_espi_slave_data *priv;
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       void __iomem *regs;
> +       int rc;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENOENT;

This check can be omitted as the devm_ioremap_resource will do this
check for you.

> +       regs =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +       priv->map =3D devm_regmap_init(dev, NULL, (__force void *)regs,
> +                       &aspeed_espi_slave_regmap_config);

Is there a reason you used a regmap for accessing these registers?

Often we use a regmap to cache access to a slow bus (like i2c), or to
provide mutual exclusion when modifying the same memory mapped
addresses. It looks like we have neither here, so you could avoid the
overhead and use readl/writel directly?

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
> +static int aspeed_espi_slave_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}

If you're not doing anything in the remove callback you can omit it.

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
> +       .remove =3D aspeed_espi_slave_remove,
> +};
> +
> +module_platform_driver(aspeed_espi_slave_driver);
> +
> +MODULE_DEVICE_TABLE(of, of_espi_slave_match_table);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> +MODULE_DESCRIPTION("Linux device interface to the eSPI slave");
> --
> 2.7.4
>
