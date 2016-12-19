Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tq800062BzDq7w
 for <openbmc@lists.ozlabs.org>; Thu, 29 Dec 2016 23:23:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LTsajqmg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mzs71gjR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D211F20963;
 Thu, 29 Dec 2016 07:23:23 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 29 Dec 2016 07:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=ahxTW3k/bqdrOimuNjax88eCXkg=; b=LTsajq
 mgVvEQKM21z0L6ViCcvzgXQpfU6u8I/I5EX3/jxLv8rH8JtXuuwC8yuU+pkU/mZp
 lpJqRbGlyguDVKSxbSEOYI6WbHA5DXAy8JZkRw7GLEC+QdKja34CH3EknVGH/9ru
 c7106GPx0x+/CZ6nk3bOwnb7UUesfx/Icmzd0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ahxTW3k/bqdrOi
 muNjax88eCXkg=; b=mzs71gjRWwp2xN5E/rngeiehFbSvXxgKbFtYyYh2IGP/hP
 bSS7JApdGPZpe/u4OuQoB2z76OxbydHMfWV038ZaTZd521RcfGWLMsTn+2Qfvuw+
 oCTNF8AR8CXeDroD59/7ssWpr08CJV41Yto2Cxjff1FdQP0uVEGJZlyi+h+Vs=
X-ME-Sender: <xms:OwBlWCcsW9ojYdg5TwZr-hTgxb0lT8EwmGV7z752CY_kMEKzFtEXGA>
X-Sasl-enc: 0pT/1aXddrLEjVso/9XAmT8dlTpOP0E6k3dp+Tiv9Hzu 1483014202
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6538B2471E;
 Thu, 29 Dec 2016 07:23:21 -0500 (EST)
Message-ID: <1482127473.3419.2.camel@aj.id.au>
Subject: Re: [PATCH linux 1/7] hwmon: Add core On-Chip Controller support
 for POWER CPUs
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
In-Reply-To: <1481920475-6638-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920475-6638-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kkyY2fJLpvV+WAcgUqFl"
Date: Mon, 19 Dec 2016 16:34:34 +1030
Mime-Version: 1.0
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Thu, 29 Dec 2016 12:23:29 -0000


--=-kkyY2fJLpvV+WAcgUqFl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

I think this is looking good. A few comments below.

On Fri, 2016-12-16 at 14:34 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add core support for polling the OCC for it's sensor data and parsing tha=
t
> data into sensor-specific information.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0Documentation/hwmon/occ=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A040 ++++
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A02 +
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
=C2=A01 +
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0|=C2=A0=C2=A015 ++
> =C2=A0drivers/hwmon/occ/Makefile |=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ.c=C2=A0=C2=A0=C2=A0=C2=A0| 519 ++++++++++++++=
+++++++++++++++++++++++++++++++
> =C2=A0drivers/hwmon/occ/occ.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A086 ++++=
++++
> =C2=A0drivers/hwmon/occ/scom.h=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A048 +++++
> =C2=A08 files changed, 712 insertions(+)
> =C2=A0create mode 100644 Documentation/hwmon/occ
> =C2=A0create mode 100644 drivers/hwmon/occ/Kconfig
> =C2=A0create mode 100644 drivers/hwmon/occ/Makefile
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.h
> =C2=A0create mode 100644 drivers/hwmon/occ/scom.h
>=20
> diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
> new file mode 100644
> index 0000000..79d1642
> --- /dev/null
> +++ b/Documentation/hwmon/occ
> @@ -0,0 +1,40 @@
> +Kernel driver occ
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> + * ASPEED AST2400
> + * ASPEED AST2500
> +
> +Please note that the chip must be connected to a POWER8 or POWER9 proces=
sor
> +(see the BMC - Host Communications section).
> +
> > +Author: Eddie James <eajames@us.ibm.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for the OCC (On-Chip Controller) on the I=
BM
> +POWER8 and POWER9 processors, from a BMC (Baseboard Management Controlle=
r). The
> +OCC is an embedded processor that provides real time power and thermal
> +monitoring.
> +
> +This driver provides an interface on a BMC to poll OCC sensor data, set =
user
> +power caps, and perform some basic OCC error handling.
> +
> +Currently, all versions of the OCC support four types of sensor data: po=
wer,
> +temperature, frequency, and "caps," which indicate limits and thresholds=
 used
