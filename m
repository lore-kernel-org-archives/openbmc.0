Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNw3r5rmTzDq62
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 12:09:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=CxTpy7Yr; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 280A331A070;
 Mon,  6 Jun 2016 19:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=T7pAEUo13RsHaKx8h6hWO
 PlPesg=; b=CxTpy7Yr+nESOHa1DFEpWR/XhSZoh1vMWC497OBDNNJPcLKH/nkqY
 2mo9BjvUWdC6BStJpJhew2ErbAjDwJm/K5UKjUkMckIrgmMEkPCyF51AulwHDLpJ
 iJ84kfTWlzWcMRlXizK5vajjXI2+IPmd61hY8DlXXv1k1ffCpNqVJ8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id 1F6F131A061;
 Mon,  6 Jun 2016 19:09:08 -0700 (PDT)
Message-ID: <1465265326.16048.50.camel@aj.id.au>
Subject: Re: [PATCH qemu 01/12] ast2400: add SMC controllers (FMC and SPI)
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 11:38:46 +0930
In-Reply-To: <1464556805-4340-2-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-2-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hTmWOaT0rKxiBBtKuQO+"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2016 02:09:15 -0000


--=-hTmWOaT0rKxiBBtKuQO+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-05-29 at 23:19 +0200, C=C3=A9dric Le Goater wrote:
> This patch provides a simple device model for the SMC controllers
> available on the Aspeed AST2400 soc. Support is limited to the FMC and
> the SPI controllers, and to SPI flash slaves.
>=20
> Below is the initial framework : the sysbus object, MMIO for registers
> configuration and controls. Each controller has a SPI bus and a
> configurable number of CS lines for SPI flash slaves.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/ast2400.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A033 ++++++
> =C2=A0hw/ssi/Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 260 ++++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/hw/arm/ast2400.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A0=
3 +
> =C2=A0include/hw/ssi/aspeed_smc.h |=C2=A0=C2=A068 ++++++++++++
> =C2=A05 files changed, 365 insertions(+)
> =C2=A0create mode 100644 hw/ssi/aspeed_smc.c
> =C2=A0create mode 100644 include/hw/ssi/aspeed_smc.h
>=20
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 23d52bffcaa7..8f678983cee5 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -23,6 +23,9 @@
> =C2=A0#define AST2400_UART_5_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00=
184000
> =C2=A0#define AST2400_IOMEM_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x00200000
> =C2=A0#define AST2400_IOMEM_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x1E600000
> +#define AST2400_SMC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0AST2400_IOMEM_BASE /* Legacy SMC */
> +#define AST2400_FMC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00X1E620000
> +#define AST2400_SPI_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00X1E630000
> =C2=A0#define AST2400_VIC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E6C0000
> =C2=A0#define AST2400_SCU_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00x1E6E2000
> =C2=A0#define AST2400_TIMER_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x1E782000
> @@ -77,6 +80,14 @@ static void ast2400_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->i2c, sizeof(s->i2c), =
TYPE_ASPEED_I2C);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "i2c", OBJEC=
T(&s->i2c), NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->i2c), sysbus=
_get_default());
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->smc, sizeof(s->smc), TYPE_=
ASPEED_SMC);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "smc", OBJECT(&s-=
>smc), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_=
default());
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->spi, sizeof(s->spi), TYPE_=
ASPEED_SMC);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "spi", OBJECT(&s-=
>spi), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_=
default());
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2400_realize(DeviceState *dev, Error **errp)
> @@ -171,6 +182,28 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The palmetto platform expects a ds3231 R=
TC but a ds1338 is
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* enough to provide basic RTC feature=
s. Alarms will be missing */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&s->i2c), 0), "ds1338", 0x68);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* SMC */
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->smc), 1, "num=
-cs", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->spi), AspeedS=
MCFMC, "smc-type", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->smc), true, =
"realized", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2=
400_FMC_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_get_=
gpio_in(DEVICE(&s->vic), 19));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* SPI */
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->spi), 1, "num=
-cs", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->spi), AspeedS=
MCSPI, "smc-type", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->spi), true, =
"realized", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2=
400_SPI_BASE);
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2400_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
> index 9555825acad1..6b32bf22ce3b 100644
> --- a/hw/ssi/Makefile.objs
> +++ b/hw/ssi/Makefile.objs
> @@ -2,5 +2,6 @@ common-obj-$(CONFIG_PL022) +=3D pl022.o
> =C2=A0common-obj-$(CONFIG_SSI) +=3D ssi.o
> =C2=A0common-obj-$(CONFIG_XILINX_SPI) +=3D xilinx_spi.o
> =C2=A0common-obj-$(CONFIG_XILINX_SPIPS) +=3D xilinx_spips.o
> +common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_smc.o
> =C2=A0
> =C2=A0obj-$(CONFIG_OMAP) +=3D omap_spi.o
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> new file mode 100644
> index 000000000000..780fcbbc9e55
> --- /dev/null
> +++ b/hw/ssi/aspeed_smc.c
> @@ -0,0 +1,260 @@
> +/*
> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
> + *
> + * Copyright (C) 2016 IBM Corp.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +#include "include/qemu/error-report.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/ssi/aspeed_smc.h"
> +
> +/* CE Type Setting Register */
> +#define R_CONF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0(0x00 / 4)
> +#define=C2=A0=C2=A0=C2=A0CONF_LEGACY_DISABLE=C2=A0=C2=A0(1 << 31)
> +#define=C2=A0=C2=A0=C2=A0CONF_ENABLE_W4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A020
> +#define=C2=A0=C2=A0=C2=A0CONF_ENABLE_W3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A019
> +#define=C2=A0=C2=A0=C2=A0CONF_ENABLE_W2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A018
> +#define=C2=A0=C2=A0=C2=A0CONF_ENABLE_W1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A017
> +#define=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A016
> +#define=C2=A0=C2=A0=C2=A0CONF_FLASH_TYPE4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A09
> +#define=C2=A0=C2=A0=C2=A0CONF_FLASH_TYPE3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07
> +#define=C2=A0=C2=A0=C2=A0CONF_FLASH_TYPE2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A05
> +#define=C2=A0=C2=A0=C2=A0CONF_FLASH_TYPE1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03
> +#define=C2=A0=C2=A0=C2=A0CONF_FLASH_TYPE0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01
> +
> +/* CE Control Register */
> +#define R_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0(0x04 / 4)
> +#define=C2=A0=C2=A0=C2=A0CRTL_EXTENDED4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A04=C2=A0=C2=A0/* 32 bit addressing for SPI */
> +#define=C2=A0=C2=A0=C2=A0CRTL_EXTENDED3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A03=C2=A0=C2=A0/* 32 bit addressing for SPI */
> +#define=C2=A0=C2=A0=C2=A0CRTL_EXTENDED2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A02=C2=A0=C2=A0/* 32 bit addressing for SPI */
> +#define=C2=A0=C2=A0=C2=A0CRTL_EXTENDED1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A01=C2=A0=C2=A0/* 32 bit addressing for SPI */
> +#define=C2=A0=C2=A0=C2=A0CRTL_EXTENDED0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00=C2=A0=C2=A0/* 32 bit addressing for SPI */
> +
> +/* Interrupt Control and Status Register */
> +#define R_INTR_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x08 / 4)
> +
> +/* CEx Control Register */
> +#define R_CTRL0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(0x10 / 4)
> +#define=C2=A0=C2=A0=C2=A0CTRL_CE_STOP_ACTIVE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(1 << 2)
> +#define=C2=A0=C2=A0=C2=A0CTRL_USERMODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x3
> +#define R_CTRL1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(0x14 / 4)
> +#define R_CTRL2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(0x18 / 4)
> +#define R_CTRL3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(0x1C / 4)
> +#define R_CTRL4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(0x20 / 4)
> +
> +/* CEx Segment Address Register */
> +#define R_SEG_ADDR0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x30 / 4)
> +#define=C2=A0=C2=A0=C2=A0SEG_SIZE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A024=C2=A0=C2=A0=C2=A0/* 8MB units */
> +#define=C2=A0=C2=A0=C2=A0SEG_SIZE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x7f
> +#define=C2=A0=C2=A0=C2=A0SEG_START_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A016=C2=A0=C2=A0=C2=A0/* address bit [A29-A23] */
> +#define=C2=A0=C2=A0=C2=A0SEG_START_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x7f
> +#define R_SEG_ADDR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x34 / 4)
> +#define R_SEG_ADDR2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x38 / 4)
> +#define R_SEG_ADDR3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x3C / 4)
> +#define R_SEG_ADDR4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x40 / 4)
> +
> +/* Misc Control Register #1 */
> +#define R_MISC_CRTL1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x50 / 4)
> +
> +/* Misc Control Register #2 */
> +#define R_MISC_CRTL2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x54 / 4)
> +
> +
> +/* SPI controller registers and bits (that we care about) */
> +#define R_SPI_CONF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x00 =
/ 4)
> +#define=C2=A0=C2=A0=C2=A0SPI_CONF_ENABLE_W0=C2=A0=C2=A0=C2=A00
> +#define R_SPI_CTRL0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x4 / 4)
> +#define R_SPI_MISC_CRTL=C2=A0=C2=A0=C2=A0(0x10 / 4)
> +#define R_SPI_TIMINGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x14 / 4)
> +
> +static const int aspeed_smc_r_ctrl0[]=C2=A0=C2=A0=C2=A0=3D { R_CTRL0, R_=
CTRL0, R_SPI_CTRL0 };
> +static const int aspeed_smc_r_conf[]=C2=A0=C2=A0=C2=A0=C2=A0=3D { R_CONF=
,=C2=A0=C2=A0R_CONF,=C2=A0=C2=A0R_SPI_CONF=C2=A0=C2=A0};
> +static const int aspeed_smc_conf_enable_w0[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, CONF_ENABLE_W0, SPI_CONF_ENABLE_=
W0 };
> +
> +
> +static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0return s->regs[s->r_ctrl0 + cs] & CTRL_CE_STOP_A=
CTIVE;
> +}
> +
> +static void aspeed_smc_update_cs(AspeedSMCState *s)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (aspeed_smc_is_ce_sto=
p_active(s, i)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
/* should reset command byte in control reg */

Can you expand on why this hasn't been implemented? I assume there are
no side-effects?

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu_set_irq(s->cs_lines=
[i], aspeed_smc_is_ce_stop_active(s, i));
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> +static void aspeed_smc_reset(DeviceState *d)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D ASPEED_SMC(d);
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0memset(s->regs, 0, sizeof s->regs);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->regs[s->r_ctrl0 + i] =
|=3D CTRL_CE_STOP_ACTIVE;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_update_cs(s);
> +}
> +
> +static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int =
size)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D ASPEED_SMC(opaque);
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t r =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0addr >>=3D 2;
> +=C2=A0=C2=A0=C2=A0=C2=A0switch (addr) {
> +=C2=A0=C2=A0=C2=A0=C2=A0default:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (addr < ARRAY_SIZE(s-=
>regs)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
r =3D s->regs[addr];
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> +=C2=A0=C2=A0=C2=A0=C2=A0}

Is there a good reason to use the switch here if there's only a default
case?

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return r;
> +}
> +
> +static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int size)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D ASPEED_SMC(opaque);
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t value =3D data;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0addr >>=3D 2;
> +=C2=A0=C2=A0=C2=A0=C2=A0switch (addr) {
> +=C2=A0=C2=A0=C2=A0=C2=A0default:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (addr < ARRAY_SIZE(s-=
>regs)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
s->regs[addr] =3D value;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> +=C2=A0=C2=A0=C2=A0=C2=A0}

Similar to above, though with ranges maybe we could accommodate the
condition below?

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + =
s->num_cs) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_update_cs(s);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +}
> +
> +static const MemoryRegionOps aspeed_smc_ops =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.read =3D aspeed_smc_read,
> +=C2=A0=C2=A0=C2=A0=C2=A0.write =3D aspeed_smc_write,
> +=C2=A0=C2=A0=C2=A0=C2=A0.endianness =3D DEVICE_NATIVE_ENDIAN,

