Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stKk15rsMzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 12:52:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=TXLa1/Kd; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=GlnNExDy; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B99162096E;
 Mon, 10 Oct 2016 21:52:07 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 10 Oct 2016 21:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=r6dwM
 S1tXFeWrivykmbIUGB3b48=; b=TXLa1/Kd9ECH7AR5RshxjQVEYzpzcPW6OWKjj
 8LyT4IYh4N0W1VdsGTWW8mae2TOejckvBVrt+FeHUajS2329j4oZPrLi84avzMVX
 RpYJ7ten9C0LppTyOgHpBdV+HZNeUFC4caMBCITaWW4MQFMvxx0detIktE4+TM+1
 LqhGlk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=r6dwMS1tXFeWrivykmbIUGB3b48=; b=GlnNE
 xDyYEvUpSeLSHkKhRIda9Izgi2goUVHoYEnvD1XLILQVsdL32AMHUW2fPjwLQkIR
 iqPAM7gqsHPLHgqbjpaaHF+HIRwxtAJuvD/ZJpk3qckzElkDP18rs7Qicxnk2D5P
 QuvJgmg+MxRdH7tMzly6JCOuFsxLcT2v3B51Ac=
X-Sasl-enc: tdoWMwHxUK1EZSCUBi4c/qiC+FeuTrJ3Bx/yaKS2CGY1 1476150725
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 045B6F29CC;
 Mon, 10 Oct 2016 21:52:03 -0400 (EDT)
Message-ID: <1476150691.16733.65.camel@aj.id.au>
Subject: Re: [RFC linux v1 2/2] drivers: occ hwmon - isolate bus transfer
 protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 11 Oct 2016 12:21:31 +1030
In-Reply-To: <1476126421-18039-1-git-send-email-eajames.ibm@gmail.com>
References: <1476126421-18039-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6wdvpeRENQuJKvJ272BS"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 11 Oct 2016 01:52:10 -0000


--=-6wdvpeRENQuJKvJ272BS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-10 at 14:07 -0500, eajames.ibm@gmail.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20

Again, this needs a commit message. A 1300 line change needs some
supporting words.

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A013 +-
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +-
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A015 +
> =C2=A0drivers/hwmon/occ/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 127 ++++++
> =C2=A0drivers/hwmon/occ/occ.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A050 +++
> =C2=A0drivers/hwmon/occ/occ_i2c.c=C2=A0=C2=A0=C2=A0=C2=A0| 191 ++++++++
> =C2=A0drivers/hwmon/occ/power8_occ.c | 970 ++++++++++++++++--------------=
-----------
> =C2=A0drivers/hwmon/occ/power8_occ.h |=C2=A0=C2=A024 +
> =C2=A09 files changed, 792 insertions(+), 601 deletions(-)
> =C2=A0create mode 100644 drivers/hwmon/occ/Kconfig
> =C2=A0create mode 100644 drivers/hwmon/occ/Makefile
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.h
> =C2=A0create mode 100644 drivers/hwmon/occ/occ_i2c.c
> =C2=A0create mode 100644 drivers/hwmon/occ/power8_occ.h
>=20
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3b34ba9..0ef3690 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1216,18 +1216,7 @@ config SENSORS_NSA320
> =C2=A0	=C2=A0=C2=A0This driver can also be built as a module. If so, the =
module
> =C2=A0	=C2=A0=C2=A0will be called nsa320-hwmon.
> =C2=A0
> -config SENSORS_POWER8_OCC_I2C
> -	tristate "Power8 On Chip Controller i2c driver"
> -	depends on I2C
> -	help
> -	=C2=A0=C2=A0If you say yes here you get support to monitor Power8 CPU
> -	=C2=A0=C2=A0sensors via the On Chip Controller (OCC) over the i2c bus.
> -
> -	=C2=A0=C2=A0Generally this is used by management controllers such as a =
BMC
> -	=C2=A0=C2=A0on an OpenPower system.
> -
> -	=C2=A0=C2=A0This driver can also be built as a module. If so, the modul=
e
> -	=C2=A0=C2=A0will be called power8_occ_i2c.
> +source drivers/hwmon/occ/Kconfig
> =C2=A0
> =C2=A0config SENSORS_PCF8591
> =C2=A0	tristate "Philips PCF8591 ADC/DAC"
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index c0f3201..7f61e31 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -127,7 +127,6 @@ obj-$(CONFIG_SENSORS_NCT7802)	+=3D nct7802.o
> =C2=A0obj-$(CONFIG_SENSORS_NCT7904)	+=3D nct7904.o
> =C2=A0obj-$(CONFIG_SENSORS_NSA320)	+=3D nsa320-hwmon.o
> =C2=A0obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+=3D ntc_thermistor.o
> -obj-$(CONFIG_SENSORS_POWER8_OCC_I2C)	+=3D power8_occ_i2c.o
> =C2=A0obj-$(CONFIG_SENSORS_PC87360)	+=3D pc87360.o
> =C2=A0obj-$(CONFIG_SENSORS_PC87427)	+=3D pc87427.o
> =C2=A0obj-$(CONFIG_SENSORS_PCF8591)	+=3D pcf8591.o
> @@ -165,6 +164,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+=3D wm831x-hwmon.o
> =C2=A0obj-$(CONFIG_SENSORS_WM8350)	+=3D wm8350-hwmon.o
> =C2=A0
> =C2=A0obj-$(CONFIG_PMBUS)		+=3D pmbus/
> +obj-$(CONFI_OCC)		+=3D occ/

As mentioned on the previous patch, please move some of these changes
to address its build issues.