> +internally on the OCC.
> +
> +BMC - Host Communications
> +-------------------------
> +
> +For the POWER8 application, the BMC can communicate with the P8 over I2C=
 bus.
> +However, to access the OCC register space, any data transfer must use a =
SCOM
> +operation. SCOM is a procedure to initiate a data transfer, typically of=
 8
> +bytes. SCOMs consist of writing a 32-bit command register and then
> +reading/writing two 32-bit data registers. This driver implements these
> +SCOM operations over I2C bus in order to communicate with the OCC.
> +
> +For the POWER9 application, the BMC can communicate with the P9 over FSI=
 bus
> +and SBE engine. Once again, SCOM operations are required. This driver wi=
ll
> +implement SCOM ops over FSI/SBE. This will require the FSI driver.

Great!

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 45cef3d..75b83d9 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1229,6 +1229,8 @@ config SENSORS_NSA320
> > =C2=A0	=C2=A0=C2=A0This driver can also be built as a module. If so, th=
e module
> > =C2=A0	=C2=A0=C2=A0will be called nsa320-hwmon.
> =C2=A0
> +source drivers/hwmon/occ/Kconfig
> +
> =C2=A0config SENSORS_PCF8591
> > =C2=A0	tristate "Philips PCF8591 ADC/DAC"
> > =C2=A0	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index aecf4ba..8339696 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+=3D wm831x-hwmon.o
> > =C2=A0obj-$(CONFIG_SENSORS_WM8350)	+=3D wm8350-hwmon.o
> > =C2=A0obj-$(CONFIG_SENSORS_XGENE)	+=3D xgene-hwmon.o
> =C2=A0
> > +obj-$(CONFIG_SENSORS_PPC_OCC)	+=3D occ/
> > =C2=A0obj-$(CONFIG_PMBUS)		+=3D pmbus/
> =C2=A0
> =C2=A0ccflags-$(CONFIG_HWMON_DEBUG_CHIP) :=3D -DDEBUG
> diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
> new file mode 100644
> index 0000000..cdb64a7
> --- /dev/null
> +++ b/drivers/hwmon/occ/Kconfig
> @@ -0,0 +1,15 @@
> +#
> +# On Chip Controller configuration
> +#
> +
> +menuconfig SENSORS_PPC_OCC
> > +	bool "PPC On-Chip Controller"
> > +	help
> > +	=C2=A0=C2=A0If you say yes here you get support to monitor Power CPU
> > +	=C2=A0=C2=A0sensors via the On-Chip Controller (OCC).
> +
> > +	=C2=A0=C2=A0Generally this is used by management controllers such as =
a BMC
> > +	=C2=A0=C2=A0on an OpenPower system.
> +
> > +	=C2=A0=C2=A0This driver can also be built as a module. If so, the mod=
ule
> > +	=C2=A0=C2=A0will be called occ.
> diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
> new file mode 100644
> index 0000000..93cb52f
> --- /dev/null
> +++ b/drivers/hwmon/occ/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_SENSORS_PPC_OCC) +=3D occ.o
> diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
> new file mode 100644
> index 0000000..6cb8df5
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.c
> @@ -0,0 +1,519 @@
> +/*
> + * occ.c - OCC hwmon driver
> + *
> + * This file contains the methods and data structures for the OCC hwmon =
driver.
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
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <asm/unaligned.h>
> +
> +#include "occ.h"
> +
> > +#define OCC_DATA_MAX		4096
> > +#define OCC_BMC_TIMEOUT_S	20
> +
> +/* To generate attn to OCC */
> > +#define ATTN_DATA		0x0006B035
> +
> +/* For BMC to read/write SRAM */
> > +#define OCB_ADDRESS		0x0006B070
> > +#define OCB_DATA		0x0006B075
> > +#define OCB_STATUS_CONTROL_AND	0x0006B072
> > +#define OCB_STATUS_CONTROL_OR	0x0006B073
> +
> +/* To init OCB */
> > +#define OCB_AND_INIT0		0xFBFFFFFF
> > +#define OCB_AND_INIT1		0xFFFFFFFF
> > +#define OCB_OR_INIT0		0x08000000
> > +#define OCB_OR_INIT1		0x00000000
> +
> +/* To generate attention on OCC */
> > +#define ATTN0			0x01010000
> > +#define ATTN1			0x00000000
> +
> +/* OCC return status for "command in progress" */
> > +#define RESP_RETURN_CMD_IN_PRG	0xFF
> +/* time interval to retry on "command in progress" return status */
> +#define CMD_IN_PRG_INT_MS	100