I think I asked about this previously - should it be
DEVICE_LITTLE_ENDIAN?

> +=C2=A0=C2=A0=C2=A0=C2=A0.valid.unaligned =3D true,
> +};
> +
> +static const char * const aspeed_smc_types[] =3D { "smc", "fmc", "spi" }=
;
> +static const int aspeed_smc_max_slaves[] =3D { 5, 5, 1 };
> +
> +static int aspeed_smc_init(SysBusDevice *sbd)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0DeviceState *dev =3D DEVICE(sbd);
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState *s =3D ASPEED_SMC(dev);
> +=C2=A0=C2=A0=C2=A0=C2=A0int i;
> +=C2=A0=C2=A0=C2=A0=C2=A0char name[16];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0s->spi =3D ssi_create_bus(dev, "spi");
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Enforce some real HW limits */
> +=C2=A0=C2=A0=C2=A0=C2=A0if (s->num_cs > aspeed_smc_max_slaves[s->smc_typ=
e]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->num_cs =3D aspeed_smc=
_max_slaves[s->smc_type];
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Setup cs_lines for slaves */
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_irq(sbd, &s->irq);
> +=C2=A0=C2=A0=C2=A0=C2=A0s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
> +=C2=A0=C2=A0=C2=A0=C2=A0ssi_auto_connect_slaves(dev, s->cs_lines, s->spi=
);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_irq(sbd, &s-=
>cs_lines[i]);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* There are some differences in the register nu=
mbers and bits
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* between the FMC and SPI controller. Let'=
s abstract these.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0s->r_ctrl0 =3D aspeed_smc_r_ctrl0[s->smc_type];
> +=C2=A0=C2=A0=C2=A0=C2=A0s->r_conf =3D aspeed_smc_r_conf[s->smc_type];
> +=C2=A0=C2=A0=C2=A0=C2=A0s->conf_enable_w0 =3D aspeed_smc_conf_enable_w0[=
s->smc_type];

A little hairy, but understandable in that we avoid two mostly similar
implementations.

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* Unselect all slaves */
> +=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < s->num_cs; ++i) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->regs[s->r_ctrl0 + i] =
|=3D CTRL_CE_STOP_ACTIVE;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0snprintf(name, sizeof(name), "aspeed.%s", aspeed=
_smc_types[s->smc_type]);
> +=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->mmio, OBJECT(s), &aspe=
ed_smc_ops, s,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0name, ASPEED_SMC_R_MAX * 4);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->mmio);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> +}
> +
> +static const VMStateDescription vmstate_aspeed_smc =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "aspeed.smc",
> +=C2=A0=C2=A0=C2=A0=C2=A0.version_id =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0.minimum_version_id =3D 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0.fields =3D (VMStateField[]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_UINT32_ARRAY(reg=
s, AspeedSMCState, ASPEED_SMC_R_MAX),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VMSTATE_END_OF_LIST()
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +};
> +
> +static Property aspeed_smc_properties[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT8("num-cs", AspeedSMCState, num_=
cs, 1),
> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_UINT8("smc-type", AspeedSMCState, sm=
c_type, AspeedSMCFMC),
> +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void aspeed_smc_class_init(ObjectClass *klass, void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);
> +=C2=A0=C2=A0=C2=A0=C2=A0SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(kl=
ass);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0k->init =3D aspeed_smc_init;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->reset =3D aspeed_smc_reset;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->props =3D aspeed_smc_properties;
> +=C2=A0=C2=A0=C2=A0=C2=A0dc->vmsd =3D &vmstate_aspeed_smc;
> +}
> +
> +static const TypeInfo aspeed_smc_info =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=3D TYPE_ASPEED_SMC,
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=3D TYPE_SYS_BUS_DEVICE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.instance_size=C2=A0=C2=A0=3D sizeof(AspeedSMCSt=
ate),
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D asp=
eed_smc_class_init,
> +};
> +
> +static void aspeed_smc_register_types(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&aspeed_smc_info);
> +}
> +
> +type_init(aspeed_smc_register_types)
> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
> index e96e3db3fbea..9ba4245619c1 100644
> --- a/include/hw/arm/ast2400.h
> +++ b/include/hw/arm/ast2400.h
> @@ -17,6 +17,7 @@
> =C2=A0#include "hw/misc/aspeed_scu.h"
> =C2=A0#include "hw/timer/aspeed_timer.h"
> =C2=A0#include "hw/i2c/aspeed_i2c.h"
> +#include "hw/ssi/aspeed_smc.h"
> =C2=A0
> =C2=A0typedef struct AST2400State {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*< private >*/
> @@ -30,6 +31,8 @@ typedef struct AST2400State {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedTimerCtrlState timerctrl;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSCUState scu;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedI2CState i2c;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState smc;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState spi;
> =C2=A0} AST2400State;
> =C2=A0
> =C2=A0#define TYPE_AST2400 "ast2400"
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> new file mode 100644
> index 000000000000..9b95fcee5da7
> --- /dev/null
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -0,0 +1,68 @@
> +/*
> + * ASPEED AST2400 SMC Controller (SPI Flash Only)
> + *
> + * Copyright (C) 2016 IBM Corp.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef ASPEED_SMC_H
> +#define ASPEED_SMC_H
> +
> +#include "hw/ssi/ssi.h"
> +
> +enum AspeedSMCType {
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCLegacy,
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCFMC,
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCSPI,
> +};
> +
> +#define TYPE_ASPEED_SMC "aspeed.smc"
> +#define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_=
SMC)
> +
> +#define ASPEED_SMC_R_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
(0x100 / 4)
> +
> +typedef struct AspeedSMCState {
> +=C2=A0=C2=A0=C2=A0=C2=A0SysBusDevice parent_obj;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion mmio;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0qemu_irq irq;
> +=C2=A0=C2=A0=C2=A0=C2=A0int irqline;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t num_cs;
> +=C2=A0=C2=A0=C2=A0=C2=A0qemu_irq *cs_lines;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0SSIBus *spi;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t regs[ASPEED_SMC_R_MAX];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t smc_type;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* depends on the controller type */
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t r_conf;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t r_ctrl0;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t conf_enable_w0;
> +} AspeedSMCState;
> +
> +#define TYPE_ASPEED_SPI "aspeed.spi"
> +#define ASPEED_SPI(obj) OBJECT_CHECK(AspeedSPIState, (obj), TYPE_ASPEED_=
SPI)
> +
> +
> +#endif /* ASPEED_SMC_H */

