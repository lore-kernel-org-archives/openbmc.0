Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcXLv72JYzDvxQ
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 17:03:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Egbz4wP2"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MOYZsk96"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 640FA20746;
 Mon, 12 Dec 2016 01:03:01 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 12 Dec 2016 01:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=JvrvvK3+hzZVRAwbW1wyt/ukf8k=; b=Egbz4w
 P2OzTpswbkJXNGX+vPB7fc8OFyXei/sd3dWi9sdwqPwoPpxjXhJLLcYPfmz07keF
 8zz6zQ415i38S5uGV3Nw6cKkMQBL18tXq0VSJN/Gvn/taiye3vYadwAVkGvbZHmZ
 lZa6t+NMnH47glSUg9J6Htv6/VtpjMpdYQs0E=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=JvrvvK3+hzZVRA
 wbW1wyt/ukf8k=; b=MOYZsk961rll6t+c5yyE69uh4eQumZdMlYsiznfqvVESqF
 V98n6CTY98GMc+jd9Lb7DZVBrVNl9cdlKj4F2ETjdhg4Yz8wu7oGGGP9jDRK7OLX
 3BhXWqIIyReAySVfwp/4gxqVTE+wgUjeqBEnIiCFtxtIgoYaEhkMr67cACvnQ=
X-ME-Sender: <xms:lT1OWOToXO19G3ljL9X05TEIKxDk3FAXUaTXslu41rzh4QneB4O3rg>
X-Sasl-enc: /GdlzztIHgMbcb6wTvyZ7f90GkKWbYPuz/f4OYrixyqm 1481522580
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AAC37E9FB;
 Mon, 12 Dec 2016 01:02:59 -0500 (EST)
Message-ID: <1481522572.3112.12.camel@aj.id.au>
Subject: Re: [RFC PATCH linux v6 2/9] hwmon: Add core On-Chip Controller
 support for POWER CPUs
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 12 Dec 2016 16:32:52 +1030
In-Reply-To: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
References: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nofVCtZqj01f3yfUR/az"
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
X-List-Received-Date: Mon, 12 Dec 2016 06:03:05 -0000


--=-nofVCtZqj01f3yfUR/az
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:03 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> The On-Chip Controller (OCC) exposes frequency and temperature sensor
> information along with power draw measurement and capping for POWER
> chips.=20

I know you have simply used what I wrote, but I think we need to expand
on it. Do we have more definitive documentation on the OCC that we
should link to? We should be explaining all that the OCC does in a
broad sense so upstream reviewers have an idea of what they are dealing
with.

> The information is gathered by SCOM reads and writes

Same here: What's a "SCOM"?

>  over a
> transport of choice,

What do we mean by transport? What are the choices and why pick one?

>  and structured in a flexible fashion to accomodate
> differences in sensors across designs.

What sensors are we talking about? Only those listed above? How might
they be different? What designs are we talking about and how do
different designs influence the sensors?

>=20
> Add core support for querying and parsing the data structures provided
> by the OCC via SCOMs.

Can we point to documentation for the data structures?

>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A02 +
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
=C2=A01 +
> =C2=A0drivers/hwmon/occ/Kconfig=C2=A0=C2=A0|=C2=A0=C2=A015 ++
> =C2=A0drivers/hwmon/occ/Makefile |=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/occ/occ.c=C2=A0=C2=A0=C2=A0=C2=A0| 495 ++++++++++++++=
+++++++++++++++++++++++++++++++
> =C2=A0drivers/hwmon/occ/occ.h=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A079 ++++=
++++
> =C2=A0drivers/hwmon/occ/scom.h=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A050 +++++
> =C2=A07 files changed, 643 insertions(+)
> =C2=A0create mode 100644 drivers/hwmon/occ/Kconfig
> =C2=A0create mode 100644 drivers/hwmon/occ/Makefile
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.c
> =C2=A0create mode 100644 drivers/hwmon/occ/occ.h
> =C2=A0create mode 100644 drivers/hwmon/occ/scom.h
>=20
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 367496c..f4b0180 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1226,6 +1226,8 @@ config SENSORS_NSA320
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
> index d7ccb02..f6af1a7 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> > @@ -165,6 +165,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+=3D wm831x-hwmon.o
> > =C2=A0obj-$(CONFIG_SENSORS_WM8350)	+=3D wm8350-hwmon.o
> =C2=A0
> > =C2=A0obj-$(CONFIG_PMBUS)		+=3D pmbus/
> > +obj-$(CONFIG_SENSORS_PPC_OCC)	+=3D occ/
> =C2=A0
> =C2=A0ccflags-$(CONFIG_HWMON_DEBUG_CHIP) :=3D -DDEBUG
> =C2=A0
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
> index 0000000..accfc43
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.c
> @@ -0,0 +1,495 @@
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
> +
> +#include "occ.h"
> +
> > +#define OCC_DATA_MAX	4096
> +
> +/* To generate attn to OCC */
> > +#define ATTN_DATA	0x0006B035
> +/* For BMC to read/write SRAM */
> > +#define OCB_ADDRESS		0x0006B070
> > +#define OCB_DATA		0x0006B075
> > +#define OCB_STATUS_CONTROL_AND	0x0006B072
> > +#define OCB_STATUS_CONTROL_OR	0x0006B073
> +
> > +#define RESP_DATA_LENGTH	3
> > +#define RESP_HEADER_OFFSET	5
> > +#define SENSOR_STR_OFFSET	37
> > +#define SENSOR_BLOCK_NUM_OFFSET	43
> > +#define SENSOR_BLOCK_OFFSET	45
> +
> > +#define MAX_SENSOR_ATTR_LEN	32
> +
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
> +};