Out of curiosity, why are we defining one period in MS and another in S
(OCC_BMC_TIMEOUT_S)? It feels like it would make sense to use
consistent units.

Regardless, thanks for defining the macros above rather than using the
magic numbers.

> +
> +/* OCC command definitions */
> > +#define OCC_POLL		0
> > +#define OCC_SET_USER_POWR_CAP	0x22
> +
> +/* OCC poll command data */
> > +#define OCC_POLL_STAT_SENSOR	0x10
> +
> +/* OCC response data offsets */
> > +#define RESP_RETURN_STATUS	2
> > +#define RESP_DATA_LENGTH	3
> > +#define RESP_HEADER_OFFSET	5
> > +#define SENSOR_STR_OFFSET	37
> > +#define SENSOR_BLOCK_NUM_OFFSET	43
> > +#define SENSOR_BLOCK_OFFSET	45
> +
> +/* occ_poll_header
> + * structure to match the raw occ poll response data
> + */
> +struct occ_poll_header {
> > +	u8 status;
> > +	u8 ext_status;
> > +	u8 occs_present;
> > +	u8 config;
> > +	u8 occ_state;
> > +	u8 mode;
> > +	u8 ips_status;
> > +	u8 error_log_id;
> > +	u32 error_log_addr_start;
> > +	u16 error_log_length;
> > +	u8 reserved2;
> > +	u8 reserved3;
> > +	u8 occ_code_level[16];
> > +	u8 sensor_eye_catcher[6];
> > +	u8 sensor_block_num;
> > +	u8 sensor_data_version;
> +} __attribute__((packed, aligned(4)));
> +
> +struct occ_response {
> > +	struct occ_poll_header header;
> > +	struct occ_blocks data;
> +};
> +
> +struct occ {
> > +	struct device *dev;
> > +	void *bus;
> > +	struct occ_bus_ops bus_ops;
> > +	struct occ_ops ops;
> > +	struct occ_config config;
> > +	unsigned long update_interval;
> > +	unsigned long last_updated;
> > +	struct mutex update_lock;
> > +	struct occ_response response;
> > +	bool valid;
> +};
> +
> +static void deinit_occ_resp_buf(struct occ_response *resp)
> +{
> > +	int i;
> +
> > +	if (!resp)
> > +		return;
> +
> > +	if (!resp->data.blocks)
> > +		return;
> +
> > +	for (i =3D 0; i < resp->header.sensor_block_num; ++i)
> > +		kfree(resp->data.blocks[i].sensors);
> +
> > +	kfree(resp->data.blocks);
> +
> > +	memset(resp, 0, sizeof(struct occ_response));
> +
> > +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> > +		resp->data.sensor_block_id[i] =3D -1;
> +}
> +
> +static void *occ_get_sensor_by_type(struct occ_response *resp,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type t)
> +{
> > +	if (!resp->data.blocks)
> > +		return NULL;
> +
> > +	if (resp->data.sensor_block_id[t] =3D=3D -1)
> > +		return NULL;
> +
> > +	return resp->data.blocks[resp->data.sensor_block_id[t]].sensors;
> +}
> +
> +static int occ_check_sensor(struct occ *driver, u8 sensor_length,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0u8 sensor_num, enum sensor_type t, int bloc=
k)
> +{
> > +	void *sensor;
> > +	int type_block_id;
> > +	struct occ_response *resp =3D &driver->response;
> +
> > +	sensor =3D occ_get_sensor_by_type(resp, t);
> +
> > +	/* empty sensor block, release older sensor data */
> > +	if (sensor_num =3D=3D 0 || sensor_length =3D=3D 0) {
> > +		kfree(sensor);
> > +		dev_err(driver->dev, "no sensor blocks available\n");
> > +		return -ENODATA;
> > +	}
> +
> > +	type_block_id =3D resp->data.sensor_block_id[t];
> > +	if (!sensor || sensor_num !=3D
> > +	=C2=A0=C2=A0=C2=A0=C2=A0resp->data.blocks[type_block_id].header.senso=
r_num) {
> > +		kfree(sensor);
> > +		resp->data.blocks[block].sensors =3D
> > +			driver->ops.alloc_sensor(t, sensor_num);
> > +		if (!resp->data.blocks[block].sensors)
> > +			return -ENOMEM;
> > +	}
> +
> > +	return 0;
> +}
> +
> +static int parse_occ_response(struct occ *driver, u8 *data,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_response *resp)
> +{
> > +	int b;
> > +	int s;
> > +	int rc;
> > +	int offset =3D SENSOR_BLOCK_OFFSET;
> > +	int sensor_type;
> > +	u8 sensor_block_num;
> +	char sensor_type_string[5] =3D { 0 };

Given how you rearranged things below, do you think we can get away
with removing sensor_type_string? Also, struct sensor_data_block_type
defines sensor_type as a char * that can't be null-terminated as its
size is 4, which still makes me feel uncomfortable. What are your
thoughts here?

> +	struct sensor_data_block_header *block;
> > +	struct device *dev =3D driver->dev;
> +
> > +	/* check if the data is valid */
> > +	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> > +		dev_err(dev, "no SENSOR string in response\n");
> > +		rc =3D -ENODATA;
> > +		goto err;
> > +	}
> +
> > +	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> > +	if (sensor_block_num =3D=3D 0) {
> > +		dev_err(dev, "no sensor blocks available\n");
> > +		rc =3D -ENODATA;
> > +		goto err;
> > +	}
> +
> > +	/* if number of sensor block has changed, re-malloc */
> > +	if (sensor_block_num !=3D resp->header.sensor_block_num) {
> > +		deinit_occ_resp_buf(resp);
> > +		resp->data.blocks =3D kcalloc(sensor_block_num,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct sensor_data_block),
> > +					=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +		if (!resp->data.blocks)
> > +			return -ENOMEM;
> > +	}
> +
> > +	memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct occ_poll_head=
er));
> > +	resp->header.error_log_addr_start =3D
> > +		be32_to_cpu(resp->header.error_log_addr_start);
> > +	resp->header.error_log_length =3D
> > +		be16_to_cpu(resp->header.error_log_length);
> +
> > +	dev_dbg(dev, "Reading %d sensor blocks\n",
> > +		resp->header.sensor_block_num);
> > +	for (b =3D 0; b < sensor_block_num; b++) {
> +		block =3D (struct sensor_data_block_header *)&data[offset];
+		/* copy to a null terminated string */
> > +		strncpy(sensor_type_string, block->sensor_type, 4);
> > +		offset +=3D 8;
> +
> > +		dev_dbg(dev, "sensor block[%d]: type: %s, sensor_num: %d\n", b,
> > +			sensor_type_string, block->sensor_num);
> +
> > +		if (strncmp(block->sensor_type, "FREQ", 4) =3D=3D 0)
> > +			sensor_type =3D FREQ;
> > +		else if (strncmp(block->sensor_type, "TEMP", 4) =3D=3D 0)
> > +			sensor_type =3D TEMP;
> > +		else if (strncmp(block->sensor_type, "POWR", 4) =3D=3D 0)
> > +			sensor_type =3D POWER;
> > +		else if (strncmp(block->sensor_type, "CAPS", 4) =3D=3D 0)
> > +			sensor_type =3D CAPS;
> > +		else {
> > +			dev_err(dev, "sensor type not supported %s\n",
> > +				sensor_type_string);
> > +			continue;
> > +		}
> +
> > +		rc =3D occ_check_sensor(driver, block->sensor_length,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0block->sensor_num, sensor_type=
, b);
> > +		if (rc =3D=3D -ENOMEM)
> > +			goto err;
> > +		else if (rc)
> > +			continue;
> +
> > +		resp->data.sensor_block_id[sensor_type] =3D b;
> > +		for (s =3D 0; s < block->sensor_num; s++) {
> > +			driver->ops.parse_sensor(data,
> > +						=C2=A0resp->data.blocks[b].sensors,
> > +						=C2=A0sensor_type, offset, s);
> > +			offset +=3D block->sensor_length;
> > +		}
> +
> > +		/* copy block data over to response pointer */
> > +		resp->data.blocks[b].header =3D *block;
> > +	}
> +
> > +	return 0;
> +err:
> > +	deinit_occ_resp_buf(resp);
> > +	return rc;
> +}
> +
> +static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16 length,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 *data, u8 *resp)
> +{
> > +	u32 cmd1, cmd2;
> > +	u16 checksum =3D 0;
> > +	u16 length_be =3D cpu_to_be16(length);
> > +	int i, rc, tries =3D 0;
> +	const int max_tries =3D (OCC_BMC_TIMEOUT_S * 1000) / CMD_IN_PRG_INT_MS;

I expect we should just #define the expression?

> +
> > +	cmd1 =3D (seq << 24) | (type << 16) | length_be;
> > +	memcpy(&cmd2, data, length);
> > +	cmd2 <<=3D ((4 - length) * 8);
> +
> > +	/* checksum: sum of every bytes of cmd1, cmd2 */
> > +	for (i =3D 0; i < 4; i++) {
> > +		checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
> +		checksum +=3D (cmd2 >> (i * 8)) & 0xFF;

I have to apologise here, as my review was wrong: Addition is
commutative, but not when we're masking the result (so the original
approach is probably more correct)! It only occurred to me when reading
over this patch. Sorry! Did you get checksum errors as a result?

> +	}
> +
> > +	cmd2 |=3D checksum << ((2 - length) * 8);
> +
> > +	/* Init OCB */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_OR,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OCB_OR_INIT0, OCB_OR_INIT1);
> > +	if (rc)
> > +		goto err;
> +
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_AND,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OCB_AND_INIT0, OCB_AND_INIT1);
> > +	if (rc)
> > +		goto err;
> +
> > +	/* Send command, 2nd half of the 64-bit addr is unused (write 0) */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->config.command_addr, 0);
> > +	if (rc)
> > +		goto err;
> +
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->config.command_addr, 0);
> > +	if (rc)
> +		goto err;