Otherwise, looks good to me.

Andrew
--=-hTmWOaT0rKxiBBtKuQO+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXViyuAAoJEJ0dnzgO5LT5FI8P+wWpGcYmb6vKj6QIHhtf738N
dg13vs8OK49R63FnOVQsUiLq0/iyD0vRhrgshZt1YQQoTutkpq3/TMbsPEyFXAAS
Oka6ZdNh0mgSQ62cRFyons1F1QiIolvHmkIU058g4Y920/wcgdv0C+hlM+1CFEDj
EfnhkjZGZ+JIC+KnoavF7rpYWBpn5nDMMl8mM7zVfsV4Cb8IT/3xMfAEzfXIlCAi
23xiiVJkm8ylVuh7navuz6COe6eEgWdTmXASao0I30D2PusEhSGW9niG3pzjv3je
+B+yZEAYX6W6TC2TUJxyVgu8RGmm+2UdAQH7yHbHjZx78Ia7Jp+4qZM9fRHTMIJx
Tw/eAx1ztNnnI3+C1iUS1hzmYPo5W3b03yA6cSGfElkfKekbuLDKGvPnA4WVO27I
qsSEYziVPuGqs9T3Y2yov65kTRdscxsMUklEkVcofKQ7kG5rf+o0xEEwDVdvlcuL
fny8zdOwHMbEWh1wQ/RUi05auAhLnanvoF9ZEmfrEKAd5R0Q2Nelgnkqrk+551Ea
2sTBt6PTIp2o2OtWuy/Q74cjPuMRqEUBr5BjXSCojE9hRmv+fk2SBGu2AIGk5xgL
XR0pzrx97eG3tx+ANq4L30qVHLT1G+eUiFmh3VczQZ7W0fCIlNW9lSB1cpABX8bo
3fSLkZKYK9TGqlbQZsnq
=OT/B
-----END PGP SIGNATURE-----

--=-hTmWOaT0rKxiBBtKuQO+--