It looks like we might be casting this over a byte blob we get back
from the OCC. If this is the case I think we should probably declare
this __attribute__((packed, aligned(4))) to be clear. The layout
shouldn't contain any padding, but I think we should be explicit about
it.

Even better would be to clear up any confusion here by providing some
kerneldoc for the structure.

> +
> +struct occ_response {
> > +	u8 sequence_num;
> > +	u8 cmd_type;
> > +	u8 rtn_status;
> +	u16 data_length;
>=20
I can't see the data_length member being used anywhere. Best delete it
if that is the case.

> > +	struct occ_poll_header header;
> > +	u16 chk_sum;
> > +	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
> > +	struct sensor_data_block *blocks;
> +};

I'd suggest kerneldoc here too

> +
> +struct occ {
> > +	struct device *dev;
> +
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

And here.

> +
> +static void deinit_occ_resp_buf(struct occ_response *resp)
> +{
> > +	int i;
> +
> > +	if (!resp)
> > +		return;
> +
> > +	if (!resp->blocks)
> > +		return;
> +
> > +	for (i =3D 0; i < resp->header.sensor_block_num; ++i) {
> > +		kfree(resp->blocks[i].sensors);
> > +	}
> +
> > +	kfree(resp->blocks);
> +
> > +	memset(resp, 0, sizeof(struct occ_response));
> +
> > +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; ++i)
> > +		resp->sensor_block_id[i] =3D -1;
> +}
> +
> +static void *occ_get_sensor_by_type(struct occ_response *resp,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0enum sensor_type t)
> +{
> > +	if (!resp->blocks)
> > +		return NULL;
> +
> > +	if (resp->sensor_block_id[t] =3D=3D -1)
> > +		return NULL;
> +
>=20
> +	return resp->blocks[resp->sensor_block_id[t]].sensors;
+}
> +
> +static int occ_renew_sensor(struct occ *driver, u8 sensor_length,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0u8 sensor_num, enum sensor_type t, int bloc=
k)
> +{
> > +	void *sensor;
> > +	int rc;
> > +	struct occ_response *resp =3D &driver->response;
> +
> > +	sensor =3D occ_get_sensor_by_type(resp, t);
> +
> > +	/* empty sensor block, release older sensor data */
> > +	if (sensor_num =3D=3D 0 || sensor_length =3D=3D 0) {
> > +		kfree(sensor);
> +		return -1;

What is -1 meant to signify given you're using the standard return code
(-ENOMEM) below? That is, do you want it to mean -EPERM? If not, then
how are we meant to interpret the return code? Special-case -1 and hope
permission is never a problem? Please resolve this.

Separately, Is freeing the structure reasonable behaviour for a
function named '*renew*'?=C2=A0Is this some opaque way to free the sensor?
It just strikes me as a bit odd. If it is reasonable can you please add
a comment to justify it?

> +	}
> +
> > +	if (!sensor || sensor_num !=3D
> > +	=C2=A0=C2=A0=C2=A0=C2=A0resp->blocks[resp->sensor_block_id[t]].sensor=
_num) {
> +		kfree(sensor);

The above might be relevant here too.

> +		resp->blocks[block].sensors =3D
> > +			driver->ops.alloc_sensor(t, sensor_num);
> > +		if (!resp->blocks[block].sensors) {
> > +			rc =3D -ENOMEM;
> > +			goto err;
> > +		}
> > +	}
> +
> > +	return 0;
> +err:
> > +	deinit_occ_resp_buf(resp);
> > +	return rc;
> +}
> +
> +static int parse_occ_response(struct occ *driver, u8 *data,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_response *resp)
> +{
> > +	int b;
> > +	int s;
> > +	int rc;
> +	int dnum =3D SENSOR_BLOCK_OFFSET;

What does 'dnum' mean? Can we call this something better?

> +	u8 sensor_block_num;
> > +	u8 sensor_type[4];
> > +	u8 sensor_format;
> > +	u8 sensor_length;
> > +	u8 sensor_num;
> > +	struct device *dev =3D driver->dev;
> > +	void (*parse_sensor)(u8 *data, void *sensor, int sensor_type, int off=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int snum) =3D driver->ops.parse_sensor;

This seems unfortunate.

> +
> > +	/* check if the data is valid */
> > +	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> > +		dev_dbg(dev, "ERROR: no SENSOR String in response\n");
> +		rc =3D -1;

Again, we should pick a relevant error code. Please audit the rest of
the patch for this issue; I'll refrain from commenting on every
instance.

> +		goto err;
> > +	}
> +
> > +	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> > +	if (sensor_block_num =3D=3D 0) {
> +		dev_dbg(dev, "ERROR: SENSOR block num is 0\n");

dev_dbg(dev, "ERROR: ...");

This seems like a contradiction. Why not dev_err()? Or drop the
"ERROR:"?

Secondly, this is the number of sensor blocks in the response? Maybe we
could reword this to be "Query returned no sensor blocks" for clarity.

> +		rc =3D -1;
> > +		goto err;
> > +	}
> +
> > +	/* if sensor block has changed, re-malloc */
> > +	if (sensor_block_num !=3D resp->header.sensor_block_num) {
> > +		deinit_occ_resp_buf(resp);
> +		resp->blocks =3D kcalloc(sensor_block_num,

Is there any other sanity checking that we need to apply? I guess at
least we are currently bounded at 255 * sizeof(struct
sensor_data_block).

> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sizeof(struct sensor_data_=
block),

I prefer to use the dereferenced type for sizeof() in these instances:

    sizeof(*resp->blocks)

that way if the type changes we are still consistent.

> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL);
> > +		if (!resp->blocks)
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
> > +		/* 8-byte sensor block head */
> +		strncpy(sensor_type, &data[dnum], 4);

This makes me nervous. Can we please allocate 5 elements to
sensor_type, and set the last one to '\0'?

> +		sensor_format =3D data[dnum + 5];
> > +		sensor_length =3D data[dnum + 6];
> > +		sensor_num =3D data[dnum + 7];
> +		dnum =3D dnum + 8;

Is there anything we could do to improve the above approach? Use a
packed struct definition to cast over it?

> +
> > +		dev_dbg(dev, "sensor block[%d]: type: %s, sensor_num: %d\n", b,
> > +			sensor_type, sensor_num);
> +
> +		if (strncmp(sensor_type, "FREQ", 4) =3D=3D 0) {

The above suggestion would make it easier to hand off to a static
inline handler for each of the processing bodies. I think that would
make this function easier to read - at the moment it's just a wall of
conditional text to me.

> +			rc =3D occ_renew_sensor(driver, sensor_length, sensor_num,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0FREQ, b);
> > +			if (rc)
> +				continue;

Should we use one of dev_{debug,info,warn}() here? Something went
wrong. If it was an allocation failure there's probably not much point
processing the remaining sensors.

> +
> > +			resp->sensor_block_id[FREQ] =3D b;
> > +			for (s =3D 0; s < sensor_num; s++) {
> > +				parse_sensor(data, resp->blocks[b].sensors,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0FREQ, dnum, s);
> +				dnum =3D dnum + sensor_length;
>=20

I'd rather we have separate counters that we add to access a sensor in
a block, so we have a "global" offset for blocks and a "local" offset
for sensors (inside a block). Use dnum as the global offset and have
this loop increment the sensor offset, and then after the loop
increment dnum to the start of the following block using the
accumulated sensor offset.

The comments for the "FREQ" case are largely applicable to the
remaining cases.

>=20
> +			}
> > +		} else if (strncmp(sensor_type, "TEMP", 4) =3D=3D 0) {
> > +			rc =3D occ_renew_sensor(driver, sensor_length,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sensor_num, TEMP, b);
> > +			if (rc)
> > +				continue;
> +
> > +			resp->sensor_block_id[TEMP] =3D b;
> > +			for (s =3D 0; s < sensor_num; s++) {
> > +				parse_sensor(data, resp->blocks[b].sensors,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TEMP, dnum, s);
> > +				dnum =3D dnum + sensor_length;
> > +			}
> > +		} else if (strncmp(sensor_type, "POWR", 4) =3D=3D 0) {
> > +			rc =3D occ_renew_sensor(driver, sensor_length,
> > +				sensor_num, POWER, b);
> > +			if (rc)
> > +				continue;
> +
> > +			resp->sensor_block_id[POWER] =3D b;
> > +			for (s =3D 0; s < sensor_num; s++) {
> > +				parse_sensor(data, resp->blocks[b].sensors,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0POWER, dnum, s);
> > +				dnum =3D dnum + sensor_length;
> > +			}
> > +		} else if (strncmp(sensor_type, "CAPS", 4) =3D=3D 0) {
> > +			rc =3D occ_renew_sensor(driver, sensor_length,
> > +				sensor_num, CAPS, b);
> > +			if (rc)
> > +				continue;
> +
> > +			resp->sensor_block_id[CAPS] =3D b;
> > +			for (s =3D 0; s < sensor_num; s++) {
> > +				parse_sensor(data, resp->blocks[b].sensors,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CAPS, dnum, s);
> > +				dnum =3D dnum + sensor_length;
> > +			}
> +
> > +		} else {
> > +			dev_dbg(dev, "ERROR: sensor type %s not supported\n",
> > +				resp->blocks[b].sensor_type);
> > +			rc =3D -1;
> > +			goto err;
> > +		}
> +
> > +		strncpy(resp->blocks[b].sensor_type, sensor_type, 4);
> > +		resp->blocks[b].sensor_format =3D sensor_format;
> > +		resp->blocks[b].sensor_length =3D sensor_length;
> > +		resp->blocks[b].sensor_num =3D sensor_num;
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
> > +	u16 checksum;
> > +	int i;
> +
> > +	length =3D cpu_to_le16(length);
> > +	cmd1 =3D (seq << 24) | (type << 16) | length;
> +	memcpy(&cmd2, data, length);

NAK.

You can't use length after you've forced it to a given endianness on a
CPU that can operate in both BE an LE modes.

This will work by accident, not by design.

> +	cmd2 <<=3D ((4 - length) * 8);
> +
> > +	/* checksum: sum of every bytes of cmd1, cmd2 */
> > +	checksum =3D 0;
> > +	for (i =3D 0; i < 4; i++)
> > +		checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
> > +	for (i =3D 0; i < 4; i++)
> +		checksum +=3D (cmd2 >> (i * 8)) & 0xFF;

Addition is commutative:

    for (i =3D 0; i < 4; i++) {
        checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
        checksum +=3D (cmd2 >> (i * 8)) & 0xFF;
    }

> +	cmd2 |=3D checksum << ((2 - length) * 8);
> +
> > +	/* Init OCB */
> > +	driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_OR, 0x0800000=
0,
> > +				0x00000000);
> > +	driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_AND,
> > +				0xFBFFFFFF, 0xFFFFFFFF);
> +
> > +	/* Send command */
> > +	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				driver->config.command_addr, 0x00000000);
> > +	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				driver->config.command_addr, 0x00000000);
> > +	driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1, cmd2);
> +
> > +	/* Trigger attention */
> > +	driver->bus_ops.putscom(driver->bus, ATTN_DATA, 0x01010000,
> > +				0x00000000);
> +
> > +	/* Get response data */
> > +	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
> > +				driver->config.response_addr, 0x00000000);
> +	driver->bus_ops.getscom(driver->bus, OCB_DATA, resp, 0);