This change highlighted to me that we're sending command_addr twice -
is this necessary?

> +
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1, cmd2);
> > +	if (rc)
> > +		goto err;
> +
> > +	/* Trigger attention */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, ATTN_DATA, ATTN0, ATTN1);
> > +	if (rc)
> > +		goto err;
> +
> > +	/* Get response data */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->config.response_addr, 0);
> > +	if (rc)
> > +		goto err;
> +
> > +	do {
> > +		rc =3D driver->bus_ops.getscom(driver->bus, OCB_DATA, resp);
> > +		if (rc)
> > +			goto err;
> +
> > +		/* retry if we get "command in progress" return status */
> > +		if (resp[RESP_RETURN_STATUS] =3D=3D RESP_RETURN_CMD_IN_PRG) {
> > +			set_current_state(TASK_INTERRUPTIBLE);
> > +			schedule_timeout(msecs_to_jiffies(CMD_IN_PRG_INT_MS));
> > +			tries++;
> > +		} else
> > +			break;
> +	} while (tries < max_tries);

I'll bikeshed this to try save the break and a timeout, which is really
picking at the nits but reduces cyclomatic complexity and saves some
time. What do you think of:

    bool retry =3D false;
    int tries =3D 0;

    ...

    do {
    =C2=A0=C2=A0=C2=A0=C2=A0if (retry) {
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set_current_state(TASK_=
INTERRUPTIBLE);
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0shedule_timeout(msecs_t=
o_jiffies(CMD_IN_PRG_INT_MS));
    =C2=A0=C2=A0=C2=A0=C2=A0}

        rc =3D driver->bus_ops.getscom(driver->bus, OCB_DATA, resp);
        if (rc)
            goto err;

        retry =3D (resp[RESP_RETURN_STATUS] =3D=3D RESP_RETURN_CMD_IN_PRG) =
&& tries++ < max_tries);
    } while (retry);