> =C2=A0
> =C2=A0ccflags-$(CONFIG_HWMON_DEBUG_CHIP) :=3D -DDEBUG
> =C2=A0
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> new file mode 100644
> index 0000000..628fd6e
> --- /dev/null
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -0,0 +1,15 @@
> +#
> +# On Chip Controller configuration
> +#
> +
> +config OCC
> +	tristate "On Chip Controller driver"
> +	help
> +	=C2=A0=C2=A0If you say yes here you get support to monitor Power CPU
> +	=C2=A0=C2=A0sensors via the On Chip Controller (OCC).
> +
> +	=C2=A0=C2=A0Generally this is used by management controllers such as a =
BMC
> +	=C2=A0=C2=A0on an OpenPower system.
> +
> +	=C2=A0=C2=A0This driver can also be built as a module. If so, the modul=
e
> +	=C2=A0=C2=A0will be called occ.
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> new file mode 100644
> index 0000000..05b5031
> --- /dev/null
> +++ b/drivers/hwmon/occ/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_OCC) +=3D occ.o occ_i2c.o power8_occ.o
> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
> new file mode 100644
> index 0000000..9eeacca
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.c
> @@ -0,0 +1,127 @@
> +/*
> + * occ.c - hwmon OCC driver
> + *
> + * This file contains common methods between different host systems and =
bus
> + * protocols.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +
> +#include "occ.h"
> +#include "power8_occ.h"
> +
> +static ssize_t show_occ_online(struct device *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *at=
tr, char *buf)
> +{
> +	struct occ_driver *driver =3D (struct occ_driver *)dev_get_drvdata(dev)=
;
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", driver->occ_online);
> +}
> +
> +static ssize_t store_occ_online(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct occ_driver *driver =3D (struct occ_driver *)dev_get_drvdata(dev)=
;
> +	unsigned long val;
> +	int rc;
> +
> +	rc =3D kstrtoul(buf, 10, &val);
> +	if (rc)
> +		return rc;
> +
> +	if (val =3D=3D 1) {
> +		if (driver->occ_online)
> +			return count;
> +
> +		driver->hwmon =3D hwmon_device_register(dev);
> +		if (IS_ERR(driver->hwmon))
> +			return PTR_ERR(driver->hwmon);
> +
> +		rc =3D occ_init(driver);
> +		if (rc) {
> +			hwmon_device_unregister(driver->hwmon);
> +			driver->hwmon =3D NULL;
> +			return rc;
> +		}
> +	} else if (val =3D=3D 0) {
> +		if (!driver->occ_online)
> +			return count;
> +
> +		occ_exit(driver);
> +		hwmon_device_unregister(driver->hwmon);
> +		driver->hwmon =3D NULL;
> +	} else
> +		return -EINVAL;
> +
> +	driver->occ_online =3D val;
> +	return count;
> +}
> +
> +static DEVICE_ATTR(online, S_IWUSR | S_IRUGO, show_occ_online,
> +		=C2=A0=C2=A0=C2=A0store_occ_online);
> +
> +/*
> + * occ_common_probe - hardware agnostic initialization method
> + * @dev: device handle for transfer protocol
> + * @bus_ops: transfer methods to communicate with the OCC
> + * @bus: private handle for transfer protocol
> + *
> + * this initializes common aspects of the hwmon driver across bus protoc=
ols and
> + * host systems.
> + *
> + * returns negative errno on failure or 0 on success
> + */
> +int occ_probe(struct device *dev, struct occ_bus_ops bus_ops, void *bus)
> +{
> +	struct occ_driver *driver =3D devm_kzalloc(dev,
> +						=C2=A0sizeof(struct occ_driver),
> +						=C2=A0GFP_KERNEL);
> +
> +	if (!driver)
> +		return -ENOMEM;
> +
> +	driver->bus =3D bus;
> +	driver->bus_ops =3D bus_ops;
> +
> +	dev_set_drvdata(dev, driver);
> +
> +	return device_create_file(dev, &dev_attr_online);
> +}
> +
> +/*
> + * occ_common_remove - hardware agnostic exit method
> + * @dev: device handle for transfer protocol
> + *
> + * returns negative errno on failure or 0 on success
> + */
> +int occ_remove(struct device *dev)
> +{
> +	struct occ_driver *driver =3D dev_get_drvdata(dev);
> +
> +	device_remove_file(dev, &dev_attr_online);
> +
> +	if (driver->hwmon) {
> +		hwmon_device_unregister(driver->hwmon);
> +		occ_remove_hwmon_attrs(driver);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
> new file mode 100644
> index 0000000..788339f
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.h
> @@ -0,0 +1,50 @@
> +/*
> + * power_occ.h - hwmon OCC driver
> + *
> + * This file contains data structures and function prototypes for common=
 access
> + * between different bus protocols and host systems.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __OCC_H__
> +#define __OCC_H__
> +
> +struct device;
> +
> +/*
> + * occ_bus_ops - represent the low-level transfer methods to communicate=
 with
> + * the OCC.
> + */
> +struct occ_bus_ops {
> +	ssize_t (*read)(void *bus, void *buf, size_t count);
> +	ssize_t (*write)(void *bus, void *buf, size_t count);
> +	int (*getscom)(void *bus, uint32_t address, uint8_t *data, int offset);

You should use kernel types here e.g. u32 and u8. And for below with
putscom(), and in the associated implementations:

> +	int (*putscom)(void *bus, uint32_t address, uint8_t data0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t data1);

However, having read down a little it seems that this is a product of
the existing code. Given my other suggestions w.r.t. breaking up this
patch, the type fixes should be done as a separate change. Bear that in
mind, as I've made further comments on types thoughout the patch.

More importantly, my gut feeling is we are mixing abstractions here.
Maybe [gs]etscom() should be moved out of struct occ_bus_ops. I'll read
on...

> +};
> +
> +/*
> + * occ_driver - structure to store all global driver data
> + */
> +struct occ_driver {
> +	void *bus;
> +	struct occ_bus_ops bus_ops;
> +	struct device *hwmon;
> +	bool occ_online;
> +};
> +
> +int occ_probe(struct device *dev, struct occ_bus_ops bus_ops, void *bus)=
;
> +int occ_remove(struct device *dev);
> +
> +#endif /* __OCC_H__ */
> diff --git a/drivers/hwmon/occ/occ_i2c.c b/drivers/hwmon/occ/occ_i2c.c
> new file mode 100644
> index 0000000..739642b
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ_i2c.c
> @@ -0,0 +1,191 @@
> +/*
> + * occ_i2c.c - hwmon OCC driver
> + *
> + * This file contains the i2c layer for accessing the OCC over i2c bus.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +
> +#include "occ.h"
> +
> +#define OCC_I2C_NAME	"occ-i2c"
> +
> +#define OCC_DATA_MAX	4096
> +#define I2C_READ_ERROR	1
> +#define I2C_WRITE_ERROR	2
> +
> +/*
> + * occ_i2c_read - wrapper for i2c_master_recv
> + * @bus: handle to slave device
> + * @buf: where to store data read from slave
> + * @count: how many bytes to read
> + *
> + * Returns negative errno or else the number of bytes successfully read
> + */
> +ssize_t occ_i2c_read(void *bus, void *buf, size_t count)
> +{
> +	struct i2c_client *client =3D bus;
> +
> +	WARN_ON(count > OCC_DATA_MAX);
> +
> +	dev_dbg(&client->dev, "i2c_read: reading %zu bytes @0x%x.\n",
> +		count, client->addr);
> +	return i2c_master_recv(client, buf, count);
> +}
> +
> +/*
> + * occ_i2c_read - wrapper for i2c_master_send
> + * @bus: handle to slave device
> + * @buf: data that will be written to the slave
> + * @count: how many bytes to write
> + *
> + * Returns negative errno or else the number of bytes successfully writt=
en
> + */
> +ssize_t occ_i2c_write(void *bus, void *buf, size_t count)
> +{
> +	struct i2c_client *client =3D bus;
> +
> +	WARN_ON(count > OCC_DATA_MAX);
> +
> +	dev_dbg(&client->dev, "i2c_write: writing %zu bytes @0x%x.\n",
> +		count, client->addr);
> +	return i2c_master_send(client, buf, count);
> +}
> +
> +/*
> + * occ_getscom - helper function for scom read over i2c to OCC
> + * @bus: handle to slave device
> + * @address: address
> + * @data: where to store data read from slave
> + * @offset: offset into data pointer

The documentation should make clear that the length of the data buffer
must be equal or longer than (offset + 8).


> + *
> + * Returns 0 on success or -1 on read error, -2 on write error
> + */
> +int occ_getscom(void *bus, uint32_t address, uint8_t *data, int offset)

As mentioned in the header use kernel types: u32, u8 etc. Does offset
need to be negative? Maybe size_t is better. Goes for occ_putscom() as
well (and possibly elsewhere).

> +{
> +	ssize_t rc;
> +	char buf[8];

buf should likely be u8, given the "data" formal parameter is unsigned.

> +	int i;
> +
> +	/* P8 i2c slave requires address to be shifted by 1 */
> +	address =3D address << 1;
> +
> +	rc =3D occ_i2c_write(client, &address, sizeof(uint32_t));

sizeof(u32)

> +
> +	if (rc !=3D sizeof(address))
> +		return -I2C_WRITE_ERROR;
> +
> +	rc =3D occ_i2c_read(bus, buf, sizeof(buf));

What's the justification for the read() and write() callbacks in struct
bus_ops if we're just going to invoke the transport functions directly?

> +	if (rc !=3D sizeof(buf))
> +		return -I2C_READ_ERROR;
> +
> +	for (i =3D 0; i < 8; i++)
> +		data[offset + i] =3D buf[7 - i];

Perhaps you should use the endian helpers?

> +
> +	return 0;
> +}
> +
> +/*
> + * occ_putscom - helper function for scom write over i2c to OCC
> + * @bus: handle to slave device
> + * @address: address
> + * @data0: first data byte to write
> + * @data1: second data byte to write
> + *
> + * Returns 0 on success or -2 on error
> + */
> +int occ_putscom(void *bus, uint32_t address, uint32_t data0, uint32_t da=
ta1)
> +{
> +	uint32_t buf[3];
> +	ssize_t rc;
> +
> +	/* P8 i2c slave requires address to be shifted by 1 */
> +	address =3D address << 1;

I understand this is from the existing code, but I would prefer this go
in the occ_i2c_write() implementation. Abstractions exist to hide
details.

What are your thoughts?

> +
> +	buf[0] =3D address;
> +	buf[1] =3D data1;
> +	buf[2] =3D data0;
> +
> +	rc =3D occ_i2c_write(bus, buf, sizeof(buf));

As above: I think this should be a call to ops->write(), or we need to
recognise that the read/write callbacks aren't useful.

> +	if (rc !=3D sizeof(buf))
> +		return -I2C_WRITE_ERROR;
> +
> +	return 0;
> +}
> +
> +static int occ_i2c_probe(struct i2c_client *client,
> +			=C2=A0const struct i2c_device_id *id)
> +{
> +	struct occ_bus_ops bus_ops;
> +
> +	bus_ops.read =3D occ_i2c_read;
> +	bus_ops.write =3D occ_i2c_write;
> +	bus_ops.getscom =3D occ_getscom;
> +	bus_ops.putscom =3D occ_putscom;
> +
> +	return occ_probe(&client->dev, bus_ops, client);
> +}
> +
> +static int occ_i2c_remove(struct i2c_client *client)
> +{
> +	return occ_remove(&client->dev);
> +}
> +
> +/* used by old-style board info. */
> +static const struct i2c_device_id occ_ids[] =3D {
> +	{ OCC_I2C_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, occ_ids);
> +
> +/* used by device table */
> +static const struct of_device_id occ_of_match[] =3D {
> +	{ .compatible =3D "ibm,occ-i2c" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, occ_of_match);
> +
> +/*
> + * i2c-core uses i2c-detect() to detect device in below address list.
> + * If exists, address will be assigned to client.
> + * It is also possible to read address from device table.
> + */
> +static const unsigned short normal_i2c[] =3D {0x50, 0x51, I2C_CLIENT_END=
 };
> +
> +static struct i2c_driver occ_i2c_driver =3D {
> +	.class =3D I2C_CLASS_HWMON,
> +	.driver =3D {
> +		.name =3D OCC_I2C_NAME,
> +		.pm =3D NULL,
> +		.of_match_table =3D occ_of_match,
> +	},
> +	.probe =3D occ_i2c_probe,
> +	.remove =3D occ_i2c_remove,
> +	.id_table =3D occ_ids,
> +	.address_list =3D normal_i2c,
> +};
> +
> +module_i2c_driver(occ_i2c_driver);
> +
> +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("BMC OCC hwmon driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_oc=
c.c
> index 6de0e76..7dec2e7 100644
> --- a/drivers/hwmon/occ/power8_occ.c
> +++ b/drivers/hwmon/occ/power8_occ.c
> @@ -1,8 +1,10 @@
> =C2=A0/*
> - * OCC HWMON driver - read IBM Power8 On Chip Controller sensor data via
> - * i2c.
> + * power8_occ.c - Power8 OCC hwmon driver
> =C2=A0 *
> - * Copyright 2015 IBM Corp.
> + * This file contains the Power8-specific methods and data structures fo=
r
> + * the OCC hwmon driver.
> + *
> + * Copyright 2016 IBM Corp.
> =C2=A0 *
> =C2=A0 * This program is free software; you can redistribute it and/or mo=
dify
> =C2=A0 * it under the terms of the GNU General Public License as publishe=
d by
> @@ -19,24 +21,14 @@
> =C2=A0#include=20
> =C2=A0#include=20
> =C2=A0#include=20
> -#include=20
> =C2=A0#include=20
> =C2=A0#include=20
> =C2=A0#include=20
> =C2=A0#include=20
> -#include=20
> =C2=A0#include=20
> =C2=A0#include=20
> =C2=A0#include=20
> =C2=A0
> -#define OCC_I2C_ADDR 0x50
> -#define OCC_I2C_NAME "occ-i2c"
> -
> -#define OCC_DATA_MAX	4096 /* 4KB at most */
> -/* i2c read and write occ sensors */
> -#define I2C_READ_ERROR	1
> -#define I2C_WRITE_ERROR	2
> -
> =C2=A0/* Defined in POWER8 Processor Registers Specification */
> =C2=A0/* To generate attn to OCC */
> =C2=A0#define ATTN_DATA	0x0006B035
> @@ -53,11 +45,11 @@
> =C2=A0
> =C2=A0#define MAX_SENSOR_ATTR_LEN	32
> =C2=A0
> -enum sensor_t {
> -	freq,
> -	temp,
> -	power,
> -	caps,
> +enum sensor_type {
> +	FREQ =3D 0,
> +	TEMP,
> +	POWER,
> +	CAPS,

This isn't related to isolating the bus transfer protocol. I'd prefer
the change be a separate patch given this one, as it stands, is ~1300
lines.

> =C2=A0	MAX_OCC_SENSOR_TYPE
> =C2=A0};
> =C2=A0
> @@ -125,7 +117,7 @@ struct occ_response {
> =C2=A0};
> =C2=A0
> =C2=A0struct sensor_attr_data {
> -	enum sensor_t type;
> +	enum sensor_type type;
> =C2=A0	uint32_t hwmon_index;
> =C2=A0	uint32_t attr_id;
> =C2=A0	char name[MAX_SENSOR_ATTR_LEN];
> @@ -138,112 +130,44 @@ struct sensor_group {
> =C2=A0	struct attribute_group group;
> =C2=A0};
> =C2=A0
> -/* data private to each client */
> -struct occ_drv_data {
> -	struct i2c_client	*client;
> -	struct device		*hwmon_dev;
> -	struct mutex		update_lock;
> -	bool			valid;
> -	unsigned long		last_updated;
> -	/* Minimum timer interval for sampling In jiffies */
> -	unsigned long		update_interval;
> -	unsigned long		occ_online;
> -	uint16_t		user_powercap;
> -	struct occ_response	occ_resp;
> -	struct sensor_group	sensor_groups[MAX_OCC_SENSOR_TYPE];
> +struct power8_occ_driver {
> +	struct occ_driver *driver;
> +	struct device *dev;
> +	struct mutex update_lock;
> +	bool valid;
> +	unsigned long last_updated;
> +	unsigned long update_interval; /* minimum interval in jiffies */
> +	uint16_t user_powercap;
> +	struct occ_response response;
> +	struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];

Please do white space changes in a separate patch.

> =C2=A0};
> =C2=A0
> -static void deinit_occ_resp_buf(struct occ_response *p)
> +static void deinit_occ_resp_buf(struct occ_response *resp)

Please rename this in a separate patch.

> =C2=A0{
> =C2=A0	int i;
> =C2=A0
> -	if (!p)
> +	if (!resp)
> =C2=A0		return;
> =C2=A0
> -	if (!p->blocks)
> +	if (!resp->blocks)
> =C2=A0		return;
> =C2=A0
> -	for (i =3D 0; i < p->header.sensor_block_num; i++) {
> -		kfree(p->blocks[i].sensor);
> -		kfree(p->blocks[i].power);
> -		kfree(p->blocks[i].caps);
> +	for (i =3D 0; i < resp->header.sensor_block_num; ++i) {
> +		kfree(resp->blocks[i].sensor);
> +		kfree(resp->blocks[i].power);
> +		kfree(resp->blocks[i].caps);
> =C2=A0	}
> =C2=A0
> -	kfree(p->blocks);
> -
> -	memset(p, 0, sizeof(*p));
> -
> -	for (i =3D 0; i < ARRAY_SIZE(p->sensor_block_id); i++)
> -		p->sensor_block_id[i] =3D -1;
> -}
> -
> -static ssize_t occ_i2c_read(struct i2c_client *client, void *buf, size_t=
 count)
> -{
> -	WARN_ON(count > OCC_DATA_MAX);
> -
> -	dev_dbg(&client->dev, "i2c_read: reading %zu bytes @0x%x.\n",
> -		count, client->addr);
> -	return i2c_master_recv(client, buf, count);
> -}
> -
> -static ssize_t occ_i2c_write(struct i2c_client *client, const void *buf,
> -				size_t count)
> -{
> -	WARN_ON(count > OCC_DATA_MAX);
> -
> -	dev_dbg(&client->dev, "i2c_write: writing %zu bytes @0x%x.\n",
> -		count, client->addr);
> -	return i2c_master_send(client, buf, count);
> -}
> -
> -/* read 8-byte value and put into data[offset] */
> -static int occ_getscomb(struct i2c_client *client, uint32_t address,
> -		uint8_t *data, int offset)
> -{
> -	uint32_t ret;
> -	char buf[8];
> -	int i;
> -
> -	/* P8 i2c slave requires address to be shifted by 1 */
> -	address =3D address << 1;
> -
> -	ret =3D occ_i2c_write(client, &address,
> -		sizeof(address));
> -
> -	if (ret !=3D sizeof(address))
> -		return -I2C_WRITE_ERROR;
> -
> -	ret =3D occ_i2c_read(client, buf, sizeof(buf));
> -	if (ret !=3D sizeof(buf))
> -		return -I2C_READ_ERROR;
> -
> -	for (i =3D 0; i < 8; i++)
> -		data[offset + i] =3D buf[7 - i];
> -
> -	return 0;
> -}
> -
> -static int occ_putscom(struct i2c_client *client, uint32_t address,
> -		uint32_t data0, uint32_t data1)
> -{
> -	uint32_t buf[3];
> -	uint32_t ret;
> +	kfree(resp->blocks);
> =C2=A0
> -	/* P8 i2c slave requires address to be shifted by 1 */
> -	address =3D address << 1;
> +	memset(resp, 0, sizeof(struct occ_response));
> =C2=A0
> -	buf[0] =3D address;
> -	buf[1] =3D data1;
> -	buf[2] =3D data0;
> -
> -	ret =3D occ_i2c_write(client, buf, sizeof(buf));
> -	if (ret !=3D sizeof(buf))
> -		return I2C_WRITE_ERROR;
> -
> -	return 0;
> +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> +		resp->sensor_block_id[i] =3D -1;
> =C2=A0}
> =C2=A0
> -static void *occ_get_sensor_by_type(struct occ_response *resp, enum sens=
or_t t)
> +static void *occ_get_sensor_by_type(struct occ_response *resp,
> +				=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type t)
> =C2=A0{
> =C2=A0	void *sensor;
> =C2=A0
> @@ -254,14 +178,14 @@ static void *occ_get_sensor_by_type(struct occ_resp=
onse *resp, enum sensor_t t)
> =C2=A0		return NULL;
> =C2=A0
> =C2=A0	switch (t) {
> -	case temp:
> -	case freq:
> +	case TEMP:
> +	case FREQ:
> =C2=A0		sensor =3D resp->blocks[resp->sensor_block_id[t]].sensor;
> =C2=A0		break;
> -	case power:
> +	case POWER:
> =C2=A0		sensor =3D resp->blocks[resp->sensor_block_id[t]].power;
> =C2=A0		break;
> -	case caps:
> +	case CAPS:
> =C2=A0		sensor =3D resp->blocks[resp->sensor_block_id[t]].caps;
> =C2=A0		break;
> =C2=A0	default:
> @@ -272,10 +196,10 @@ static void *occ_get_sensor_by_type(struct occ_resp=
onse *resp, enum sensor_t t)
> =C2=A0}
> =C2=A0
> =C2=A0static int occ_renew_sensor(struct occ_response *resp, uint8_t sens=
or_length,
> -	uint8_t sensor_num, enum sensor_t t, int block)
> +			=C2=A0=C2=A0=C2=A0=C2=A0uint8_t sensor_num, enum sensor_type t, int b=
lock)
> =C2=A0{
> =C2=A0	void *sensor;
> -	int ret;
> +	int rc;

Another rename. Please split out to a separate patch

> =C2=A0
> =C2=A0	sensor =3D occ_get_sensor_by_type(resp, t);
> =C2=A0
> @@ -286,40 +210,40 @@ static int occ_renew_sensor(struct occ_response *re=
sp, uint8_t sensor_length,
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!sensor || sensor_num !=3D
> -			resp->blocks[resp->sensor_block_id[t]].sensor_num) {
> +	=C2=A0=C2=A0=C2=A0=C2=A0resp->blocks[resp->sensor_block_id[t]].sensor_n=
um) {
> =C2=A0		kfree(sensor);
> =C2=A0		switch (t) {
> -		case temp:
> -		case freq:
> +		case TEMP:
> +		case FREQ:
> =C2=A0			resp->blocks[block].sensor =3D
> -				kcalloc(sensor_num,
> -					sizeof(struct occ_sensor), GFP_KERNEL);
> +				kcalloc(sensor_num, sizeof(struct occ_sensor),
> +					GFP_KERNEL);
> =C2=A0			if (!resp->blocks[block].sensor) {
> -				ret =3D -ENOMEM;
> +				rc =3D -ENOMEM;
> =C2=A0				goto err;
> =C2=A0			}
> =C2=A0			break;
> -		case power:
> +		case POWER:
> =C2=A0			resp->blocks[block].power =3D
> =C2=A0				kcalloc(sensor_num,
> =C2=A0					sizeof(struct power_sensor),
> =C2=A0					GFP_KERNEL);
> =C2=A0			if (!resp->blocks[block].power) {
> -				ret =3D -ENOMEM;
> +				rc =3D -ENOMEM;
> =C2=A0				goto err;
> =C2=A0			}
> =C2=A0			break;
> -		case caps:
> +		case CAPS:
> =C2=A0			resp->blocks[block].caps =3D
> -				kcalloc(sensor_num,
> -					sizeof(struct caps_sensor), GFP_KERNEL);
> +				kcalloc(sensor_num, sizeof(struct caps_sensor),
> +					GFP_KERNEL);
> =C2=A0			if (!resp->blocks[block].caps) {
> -				ret =3D -ENOMEM;
> +				rc =3D -ENOMEM;
> =C2=A0				goto err;
> =C2=A0			}
> =C2=A0			break;
> =C2=A0		default:
> -			ret =3D -ENOMEM;
> +			rc =3D -ENOMEM;
> =C2=A0			goto err;
> =C2=A0		}
> =C2=A0	}
> @@ -327,7 +251,7 @@ static int occ_renew_sensor(struct occ_response *resp=
, uint8_t sensor_length,
> =C2=A0	return 0;
> =C2=A0err:
> =C2=A0	deinit_occ_resp_buf(resp);
> -	return ret;
> +	return rc;
> =C2=A0}
> =C2=A0
> =C2=A0#define RESP_DATA_LENGTH	3
> @@ -341,12 +265,12 @@ static inline uint16_t get_occdata_length(uint8_t *=
data)
> =C2=A0	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
> =C2=A0}
> =C2=A0
> -static int parse_occ_response(struct i2c_client *client,
> -		uint8_t *data, struct occ_response *resp)
> +static int parse_occ_response(struct power8_occ_driver *driver, uint8_t =
*data,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_response *resp)
> =C2=A0{
> =C2=A0	int b;
> =C2=A0	int s;
> -	int ret;
> +	int rc;

Please split this out to a separate patch.

> =C2=A0	int dnum =3D SENSOR_BLOCK_OFFSET;
> =C2=A0	struct occ_sensor *f_sensor;
> =C2=A0	struct occ_sensor *t_sensor;
> @@ -357,19 +281,19 @@ static int parse_occ_response(struct i2c_client *cl=
ient,
> =C2=A0	uint8_t sensor_format;
> =C2=A0	uint8_t sensor_length;
> =C2=A0	uint8_t sensor_num;
> +	struct device *dev =3D driver->dev;

Please split this out to a separate patch.

> =C2=A0
> =C2=A0	/* check if the data is valid */
> =C2=A0	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> -		dev_dbg(&client->dev,
> -			"ERROR: no SENSOR String in response\n");
> -		ret =3D -1;
> +		dev_dbg(dev, "ERROR: no SENSOR String in response\n");
> +		rc =3D -1;
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> =C2=A0	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> =C2=A0	if (sensor_block_num =3D=3D 0) {
> -		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
> -		ret =3D -1;
> +		dev_dbg(dev, "ERROR: SENSOR block num is 0\n");
> +		rc =3D -1;
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> @@ -377,93 +301,94 @@ static int parse_occ_response(struct i2c_client *cl=
ient,
> =C2=A0	if (sensor_block_num !=3D resp->header.sensor_block_num) {
> =C2=A0		deinit_occ_resp_buf(resp);
> =C2=A0		resp->blocks =3D kcalloc(sensor_block_num,
> -			sizeof(struct sensor_data_block), GFP_KERNEL);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct sensor_data_=
block),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> =C2=A0		if (!resp->blocks)
> =C2=A0			return -ENOMEM;
> =C2=A0	}
> =C2=A0
> -	memcpy(&resp->header, &data[RESP_HEADER_OFFSET], sizeof(resp->header));
> +	memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct occ_poll_header=
));

Separate patch

> =C2=A0	resp->header.error_log_addr_start =3D
> =C2=A0		be32_to_cpu(resp->header.error_log_addr_start);
> =C2=A0	resp->header.error_log_length =3D
> =C2=A0		be16_to_cpu(resp->header.error_log_length);
> =C2=A0
> -	dev_dbg(&client->dev, "Reading %d sensor blocks\n",
> +	dev_dbg(dev, "Reading %d sensor blocks\n",
> =C2=A0		resp->header.sensor_block_num);
> =C2=A0	for (b =3D 0; b < sensor_block_num; b++) {
> =C2=A0		/* 8-byte sensor block head */
> =C2=A0		strncpy(sensor_type, &data[dnum], 4);
> -		sensor_format =3D data[dnum+5];
> -		sensor_length =3D data[dnum+6];
> -		sensor_num =3D data[dnum+7];
> +		sensor_format =3D data[dnum + 5];
> +		sensor_length =3D data[dnum + 6];
> +		sensor_num =3D data[dnum + 7];
> =C2=A0		dnum =3D dnum + 8;
> =C2=A0
> -		dev_dbg(&client->dev,
> -			"sensor block[%d]: type: %s, sensor_num: %d\n",
> -			b, sensor_type, sensor_num);
> +		dev_dbg(dev, "sensor block[%d]: type: %s, sensor_num: %d\n", b,
> +			sensor_type, sensor_num);
> =C2=A0
> =C2=A0		if (strncmp(sensor_type, "FREQ", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, freq, b);
> -			if (ret)
> +			rc =3D occ_renew_sensor(resp, sensor_length, sensor_num,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0FREQ, b);
> +			if (rc)
> =C2=A0				continue;
> =C2=A0
> -			resp->sensor_block_id[freq] =3D b;
> +			resp->sensor_block_id[FREQ] =3D b;
> =C2=A0			for (s =3D 0; s < sensor_num; s++) {
> =C2=A0				f_sensor =3D &resp->blocks[b].sensor[s];
> =C2=A0				f_sensor->sensor_id =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum]);
> =C2=A0				f_sensor->value =3D be16_to_cpup((const __be16 *)
> -							&data[dnum+2]);
> -				dev_dbg(&client->dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 2]);
> +				dev_dbg(dev,
> =C2=A0					"sensor[%d]-[%d]: id: %u, value: %u\n",
> =C2=A0					b, s, f_sensor->sensor_id,
> =C2=A0					f_sensor->value);
> =C2=A0				dnum =3D dnum + sensor_length;
> =C2=A0			}
> =C2=A0		} else if (strncmp(sensor_type, "TEMP", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, temp, b);
> -			if (ret)
> +			rc =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, TEMP, b);
> +			if (rc)
> =C2=A0				continue;
> =C2=A0
> -			resp->sensor_block_id[temp] =3D b;
> +			resp->sensor_block_id[TEMP] =3D b;
> =C2=A0			for (s =3D 0; s < sensor_num; s++) {
> =C2=A0				t_sensor =3D &resp->blocks[b].sensor[s];
> =C2=A0				t_sensor->sensor_id =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum]);
> =C2=A0				t_sensor->value =3D be16_to_cpup((const __be16 *)
> -							&data[dnum+2]);
> -				dev_dbg(&client->dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 2]);
> +				dev_dbg(dev,
> =C2=A0					"sensor[%d]-[%d]: id: %u, value: %u\n",
> =C2=A0					b, s, t_sensor->sensor_id,
> =C2=A0					t_sensor->value);
> =C2=A0				dnum =3D dnum + sensor_length;
> =C2=A0			}
> =C2=A0		} else if (strncmp(sensor_type, "POWR", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, power, b);
> -			if (ret)
> +			rc =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, POWER, b);
> +			if (rc)
> =C2=A0				continue;
> =C2=A0
> -			resp->sensor_block_id[power] =3D b;
> +			resp->sensor_block_id[POWER] =3D b;
> =C2=A0			for (s =3D 0; s < sensor_num; s++) {
> =C2=A0				p_sensor =3D &resp->blocks[b].power[s];
> =C2=A0				p_sensor->sensor_id =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum]);
> =C2=A0				p_sensor->update_tag =3D
> =C2=A0					be32_to_cpup((const __be32 *)
> -							&data[dnum+2]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 2]);
> =C2=A0				p_sensor->accumulator =3D
> =C2=A0					be32_to_cpup((const __be32 *)
> -							&data[dnum+6]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 6]);
> =C2=A0				p_sensor->value =3D be16_to_cpup((const __be16 *)
> -							&data[dnum+10]);
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 10]);
> =C2=A0
> -				dev_dbg(&client->dev,
> +				dev_dbg(dev,
> =C2=A0					"sensor[%d]-[%d]: id: %u, value: %u\n",
> =C2=A0					b, s, p_sensor->sensor_id,
> =C2=A0					p_sensor->value);
> @@ -471,55 +396,53 @@ static int parse_occ_response(struct i2c_client *cl=
ient,
> =C2=A0				dnum =3D dnum + sensor_length;
> =C2=A0			}
> =C2=A0		} else if (strncmp(sensor_type, "CAPS", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, caps, b);
> -			if (ret)
> +			rc =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, CAPS, b);
> +			if (rc)
> =C2=A0				continue;
> =C2=A0
> -			resp->sensor_block_id[caps] =3D b;
> +			resp->sensor_block_id[CAPS] =3D b;
> =C2=A0			for (s =3D 0; s < sensor_num; s++) {
> =C2=A0				c_sensor =3D &resp->blocks[b].caps[s];
> =C2=A0				c_sensor->curr_powercap =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum]);
> =C2=A0				c_sensor->curr_powerreading =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum+2]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 2]);
> =C2=A0				c_sensor->norm_powercap =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum+4]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 4]);
> =C2=A0				c_sensor->max_powercap =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum+6]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 6]);
> =C2=A0				c_sensor->min_powercap =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum+8]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 8]);
> =C2=A0				c_sensor->user_powerlimit =3D
> =C2=A0					be16_to_cpup((const __be16 *)
> -							&data[dnum+10]);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&data[dnum + 10]);
> =C2=A0
> =C2=A0				dnum =3D dnum + sensor_length;
> -				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
> -				dev_dbg(&client->dev, "curr_powercap is %x\n",
> +				dev_dbg(dev, "CAPS sensor #%d:\n", s);
> +				dev_dbg(dev, "curr_powercap is %x\n",
> =C2=A0					c_sensor->curr_powercap);
> -				dev_dbg(&client->dev,
> -					"curr_powerreading is %x\n",
> +				dev_dbg(dev, "curr_powerreading is %x\n",
> =C2=A0					c_sensor->curr_powerreading);
> -				dev_dbg(&client->dev, "norm_powercap is %x\n",
> +				dev_dbg(dev, "norm_powercap is %x\n",
> =C2=A0					c_sensor->norm_powercap);
> -				dev_dbg(&client->dev, "max_powercap is %x\n",
> +				dev_dbg(dev, "max_powercap is %x\n",
> =C2=A0					c_sensor->max_powercap);
> -				dev_dbg(&client->dev, "min_powercap is %x\n",
> +				dev_dbg(dev, "min_powercap is %x\n",
> =C2=A0					c_sensor->min_powercap);
> -				dev_dbg(&client->dev, "user_powerlimit is %x\n",
> +				dev_dbg(dev, "user_powerlimit is %x\n",
> =C2=A0					c_sensor->user_powerlimit);
> =C2=A0			}
> =C2=A0
> =C2=A0		} else {
> -			dev_dbg(&client->dev,
> -				"ERROR: sensor type %s not supported\n",
> +			dev_dbg(dev, "ERROR: sensor type %s not supported\n",
> =C2=A0				resp->blocks[b].sensor_type);
> -			ret =3D -1;
> +			rc =3D -1;
> =C2=A0			goto err;
> =C2=A0		}
> =C2=A0
> @@ -532,15 +455,15 @@ static int parse_occ_response(struct i2c_client *cl=
ient,
> =C2=A0	return 0;
> =C2=A0err:
> =C2=A0	deinit_occ_resp_buf(resp);
> -	return ret;
> +	return rc;
> =C2=A0}
> =C2=A0
> -
> -/* Refer to OCC interface document for OCC command format
> +/*
> + * Refer to OCC interface document for OCC command format
> =C2=A0 * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_F=
W_Interfaces.pdf
> =C2=A0 */
> -static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
> -		uint8_t type, uint16_t length, uint8_t *data, uint8_t *resp)
> +static uint8_t occ_send_cmd(struct occ_driver *occ, uint8_t seq, uint8_t=
 type,
> +			=C2=A0=C2=A0=C2=A0=C2=A0uint16_t length, uint8_t *data, uint8_t *resp=
)
> =C2=A0{
> =C2=A0	uint32_t cmd1, cmd2;
> =C2=A0	uint16_t checksum;
> @@ -560,146 +483,152 @@ static uint8_t occ_send_cmd(struct i2c_client *cl=
ient, uint8_t seq,
> =C2=A0	cmd2 |=3D checksum << ((2 - length) * 8);
> =C2=A0
> =C2=A0	/* Init OCB */
> -	occ_putscom(client, OCB_STATUS_CONTROL_OR,=C2=A0=C2=A00x08000000, 0x000=
00000);
> -	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
> +	occ->bus_ops.putscom(occ->bus, OCB_STATUS_CONTROL_OR,=C2=A0=C2=A00x0800=
0000,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000000);
> +	occ->bus_ops.putscom(occ->bus, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00xFFFFFFFF);
> =C2=A0
> =C2=A0	/* Send command */
> -	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> -	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> -	occ_putscom(client, OCB_DATA, cmd1, cmd2);
> +	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_COMMAND_ADDR,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000000);
> +	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_COMMAND_ADDR,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000000);
> +	occ->bus_ops.putscom(occ->bus, OCB_DATA, cmd1, cmd2);
> =C2=A0
> =C2=A0	/* Trigger attention */
> -	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
> +	occ->bus_ops.putscom(occ->bus, ATTN_DATA, 0x01010000, 0x00000000);
> =C2=A0
> =C2=A0	/* Get response data */
> -	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
> -	occ_getscomb(client, OCB_DATA, resp, 0);
> +	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_RESPONSE_ADDR,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000000);
> +	occ->bus_ops.getscom(occ->bus, OCB_DATA, resp, 0);
> =C2=A0
> =C2=A0	/* return status */
> =C2=A0	return resp[2];
> =C2=A0}
> =C2=A0
> -static int occ_get_all(struct i2c_client *client, struct occ_response *o=
cc_resp)
> +static int occ_get_all(struct power8_occ_driver *driver)
> =C2=A0{
> +	int i, rc;
> =C2=A0	uint8_t *occ_data;
> =C2=A0	uint16_t num_bytes;
> -	int i;
> -	int ret;
> -	uint8_t poll_cmd_data;
> -
> -	poll_cmd_data =3D 0x10;
> +	uint8_t poll_cmd_data =3D 0x10;
> +	struct device *dev =3D driver->dev;
> +	struct occ_driver *occ =3D driver->driver;
> +	struct occ_response *response =3D &driver->response;

Separate patch.

> =C2=A0
> =C2=A0	/*
> =C2=A0	=C2=A0* TODO: fetch header, and then allocate the rest of the buff=
er based
> =C2=A0	=C2=A0* on the header size. Assuming the OCC has a fixed sized hea=
der
> =C2=A0	=C2=A0*/
> -	occ_data =3D devm_kzalloc(&client->dev, OCC_DATA_MAX, GFP_KERNEL);
> +	occ_data =3D devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
> +	if (!occ_data)
> +		return -ENOMEM;
> =C2=A0
> -	ret =3D occ_send_cmd(client, 0, 0, 1, &poll_cmd_data, occ_data);
> -	if (ret) {
> -		dev_err(&client->dev, "ERROR: OCC Poll: 0x%x\n", ret);
> -		ret =3D -EINVAL;
> +	rc =3D occ_send_cmd(occ, 0, 0, 1, &poll_cmd_data, occ_data);
> +	if (rc) {
> +		dev_err(dev, "ERROR: OCC Poll: 0x%x\n", rc);
> +		rc =3D -EINVAL;
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	num_bytes =3D get_occdata_length(occ_data);
> =C2=A0
> -	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
> +	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
> =C2=A0
> =C2=A0	if (num_bytes > OCC_DATA_MAX) {
> -		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
> -		ret =3D -EINVAL;
> +		dev_dbg(dev, "ERROR: OCC data length must be < 4KB\n");
> +		rc =3D -EINVAL;
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (num_bytes <=3D 0) {
> -		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
> -		ret =3D -EINVAL;
> +		dev_dbg(dev, "ERROR: OCC data length is zero\n");
> +		rc =3D -EINVAL;
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* read remaining data */
> =C2=A0	for (i =3D 8; i < num_bytes + 8; i =3D i + 8)
> -		occ_getscomb(client, OCB_DATA, occ_data, i);
> +		occ->bus_ops.getscom(occ->bus, OCB_DATA, occ_data, i);
> =C2=A0
> -	ret =3D parse_occ_response(client, occ_data, occ_resp);
> +	rc =3D parse_occ_response(driver, occ_data, occ_resp);
> =C2=A0
> =C2=A0out:
> -	devm_kfree(&client->dev, occ_data);
> -	return ret;
> +	devm_kfree(dev, occ_data);
> +	return rc;
> =C2=A0}
> =C2=A0
> =C2=A0
> -static int occ_update_device(struct device *dev)
> +static int occ_update_device(struct power8_occ_driver *driver)

Do the (global) switch from struct device to struct power8_occ_driver
in a separate patch.

> =C2=A0{
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	struct i2c_client *client =3D data->client;
> -	int ret =3D 0;
> -
> -	mutex_lock(&data->update_lock);
> -
> -	if (time_after(jiffies, data->last_updated + data->update_interval)
> -	=C2=A0=C2=A0=C2=A0=C2=A0|| !data->valid) {
> -		data->valid =3D 1;
> -		ret =3D occ_get_all(client, &data->occ_resp);
> -		if (ret)
> -			data->valid =3D 0;
> -		data->last_updated =3D jiffies;
> +	int rc =3D 0;
> +
> +	mutex_lock(&driver->update_lock);
> +
> +	if (time_after(jiffies, driver->last_updated + driver->update_interval)
> +	=C2=A0=C2=A0=C2=A0=C2=A0|| !driver->valid) {
> +		driver->valid =3D 1;
> +
> +		rc =3D occ_get_all(driver);
> +		if (rc)
> +			driver->valid =3D 0;
> +
> +		driver->last_updated =3D jiffies;
> =C2=A0	}
> -	mutex_unlock(&data->update_lock);
> =C2=A0
> -	return ret;
> +	mutex_unlock(&driver->update_lock);
> +
> +	return rc;
> =C2=A0}
> =C2=A0
> =C2=A0
> -static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
> +static void *occ_get_sensor(struct power8_occ_driver *driver,
> +			=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type t)
> =C2=A0{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	int ret;
> +	int rc;
> =C2=A0
> -	ret =3D occ_update_device(dev);
> -	if (ret !=3D 0) {
> -		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> +	rc =3D occ_update_device(driver);
> +	if (rc !=3D 0) {
> +		dev_dbg(driver->dev, "ERROR: cannot get occ sensor data: %d\n",
> +			rc);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> -	return occ_get_sensor_by_type(&data->occ_resp, t);
> +	return occ_get_sensor_by_type(&driver->response, t);
> =C2=A0}
> =C2=A0
> -static int occ_get_sensor_value(struct device *hwmon_dev, enum sensor_t =
t,
> -					int index)
> +static int occ_get_sensor_value(struct power8_occ_driver *driver,
> +				enum sensor_type t, int index)
> =C2=A0{
> =C2=A0	void *sensor;
> =C2=A0
> -	if (t =3D=3D caps)
> +	if (t =3D=3D CAPS)
> =C2=A0		return -1;
> =C2=A0
> -	sensor =3D occ_get_sensor(hwmon_dev, t);
> -
> +	sensor =3D occ_get_sensor(driver, t);
> =C2=A0	if (!sensor)
> =C2=A0		return -1;
> =C2=A0
> -	if (t =3D=3D power)
> +	if (t =3D=3D POWER)
> =C2=A0		return ((struct power_sensor *)sensor)[index].value;
> =C2=A0
> =C2=A0	return ((struct occ_sensor *)sensor)[index].value;
> =C2=A0}
> =C2=A0
> -static int occ_get_sensor_id(struct device *hwmon_dev, enum sensor_t t,
> -					int index)
> +static int occ_get_sensor_id(struct power8_occ_driver *driver,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type t, int index)
> =C2=A0{
> =C2=A0	void *sensor;
> =C2=A0
> -	if (t =3D=3D caps)
> +	if (t =3D=3D CAPS)
> =C2=A0		return -1;
> =C2=A0
> -	sensor =3D occ_get_sensor(hwmon_dev, t);
> -
> +	sensor =3D occ_get_sensor(driver, t);
> =C2=A0	if (!sensor)
> =C2=A0		return -1;
> =C2=A0
> -	if (t =3D=3D power)
> +	if (t =3D=3D POWER)
> =C2=A0		return ((struct power_sensor *)sensor)[index].sensor_id;
> =C2=A0
> =C2=A0	return ((struct occ_sensor *)sensor)[index].sensor_id;
> @@ -707,52 +636,56 @@ static int occ_get_sensor_id(struct device *hwmon_d=
ev, enum sensor_t t,
> =C2=A0
> =C2=A0/* sysfs attributes for occ hwmon device */
> =C2=A0
> -static ssize_t show_input(struct device *hwmon_dev,
> -				struct device_attribute *da, char *buf)
> +static ssize_t show_input(struct device *dev,

Roll the switch from 'hwmon_dev' to 'dev' into the patch that removes
the passing of struct device.

> +			=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> =C2=A0{
> -	struct sensor_attr_data *sdata =3D container_of(da,
> -					struct sensor_attr_data, dev_attr);
> =C2=A0	int val;
> -
> -	val =3D occ_get_sensor_value(hwmon_dev, sdata->type,
> -					sdata->hwmon_index - 1);
> -	if (sdata->type =3D=3D temp)
> +	struct sensor_attr_data *sdata =3D container_of(attr,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_attr_data,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_attr);
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> +
> +	val =3D occ_get_sensor_value(driver, sdata->type,
> +				=C2=A0=C2=A0=C2=A0sdata->hwmon_index - 1);
> +	if (sdata->type =3D=3D TEMP)
> =C2=A0		/* in millidegree Celsius */
> =C2=A0		val *=3D 1000;
> =C2=A0
> =C2=A0	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> =C2=A0}
> =C2=A0
> -static ssize_t show_label(struct device *hwmon_dev,
> -			struct device_attribute *da, char *buf)
> +static ssize_t show_label(struct device *dev,
> +			=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> =C2=A0{
> -	struct sensor_attr_data *sdata =3D container_of(da,
> -					struct sensor_attr_data, dev_attr);
> =C2=A0	int val;
> +	struct sensor_attr_data *sdata =3D container_of(da,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_attr_data,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_attr);
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> =C2=A0
> -	val =3D occ_get_sensor_id(hwmon_dev, sdata->type,
> -					sdata->hwmon_index - 1);
> +	val =3D occ_get_sensor_id(driver, sdata->type, sdata->hwmon_index - 1);
> =C2=A0
> =C2=A0	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> =C2=A0}
> =C2=A0
> -static ssize_t show_caps(struct device *hwmon_dev,
> -		struct device_attribute *da, char *buf)
> +static ssize_t show_caps(struct device *dev,
> +			=C2=A0struct device_attribute *attr, char *buf)
> =C2=A0{
> -	struct sensor_attr_data *sdata =3D container_of(da,
> -					struct sensor_attr_data, dev_attr);
> -	int nr =3D sdata->attr_id;
> -	int n =3D sdata->hwmon_index - 1;
> -	struct caps_sensor *sensor;
> =C2=A0	int val;
> +	struct caps_sensor *sensor;
> +	struct sensor_attr_data *sdata =3D container_of(attr,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sensor_attr_data,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_attr);
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> +	int n =3D sdata->hwmon_index - 1;
> =C2=A0
> -	sensor =3D occ_get_sensor(hwmon_dev, caps);
> +	sensor =3D occ_get_sensor(driver, CAPS);
> =C2=A0	if (!sensor) {
> =C2=A0		val =3D -1;
> =C2=A0		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> =C2=A0	}
> =C2=A0
> -	switch (nr) {
> +	switch (sdata->attr_id) {
> =C2=A0	case 0:
> =C2=A0		val =3D sensor[n].curr_powercap;
> =C2=A0		break;
> @@ -778,159 +711,139 @@ static ssize_t show_caps(struct device *hwmon_dev=
,
> =C2=A0	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> =C2=A0}
> =C2=A0
> -static ssize_t show_update_interval(struct device *hwmon_dev,
> -				struct device_attribute *attr, char *buf)
> +static ssize_t show_update_interval(struct device *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> =C2=A0{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> =C2=A0
> =C2=A0	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
> -		jiffies_to_msecs(data->update_interval));
> +			jiffies_to_msecs(driver->update_interval));
> =C2=A0}
> =C2=A0
> -static ssize_t set_update_interval(struct device *hwmon_dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t store_update_interval(struct device *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> =C2=A0{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> =C2=A0	unsigned long val;
> -	int err;
> +	int rc;
> =C2=A0
> -	err =3D kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> +	rc =3D kstrtoul(buf, 10, &val);
> +	if (rc)
> +		return rc;
> +
> +	driver->update_interval =3D msecs_to_jiffies(val);
> =C2=A0
> -	data->update_interval =3D msecs_to_jiffies(val);
> =C2=A0	return count;
> =C2=A0}
> -static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
> -		show_update_interval, set_update_interval);
> =C2=A0
> -static ssize_t show_name(struct device *hwmon_dev,
> -				struct device_attribute *attr, char *buf)
> +static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_inter=
val,
> +		=C2=A0=C2=A0=C2=A0store_update_interval);
> +
> +static ssize_t show_name(struct device *devdev,
> +			=C2=A0struct device_attribute *attr, char *buf)
> =C2=A0{
> =C2=A0	return snprintf(buf, PAGE_SIZE - 1, "%s\n", OCC_I2C_NAME);
> =C2=A0}
> +
> =C2=A0static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
> =C2=A0
> -static ssize_t show_user_powercap(struct device *hwmon_dev,
> -				struct device_attribute *attr, char *buf)
> +static ssize_t show_user_powercap(struct device *dev,
> +				=C2=A0=C2=A0struct device_attribute *attr, char *buf)
> =C2=A0{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> =C2=A0
> -	return snprintf(buf, PAGE_SIZE - 1, "%u\n", data->user_powercap);
> +	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap);
> =C2=A0}
> =C2=A0
> -
> -static ssize_t set_user_powercap(struct device *hwmon_dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t store_user_powercap(struct device *dev,
> +				=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> +				=C2=A0=C2=A0=C2=A0const char *buf, size_t count)
> =C2=A0{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	struct i2c_client *client =3D data->client;
> +	struct power8_occ_driver *driver =3D dev_get_drvdata(dev);
> =C2=A0	uint16_t val;
> =C2=A0	uint8_t resp[8];
> -	int err;
> +	int rc;
> =C2=A0
> -	err =3D kstrtou16(buf, 10, &val);
> -	if (err)
> -		return err;
> +	rc =3D kstrtou16(buf, 10, &val);
> +	if (rc)
> +		return rc;
> =C2=A0
> =C2=A0	dev_dbg(dev, "set user powercap to: %u\n", val);
> =C2=A0	val =3D cpu_to_le16(val);
> -	err =3D occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
> -	if (err !=3D 0) {
> +	rc =3D occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
> +	if (rc !=3D 0) {
> =C2=A0		dev_dbg(dev,
> =C2=A0			"ERROR: Set User Powercap: wrong return status: %x\n",
> -			err);
> -		if (err =3D=3D 0x13)
> +			rc);
> +		if (rc =3D=3D 0x13)
> =C2=A0			dev_info(dev,
> -				"ERROR: set invalid powercap value: %x\n", val);
> +				=C2=A0"ERROR: set invalid powercap value: %x\n",
> +				=C2=A0val);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> -	data->user_powercap =3D val;
> +
> +	driver->user_powercap =3D val;
> =C2=A0	return count;
> =C2=A0}
> -static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO,
> -		show_user_powercap, set_user_powercap);
> =C2=A0
> -static void deinit_sensor_groups(struct device *hwmon_dev,
> -					struct sensor_group *sensor_groups)
> +static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
> +		=C2=A0=C2=A0=C2=A0store_user_powercap);
> +
> +static void deinit_sensor_groups(struct device *dev,
> +				=C2=A0struct sensor_group *sensor_groups)
> =C2=A0{
> =C2=A0	int cnt;
> =C2=A0
> =C2=A0	for (cnt =3D 0; cnt < MAX_OCC_SENSOR_TYPE; cnt++) {
> =C2=A0		if (sensor_groups[cnt].group.attrs)
> -			devm_kfree(hwmon_dev, sensor_groups[cnt].group.attrs);
> +			devm_kfree(dev, sensor_groups[cnt].group.attrs);
> =C2=A0		if (sensor_groups[cnt].sattr)
> -			devm_kfree(hwmon_dev, sensor_groups[cnt].sattr);
> +			devm_kfree(dev, sensor_groups[cnt].sattr);
> =C2=A0		sensor_groups[cnt].group.attrs =3D NULL;
> =C2=A0		sensor_groups[cnt].sattr =3D NULL;
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void occ_remove_hwmon_attrs(struct device *hwmon_dev)
> -{
> -	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> -	struct sensor_group *sensor_groups =3D data->sensor_groups;
> -	int i;
> -
> -	if (!hwmon_dev)
> -		return;
> -
> -	device_remove_file(hwmon_dev, &dev_attr_update_interval);
> -	device_remove_file(hwmon_dev, &dev_attr_name);
> -	device_remove_file(hwmon_dev, &dev_attr_user_powercap);
> -
> -	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++)
> -		sysfs_remove_group(&hwmon_dev->kobj, &sensor_groups[i].group);
> -
> -	deinit_sensor_groups(hwmon_dev, sensor_groups);
> -}
> -
> =C2=A0static void sensor_attr_init(struct sensor_attr_data *sdata,
> -				char *sensor_group_name,
> -				char *attr_name,
> -				ssize_t (*show)(struct device *dev,
> -						struct device_attribute *attr,
> -						char *buf))
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *sensor_group_name,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *attr_name,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t (*show)(struct device *dev,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *buf))
> =C2=A0{
> =C2=A0	sysfs_attr_init(&sdata->dev_attr.attr);
> =C2=A0
> =C2=A0	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> -		sensor_group_name, sdata->hwmon_index, attr_name);
> +		=C2=A0sensor_group_name, sdata->hwmon_index, attr_name);
> =C2=A0	sdata->dev_attr.attr.name =3D sdata->name;
> =C2=A0	sdata->dev_attr.attr.mode =3D S_IRUGO;
> =C2=A0	sdata->dev_attr.show =3D show;
> =C2=A0}
> =C2=A0
> =C2=A0/* create hwmon sensor sysfs attributes */
> -static int create_sensor_group(struct device *hwmon_dev, enum sensor_t t=
ype,
> -				int sensor_num)
> +static int create_sensor_group(struct power8_occ_driver *driver,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type type, int =
sensor_num)
> =C2=A0{
> -	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> -	struct sensor_group *sensor_groups =3D data->sensor_groups;
> +	struct device *dev =3D driver->dev;
> +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> =C2=A0	struct sensor_attr_data *sdata;
> -	int ret;
> -	int cnt;
> +	int rc, cnt;
> =C2=A0
> =C2=A0	/* each sensor has 'label' and 'input' attributes */
> -	sensor_groups[type].group.attrs =3D devm_kzalloc(hwmon_dev,
> -						sizeof(struct attribute *) *
> -						sensor_num * 2 + 1, GFP_KERNEL);
> +	sensor_groups[type].group.attrs =3D
> +		devm_kzalloc(dev, sizeof(struct attribute *) *
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num * 2 + 1, GFP_KERNEL);
> =C2=A0	if (!sensor_groups[type].group.attrs) {
> -		ret =3D -ENOMEM;
> +		rc =3D -ENOMEM;
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> -	sensor_groups[type].sattr =3D devm_kzalloc(hwmon_dev,
> -					sizeof(struct sensor_attr_data) *
> -					sensor_num * 2, GFP_KERNEL);
> +	sensor_groups[type].sattr =3D
> +		devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num * 2, GFP_KERNEL);
> =C2=A0	if (!sensor_groups[type].sattr) {
> -		ret =3D -ENOMEM;
> +		rc =3D -ENOMEM;
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> @@ -940,45 +853,38 @@ static int create_sensor_group(struct device *hwmon=
_dev, enum sensor_t type,
> =C2=A0		sdata->hwmon_index =3D cnt + 1;
> =C2=A0		sdata->type =3D type;
> =C2=A0		sensor_attr_init(sdata, sensor_groups[type].name, "input",
> -					show_input);
> +				=C2=A0show_input);
> =C2=A0		sensor_groups[type].group.attrs[cnt] =3D &sdata->dev_attr.attr;
> =C2=A0
> =C2=A0		sdata =3D &sensor_groups[type].sattr[cnt + sensor_num];
> =C2=A0		sdata->hwmon_index =3D cnt + 1;
> =C2=A0		sdata->type =3D type;
> =C2=A0		sensor_attr_init(sdata, sensor_groups[type].name, "label",
> -					show_label);
> +				=C2=A0show_label);
> =C2=A0		sensor_groups[type].group.attrs[cnt + sensor_num] =3D
> =C2=A0			&sdata->dev_attr.attr;
> =C2=A0	}
> =C2=A0
> -	ret =3D sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[type].group=
);
> -	if (ret)
> +	rc =3D sysfs_create_group(&dev->kobj, &sensor_groups[type].group);
> +	if (rc)
> =C2=A0		goto err;
> =C2=A0
> -	return ret;
> +	return rc;
> =C2=A0err:
> -	deinit_sensor_groups(hwmon_dev, sensor_groups);
> -	return ret;
> +	deinit_sensor_groups(dev, sensor_groups);
> +	return rc;
> =C2=A0}
> =C2=A0
> =C2=A0static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
> -					char *attr_name, uint32_t hwmon_index,
> -					uint32_t attr_id)
> +				=C2=A0=C2=A0char *attr_name, uint32_t hwmon_index,
> +				=C2=A0=C2=A0uint32_t attr_id)
> =C2=A0{
> -	sdata->type =3D caps;
> +	sdata->type =3D CAPS;
> =C2=A0	sdata->hwmon_index =3D hwmon_index;
> =C2=A0	sdata->attr_id =3D attr_id;
> =C2=A0
> -	/* FIXME, to be compatible with user space app, we do not
> -	=C2=A0* generate caps1_* attributes.
> -	=C2=A0*/

Removing the fixme needs some justification. Probably best as a
separate patch if it is resolved.

> -	if (sdata->hwmon_index =3D=3D 1)
> -		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s_%s",
> -			"caps", attr_name);
> -	else
> -		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> -			"caps", sdata->hwmon_index, attr_name);
> +	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> +		=C2=A0"caps", sdata->hwmon_index, attr_name);
> =C2=A0
> =C2=A0	sysfs_attr_init(&sdata->dev_attr.attr);
> =C2=A0	sdata->dev_attr.attr.name =3D sdata->name;
> @@ -995,260 +901,148 @@ static char *caps_sensor_name[] =3D {
> =C2=A0	"user_powerlimit",
> =C2=A0};
> =C2=A0
> -static int create_caps_sensor_group(struct device *hwmon_dev, int sensor=
_num)
> +static int create_caps_sensor_group(struct power8_occ_driver *driver,
> +				=C2=A0=C2=A0=C2=A0=C2=A0int sensor_num)
> =C2=A0{
> -	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> -	struct sensor_group *sensor_groups =3D data->sensor_groups;
> +	struct device *dev =3D driver->dev;
> +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> =C2=A0	int field_num =3D ARRAY_SIZE(caps_sensor_name);
> =C2=A0	struct sensor_attr_data *sdata;
> -	int ret;
> -	int cnt;
> -	int i;
> +	int i, j, rc;
> =C2=A0
> -	sensor_groups[caps].group.attrs =3D devm_kzalloc(hwmon_dev,
> -						sizeof(struct attribute *) *
> -						sensor_num * field_num + 1,
> -						GFP_KERNEL);
> -	if (!sensor_groups[caps].group.attrs) {
> -		ret =3D -ENOMEM;
> +	sensor_groups[CAPS].group.attrs =3D
> +		devm_kzalloc(dev, sizeof(struct attribute *) * sensor_num *
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0field_num + 1, GFP_KERNEL);
> +	if (!sensor_groups[CAPS].group.attrs) {
> +		rc =3D -ENOMEM;
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> -	sensor_groups[caps].sattr =3D devm_kzalloc(hwmon_dev,
> -					sizeof(struct sensor_attr_data) *
> -					sensor_num * field_num,
> -					GFP_KERNEL);
> -	if (!sensor_groups[caps].sattr) {
> -		ret =3D -ENOMEM;
> +	sensor_groups[CAPS].sattr =3D
> +		devm_kzalloc(hwmon_dev, sizeof(struct sensor_attr_data) *
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num * field_num, GFP_KERNEL);
> +	if (!sensor_groups[CAPS].sattr) {
> +		rc =3D -ENOMEM;
> =C2=A0		goto err;
> =C2=A0	}
> =C2=A0
> -	for (cnt =3D 0; cnt < sensor_num; cnt++) {
> -		for (i =3D 0; i < field_num; i++) {
> -			sdata =3D &sensor_groups[caps].sattr[cnt * field_num + i];
> +	for (j =3D 0; j < sensor_num; ++j) {
> +		for (i =3D 0; i < field_num; ++i) {
> +			sdata =3D &sensor_groups[CAPS].sattr[j * field_num + i];
> =C2=A0			caps_sensor_attr_init(sdata, caps_sensor_name[i],
> -						cnt + 1, i);
> -			sensor_groups[caps].group.attrs[cnt * field_num + i] =3D
> -						&sdata->dev_attr.attr;
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0j + 1, i);
> +			sensor_groups[CAPS].group.attrs[j * field_num + i] =3D
> +				&sdata->dev_attr.attr;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	ret =3D sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[caps].group=
);
> -	if (ret)
> +	rc =3D sysfs_create_group(&dev->kobj, &sensor_groups[CAPS].group);
> +	if (rc)
> =C2=A0		goto err;
> =C2=A0
> -	return ret;
> +	return rc;
> =C2=A0err:
> -	deinit_sensor_groups(hwmon_dev, sensor_groups);
> -	return ret;
> +	deinit_sensor_groups(dev, sensor_groups);
> +	return rc;
> =C2=A0}
> =C2=A0
> -static int occ_create_hwmon_attrs(struct device *dev)
> +static void occ_remove_hwmon_attrs(struct power8_occ_driver *driver)
> =C2=A0{
> -	struct occ_drv_data *drv_data =3D dev_get_drvdata(dev);
> -	struct device *hwmon_dev =3D drv_data->hwmon_dev;
> -	struct sensor_group *sensor_groups =3D drv_data->sensor_groups;
> =C2=A0	int i;
> -	int sensor_num;
> -	int ret;
> -	struct occ_response *rsp;
> -	enum sensor_t t;
> +	struct device *dev =3D driver->dev;
> +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> +
> +	device_remove_file(dev, &dev_attr_user_powercap);
> +	device_remove_file(dev, &dev_attr_update_interval);
> +	device_remove_file(dev, &dev_attr_name);
> =C2=A0
> -	rsp =3D &drv_data->occ_resp;
> +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++)
> +		sysfs_remove_group(&dev->kobj, &sensor_groups[i].group);
> +
> +	deinit_sensor_groups(dev, sensor_groups);
> +}
> +
> +static int occ_create_hwmon_attrs(struct power8_occ_driver *driver)
> +{
> +	int i, sensor_num, rc, id;
> +	struct device *dev =3D driver->dev;
> +	struct sensor_group *sensor_groups =3D driver->sensor_groups;
> +	struct occ_response *response =3D &driver->response;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(rsp->sensor_block_id); i++)
> -		rsp->sensor_block_id[i] =3D -1;
> +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> +		response->sensor_block_id[i] =3D -1;
> =C2=A0
> =C2=A0	/* read sensor data from occ. */
> -	ret =3D occ_update_device(dev);
> -	if (ret !=3D 0) {
> -		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> -		return ret;
> +	rc =3D occ_update_device(driver);
> +	if (rc !=3D 0) {
> +		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", rc);
> +		return rc;
> =C2=A0	}
> -	if (!rsp->blocks)
> +	if (!response->blocks)
> =C2=A0		return -1;
> =C2=A0
> -	ret =3D device_create_file(hwmon_dev, &dev_attr_name);
> -	if (ret)
> +	rc =3D device_create_file(dev, &dev_attr_name);
> +	if (rc)
> =C2=A0		goto error;
> =C2=A0
> -	ret =3D device_create_file(hwmon_dev, &dev_attr_update_interval);
> -	if (ret)
> +	rc =3D device_create_file(dev, &dev_attr_update_interval);
> +	if (rc)
> =C2=A0		goto error;
> =C2=A0
> -	if (rsp->sensor_block_id[caps] >=3D 0) {
> +	if (response->sensor_block_id[CAPS] >=3D 0) {
> =C2=A0		/* user powercap: only for master OCC */
> -		ret =3D device_create_file(hwmon_dev, &dev_attr_user_powercap);
> -		if (ret)
> +		rc =3D device_create_file(dev, &dev_attr_user_powercap);
> +		if (rc)
> =C2=A0			goto error;
> =C2=A0	}
> =C2=A0
> -	sensor_groups[freq].name =3D "freq";
> -	sensor_groups[temp].name =3D "temp";
> -	sensor_groups[power].name =3D "power";
> -	sensor_groups[caps].name =3D=C2=A0=C2=A0"caps";
> +	sensor_groups[FREQ].name =3D "freq";
> +	sensor_groups[TEMP].name =3D "temp";
> +	sensor_groups[POWER].name =3D "power";
> +	sensor_groups[CAPS].name =3D=C2=A0=C2=A0"caps";
> =C2=A0
> -	for (t =3D 0; t < MAX_OCC_SENSOR_TYPE; t++) {
> -		if (rsp->sensor_block_id[t] < 0)
> +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++) {
> +		id =3D response->sensor_block_id[i];
> +		if (id < 0)
> =C2=A0			continue;
> =C2=A0
> -		sensor_num =3D
> -			rsp->blocks[rsp->sensor_block_id[t]].sensor_num;
> -		if (t =3D=3D caps)
> -			ret =3D create_caps_sensor_group(hwmon_dev, sensor_num);
> +		sensor_num =3D response->blocks[id].sensor_num;
> +		if (i =3D=3D CAPS)
> +			rc =3D create_caps_sensor_group(dev, sensor_num);
> =C2=A0		else
> -			ret =3D create_sensor_group(hwmon_dev, t, sensor_num);
> -		if (ret)
> +			rc =3D create_sensor_group(dev, i, sensor_num);
> +		if (rc)
> =C2=A0			goto error;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> -error:
> -	dev_err(dev, "ERROR: cannot create hwmon attributes\n");
> -	occ_remove_hwmon_attrs(drv_data->hwmon_dev);
> -	return ret;
> -}
> -
> -static ssize_t show_occ_online(struct device *dev,
> -				struct device_attribute *attr, char *buf)
> -{
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -
> -	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", data->occ_online);
> -}
> -
> -static ssize_t set_occ_online(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> -{
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	unsigned long val;
> -	int err;
> -
> -	err =3D kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> -
> -	if (val =3D=3D 1) {
> -		if (data->occ_online =3D=3D 1)
> -			return count;
> =C2=A0
> -		/* populate hwmon sysfs attr using sensor data */
> -		dev_dbg(dev, "occ register hwmon @0x%x\n", data->client->addr);
> -
> -		data->hwmon_dev =3D hwmon_device_register(dev);
> -		if (IS_ERR(data->hwmon_dev))
> -			return PTR_ERR(data->hwmon_dev);
> -
> -		err =3D occ_create_hwmon_attrs(dev);
> -		if (err) {
> -			hwmon_device_unregister(data->hwmon_dev);
> -			return err;
> -		}
> -		data->hwmon_dev->parent =3D dev;
> -	} else if (val =3D=3D 0) {
> -		if (data->occ_online =3D=3D 0)
> -			return count;
> -
> -		occ_remove_hwmon_attrs(data->hwmon_dev);
> -		hwmon_device_unregister(data->hwmon_dev);
> -		data->hwmon_dev =3D NULL;
> -	} else
> -		return -EINVAL;
> -
> -	data->occ_online =3D val;
> -	return count;
> -}
> -
> -static DEVICE_ATTR(online, S_IWUSR | S_IRUGO,
> -		show_occ_online, set_occ_online);
> -
> -static int occ_create_i2c_sysfs_attr(struct device *dev)
> -{
> -	/* create an i2c sysfs attribute, to indicate whether OCC is active */
> -	return device_create_file(dev, &dev_attr_online);
> +error:
> +	dev_err(dev, "ERROR: cannot create hwmon attributes: %d\n", rc);
> +	occ_remove_hwmon_attrs(driver);
> +	return rc;
> =C2=A0}
> =C2=A0
> -
> -/* device probe and removal */
> -
> -enum occ_type {
> -	occ_id,
> -};
> -
> -static int occ_probe(struct i2c_client *client, const struct i2c_device_=
id *id)
> +int occ_init(struct occ_driver *driver)
> =C2=A0{
> -	struct device *dev =3D &client->dev;
> -	struct occ_drv_data *data;
> -
> -	data =3D devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
> -	if (!data)
> +	struct device *dev =3D driver->hwmon;
> +	struct power8_occ_driver *power =3D
> +		devm_kzalloc(dev, sizeof(struct power_occ_driver),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> +	if (!power)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	data->client =3D client;
> -	i2c_set_clientdata(client, data);
> -	mutex_init(&data->update_lock);
> -	data->update_interval =3D HZ;
> +	power->driver =3D driver;
> +	power->dev =3D dev;
> =C2=A0
> -	occ_create_i2c_sysfs_attr(dev);
> +	set_dev_drvdata(dev, power);
> =C2=A0
> -	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
> -
> -	return 0;
> +	return occ_create_hwmon_attrs(driver);
> =C2=A0}
> =C2=A0
> -static int occ_remove(struct i2c_client *client)
> +void occ_exit(occ_driver *driver)
> =C2=A0{
> -	struct occ_drv_data *data =3D i2c_get_clientdata(client);
> -
> -	/* free allocated sensor memory */
> -	deinit_occ_resp_buf(&data->occ_resp);
> -
> -	device_remove_file(&client->dev, &dev_attr_online);
> +	struct power8_occ_driver *power =3D dev_get_drvdata(driver->hwmon);
> =C2=A0
> -	if (!data->hwmon_dev)
> -		return 0;
> -
> -	occ_remove_hwmon_attrs(data->hwmon_dev);
> -	hwmon_device_unregister(data->hwmon_dev);
> -	return 0;
> +	occ_remove_hwmon_attrs(power);
> =C2=A0}
> -
> -/* used by old-style board info. */
> -static const struct i2c_device_id occ_ids[] =3D {
> -	{ OCC_I2C_NAME, occ_id, },
> -	{ /* LIST END */ }
> -};
> -MODULE_DEVICE_TABLE(i2c, occ_ids);
> -
> -/* use by device table */
> -static const struct of_device_id i2c_occ_of_match[] =3D {
> -	{.compatible =3D "ibm,occ-i2c"},
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, i2c_occ_of_match);
> -
> -/* i2c-core uses i2c-detect() to detect device in bellow address list.
> - *=C2=A0=C2=A0If exists, address will be assigned to client.
> - * It is also possible to read address from device table.
> - */
> -static const unsigned short normal_i2c[] =3D {0x50, 0x51, I2C_CLIENT_END=
 };
> -
> -static struct i2c_driver occ_driver =3D {
> -	.class		=3D I2C_CLASS_HWMON,
> -	.driver =3D {
> -		.name	=3D OCC_I2C_NAME,
> -		.pm	=3D NULL,
> -		.of_match_table =3D i2c_occ_of_match,
> -	},
> -	.probe		=3D occ_probe,
> -	.remove		=3D occ_remove,
> -	.id_table=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D occ_ids,
> -	.address_list	=3D normal_i2c,
> -};
> -
> -module_i2c_driver(occ_driver);
> -
> -MODULE_AUTHOR("Li Yi <shliyi@cn.ibm.com>");
> -MODULE_DESCRIPTION("BMC OCC hwmon driver");
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/power8_occ.h b/drivers/hwmon/occ/power8_oc=
c.h
> new file mode 100644
> index 0000000..3f23d95
> --- /dev/null
> +++ b/drivers/hwmon/occ/power8_occ.h
> @@ -0,0 +1,24 @@
> +/*
> + * power8_occ.h - Power8 OCC hwmon driver
> + *
> + * This file contains Power8 specific function prototypes
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __POWER8_OCC_H__
> +#define __POWER8_OCC_H__
> +
> +int occ_init(struct occ_driver *driver);
> +
> +#endif /* __POWER8_OCC_H__ */

I was suffering review fatigue by the end, so the lack of comments
doesn't necessary mean a lack of issues, but in the interest of sending
this sooner rather than later I'll try to come back to it.

The changes have a much higher chance of being accepted if they are
provided as concise patches. The fact that your overview contains four
bullet points:

> Patch 2: "drivers: occ hwmon - isolate bus transfer protocol"
> * modify drivers/hwmon Makefile and Kconfig
> * create i2c layer
> * move some common code out of the Power8 OCC specific file
> * clean up Power8 OCC driver
>=C2=A0

Indicates this one change might be at least four patches.

Andrew
--=-6wdvpeRENQuJKvJ272BS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX/EW/AAoJEJ0dnzgO5LT5pXsP/0H39wG4Wn6GbEnMVYBH+2b3
WvWGXhfGdGvXW7OH4yR9PKhGLjt+pMscN3bhw+MszeToS4r+R5J0GAEd1q9tgw+9
plYCV7w+MlC/MQHXdDwmYUbm0KZ+prZzzjyVnDftJDVhHJUMgRe3eYd5o51s623L
HScpioEQgmnQJI6x9i1OK2K3AA/Eh55V6G9iMfI+dgWHf9ZRvKue3WWjGoaoh7g8
2H67HNGe+MPnKefJO2DBiZMaEGxgUDqZFb3MpDAwwlEeelhSTqdOMIlrPsdYsqKa
OzB+/cpAIljj40J78CO2PmJO3HBnadMMZss90Px/PIKOz2blvOBVDplr/DpJQpRM
mFq3qz5piqQ6829ylJNXeeFK/39lwl/DB4QgPOuB8SpYs4Epq2UT4uQNzwptvxXv
tLP6dbd3ZJQtQspEcOtDX2xo9YYzVQsYjMxQqzkyTylWjS9ktn9LOypFne+aNugy
RmOBMr6d3QcTXZcYIFVKc8xZw4VmcYz3lGBm3e3Fp1uSt/fBY5iGAJx2+OB07Eh0
wL/0D4Xd3F/WS9g5h8TWlbT7Rp/tGqcqd699irttntDZYnogQODyDoW/AdEb+aD5
0lFlBfUFWu0+JAxlY+eI/JE7oQyE1nWL7tpCygdv1X4SS5ex7dpuyjzicRsqrD6O
eOtnxAkD/0rdvi22gpNx
=l+mX
-----END PGP SIGNATURE-----

--=-6wdvpeRENQuJKvJ272BS--
