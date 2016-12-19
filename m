Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3thr5V5GWMzDwHV
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 17:06:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EORGoceN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LORv5oOw"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4307720876;
 Mon, 19 Dec 2016 01:06:20 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 01:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=WqlbVjF+wcrxVS6R/307SSS3X4E=; b=EORGoc
 eNmDRLkgXZwrC7odSIcuFoT+xPrNCi+xFDoWqiWjhYg9yQk87WnQNr8TS4c8b9oT
 IvIRTH09Gju6wbpMYq65LcXm0YwHeb7hwSfD52CKCoqOf3j6NJStCc5TYCCT3WWH
 JeJkzwC26QyUnvXhHcCefzg6hVdyl5U1eX7mA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=WqlbVjF+wcrxVS
 6R/307SSS3X4E=; b=LORv5oOwWm2H1TR4fH0+O99AElloQbsRE+cy0otrHDpygN
 TRm/AU7GiNGoUxhHoodnn6DGRMP6/imNeflYelZIQbPq/GywLsEpfjxFmCpx5YkT
 oJUYWH1FnlWaMNlZgn5R/cv6nWyOAh4qxml4wZ6k0MO/BHqYuFO4TymW9uQsM=
X-ME-Sender: <xms:3HhXWMWGdX6jZ238VaS0XoRHiCCoBiv3sVZ5b6hrz6LjH4uvAdQPLw>
X-Sasl-enc: FIqmwupek7qkbGa4NgqJh++37nCC+c3EXkQdk/ZpJG1D 1482127579
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id C35C224240;
 Mon, 19 Dec 2016 01:06:17 -0500 (EST)
Message-ID: <1482127573.3419.4.camel@aj.id.au>
Subject: Re: [PATCH linux 1/7] hwmon: Add core On-Chip Controller support
 for POWER CPUs
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 19 Dec 2016 16:36:13 +1030
In-Reply-To: <1481920475-6638-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920475-6638-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6KZH+rO6AdUdPAINha2t"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Mon, 19 Dec 2016 06:06:23 -0000


--=-6KZH+rO6AdUdPAINha2t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

I think this is looking good. A few comments below.

On Fri, 2016-12-16 at 14:34 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add core support for polling the OCC for it's sensor data and parsing
> that
> data into sensor-specific information.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> ---
> =C2=A0Documentation/hwmon/occ=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A040 ++++
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A02 +
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
=C2=A01 +
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0|=C2=A0=C2=A015 ++
> =C2=A0drivers/hwmon/occ/Makefile |=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ.c=C2=A0=C2=A0=C2=A0=C2=A0| 519
> +++++++++++++++++++++++++++++++++++++++++++++
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
> +Please note that the chip must be connected to a POWER8 or POWER9
> processor
> +(see the BMC - Host Communications section).
> +
> > +Author: Eddie James <eajames@us.ibm.com>
>=20
> +
> +Description
> +-----------
> +
> +This driver implements support for the OCC (On-Chip Controller) on
> the IBM
> +POWER8 and POWER9 processors, from a BMC (Baseboard Management
> Controller). The
> +OCC is an embedded processor that provides real time power and
> thermal
> +monitoring.
> +
> +This driver provides an interface on a BMC to poll OCC sensor data,
> set user
> +power caps, and perform some basic OCC error handling.
> +
> +Currently, all versions of the OCC support four types of sensor
> data: power,
> +temperature, frequency, and "caps," which indicate limits and
> thresholds used
> +internally on the OCC.
> +
> +BMC - Host Communications
> +-------------------------
> +
> +For the POWER8 application, the BMC can communicate with the P8 over
> I2C bus.
> +However, to access the OCC register space, any data transfer must
> use a SCOM
> +operation. SCOM is a procedure to initiate a data transfer,
> typically of 8
> +bytes. SCOMs consist of writing a 32-bit command register and then
> +reading/writing two 32-bit data registers. This driver implements
> these
> +SCOM operations over I2C bus in order to communicate with the OCC.
> +
> +For the POWER9 application, the BMC can communicate with the P9 over
> FSI bus
> +and SBE engine. Once again, SCOM operations are required. This
> driver will
> +implement SCOM ops over FSI/SBE. This will require the FSI driver.