Are we okay with returning RESP_RETURN_CMD_IN_PRG to the caller?
Because that's what happens in either case if we exceed max_tries.

> +
> > +	return resp[RESP_RETURN_STATUS];
> +
> +err:
> > +	dev_err(driver->dev, "scom op failed rc:%d\n", rc);
> > +	return rc;
> +}
> +
> +static int occ_get_all(struct occ *driver)
> +{
> > +	int i =3D 0, rc;
> > +	u8 *occ_data;
> > +	u16 num_bytes;
> > +	const u8 poll_cmd_data =3D OCC_POLL_STAT_SENSOR;
> > +	struct device *dev =3D driver->dev;
> > +	struct occ_response *resp =3D &driver->response;
> +
> > +	occ_data =3D devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
> > +	if (!occ_data)
> > +		return -ENOMEM;
> +
> > +	rc =3D occ_send_cmd(driver, 0, OCC_POLL, 1, &poll_cmd_data, occ_data)=
;
> > +	if (rc) {
> > +		dev_err(dev, "OCC poll failed: 0x%x\n", rc);
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	num_bytes =3D get_unaligned((u16 *)&occ_data[RESP_DATA_LENGTH]);
> > +	num_bytes =3D be16_to_cpu(num_bytes);
> > +	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
> +
> > +	if (num_bytes > OCC_DATA_MAX) {
> > +		dev_err(dev, "OCC data length must be < 4KB\n");
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	if (num_bytes <=3D 0) {
> > +		dev_err(dev, "OCC data length is zero\n");
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	/* read remaining data */
> > +	for (i =3D 8; i < num_bytes + 8; i +=3D 8) {
> > +		rc =3D driver->bus_ops.getscom(driver->bus, OCB_DATA,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&occ_data[i]);
> > +		if (rc) {
> > +			dev_err(dev, "scom op failed rc:%d\n", rc);
> > +			goto out;
> > +		}
> > +	}
> +
> > +	/* don't need more sanity checks; buffer is alloc'd for max response
> > +	=C2=A0* size so we just check for valid data in parse_occ_response
> +	=C2=A0*/

Thanks for the comment.

> +	rc =3D parse_occ_response(driver, occ_data, resp);
> +
> +out:
> > +	devm_kfree(dev, occ_data);
> > +	return rc;
> +}
> +
> +int occ_update_device(struct occ *driver)
> +{
> > +	int rc =3D 0;
> +
> > +	mutex_lock(&driver->update_lock);
> +
> > +	if (time_after(jiffies, driver->last_updated + driver->update_interva=
l)
> > +	=C2=A0=C2=A0=C2=A0=C2=A0|| !driver->valid) {
> > +		driver->valid =3D 1;
> +
> > +		rc =3D occ_get_all(driver);
> > +		if (rc)
> > +			driver->valid =3D 0;
> +
> > +		driver->last_updated =3D jiffies;
> > +	}
> +
> > +	mutex_unlock(&driver->update_lock);
> +
> > +	return rc;
> +}
> +EXPORT_SYMBOL(occ_update_device);
> +
> +void *occ_get_sensor(struct occ *driver, int sensor_type)
> +{
> > +	int rc;
> +
> > +	/* occ_update_device locks the update lock */
> > +	rc =3D occ_update_device(driver);
> > +	if (rc !=3D 0) {
> > +		dev_err(driver->dev, "cannot get occ sensor data: %d\n",
> > +			rc);
> > +		return NULL;
> > +	}
> +
> > +	return occ_get_sensor_by_type(&driver->response, sensor_type);
> +}
> +EXPORT_SYMBOL(occ_get_sensor);
> +
> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum)
> +{
> > +	return occ->ops.get_sensor_value(occ, sensor_type, snum);
> +}
> +EXPORT_SYMBOL(occ_get_sensor_value);
> +
> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum)
> +{
> > +	return occ->ops.get_sensor_id(occ, sensor_type, snum);
> +}
> +EXPORT_SYMBOL(occ_get_sensor_id);
> +
> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum, int caps=
_field)
> +{
> > +	return occ->ops.get_caps_value(sensor, snum, caps_field);
> +}
> +EXPORT_SYMBOL(occ_get_caps_value);
> +
> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks **blocks=
)
> +{
> > +	*blocks =3D &occ->response.data;
> +}
> +EXPORT_SYMBOL(occ_get_response_blocks);
> +
> +void occ_set_update_interval(struct occ *occ, unsigned long interval)
> +{
> > +	occ->update_interval =3D msecs_to_jiffies(interval);
> +}
> +EXPORT_SYMBOL(occ_set_update_interval);
> +
> +int occ_set_user_powercap(struct occ *occ, u16 cap)
> +{
> > +	u8 resp[8];
> +
> > +	cap =3D cpu_to_be16(cap);
> +
> > +	return occ_send_cmd(occ, 0, OCC_SET_USER_POWR_CAP, 2, (u8 *)&cap,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0resp);
> +}
> +EXPORT_SYMBOL(occ_set_user_powercap);
> +
> +struct occ *occ_start(struct device *dev, void *bus,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_bus_ops *bus_ops, con=
st struct occ_ops *ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct occ_config *config)
> +{
> > +	struct occ *driver =3D devm_kzalloc(dev, sizeof(struct occ), GFP_KERN=
EL);
> +
> > +	if (!driver)
> > +		return ERR_PTR(-ENOMEM);
> +
> > +	driver->dev =3D dev;
> > +	driver->bus =3D bus;
> > +	driver->bus_ops =3D *bus_ops;
> > +	driver->ops =3D *ops;
> > +	driver->config =3D *config;
> +
> > +	driver->update_interval =3D HZ;
> > +	mutex_init(&driver->update_lock);
> +
> > +	return driver;
> +}
> +EXPORT_SYMBOL(occ_start);
> +
> +int occ_stop(struct occ *occ)
> +{
> > +	devm_kfree(occ->dev, occ);
> +
> > +	return 0;
> +}
> +EXPORT_SYMBOL(occ_stop);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
> +MODULE_DESCRIPTION("OCC hwmon core driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
> new file mode 100644
> index 0000000..8c08607
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.h
> @@ -0,0 +1,86 @@
> +/*
> + * occ.h - hwmon OCC driver
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
> +#include "scom.h"
> +
> +struct device;
> +struct occ;
> +
> +/* sensor_data_block_header
> + * structure to match the raw occ sensor block header
> + */
> +struct sensor_data_block_header {
> > +	u8 sensor_type[4];
> > +	u8 reserved0;
> > +	u8 sensor_format;
> > +	u8 sensor_length;
> > +	u8 sensor_num;
> +} __attribute__((packed, aligned(4)));
> +
> +struct sensor_data_block {
> > +	struct sensor_data_block_header header;
> > +	void *sensors;
> +};
> +
> +enum sensor_type {
> > +	FREQ =3D 0,
> > +	TEMP,
> > +	POWER,
> > +	CAPS,
> > +	MAX_OCC_SENSOR_TYPE
> +};
> +
> +struct occ_ops {
> > +	void (*parse_sensor)(u8 *data, void *sensor, int sensor_type, int off=
,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int snum);
> > +	void *(*alloc_sensor)(int sensor_type, int num_sensors);
> > +	int (*get_sensor_value)(struct occ *driver, int sensor_type, int snum=
);
> > +	int (*get_sensor_id)(struct occ *driver, int sensor_type, int snum);
> > +	int (*get_caps_value)(void *sensor, int snum, int caps_field);
> +};
> +
> +struct occ_config {
> > +	u32 command_addr;
> > +	u32 response_addr;
> +};
> +
> +struct occ_blocks {
> > +	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
> > +	struct sensor_data_block *blocks;
> +};
> +
> +struct occ *occ_start(struct device *dev, void *bus,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_bus_ops *bus_ops, con=
st struct occ_ops *ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct occ_config *config)=
;
> +int occ_stop(struct occ *occ);
> +
> +void *occ_get_sensor(struct occ *occ, int sensor_type);
> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum);
> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum);
> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int caps_field);
> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks **blocks=
);
> +int occ_update_device(struct occ *driver);
> +void occ_set_update_interval(struct occ *occ, unsigned long interval);
> +int occ_set_user_powercap(struct occ *occ, u16 cap);
> +
> +#endif /* __OCC_H__ */
> diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
> new file mode 100644
> index 0000000..409a861
> --- /dev/null
> +++ b/drivers/hwmon/occ/scom.h
> @@ -0,0 +1,48 @@
> +/*
> + * scom.h - hwmon OCC driver
> + *
> + * This file contains data structures for scom operations to the OCC
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
> +#ifndef __SCOM_H__
> +#define __SCOM_H__
> +
> +/*
> + * occ_bus_ops - represent the low-level transfer methods to communicate=
 with
> + * the OCC.
> + *
> + * getscom - OCC scom read
> + * @bus: handle to slave device
> + * @address: address
> + * @data: where to store data read from slave; buffer size must be great=
er than
> + * or equal to offset + 8 bytes.
> + * @offset: offset into data pointer
> + *
> + * Returns 0 on success or one of -SCOM_READ_ERROR, -SCOM_WRITE_ERROR.

We deleted these macros. What's the plan?

> + *
> + * putscom - OCC scom write
> + * @bus: handle to slave device
> + * @address: address
> + * @data0: first data byte to write
> + * @data1: second data byte to write
> + *
> + * Returns 0 on success or -SCOM_WRITE_ERROR on error

Again, this macro was deleted.

> + */
> +struct occ_bus_ops {
> > +	int (*getscom)(void *bus, u32 address, u8 *data);
> > +	int (*putscom)(void *bus, u32 address, u32 data0, u32 data1);
> +};
> +
> +#endif /* __SCOM_H__ */