I'd like some documentation for all of the magic values above.

Further, getscom() and putscom() return ints, presumable a
success/error code. None of the code above is doing any error handling.
Please fix it.

> +
> > +	/* return status */
> +	return resp[2];

Hmm, I guess it's handy to do this.

> +}
> +
> +static inline u16 get_occdata_length(u8 *data)

Looks like you've missed an underscore in the function name.

> +{
> +	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);

This looks problematic with respect to alignment. By [1] the AST2400
can handle this through an MMU trap, but by [2] this is highly
discouraged in favour of the macros in the relevant unaligned.h (e.g.
[3]).

[1] http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi0360f/=
CDFEJCBH.html
[2] https://www.kernel.org/doc/Documentation/arm/mem_alignment
[3] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/in=
clude/asm-generic/unaligned.h

> +}
> +
> +static int occ_get_all(struct occ *driver)
> +{
> > +	int i =3D 0, rc;
> > +	u8 *occ_data;
> > +	u16 num_bytes;
> > +	u8 poll_cmd_data =3D 0x10;
> > +	struct device *dev =3D driver->dev;
> > +	struct occ_response *resp =3D &driver->response;
> +
> > +	occ_data =3D devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
> > +	if (!occ_data)
> > +		return -ENOMEM;
> +
> > +	rc =3D occ_send_cmd(driver, 0, 0, 1, &poll_cmd_data, occ_data);
> > +	if (rc) {
> +		dev_err(dev, "ERROR: OCC Poll: 0x%x\n", rc);

Please don't prefix these format strings with ERROR. Audit the patch
for any instances of this issue.

> +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	num_bytes =3D get_occdata_length(occ_data);
> > +	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
> +
> > +	if (num_bytes > OCC_DATA_MAX) {
> > +		dev_dbg(dev, "ERROR: OCC data length must be < 4KB\n");
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	if (num_bytes <=3D 0) {
> > +		dev_dbg(dev, "ERROR: OCC data length is zero\n");
> > +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	/* read remaining data */
> > +	for (i =3D 8; i < num_bytes + 8; i +=3D 8)
> +		driver->bus_ops.getscom(driver->bus, OCB_DATA, occ_data, i);

This interface needs work. I'd much rather we could write:

    occ_data[i] =3D driver->bus_ops.getscom(driver->bus, OCB_DATA);

Looking at patch 4/9 I can't see any reason why we'd need such an
unusual interface.

> +

Below, parse_occ_response() doesn't have the length information for
occ_data, and at no point do we ever test that it's a relevant length
as opposed to an insane length: That is, above you test that it's less
than the maximum expected size and at least greater than zero, but
num_bytes =3D=3D 1 passes both of those cases and will cause
parse_occ_response() to do bad things in broad daylight. Please add
more sanity checking to the point where we at least validate that
parse_occ_response()'s actions aren't going to access invalid memory.

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
> > +	rc =3D occ_update_device(driver);
> > +	if (rc !=3D 0) {
> > +		dev_dbg(driver->dev, "ERROR: cannot get occ sensor data: %d\n",
> > +			rc);
> > +		return NULL;
> > +	}
> +
> +	return occ_get_sensor_by_type(&driver->response, sensor_type);

Don't we need to take update_lock before doing this to prevent
concurrent updates?

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
> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks *blocks)
> +{
> > +	blocks->sensor_block_id =3D occ->response.sensor_block_id;
> > +	blocks->blocks =3D occ->response.blocks;
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
> > +	cap =3D cpu_to_le16(cap);
> +
> > +	return occ_send_cmd(occ, 0, 0x22, 2, (u8 *)&cap, resp);
> +}
> +EXPORT_SYMBOL(occ_set_user_powercap);
> +
> +struct occ *occ_start(struct device *dev, void *bus, struct occ_bus_ops =
bus_ops,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct occ_ops ops, struct occ_conf=
ig config)

Why are we copying the structs rather than taking pointers?

> +{
> > +	struct occ *driver =3D devm_kzalloc(dev, sizeof(struct occ), GFP_KERN=
EL);
> > +	if (!driver)
> > +		return ERR_PTR(-ENOMEM);
> +
> > +	driver->dev =3D dev;
> > +	driver->bus =3D bus;
> > +	driver->bus_ops =3D bus_ops;
> > +	driver->ops =3D ops;
> > +	driver->config =3D config;
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
> index 0000000..758d011
> --- /dev/null
> +++ b/drivers/hwmon/occ/occ.h
> @@ -0,0 +1,79 @@
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
> +struct occ_driver;
> +
> +struct sensor_data_block {
> > +	u8 sensor_type[4];
> > +	u8 reserved0;
> > +	u8 sensor_format;
> > +	u8 sensor_length;
> > +	u8 sensor_num;
> > +	void *sensors;
> +};

Do we need the reserved0 member?

> +
> +enum sensor_type {
> > +	FREQ =3D 0,
> > +	TEMP,
> > +	POWER,
> > +	CAPS,
> > +	MAX_OCC_SENSOR_TYPE
> +};
> +
> +struct occ;
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
> > +	int *sensor_block_id;
> > +	struct sensor_data_block *blocks;
> +};
> +
> +struct occ *occ_start(struct device *dev, void *bus, struct occ_bus_ops =
bus_ops,
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct occ_ops ops, const s=
truct occ_config config);
> +int occ_stop(struct occ *occ);
> +
> +void *occ_get_sensor(struct occ *occ, int sensor_type);
> +int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum);
> +int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum);
> +int occ_get_caps_value(struct occ *occ, void *sensor, int snum, int caps=
_field);
> +void occ_get_response_blocks(struct occ *occ, struct occ_blocks *blocks)=
;
> +int occ_update_device(struct occ *driver);
> +void occ_set_update_interval(struct occ *occ, unsigned long interval);
> +int occ_set_user_powercap(struct occ *occ, u16 cap);=C2=A0
> +
> +#endif /* __OCC_H__ */
> diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
> new file mode 100644
> index 0000000..ae5ed0a
> --- /dev/null
> +++ b/drivers/hwmon/occ/scom.h
> @@ -0,0 +1,50 @@
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
> > +#define SCOM_READ_ERROR		1
> > +#define SCOM_WRITE_ERROR	2
> +/*
> + * occ_bus_ops - represent the low-level transfer methods to communicate=
 with
> + * the OCC.
> +*
> + * getscom - OCC scom read
> + * @bus: handle to slave device
> + * @address: address
> + * @data: where to store data read from slave; buffer size must be great=
er than
> + * or equal to offset + 8 bytes.
> + * @offset: offset into data pointer
> + *
> + * Returns 0 on success or one of -SCOM_READ_ERROR, -SCOM_WRITE_ERROR.
> + *
> + * putscom - OCC scom write
> + * @bus: handle to slave device
> + * @address: address
> + * @data0: first data byte to write
> + * @data1: second data byte to write
> + *
> + * Returns 0 on success or -SCOM_WRITE_ERROR on error
> + */
> +struct occ_bus_ops {
> > +	int (*getscom)(void *bus, u32 address, u8 *data, size_t offset);
> > +	int (*putscom)(void *bus, u32 address, u32 data0, u32 data1);
> +};
> +
> +#endif /* __SCOM_H__ */

Andrew
--=-nofVCtZqj01f3yfUR/az
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYTj2NAAoJEJ0dnzgO5LT525sP/1KLawrw97P5sUAo8eho5266
K6rHuxni6Bi78eR+lXeeH1pp5QKXrx81RFEsSoZ/U/PttfeRKFe0k8K9JMqP8+LU
8aG2pzK9mNtPBiApYSdn3TkIAZsiqiIEGGfqj4T/FCitadt7f2omq2fk9T2Tv6o4
g3FnUrO84RFwBnDSXbOKA3w/JdVbVQOFdlYq4JwZUrwEgMnOOMx0vkxnYKUDW1i4
ChL36Wa90aOQgKsTWEKF95qnjlQVn35ZrdQoEjSGnxCgoOVzd25OSeDVL/GYZ8ms
RDddzB1j7107SK6pbv3vl2AcfnRLouY+XuycLfjZEAGHYtIYAEtHgol4bn8JrTsd
hmkvXMppdgXH8qC0WBpkeFLPf2R9bp9LTtE0+kf77Va9NOO+Nsp9CDbsC5MYOlM5
zuM5idfYx8WFNE6l855GXOBoy5rreqQ9Usib6IwfzdZfHgPNknNuQaC08ikI2tYp
FwbSiFMMg168pMYVl1vi2ae4DE0tS82bWukvl4HeidQLoticIVmdu8NL22TnPE8d
KUgLG2SEHYa0ElZ1NBUNfJFMsf+HF0GOVM3FZF870DPdyUY2UhWNpaq0rwTZcJf1
yRax6QwWON+Bql6L2C+wKnH2XyMx8y+aQPKEZevXthDSp3ffRDjfkbkYU9Du6+ea
vVOs0071qJwASh6/7IMJ
=uJ0O
-----END PGP SIGNATURE-----

--=-nofVCtZqj01f3yfUR/az--