Great!

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 45cef3d..75b83d9 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1229,6 +1229,8 @@ config SENSORS_NSA320
> > =C2=A0	=C2=A0=C2=A0This driver can also be built as a module. If so, th=
e
> > module
> > =C2=A0	=C2=A0=C2=A0will be called nsa320-hwmon.
>=20
> =C2=A0
> +source drivers/hwmon/occ/Kconfig
> +
> =C2=A0config SENSORS_PCF8591
> > =C2=A0	tristate "Philips PCF8591 ADC/DAC"
> > =C2=A0	depends on I2C
>=20
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index aecf4ba..8339696 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+=3D wm831x-
> > hwmon.o
> > =C2=A0obj-$(CONFIG_SENSORS_WM8350)	+=3D wm8350-hwmon.o
> > =C2=A0obj-$(CONFIG_SENSORS_XGENE)	+=3D xgene-hwmon.o
>=20
> =C2=A0
> > +obj-$(CONFIG_SENSORS_PPC_OCC)	+=3D occ/
> > =C2=A0obj-$(CONFIG_PMBUS)		+=3D pmbus/
>=20
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
>=20
> +
> > +	=C2=A0=C2=A0Generally this is used by management controllers such as
> > a BMC
> > +	=C2=A0=C2=A0on an OpenPower system.
>=20
> +
> > +	=C2=A0=C2=A0This driver can also be built as a module. If so, the
> > module
> > +	=C2=A0=C2=A0will be called occ.
>=20
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
> + * This file contains the methods and data structures for the OCC
> hwmon driver.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License as published
> by
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
>=20
> +
> +/* To generate attn to OCC */
> > +#define ATTN_DATA		0x0006B035
>=20
> +
> +/* For BMC to read/write SRAM */
> > +#define OCB_ADDRESS		0x0006B070
> > +#define OCB_DATA		0x0006B075
> > +#define OCB_STATUS_CONTROL_AND	0x0006B072
> > +#define OCB_STATUS_CONTROL_OR	0x0006B073
>=20
> +
> +/* To init OCB */
> > +#define OCB_AND_INIT0		0xFBFFFFFF
> > +#define OCB_AND_INIT1		0xFFFFFFFF
> > +#define OCB_OR_INIT0		0x08000000
> > +#define OCB_OR_INIT1		0x00000000
>=20
> +
> +/* To generate attention on OCC */
> > +#define ATTN0			0x01010000
> > +#define ATTN1			0x00000000
>=20
> +
> +/* OCC return status for "command in progress" */
> > +#define RESP_RETURN_CMD_IN_PRG	0xFF
>=20
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
>=20
> +
> +/* OCC poll command data */
> > +#define OCC_POLL_STAT_SENSOR	0x10
>=20
> +
> +/* OCC response data offsets */
> > +#define RESP_RETURN_STATUS	2
> > +#define RESP_DATA_LENGTH	3
> > +#define RESP_HEADER_OFFSET	5
> > +#define SENSOR_STR_OFFSET	37
> > +#define SENSOR_BLOCK_NUM_OFFSET	43
> > +#define SENSOR_BLOCK_OFFSET	45
>=20
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
>=20
> +} __attribute__((packed, aligned(4)));
> +
> +struct occ_response {
> > +	struct occ_poll_header header;
> > +	struct occ_blocks data;
>=20
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
>=20
> +};
> +
> +static void deinit_occ_resp_buf(struct occ_response *resp)
> +{
> > +	int i;
>=20
> +
> > +	if (!resp)
> > +		return;
>=20
> +
> > +	if (!resp->data.blocks)
> > +		return;
>=20
> +
> > +	for (i =3D 0; i < resp->header.sensor_block_num; ++i)
> > +		kfree(resp->data.blocks[i].sensors);
>=20
> +
> > +	kfree(resp->data.blocks);
>=20
> +
> > +	memset(resp, 0, sizeof(struct occ_response));
>=20
> +
> > +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> > +		resp->data.sensor_block_id[i] =3D -1;
>=20
> +}
> +
> +static void *occ_get_sensor_by_type(struct occ_response *resp,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type t)
>=20
> +{
> > +	if (!resp->data.blocks)
> > +		return NULL;
>=20
> +
> > +	if (resp->data.sensor_block_id[t] =3D=3D -1)
> > +		return NULL;
>=20
> +
> > +	return resp->data.blocks[resp-
> > >data.sensor_block_id[t]].sensors;
>=20
> +}
> +
> +static int occ_check_sensor(struct occ *driver, u8 sensor_length,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0u8 sensor_num, enum sensor_type t, int
> > block)
>=20
> +{
> > +	void *sensor;
> > +	int type_block_id;
> > +	struct occ_response *resp =3D &driver->response;
>=20
> +
> > +	sensor =3D occ_get_sensor_by_type(resp, t);
>=20
> +
> > +	/* empty sensor block, release older sensor data */
> > +	if (sensor_num =3D=3D 0 || sensor_length =3D=3D 0) {
> > +		kfree(sensor);
> > +		dev_err(driver->dev, "no sensor blocks
> > available\n");
> > +		return -ENODATA;
> > +	}
>=20
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
>=20
> +
> > +	return 0;
>=20
> +}
> +
> +static int parse_occ_response(struct occ *driver, u8 *data,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_response *resp)
>=20
> +{
> > +	int b;
> > +	int s;
> > +	int rc;
> > +	int offset =3D SENSOR_BLOCK_OFFSET;
> > +	int sensor_type;
> > +	u8 sensor_block_num;
>=20
> +	char sensor_type_string[5] =3D { 0 };

Given how you rearranged things below, do you think we can get away
with removing sensor_type_string? Also, struct sensor_data_block_type
defines sensor_type as a char * that can't be null-terminated as its
size is 4, which still makes me feel uncomfortable. What are your
thoughts here?

> +	struct sensor_data_block_header *block;
> > +	struct device *dev =3D driver->dev;
>=20
> +
> > +	/* check if the data is valid */
> > +	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> > +		dev_err(dev, "no SENSOR string in response\n");
> > +		rc =3D -ENODATA;
> > +		goto err;
> > +	}
>=20
> +
> > +	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> > +	if (sensor_block_num =3D=3D 0) {
> > +		dev_err(dev, "no sensor blocks available\n");
> > +		rc =3D -ENODATA;
> > +		goto err;
> > +	}
>=20
> +
> > +	/* if number of sensor block has changed, re-malloc */
> > +	if (sensor_block_num !=3D resp->header.sensor_block_num) {
> > +		deinit_occ_resp_buf(resp);
> > +		resp->data.blocks =3D kcalloc(sensor_block_num,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct
> > sensor_data_block),
> > +					=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +		if (!resp->data.blocks)
> > +			return -ENOMEM;
> > +	}
>=20
> +
> > +	memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct occ_poll_head=
er));
> > +	resp->header.error_log_addr_start =3D
> > +		be32_to_cpu(resp->header.error_log_addr_start);
> > +	resp->header.error_log_length =3D
> > +		be16_to_cpu(resp->header.error_log_length);
>=20
> +
> > +	dev_dbg(dev, "Reading %d sensor blocks\n",
> > +		resp->header.sensor_block_num);
> > +	for (b =3D 0; b < sensor_block_num; b++) {
>=20
> +		block =3D (struct sensor_data_block_header
> *)&data[offset];

+		/* copy to a null terminated string */
> > +		strncpy(sensor_type_string, block->sensor_type,
> > 4);
> > +		offset +=3D 8;
>=20
> +
> > +		dev_dbg(dev, "sensor block[%d]: type: %s,
> > sensor_num: %d\n", b,
> > +			sensor_type_string, block->sensor_num);
>=20
> +
> > +		if (strncmp(block->sensor_type, "FREQ", 4) =3D=3D 0)
> > +			sensor_type =3D FREQ;
> > +		else if (strncmp(block->sensor_type, "TEMP", 4) =3D=3D
> > 0)
> > +			sensor_type =3D TEMP;
> > +		else if (strncmp(block->sensor_type, "POWR", 4) =3D=3D
> > 0)
> > +			sensor_type =3D POWER;
> > +		else if (strncmp(block->sensor_type, "CAPS", 4) =3D=3D
> > 0)
> > +			sensor_type =3D CAPS;
> > +		else {
> > +			dev_err(dev, "sensor type not supported
> > %s\n",
> > +				sensor_type_string);
> > +			continue;
> > +		}
>=20
> +
> > +		rc =3D occ_check_sensor(driver, block-
> > >sensor_length,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0block->sensor_num,
> > sensor_type, b);
> > +		if (rc =3D=3D -ENOMEM)
> > +			goto err;
> > +		else if (rc)
> > +			continue;
>=20
> +
> > +		resp->data.sensor_block_id[sensor_type] =3D b;
> > +		for (s =3D 0; s < block->sensor_num; s++) {
> > +			driver->ops.parse_sensor(data,
> > +						=C2=A0resp-
> > >data.blocks[b].sensors,
> > +						=C2=A0sensor_type,
> > offset, s);
> > +			offset +=3D block->sensor_length;
> > +		}
>=20
> +
> > +		/* copy block data over to response pointer */
> > +		resp->data.blocks[b].header =3D *block;
> > +	}
>=20
> +
> > +	return 0;
>=20
> +err:
> > +	deinit_occ_resp_buf(resp);
> > +	return rc;
>=20
> +}
> +
> +static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16
> length,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 *data, u8 *resp)
>=20
> +{
> > +	u32 cmd1, cmd2;
> > +	u16 checksum =3D 0;
> > +	u16 length_be =3D cpu_to_be16(length);
> > +	int i, rc, tries =3D 0;
>=20
> +	const int max_tries =3D (OCC_BMC_TIMEOUT_S * 1000) /
> CMD_IN_PRG_INT_MS;

I expect we should just #define the expression?

> +
> > +	cmd1 =3D (seq << 24) | (type << 16) | length_be;
> > +	memcpy(&cmd2, data, length);
> > +	cmd2 <<=3D ((4 - length) * 8);
>=20
> +
> > +	/* checksum: sum of every bytes of cmd1, cmd2 */
> > +	for (i =3D 0; i < 4; i++) {
> > +		checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
>=20
> +		checksum +=3D (cmd2 >> (i * 8)) & 0xFF;

I have to apologise here, as my review was wrong: Addition is
commutative, but not when we're masking the result!=C2=A0So the original
approach is probably more correct, and it only occurred to me when
reading over this patch. Sorry! Did you get checksum errors as a
result?

> +	}
> +
> > +	cmd2 |=3D checksum << ((2 - length) * 8);
>=20
> +
> > +	/* Init OCB */
> > +	rc =3D driver->bus_ops.putscom(driver->bus,
> > OCB_STATUS_CONTROL_OR,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OCB_OR_INIT0, OCB_OR_INIT1);
> > +	if (rc)
> > +		goto err;
>=20
> +
> > +	rc =3D driver->bus_ops.putscom(driver->bus,
> > OCB_STATUS_CONTROL_AND,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OCB_AND_INIT0,
> > OCB_AND_INIT1);
> > +	if (rc)
> > +		goto err;
>=20
> +
> > +	/* Send command, 2nd half of the 64-bit addr is unused
> > (write 0) */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->config.command_addr,
> > 0);
> > +	if (rc)
> > +		goto err;
>=20
> +
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->config.command_addr,
> > 0);
> > +	if (rc)
>=20
> +		goto err;