Cheers,

Andrew
--=-kkyY2fJLpvV+WAcgUqFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYV3hxAAoJEJ0dnzgO5LT5XXMP/2R3IHthDM/UL8oJd34Bx7UF
ZRpsEljF1e1/UssI/wn2zMF28P/m35fAn60Ll72IwjHnjQ7R5OtmIw/rQHthNWm4
90AUcA48yh9m+rVHe+nnO4lImV8AZFgDy94R8UuoPzvhMlRE+k92MhJ4lDNo4XVh
WqLXJ65DRxQreulf0EUlSJ0W4YQgpR4zfISSoGwVRb/wotxc9MoDGdt0lMAhsR4P
PazLeyzS9uy4TgM/7iXdlwWw74Ya2DeTKnyJnXXOWbc6YQpHiZPrw/qP8yfrVtkv
X1fuHcRROCEJV6sPVNBF9tF/D6ljDIJEmk0QC2exPxlhWdK/2U6jKPXuvzA3JwEY
CCsjU3PT5hxxj63s6gHRnKpQgWnpKFe9xSpWbSpl4rCiesTG4xZwcDyVMTMpAMxA
7ngn9b4tVmOB2TLiSgafY+ajP1e7oaUUDwAiVKRpuf3S58nRoD2NqClsBjYVxC0E
oRV22IONeuIFm8kLSJSuVAcHrsL5F4OY0uiCq4t9jw0O1W7TApVWMU9GVJ0oq0KO
/M6rzs1n0EFJ1RjVnXaCTHi0uUrMZ/TL7duZOpLXT5RqcE4i0/JrU5fs8ocKutOR
swqS2vHSRTlSjkaTecOe4szx7nzfy1d/yQJLCLZHLJ+A/QWRG/7cFLzy65h3zlXY
C79FTyznScIyFRQ1A7lh
=TPZm
-----END PGP SIGNATURE-----

--=-kkyY2fJLpvV+WAcgUqFl--