This change highlighted to me that we're sending command_addr twice -
is this necessary?

> +
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1,
> > cmd2);
> > +	if (rc)
> > +		goto err;
>=20
> +
> > +	/* Trigger attention */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, ATTN_DATA,
> > ATTN0, ATTN1);
> > +	if (rc)
> > +		goto err;
>=20
> +
> > +	/* Get response data */
> > +	rc =3D driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0driver->config.response_addr,=20
> > 0);
> > +	if (rc)
> > +		goto err;
>=20
> +
> > +	do {
> > +		rc =3D driver->bus_ops.getscom(driver->bus,
> > OCB_DATA, resp);
> > +		if (rc)
> > +			goto err;
>=20
> +
> > +		/* retry if we get "command in progress" return
> > status */
> > +		if (resp[RESP_RETURN_STATUS] =3D=3D
> > RESP_RETURN_CMD_IN_PRG) {
> > +			set_current_state(TASK_INTERRUPTIBLE);
> > +			schedule_timeout(msecs_to_jiffies(CMD_IN_P
> > RG_INT_MS));
> > +			tries++;
> > +		} else
> > +			break;
>=20
> +	} while (tries < max_tries);

I'll bikeshed this to try save the break and a timeout, which is really
picking at the nits but reduces cyclomatic complexity and saves some
time. What do you think of:

=C2=A0=C2=A0=C2=A0=C2=A0bool retry =3D false;
=C2=A0=C2=A0=C2=A0=C2=A0int tries =3D 0;

=C2=A0=C2=A0=C2=A0=C2=A0...

=C2=A0=C2=A0=C2=A0=C2=A0do {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (retry) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set=
_current_state(TASK_INTERRUPTIBLE);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0she=
dule_timeout(msecs_to_jiffies(CMD_IN_PRG_INT_MS));
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D driver->bus_ops.gets=
com(driver->bus, OCB_DATA, resp);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0got=
o err;

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retry =3D (resp[RESP_RETURN=
_STATUS] =3D=3D RESP_RETURN_CMD_IN_PRG) && tries++ < max_tries);
=C2=A0=C2=A0=C2=A0=C2=A0} while (retry);

Are we okay with returning RESP_RETURN_CMD_IN_PRG to the caller?
Because that's what happens in either case if we exceed max_tries.

> +
> > +	return resp[RESP_RETURN_STATUS];
>=20
> +
> +err:
> > +	dev_err(driver->dev, "scom op failed rc:%d\n", rc);
> > +	return rc;
>=20
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
>=20
> +
> > +	occ_data =3D devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
> > +	if (!occ_data)
> > +		return -ENOMEM;
>=20
> +
> > +	rc =3D occ_send_cmd(driver, 0, OCC_POLL, 1, &poll_cmd_data,
> > occ_data);
> > +	if (rc) {
> > +		dev_err(dev, "OCC poll failed: 0x%x\n", rc);
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
>=20
> +
> > +	num_bytes =3D get_unaligned((u16
> > *)&occ_data[RESP_DATA_LENGTH]);
> > +	num_bytes =3D be16_to_cpu(num_bytes);
> > +	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
>=20
> +
> > +	if (num_bytes > OCC_DATA_MAX) {
> > +		dev_err(dev, "OCC data length must be < 4KB\n");
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
>=20
> +
> > +	if (num_bytes <=3D 0) {
> > +		dev_err(dev, "OCC data length is zero\n");
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
>=20
> +
> > +	/* read remaining data */
> > +	for (i =3D 8; i < num_bytes + 8; i +=3D 8) {
> > +		rc =3D driver->bus_ops.getscom(driver->bus,
> > OCB_DATA,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&occ_data[i]);
> > +		if (rc) {
> > +			dev_err(dev, "scom op failed rc:%d\n",
> > rc);
> > +			goto out;
> > +		}
> > +	}
>=20
> +
> > +	/* don't need more sanity checks; buffer is alloc'd for
> > max response
> > +	=C2=A0* size so we just check for valid data in
> > parse_occ_response
>=20
> +	=C2=A0*/

Thanks for the comment.

> +	rc =3D parse_occ_response(driver, occ_data, resp);
> +
> +out:
> > +	devm_kfree(dev, occ_data);
> > +	return rc;
>=20
> +}
> +
> +int occ_update_device(struct occ *driver)
> +{
> > +	int rc =3D 0;
>=20
> +
> > +	mutex_lock(&driver->update_lock);
>=20
> +
> > +	if (time_after(jiffies, driver->last_updated + driver-
> > >update_interval)
> > +	=C2=A0=C2=A0=C2=A0=C2=A0|| !driver->valid) {
> > +		driver->valid =3D 1;
>=20
> +
> > +		rc =3D occ_get_all(driver);
> > +		if (rc)
> > +			driver->valid =3D 0;
>=20
> +
> > +		driver->last_updated =3D jiffies;
> > +	}
>=20
> +
> > +	mutex_unlock(&driver->update_lock);
>=20
> +
> > +	return rc;
>=20
> +}
> +EXPORT_SYMBOL(occ_update_device);
> +
> +void *occ_get_sensor(struct occ *driver, int sensor_type)
> +{
> > +	int rc;
>=20
> +
> > +	/* occ_update_device locks the update lock */
> > +	rc =3D occ_update_device(driver);
> > +	if (rc !=3D 0) {
> > +		dev_err(driver->dev, "cannot get occ sensor data:
> > %d\n",
> > +			rc);
> > +		return NULL;
> > +	}
>=20
> +
> > +	return occ_get_sensor_by_type(&driver->response,
> > sensor_type);
>=20
> +}
> +EXPORT_SYMBOL(occ_get_sensor);
> +
> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum)
> +{
> > +	return occ->ops.get_sensor_value(occ, sensor_type, snum);
>=20
> +}
> +EXPORT_SYMBOL(occ_get_sensor_value);
> +
> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum)
> +{
> > +	return occ->ops.get_sensor_id(occ, sensor_type, snum);
>=20
> +}
> +EXPORT_SYMBOL(occ_get_sensor_id);
> +
> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum, int
> caps_field)
> +{
> > +	return occ->ops.get_caps_value(sensor, snum, caps_field);
>=20
> +}
> +EXPORT_SYMBOL(occ_get_caps_value);
> +
> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks
> **blocks)
> +{
> > +	*blocks =3D &occ->response.data;
>=20
> +}
> +EXPORT_SYMBOL(occ_get_response_blocks);
> +
> +void occ_set_update_interval(struct occ *occ, unsigned long
> interval)
> +{
> > +	occ->update_interval =3D msecs_to_jiffies(interval);
>=20
> +}
> +EXPORT_SYMBOL(occ_set_update_interval);
> +
> +int occ_set_user_powercap(struct occ *occ, u16 cap)
> +{
> > +	u8 resp[8];
>=20
> +
> > +	cap =3D cpu_to_be16(cap);
>=20
> +
> > +	return occ_send_cmd(occ, 0, OCC_SET_USER_POWR_CAP, 2, (u8
> > *)&cap,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0resp);
>=20
> +}
> +EXPORT_SYMBOL(occ_set_user_powercap);
> +
> +struct occ *occ_start(struct device *dev, void *bus,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_bus_ops *bus_ops, con=
st struct
> > occ_ops *ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct occ_config *config)
>=20
> +{
> > +	struct occ *driver =3D devm_kzalloc(dev, sizeof(struct occ),
> > GFP_KERNEL);
>=20
> +
> > +	if (!driver)
> > +		return ERR_PTR(-ENOMEM);
>=20
> +
> > +	driver->dev =3D dev;
> > +	driver->bus =3D bus;
> > +	driver->bus_ops =3D *bus_ops;
> > +	driver->ops =3D *ops;
> > +	driver->config =3D *config;
>=20
> +
> > +	driver->update_interval =3D HZ;
> > +	mutex_init(&driver->update_lock);
>=20
> +
> > +	return driver;
>=20
> +}
> +EXPORT_SYMBOL(occ_start);
> +
> +int occ_stop(struct occ *occ)
> +{
> > +	devm_kfree(occ->dev, occ);
>=20
> +
> > +	return 0;
>=20
> +}
> +EXPORT_SYMBOL(occ_stop);
> +
> > +MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
>=20
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
> + * This file contains data structures and function prototypes for
> common access
> + * between different bus protocols and host systems.
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License as published
> by
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
>=20
> +} __attribute__((packed, aligned(4)));
> +
> +struct sensor_data_block {
> > +	struct sensor_data_block_header header;
> > +	void *sensors;
>=20
> +};
> +
> +enum sensor_type {
> > +	FREQ =3D 0,
> > +	TEMP,
> > +	POWER,
> > +	CAPS,
> > +	MAX_OCC_SENSOR_TYPE
>=20
> +};
> +
> +struct occ_ops {
> > +	void (*parse_sensor)(u8 *data, void *sensor, int
> > sensor_type, int off,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int snum);
> > +	void *(*alloc_sensor)(int sensor_type, int num_sensors);
> > +	int (*get_sensor_value)(struct occ *driver, int
> > sensor_type, int snum);
> > +	int (*get_sensor_id)(struct occ *driver, int sensor_type,
> > int snum);
> > +	int (*get_caps_value)(void *sensor, int snum, int
> > caps_field);
>=20
> +};
> +
> +struct occ_config {
> > +	u32 command_addr;
> > +	u32 response_addr;
>=20
> +};
> +
> +struct occ_blocks {
> > +	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
> > +	struct sensor_data_block *blocks;
>=20
> +};
> +
> +struct occ *occ_start(struct device *dev, void *bus,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_bus_ops *bus_ops, con=
st struct
> > occ_ops *ops,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct occ_config *config)=
;
>=20
> +int occ_stop(struct occ *occ);
> +
> +void *occ_get_sensor(struct occ *occ, int sensor_type);
> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int
> snum);
> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum);
> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int caps_field);
>=20
> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks
> **blocks);
> +int occ_update_device(struct occ *driver);
> +void occ_set_update_interval(struct occ *occ, unsigned long
> interval);
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
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License as published
> by
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
> + * occ_bus_ops - represent the low-level transfer methods to
> communicate with
> + * the OCC.
> + *
> + * getscom - OCC scom read
> + * @bus: handle to slave device
> + * @address: address
> + * @data: where to store data read from slave; buffer size must be
> greater than
> + * or equal to offset + 8 bytes.
> + * @offset: offset into data pointer
> + *
> + * Returns 0 on success or one of -SCOM_READ_ERROR,
> -SCOM_WRITE_ERROR.

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
> > +	int (*putscom)(void *bus, u32 address, u32 data0, u32
> > data1);
>=20
> +};
> +
> +#endif /* __SCOM_H__ */

Cheers,

Andrew
--=-6KZH+rO6AdUdPAINha2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYV3jVAAoJEJ0dnzgO5LT5uCoQALhdVgfECqVhFzLgh0lclmL3
quR/JykgQW3RwIJz7zBqNZYARWX3BxIJUFqH9gnAe8wtUkBwC5AHdm98ycpwOdlx
gvG4qvPy+PaOEtlCqHws8Uh9p/T+LeSd1o10ua+Shl5hC9xvgUCXvCaAVV4Z9xoS
YhJVL+PiLYEujYm4GHePLoihr3xSC+q/4iqECJf+xKSdV32G8n0IiH5eU/RDgIn3
PA0PXPk2AByceMTuBiF0FLwf6nalGGMJWoWWwzfIgWWtECp3lZKK02yMe9lXYK1k
ZlbOLjrUvhmCcDnqZdV3NIqrt/cFWVvBmlxKj/NI/+0EGqRnUsOwtGG4c00EmvuE
tCtjN20Y9n+dCHVL19I9+RXippCUV805BAsOScnEWxi1d97e4IFCiKiuDUWGXa2V
a+cMI/sgNTJDjW33tR8jlj4/E96zSHiTEzyQ3wD5gz2dJbU86LYdXyfw2LZ17eyq
J9dBeSX53tc9aHxGynTNIxR/h/jFSJY4PfnbZ/PE3Ya/ZIhmOWwfKNw/zWr9jrPI
XkOwlWsmSJ6zrAIISRyw6IbylBSj9rDZo+Is7p1i1Jzj7rS07aRYW6F3CItFqnnu
ZfxRJHXdoYhHaYtJqPuNzKkwjxdDJSdljHbte29q3oKmg0kj2Jk7yKrgjcBQTSfD
+Y5D21DhimCbD7z137/c
=wYWz
-----END PGP SIGNATURE-----

--=-6KZH+rO6AdUdPAINha2t--
