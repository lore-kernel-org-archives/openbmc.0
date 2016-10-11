Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stKhc2mJJzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 12:50:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Zmzv6gz1; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=IcSdA81n; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C10920982;
 Mon, 10 Oct 2016 21:50:54 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 10 Oct 2016 21:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=i0scI
 Gi1/gDH7fWLzjVP7/8X1Dg=; b=Zmzv6gz1l9nkYMcGgxU1C4fb1JB5/Ewm7sdaM
 64ALg7UUNTPjLuyulcAhLfGeu9R8idHOvzlzOH2eR5FuAh5HUbts7MK/m5KdteU0
 7NXN4SRGvJwhDGg5CFum6ZjxMzDmlZjbbmAllHEl2ttR0yiAcF97qOJNFSESzJto
 /wZm9w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=i0scIGi1/gDH7fWLzjVP7/8X1Dg=; b=IcSdA
 81nQ6b8jU47jdAySvlagMxlbpTmmIVJtRPk7EA7dDbKcZwk5XddIO8FdbuIYX17B
 bQE12lZ3wF6mB3MfChzVTMvOqwxfgDflknFfXjB54z2lLKfRi6WIl2FRqZdSmUaA
 70z6spTOWExepGudLtX0yvgqh4wfKhVQ05Lpvw=
X-Sasl-enc: K5UYRHyPykr2QPX0qQdCIstIX6ucHuZrE0RqhBxFLr3A 1476150652
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D610CCC08B;
 Mon, 10 Oct 2016 21:50:51 -0400 (EDT)
Message-ID: <1476150635.16733.64.camel@aj.id.au>
Subject: Re: [RFC linux v1 1/2] drivers: move OCC hwmon driver to occ directory
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 11 Oct 2016 12:20:35 +1030
In-Reply-To: <1476126400-17955-1-git-send-email-eajames.ibm@gmail.com>
References: <1476126400-17955-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-eVCSNS1jBxHPObVfCPZV"
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
X-List-Received-Date: Tue, 11 Oct 2016 01:50:57 -0000


--=-eVCSNS1jBxHPObVfCPZV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

On Mon, 2016-10-10 at 14:06 -0500, eajames.ibm@gmail.com wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=20

This needs more of a commit message. You have put some notes in your
cover letter - you should move them here. It's fine for the cover
letter to just have the summary of the patches.

> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/power8_occ.c | 1254 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A0drivers/hwmon/power8_occ_i2c.c | 1254 -----------------------------=
-----------
> =C2=A02 files changed, 1254 insertions(+), 1254 deletions(-)
> =C2=A0create mode 100644 drivers/hwmon/occ/power8_occ.c
> =C2=A0delete mode 100644 drivers/hwmon/power8_occ_i2c.c

This patch isn't touching drivers/hwmon/Kconfig so the build system
still expects power8_occ_i2c.c to be under drivers/hwmon. As such this
patch breaks the build (and thus bisection). Your following patch
addresses this, but please fix the Kconfig for the rename in this
patch.

Also, this appears to be a straight rename but it's not obvious from
only the patch statistics. If you're generating the series with `git
format-patch`, you can use the -M switch to generate patches that are
explicit about the rename:

    ...
    diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/occ/power8_=
occ.c
    similarity index 100%
    rename from drivers/hwmon/power8_occ_i2c.c
    rename to drivers/hwmon/occ/power8_occ.c
    ...

Cheers,

Andrew

>=20
> diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_oc=
c.c
> new file mode 100644
> index 0000000..6de0e76
> --- /dev/null
> +++ b/drivers/hwmon/occ/power8_occ.c
> @@ -0,0 +1,1254 @@
> +/*
> + * OCC HWMON driver - read IBM Power8 On Chip Controller sensor data via
> + * i2c.
> + *
> + * Copyright 2015 IBM Corp.
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
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +#include=20
> +
> +#define OCC_I2C_ADDR 0x50
> +#define OCC_I2C_NAME "occ-i2c"
> +
> +#define OCC_DATA_MAX	4096 /* 4KB at most */
> +/* i2c read and write occ sensors */
> +#define I2C_READ_ERROR	1
> +#define I2C_WRITE_ERROR	2
> +
> +/* Defined in POWER8 Processor Registers Specification */
> +/* To generate attn to OCC */
> +#define ATTN_DATA	0x0006B035
> +/* For BMC to read/write SRAM */
> +#define OCB_ADDRESS		0x0006B070
> +#define OCB_DATA		0x0006B075
> +#define OCB_STATUS_CONTROL_AND	0x0006B072
> +#define OCB_STATUS_CONTROL_OR	0x0006B073
> +/* See definition in:
> + * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Int=
erfaces.pdf
> + */
> +#define OCC_COMMAND_ADDR	0xFFFF6000
> +#define OCC_RESPONSE_ADDR	0xFFFF7000
> +
> +#define MAX_SENSOR_ATTR_LEN	32
> +
> +enum sensor_t {
> +	freq,
> +	temp,
> +	power,
> +	caps,
> +	MAX_OCC_SENSOR_TYPE
> +};
> +
> +/* OCC sensor data format */
> +struct occ_sensor {
> +	uint16_t sensor_id;
> +	uint16_t value;
> +};
> +
> +struct power_sensor {
> +	uint16_t sensor_id;
> +	uint32_t update_tag;
> +	uint32_t accumulator;
> +	uint16_t value;
> +};
> +
> +struct caps_sensor {
> +	uint16_t curr_powercap;
> +	uint16_t curr_powerreading;
> +	uint16_t norm_powercap;
> +	uint16_t max_powercap;
> +	uint16_t min_powercap;
> +	uint16_t user_powerlimit;
> +};
> +
> +struct sensor_data_block {
> +	uint8_t sensor_type[4];
> +	uint8_t reserved0;
> +	uint8_t sensor_format;
> +	uint8_t sensor_length;
> +	uint8_t sensor_num;
> +	struct occ_sensor *sensor;
> +	struct power_sensor *power;
> +	struct caps_sensor *caps;
> +};
> +
> +struct occ_poll_header {
> +	uint8_t status;
> +	uint8_t ext_status;
> +	uint8_t occs_present;
> +	uint8_t config;
> +	uint8_t occ_state;
> +	uint8_t reserved0;
> +	uint8_t reserved1;
> +	uint8_t error_log_id;
> +	uint32_t error_log_addr_start;
> +	uint16_t error_log_length;
> +	uint8_t reserved2;
> +	uint8_t reserved3;
> +	uint8_t occ_code_level[16];
> +	uint8_t sensor_eye_catcher[6];
> +	uint8_t sensor_block_num;
> +	uint8_t sensor_data_version;
> +};
> +
> +struct occ_response {
> +	uint8_t sequence_num;
> +	uint8_t cmd_type;
> +	uint8_t rtn_status;
> +	uint16_t data_length;
> +	struct occ_poll_header header;
> +	struct sensor_data_block *blocks;
> +	uint16_t chk_sum;
> +	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
> +};
> +
> +struct sensor_attr_data {
> +	enum sensor_t type;
> +	uint32_t hwmon_index;
> +	uint32_t attr_id;
> +	char name[MAX_SENSOR_ATTR_LEN];
> +	struct device_attribute dev_attr;
> +};
> +
> +struct sensor_group {
> +	char *name;
> +	struct sensor_attr_data *sattr;
> +	struct attribute_group group;
> +};
> +
> +/* data private to each client */
> +struct occ_drv_data {
> +	struct i2c_client	*client;
> +	struct device		*hwmon_dev;
> +	struct mutex		update_lock;
> +	bool			valid;
> +	unsigned long		last_updated;
> +	/* Minimum timer interval for sampling In jiffies */
> +	unsigned long		update_interval;
> +	unsigned long		occ_online;
> +	uint16_t		user_powercap;
> +	struct occ_response	occ_resp;
> +	struct sensor_group	sensor_groups[MAX_OCC_SENSOR_TYPE];
> +};
> +
> +static void deinit_occ_resp_buf(struct occ_response *p)
> +{
> +	int i;
> +
> +	if (!p)
> +		return;
> +
> +	if (!p->blocks)
> +		return;
> +
> +	for (i =3D 0; i < p->header.sensor_block_num; i++) {
> +		kfree(p->blocks[i].sensor);
> +		kfree(p->blocks[i].power);
> +		kfree(p->blocks[i].caps);
> +	}
> +
> +	kfree(p->blocks);
> +
> +	memset(p, 0, sizeof(*p));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(p->sensor_block_id); i++)
> +		p->sensor_block_id[i] =3D -1;
> +}
> +
> +static ssize_t occ_i2c_read(struct i2c_client *client, void *buf, size_t=
 count)
> +{
> +	WARN_ON(count > OCC_DATA_MAX);
> +
> +	dev_dbg(&client->dev, "i2c_read: reading %zu bytes @0x%x.\n",
> +		count, client->addr);
> +	return i2c_master_recv(client, buf, count);
> +}
> +
> +static ssize_t occ_i2c_write(struct i2c_client *client, const void *buf,
> +				size_t count)
> +{
> +	WARN_ON(count > OCC_DATA_MAX);
> +
> +	dev_dbg(&client->dev, "i2c_write: writing %zu bytes @0x%x.\n",
> +		count, client->addr);
> +	return i2c_master_send(client, buf, count);
> +}
> +
> +/* read 8-byte value and put into data[offset] */
> +static int occ_getscomb(struct i2c_client *client, uint32_t address,
> +		uint8_t *data, int offset)
> +{
> +	uint32_t ret;
> +	char buf[8];
> +	int i;
> +
> +	/* P8 i2c slave requires address to be shifted by 1 */
> +	address =3D address << 1;
> +
> +	ret =3D occ_i2c_write(client, &address,
> +		sizeof(address));
> +
> +	if (ret !=3D sizeof(address))
> +		return -I2C_WRITE_ERROR;
> +
> +	ret =3D occ_i2c_read(client, buf, sizeof(buf));
> +	if (ret !=3D sizeof(buf))
> +		return -I2C_READ_ERROR;
> +
> +	for (i =3D 0; i < 8; i++)
> +		data[offset + i] =3D buf[7 - i];
> +
> +	return 0;
> +}
> +
> +static int occ_putscom(struct i2c_client *client, uint32_t address,
> +		uint32_t data0, uint32_t data1)
> +{
> +	uint32_t buf[3];
> +	uint32_t ret;
> +
> +	/* P8 i2c slave requires address to be shifted by 1 */
> +	address =3D address << 1;
> +
> +	buf[0] =3D address;
> +	buf[1] =3D data1;
> +	buf[2] =3D data0;
> +
> +	ret =3D occ_i2c_write(client, buf, sizeof(buf));
> +	if (ret !=3D sizeof(buf))
> +		return I2C_WRITE_ERROR;
> +
> +	return 0;
> +}
> +
> +static void *occ_get_sensor_by_type(struct occ_response *resp, enum sens=
or_t t)
> +{
> +	void *sensor;
> +
> +	if (!resp->blocks)
> +		return NULL;
> +
> +	if (resp->sensor_block_id[t] =3D=3D -1)
> +		return NULL;
> +
> +	switch (t) {
> +	case temp:
> +	case freq:
> +		sensor =3D resp->blocks[resp->sensor_block_id[t]].sensor;
> +		break;
> +	case power:
> +		sensor =3D resp->blocks[resp->sensor_block_id[t]].power;
> +		break;
> +	case caps:
> +		sensor =3D resp->blocks[resp->sensor_block_id[t]].caps;
> +		break;
> +	default:
> +		sensor =3D NULL;
> +	}
> +
> +	return sensor;
> +}
> +
> +static int occ_renew_sensor(struct occ_response *resp, uint8_t sensor_le=
ngth,
> +	uint8_t sensor_num, enum sensor_t t, int block)
> +{
> +	void *sensor;
> +	int ret;
> +
> +	sensor =3D occ_get_sensor_by_type(resp, t);
> +
> +	/* empty sensor block, release older sensor data */
> +	if (sensor_num =3D=3D 0 || sensor_length =3D=3D 0) {
> +		kfree(sensor);
> +		return -1;
> +	}
> +
> +	if (!sensor || sensor_num !=3D
> +			resp->blocks[resp->sensor_block_id[t]].sensor_num) {
> +		kfree(sensor);
> +		switch (t) {
> +		case temp:
> +		case freq:
> +			resp->blocks[block].sensor =3D
> +				kcalloc(sensor_num,
> +					sizeof(struct occ_sensor), GFP_KERNEL);
> +			if (!resp->blocks[block].sensor) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +			break;
> +		case power:
> +			resp->blocks[block].power =3D
> +				kcalloc(sensor_num,
> +					sizeof(struct power_sensor),
> +					GFP_KERNEL);
> +			if (!resp->blocks[block].power) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +			break;
> +		case caps:
> +			resp->blocks[block].caps =3D
> +				kcalloc(sensor_num,
> +					sizeof(struct caps_sensor), GFP_KERNEL);
> +			if (!resp->blocks[block].caps) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +			break;
> +		default:
> +			ret =3D -ENOMEM;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +err:
> +	deinit_occ_resp_buf(resp);
> +	return ret;
> +}
> +
> +#define RESP_DATA_LENGTH	3
> +#define RESP_HEADER_OFFSET	5
> +#define SENSOR_STR_OFFSET	37
> +#define SENSOR_BLOCK_NUM_OFFSET	43
> +#define SENSOR_BLOCK_OFFSET	45
> +
> +static inline uint16_t get_occdata_length(uint8_t *data)
> +{
> +	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
> +}
> +
> +static int parse_occ_response(struct i2c_client *client,
> +		uint8_t *data, struct occ_response *resp)
> +{
> +	int b;
> +	int s;
> +	int ret;
> +	int dnum =3D SENSOR_BLOCK_OFFSET;
> +	struct occ_sensor *f_sensor;
> +	struct occ_sensor *t_sensor;
> +	struct power_sensor *p_sensor;
> +	struct caps_sensor *c_sensor;
> +	uint8_t sensor_block_num;
> +	uint8_t sensor_type[4];
> +	uint8_t sensor_format;
> +	uint8_t sensor_length;
> +	uint8_t sensor_num;
> +
> +	/* check if the data is valid */
> +	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> +		dev_dbg(&client->dev,
> +			"ERROR: no SENSOR String in response\n");
> +		ret =3D -1;
> +		goto err;
> +	}
> +
> +	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> +	if (sensor_block_num =3D=3D 0) {
> +		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
> +		ret =3D -1;
> +		goto err;
> +	}
> +
> +	/* if sensor block has changed, re-malloc */
> +	if (sensor_block_num !=3D resp->header.sensor_block_num) {
> +		deinit_occ_resp_buf(resp);
> +		resp->blocks =3D kcalloc(sensor_block_num,
> +			sizeof(struct sensor_data_block), GFP_KERNEL);
> +		if (!resp->blocks)
> +			return -ENOMEM;
> +	}
> +
> +	memcpy(&resp->header, &data[RESP_HEADER_OFFSET], sizeof(resp->header));
> +	resp->header.error_log_addr_start =3D
> +		be32_to_cpu(resp->header.error_log_addr_start);
> +	resp->header.error_log_length =3D
> +		be16_to_cpu(resp->header.error_log_length);
> +
> +	dev_dbg(&client->dev, "Reading %d sensor blocks\n",
> +		resp->header.sensor_block_num);
> +	for (b =3D 0; b < sensor_block_num; b++) {
> +		/* 8-byte sensor block head */
> +		strncpy(sensor_type, &data[dnum], 4);
> +		sensor_format =3D data[dnum+5];
> +		sensor_length =3D data[dnum+6];
> +		sensor_num =3D data[dnum+7];
> +		dnum =3D dnum + 8;
> +
> +		dev_dbg(&client->dev,
> +			"sensor block[%d]: type: %s, sensor_num: %d\n",
> +			b, sensor_type, sensor_num);
> +
> +		if (strncmp(sensor_type, "FREQ", 4) =3D=3D 0) {
> +			ret =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, freq, b);
> +			if (ret)
> +				continue;
> +
> +			resp->sensor_block_id[freq] =3D b;
> +			for (s =3D 0; s < sensor_num; s++) {
> +				f_sensor =3D &resp->blocks[b].sensor[s];
> +				f_sensor->sensor_id =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
> +				f_sensor->value =3D be16_to_cpup((const __be16 *)
> +							&data[dnum+2]);
> +				dev_dbg(&client->dev,
> +					"sensor[%d]-[%d]: id: %u, value: %u\n",
> +					b, s, f_sensor->sensor_id,
> +					f_sensor->value);
> +				dnum =3D dnum + sensor_length;
> +			}
> +		} else if (strncmp(sensor_type, "TEMP", 4) =3D=3D 0) {
> +			ret =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, temp, b);
> +			if (ret)
> +				continue;
> +
> +			resp->sensor_block_id[temp] =3D b;
> +			for (s =3D 0; s < sensor_num; s++) {
> +				t_sensor =3D &resp->blocks[b].sensor[s];
> +				t_sensor->sensor_id =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
> +				t_sensor->value =3D be16_to_cpup((const __be16 *)
> +							&data[dnum+2]);
> +				dev_dbg(&client->dev,
> +					"sensor[%d]-[%d]: id: %u, value: %u\n",
> +					b, s, t_sensor->sensor_id,
> +					t_sensor->value);
> +				dnum =3D dnum + sensor_length;
> +			}
> +		} else if (strncmp(sensor_type, "POWR", 4) =3D=3D 0) {
> +			ret =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, power, b);
> +			if (ret)
> +				continue;
> +
> +			resp->sensor_block_id[power] =3D b;
> +			for (s =3D 0; s < sensor_num; s++) {
> +				p_sensor =3D &resp->blocks[b].power[s];
> +				p_sensor->sensor_id =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
> +				p_sensor->update_tag =3D
> +					be32_to_cpup((const __be32 *)
> +							&data[dnum+2]);
> +				p_sensor->accumulator =3D
> +					be32_to_cpup((const __be32 *)
> +							&data[dnum+6]);
> +				p_sensor->value =3D be16_to_cpup((const __be16 *)
> +							&data[dnum+10]);
> +
> +				dev_dbg(&client->dev,
> +					"sensor[%d]-[%d]: id: %u, value: %u\n",
> +					b, s, p_sensor->sensor_id,
> +					p_sensor->value);
> +
> +				dnum =3D dnum + sensor_length;
> +			}
> +		} else if (strncmp(sensor_type, "CAPS", 4) =3D=3D 0) {
> +			ret =3D occ_renew_sensor(resp, sensor_length,
> +				sensor_num, caps, b);
> +			if (ret)
> +				continue;
> +
> +			resp->sensor_block_id[caps] =3D b;
> +			for (s =3D 0; s < sensor_num; s++) {
> +				c_sensor =3D &resp->blocks[b].caps[s];
> +				c_sensor->curr_powercap =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
> +				c_sensor->curr_powerreading =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+2]);
> +				c_sensor->norm_powercap =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+4]);
> +				c_sensor->max_powercap =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+6]);
> +				c_sensor->min_powercap =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+8]);
> +				c_sensor->user_powerlimit =3D
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+10]);
> +
> +				dnum =3D dnum + sensor_length;
> +				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
> +				dev_dbg(&client->dev, "curr_powercap is %x\n",
> +					c_sensor->curr_powercap);
> +				dev_dbg(&client->dev,
> +					"curr_powerreading is %x\n",
> +					c_sensor->curr_powerreading);
> +				dev_dbg(&client->dev, "norm_powercap is %x\n",
> +					c_sensor->norm_powercap);
> +				dev_dbg(&client->dev, "max_powercap is %x\n",
> +					c_sensor->max_powercap);
> +				dev_dbg(&client->dev, "min_powercap is %x\n",
> +					c_sensor->min_powercap);
> +				dev_dbg(&client->dev, "user_powerlimit is %x\n",
> +					c_sensor->user_powerlimit);
> +			}
> +
> +		} else {
> +			dev_dbg(&client->dev,
> +				"ERROR: sensor type %s not supported\n",
> +				resp->blocks[b].sensor_type);
> +			ret =3D -1;
> +			goto err;
> +		}
> +
> +		strncpy(resp->blocks[b].sensor_type, sensor_type, 4);
> +		resp->blocks[b].sensor_format =3D sensor_format;
> +		resp->blocks[b].sensor_length =3D sensor_length;
> +		resp->blocks[b].sensor_num =3D sensor_num;
> +	}
> +
> +	return 0;
> +err:
> +	deinit_occ_resp_buf(resp);
> +	return ret;
> +}
> +
> +
> +/* Refer to OCC interface document for OCC command format
> + * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Int=
erfaces.pdf
> + */
> +static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
> +		uint8_t type, uint16_t length, uint8_t *data, uint8_t *resp)
> +{
> +	uint32_t cmd1, cmd2;
> +	uint16_t checksum;
> +	int i;
> +
> +	length =3D cpu_to_le16(length);
> +	cmd1 =3D (seq << 24) | (type << 16) | length;
> +	memcpy(&cmd2, data, length);
> +	cmd2 <<=3D ((4 - length) * 8);
> +
> +	/* checksum: sum of every bytes of cmd1, cmd2 */
> +	checksum =3D 0;
> +	for (i =3D 0; i < 4; i++)
> +		checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
> +	for (i =3D 0; i < 4; i++)
> +		checksum +=3D (cmd2 >> (i * 8)) & 0xFF;
> +	cmd2 |=3D checksum << ((2 - length) * 8);
> +
> +	/* Init OCB */
> +	occ_putscom(client, OCB_STATUS_CONTROL_OR,=C2=A0=C2=A00x08000000, 0x000=
00000);
> +	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
> +
> +	/* Send command */
> +	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> +	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> +	occ_putscom(client, OCB_DATA, cmd1, cmd2);
> +
> +	/* Trigger attention */
> +	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
> +
> +	/* Get response data */
> +	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
> +	occ_getscomb(client, OCB_DATA, resp, 0);
> +
> +	/* return status */
> +	return resp[2];
> +}
> +
> +static int occ_get_all(struct i2c_client *client, struct occ_response *o=
cc_resp)
> +{
> +	uint8_t *occ_data;
> +	uint16_t num_bytes;
> +	int i;
> +	int ret;
> +	uint8_t poll_cmd_data;
> +
> +	poll_cmd_data =3D 0x10;
> +
> +	/*
> +	=C2=A0* TODO: fetch header, and then allocate the rest of the buffer ba=
sed
> +	=C2=A0* on the header size. Assuming the OCC has a fixed sized header
> +	=C2=A0*/
> +	occ_data =3D devm_kzalloc(&client->dev, OCC_DATA_MAX, GFP_KERNEL);
> +
> +	ret =3D occ_send_cmd(client, 0, 0, 1, &poll_cmd_data, occ_data);
> +	if (ret) {
> +		dev_err(&client->dev, "ERROR: OCC Poll: 0x%x\n", ret);
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	num_bytes =3D get_occdata_length(occ_data);
> +
> +	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
> +
> +	if (num_bytes > OCC_DATA_MAX) {
> +		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	if (num_bytes <=3D 0) {
> +		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	/* read remaining data */
> +	for (i =3D 8; i < num_bytes + 8; i =3D i + 8)
> +		occ_getscomb(client, OCB_DATA, occ_data, i);
> +
> +	ret =3D parse_occ_response(client, occ_data, occ_resp);
> +
> +out:
> +	devm_kfree(&client->dev, occ_data);
> +	return ret;
> +}
> +
> +
> +static int occ_update_device(struct device *dev)
> +{
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	int ret =3D 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + data->update_interval)
> +	=C2=A0=C2=A0=C2=A0=C2=A0|| !data->valid) {
> +		data->valid =3D 1;
> +		ret =3D occ_get_all(client, &data->occ_resp);
> +		if (ret)
> +			data->valid =3D 0;
> +		data->last_updated =3D jiffies;
> +	}
> +	mutex_unlock(&data->update_lock);
> +
> +	return ret;
> +}
> +
> +
> +static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
> +{
> +	struct device *dev =3D hwmon_dev->parent;
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D occ_update_device(dev);
> +	if (ret !=3D 0) {
> +		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> +		return NULL;
> +	}
> +
> +	return occ_get_sensor_by_type(&data->occ_resp, t);
> +}
> +
> +static int occ_get_sensor_value(struct device *hwmon_dev, enum sensor_t =
t,
> +					int index)
> +{
> +	void *sensor;
> +
> +	if (t =3D=3D caps)
> +		return -1;
> +
> +	sensor =3D occ_get_sensor(hwmon_dev, t);
> +
> +	if (!sensor)
> +		return -1;
> +
> +	if (t =3D=3D power)
> +		return ((struct power_sensor *)sensor)[index].value;
> +
> +	return ((struct occ_sensor *)sensor)[index].value;
> +}
> +
> +static int occ_get_sensor_id(struct device *hwmon_dev, enum sensor_t t,
> +					int index)
> +{
> +	void *sensor;
> +
> +	if (t =3D=3D caps)
> +		return -1;
> +
> +	sensor =3D occ_get_sensor(hwmon_dev, t);
> +
> +	if (!sensor)
> +		return -1;
> +
> +	if (t =3D=3D power)
> +		return ((struct power_sensor *)sensor)[index].sensor_id;
> +
> +	return ((struct occ_sensor *)sensor)[index].sensor_id;
> +}
> +
> +/* sysfs attributes for occ hwmon device */
> +
> +static ssize_t show_input(struct device *hwmon_dev,
> +				struct device_attribute *da, char *buf)
> +{
> +	struct sensor_attr_data *sdata =3D container_of(da,
> +					struct sensor_attr_data, dev_attr);
> +	int val;
> +
> +	val =3D occ_get_sensor_value(hwmon_dev, sdata->type,
> +					sdata->hwmon_index - 1);
> +	if (sdata->type =3D=3D temp)
> +		/* in millidegree Celsius */
> +		val *=3D 1000;
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +}
> +
> +static ssize_t show_label(struct device *hwmon_dev,
> +			struct device_attribute *da, char *buf)
> +{
> +	struct sensor_attr_data *sdata =3D container_of(da,
> +					struct sensor_attr_data, dev_attr);
> +	int val;
> +
> +	val =3D occ_get_sensor_id(hwmon_dev, sdata->type,
> +					sdata->hwmon_index - 1);
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +}
> +
> +static ssize_t show_caps(struct device *hwmon_dev,
> +		struct device_attribute *da, char *buf)
> +{
> +	struct sensor_attr_data *sdata =3D container_of(da,
> +					struct sensor_attr_data, dev_attr);
> +	int nr =3D sdata->attr_id;
> +	int n =3D sdata->hwmon_index - 1;
> +	struct caps_sensor *sensor;
> +	int val;
> +
> +	sensor =3D occ_get_sensor(hwmon_dev, caps);
> +	if (!sensor) {
> +		val =3D -1;
> +		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +	}
> +
> +	switch (nr) {
> +	case 0:
> +		val =3D sensor[n].curr_powercap;
> +		break;
> +	case 1:
> +		val =3D sensor[n].curr_powerreading;
> +		break;
> +	case 2:
> +		val =3D sensor[n].norm_powercap;
> +		break;
> +	case 3:
> +		val =3D sensor[n].max_powercap;
> +		break;
> +	case 4:
> +		val =3D sensor[n].min_powercap;
> +		break;
> +	case 5:
> +		val =3D sensor[n].user_powerlimit;
> +		break;
> +	default:
> +		val =3D -1;
> +	}
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> +}
> +
> +static ssize_t show_update_interval(struct device *hwmon_dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct device *dev =3D hwmon_dev->parent;
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
> +		jiffies_to_msecs(data->update_interval));
> +}
> +
> +static ssize_t set_update_interval(struct device *hwmon_dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct device *dev =3D hwmon_dev->parent;
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	unsigned long val;
> +	int err;
> +
> +	err =3D kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	data->update_interval =3D msecs_to_jiffies(val);
> +	return count;
> +}
> +static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
> +		show_update_interval, set_update_interval);
> +
> +static ssize_t show_name(struct device *hwmon_dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	return snprintf(buf, PAGE_SIZE - 1, "%s\n", OCC_I2C_NAME);
> +}
> +static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
> +
> +static ssize_t show_user_powercap(struct device *hwmon_dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct device *dev =3D hwmon_dev->parent;
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%u\n", data->user_powercap);
> +}
> +
> +
> +static ssize_t set_user_powercap(struct device *hwmon_dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct device *dev =3D hwmon_dev->parent;
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	uint16_t val;
> +	uint8_t resp[8];
> +	int err;
> +
> +	err =3D kstrtou16(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	dev_dbg(dev, "set user powercap to: %u\n", val);
> +	val =3D cpu_to_le16(val);
> +	err =3D occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
> +	if (err !=3D 0) {
> +		dev_dbg(dev,
> +			"ERROR: Set User Powercap: wrong return status: %x\n",
> +			err);
> +		if (err =3D=3D 0x13)
> +			dev_info(dev,
> +				"ERROR: set invalid powercap value: %x\n", val);
> +		return -EINVAL;
> +	}
> +	data->user_powercap =3D val;
> +	return count;
> +}
> +static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO,
> +		show_user_powercap, set_user_powercap);
> +
> +static void deinit_sensor_groups(struct device *hwmon_dev,
> +					struct sensor_group *sensor_groups)
> +{
> +	int cnt;
> +
> +	for (cnt =3D 0; cnt < MAX_OCC_SENSOR_TYPE; cnt++) {
> +		if (sensor_groups[cnt].group.attrs)
> +			devm_kfree(hwmon_dev, sensor_groups[cnt].group.attrs);
> +		if (sensor_groups[cnt].sattr)
> +			devm_kfree(hwmon_dev, sensor_groups[cnt].sattr);
> +		sensor_groups[cnt].group.attrs =3D NULL;
> +		sensor_groups[cnt].sattr =3D NULL;
> +	}
> +}
> +
> +static void occ_remove_hwmon_attrs(struct device *hwmon_dev)
> +{
> +	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> +	struct sensor_group *sensor_groups =3D data->sensor_groups;
> +	int i;
> +
> +	if (!hwmon_dev)
> +		return;
> +
> +	device_remove_file(hwmon_dev, &dev_attr_update_interval);
> +	device_remove_file(hwmon_dev, &dev_attr_name);
> +	device_remove_file(hwmon_dev, &dev_attr_user_powercap);
> +
> +	for (i =3D 0; i < MAX_OCC_SENSOR_TYPE; i++)
> +		sysfs_remove_group(&hwmon_dev->kobj, &sensor_groups[i].group);
> +
> +	deinit_sensor_groups(hwmon_dev, sensor_groups);
> +}
> +
> +static void sensor_attr_init(struct sensor_attr_data *sdata,
> +				char *sensor_group_name,
> +				char *attr_name,
> +				ssize_t (*show)(struct device *dev,
> +						struct device_attribute *attr,
> +						char *buf))
> +{
> +	sysfs_attr_init(&sdata->dev_attr.attr);
> +
> +	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> +		sensor_group_name, sdata->hwmon_index, attr_name);
> +	sdata->dev_attr.attr.name =3D sdata->name;
> +	sdata->dev_attr.attr.mode =3D S_IRUGO;
> +	sdata->dev_attr.show =3D show;
> +}
> +
> +/* create hwmon sensor sysfs attributes */
> +static int create_sensor_group(struct device *hwmon_dev, enum sensor_t t=
ype,
> +				int sensor_num)
> +{
> +	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> +	struct sensor_group *sensor_groups =3D data->sensor_groups;
> +	struct sensor_attr_data *sdata;
> +	int ret;
> +	int cnt;
> +
> +	/* each sensor has 'label' and 'input' attributes */
> +	sensor_groups[type].group.attrs =3D devm_kzalloc(hwmon_dev,
> +						sizeof(struct attribute *) *
> +						sensor_num * 2 + 1, GFP_KERNEL);
> +	if (!sensor_groups[type].group.attrs) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	sensor_groups[type].sattr =3D devm_kzalloc(hwmon_dev,
> +					sizeof(struct sensor_attr_data) *
> +					sensor_num * 2, GFP_KERNEL);
> +	if (!sensor_groups[type].sattr) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	for (cnt =3D 0; cnt < sensor_num; cnt++) {
> +		sdata =3D &sensor_groups[type].sattr[cnt];
> +		/* hwomon attributes index starts from 1 */
> +		sdata->hwmon_index =3D cnt + 1;
> +		sdata->type =3D type;
> +		sensor_attr_init(sdata, sensor_groups[type].name, "input",
> +					show_input);
> +		sensor_groups[type].group.attrs[cnt] =3D &sdata->dev_attr.attr;
> +
> +		sdata =3D &sensor_groups[type].sattr[cnt + sensor_num];
> +		sdata->hwmon_index =3D cnt + 1;
> +		sdata->type =3D type;
> +		sensor_attr_init(sdata, sensor_groups[type].name, "label",
> +					show_label);
> +		sensor_groups[type].group.attrs[cnt + sensor_num] =3D
> +			&sdata->dev_attr.attr;
> +	}
> +
> +	ret =3D sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[type].group=
);
> +	if (ret)
> +		goto err;
> +
> +	return ret;
> +err:
> +	deinit_sensor_groups(hwmon_dev, sensor_groups);
> +	return ret;
> +}
> +
> +static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
> +					char *attr_name, uint32_t hwmon_index,
> +					uint32_t attr_id)
> +{
> +	sdata->type =3D caps;
> +	sdata->hwmon_index =3D hwmon_index;
> +	sdata->attr_id =3D attr_id;
> +
> +	/* FIXME, to be compatible with user space app, we do not
> +	=C2=A0* generate caps1_* attributes.
> +	=C2=A0*/
> +	if (sdata->hwmon_index =3D=3D 1)
> +		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s_%s",
> +			"caps", attr_name);
> +	else
> +		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> +			"caps", sdata->hwmon_index, attr_name);
> +
> +	sysfs_attr_init(&sdata->dev_attr.attr);
> +	sdata->dev_attr.attr.name =3D sdata->name;
> +	sdata->dev_attr.attr.mode =3D S_IRUGO;
> +	sdata->dev_attr.show =3D show_caps;
> +}
> +
> +static char *caps_sensor_name[] =3D {
> +	"curr_powercap",
> +	"curr_powerreading",
> +	"norm_powercap",
> +	"max_powercap",
> +	"min_powercap",
> +	"user_powerlimit",
> +};
> +
> +static int create_caps_sensor_group(struct device *hwmon_dev, int sensor=
_num)
> +{
> +	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> +	struct sensor_group *sensor_groups =3D data->sensor_groups;
> +	int field_num =3D ARRAY_SIZE(caps_sensor_name);
> +	struct sensor_attr_data *sdata;
> +	int ret;
> +	int cnt;
> +	int i;
> +
> +	sensor_groups[caps].group.attrs =3D devm_kzalloc(hwmon_dev,
> +						sizeof(struct attribute *) *
> +						sensor_num * field_num + 1,
> +						GFP_KERNEL);
> +	if (!sensor_groups[caps].group.attrs) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	sensor_groups[caps].sattr =3D devm_kzalloc(hwmon_dev,
> +					sizeof(struct sensor_attr_data) *
> +					sensor_num * field_num,
> +					GFP_KERNEL);
> +	if (!sensor_groups[caps].sattr) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	for (cnt =3D 0; cnt < sensor_num; cnt++) {
> +		for (i =3D 0; i < field_num; i++) {
> +			sdata =3D &sensor_groups[caps].sattr[cnt * field_num + i];
> +			caps_sensor_attr_init(sdata, caps_sensor_name[i],
> +						cnt + 1, i);
> +			sensor_groups[caps].group.attrs[cnt * field_num + i] =3D
> +						&sdata->dev_attr.attr;
> +		}
> +	}
> +
> +	ret =3D sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[caps].group=
);
> +	if (ret)
> +		goto err;
> +
> +	return ret;
> +err:
> +	deinit_sensor_groups(hwmon_dev, sensor_groups);
> +	return ret;
> +}
> +
> +static int occ_create_hwmon_attrs(struct device *dev)
> +{
> +	struct occ_drv_data *drv_data =3D dev_get_drvdata(dev);
> +	struct device *hwmon_dev =3D drv_data->hwmon_dev;
> +	struct sensor_group *sensor_groups =3D drv_data->sensor_groups;
> +	int i;
> +	int sensor_num;
> +	int ret;
> +	struct occ_response *rsp;
> +	enum sensor_t t;
> +
> +	rsp =3D &drv_data->occ_resp;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(rsp->sensor_block_id); i++)
> +		rsp->sensor_block_id[i] =3D -1;
> +
> +	/* read sensor data from occ. */
> +	ret =3D occ_update_device(dev);
> +	if (ret !=3D 0) {
> +		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> +		return ret;
> +	}
> +	if (!rsp->blocks)
> +		return -1;
> +
> +	ret =3D device_create_file(hwmon_dev, &dev_attr_name);
> +	if (ret)
> +		goto error;
> +
> +	ret =3D device_create_file(hwmon_dev, &dev_attr_update_interval);
> +	if (ret)
> +		goto error;
> +
> +	if (rsp->sensor_block_id[caps] >=3D 0) {
> +		/* user powercap: only for master OCC */
> +		ret =3D device_create_file(hwmon_dev, &dev_attr_user_powercap);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	sensor_groups[freq].name =3D "freq";
> +	sensor_groups[temp].name =3D "temp";
> +	sensor_groups[power].name =3D "power";
> +	sensor_groups[caps].name =3D=C2=A0=C2=A0"caps";
> +
> +	for (t =3D 0; t < MAX_OCC_SENSOR_TYPE; t++) {
> +		if (rsp->sensor_block_id[t] < 0)
> +			continue;
> +
> +		sensor_num =3D
> +			rsp->blocks[rsp->sensor_block_id[t]].sensor_num;
> +		if (t =3D=3D caps)
> +			ret =3D create_caps_sensor_group(hwmon_dev, sensor_num);
> +		else
> +			ret =3D create_sensor_group(hwmon_dev, t, sensor_num);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	return 0;
> +error:
> +	dev_err(dev, "ERROR: cannot create hwmon attributes\n");
> +	occ_remove_hwmon_attrs(drv_data->hwmon_dev);
> +	return ret;
> +}
> +
> +static ssize_t show_occ_online(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", data->occ_online);
> +}
> +
> +static ssize_t set_occ_online(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> +	unsigned long val;
> +	int err;
> +
> +	err =3D kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	if (val =3D=3D 1) {
> +		if (data->occ_online =3D=3D 1)
> +			return count;
> +
> +		/* populate hwmon sysfs attr using sensor data */
> +		dev_dbg(dev, "occ register hwmon @0x%x\n", data->client->addr);
> +
> +		data->hwmon_dev =3D hwmon_device_register(dev);
> +		if (IS_ERR(data->hwmon_dev))
> +			return PTR_ERR(data->hwmon_dev);
> +
> +		err =3D occ_create_hwmon_attrs(dev);
> +		if (err) {
> +			hwmon_device_unregister(data->hwmon_dev);
> +			return err;
> +		}
> +		data->hwmon_dev->parent =3D dev;
> +	} else if (val =3D=3D 0) {
> +		if (data->occ_online =3D=3D 0)
> +			return count;
> +
> +		occ_remove_hwmon_attrs(data->hwmon_dev);
> +		hwmon_device_unregister(data->hwmon_dev);
> +		data->hwmon_dev =3D NULL;
> +	} else
> +		return -EINVAL;
> +
> +	data->occ_online =3D val;
> +	return count;
> +}
> +
> +static DEVICE_ATTR(online, S_IWUSR | S_IRUGO,
> +		show_occ_online, set_occ_online);
> +
> +static int occ_create_i2c_sysfs_attr(struct device *dev)
> +{
> +	/* create an i2c sysfs attribute, to indicate whether OCC is active */
> +	return device_create_file(dev, &dev_attr_online);
> +}
> +
> +
> +/* device probe and removal */
> +
> +enum occ_type {
> +	occ_id,
> +};
> +
> +static int occ_probe(struct i2c_client *client, const struct i2c_device_=
id *id)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct occ_drv_data *data;
> +
> +	data =3D devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client =3D client;
> +	i2c_set_clientdata(client, data);
> +	mutex_init(&data->update_lock);
> +	data->update_interval =3D HZ;
> +
> +	occ_create_i2c_sysfs_attr(dev);
> +
> +	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
> +
> +	return 0;
> +}
> +
> +static int occ_remove(struct i2c_client *client)
> +{
> +	struct occ_drv_data *data =3D i2c_get_clientdata(client);
> +
> +	/* free allocated sensor memory */
> +	deinit_occ_resp_buf(&data->occ_resp);
> +
> +	device_remove_file(&client->dev, &dev_attr_online);
> +
> +	if (!data->hwmon_dev)
> +		return 0;
> +
> +	occ_remove_hwmon_attrs(data->hwmon_dev);
> +	hwmon_device_unregister(data->hwmon_dev);
> +	return 0;
> +}
> +
> +/* used by old-style board info. */
> +static const struct i2c_device_id occ_ids[] =3D {
> +	{ OCC_I2C_NAME, occ_id, },
> +	{ /* LIST END */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, occ_ids);
> +
> +/* use by device table */
> +static const struct of_device_id i2c_occ_of_match[] =3D {
> +	{.compatible =3D "ibm,occ-i2c"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, i2c_occ_of_match);
> +
> +/* i2c-core uses i2c-detect() to detect device in bellow address list.
> + *=C2=A0=C2=A0If exists, address will be assigned to client.
> + * It is also possible to read address from device table.
> + */
> +static const unsigned short normal_i2c[] =3D {0x50, 0x51, I2C_CLIENT_END=
 };
> +
> +static struct i2c_driver occ_driver =3D {
> +	.class		=3D I2C_CLASS_HWMON,
> +	.driver =3D {
> +		.name	=3D OCC_I2C_NAME,
> +		.pm	=3D NULL,
> +		.of_match_table =3D i2c_occ_of_match,
> +	},
> +	.probe		=3D occ_probe,
> +	.remove		=3D occ_remove,
> +	.id_table=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D occ_ids,
> +	.address_list	=3D normal_i2c,
> +};
> +
> +module_i2c_driver(occ_driver);
> +
> +MODULE_AUTHOR("Li Yi <shliyi@cn.ibm.com>");
> +MODULE_DESCRIPTION("BMC OCC hwmon driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2=
c.c
> deleted file mode 100644
> index 6de0e76..0000000
> --- a/drivers/hwmon/power8_occ_i2c.c
> +++ /dev/null
> @@ -1,1254 +0,0 @@
> -/*
> - * OCC HWMON driver - read IBM Power8 On Chip Controller sensor data via
> - * i2c.
> - *
> - * Copyright 2015 IBM Corp.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0=C2=A0See t=
he
> - * GNU General Public License for more details.
> - */
> -
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -#include=20
> -
> -#define OCC_I2C_ADDR 0x50
> -#define OCC_I2C_NAME "occ-i2c"
> -
> -#define OCC_DATA_MAX	4096 /* 4KB at most */
> -/* i2c read and write occ sensors */
> -#define I2C_READ_ERROR	1
> -#define I2C_WRITE_ERROR	2
> -
> -/* Defined in POWER8 Processor Registers Specification */
> -/* To generate attn to OCC */
> -#define ATTN_DATA	0x0006B035
> -/* For BMC to read/write SRAM */
> -#define OCB_ADDRESS		0x0006B070
> -#define OCB_DATA		0x0006B075
> -#define OCB_STATUS_CONTROL_AND	0x0006B072
> -#define OCB_STATUS_CONTROL_OR	0x0006B073
> -/* See definition in:
> - * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Int=
erfaces.pdf
> - */
> -#define OCC_COMMAND_ADDR	0xFFFF6000
> -#define OCC_RESPONSE_ADDR	0xFFFF7000
> -
> -#define MAX_SENSOR_ATTR_LEN	32
> -
> -enum sensor_t {
> -	freq,
> -	temp,
> -	power,
> -	caps,
> -	MAX_OCC_SENSOR_TYPE
> -};
> -
> -/* OCC sensor data format */
> -struct occ_sensor {
> -	uint16_t sensor_id;
> -	uint16_t value;
> -};
> -
> -struct power_sensor {
> -	uint16_t sensor_id;
> -	uint32_t update_tag;
> -	uint32_t accumulator;
> -	uint16_t value;
> -};
> -
> -struct caps_sensor {
> -	uint16_t curr_powercap;
> -	uint16_t curr_powerreading;
> -	uint16_t norm_powercap;
> -	uint16_t max_powercap;
> -	uint16_t min_powercap;
> -	uint16_t user_powerlimit;
> -};
> -
> -struct sensor_data_block {
> -	uint8_t sensor_type[4];
> -	uint8_t reserved0;
> -	uint8_t sensor_format;
> -	uint8_t sensor_length;
> -	uint8_t sensor_num;
> -	struct occ_sensor *sensor;
> -	struct power_sensor *power;
> -	struct caps_sensor *caps;
> -};
> -
> -struct occ_poll_header {
> -	uint8_t status;
> -	uint8_t ext_status;
> -	uint8_t occs_present;
> -	uint8_t config;
> -	uint8_t occ_state;
> -	uint8_t reserved0;
> -	uint8_t reserved1;
> -	uint8_t error_log_id;
> -	uint32_t error_log_addr_start;
> -	uint16_t error_log_length;
> -	uint8_t reserved2;
> -	uint8_t reserved3;
> -	uint8_t occ_code_level[16];
> -	uint8_t sensor_eye_catcher[6];
> -	uint8_t sensor_block_num;
> -	uint8_t sensor_data_version;
> -};
> -
> -struct occ_response {
> -	uint8_t sequence_num;
> -	uint8_t cmd_type;
> -	uint8_t rtn_status;
> -	uint16_t data_length;
> -	struct occ_poll_header header;
> -	struct sensor_data_block *blocks;
> -	uint16_t chk_sum;
> -	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
> -};
> -
> -struct sensor_attr_data {
> -	enum sensor_t type;
> -	uint32_t hwmon_index;
> -	uint32_t attr_id;
> -	char name[MAX_SENSOR_ATTR_LEN];
> -	struct device_attribute dev_attr;
> -};
> -
> -struct sensor_group {
> -	char *name;
> -	struct sensor_attr_data *sattr;
> -	struct attribute_group group;
> -};
> -
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
> -};
> -
> -static void deinit_occ_resp_buf(struct occ_response *p)
> -{
> -	int i;
> -
> -	if (!p)
> -		return;
> -
> -	if (!p->blocks)
> -		return;
> -
> -	for (i =3D 0; i < p->header.sensor_block_num; i++) {
> -		kfree(p->blocks[i].sensor);
> -		kfree(p->blocks[i].power);
> -		kfree(p->blocks[i].caps);
> -	}
> -
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
> -
> -	/* P8 i2c slave requires address to be shifted by 1 */
> -	address =3D address << 1;
> -
> -	buf[0] =3D address;
> -	buf[1] =3D data1;
> -	buf[2] =3D data0;
> -
> -	ret =3D occ_i2c_write(client, buf, sizeof(buf));
> -	if (ret !=3D sizeof(buf))
> -		return I2C_WRITE_ERROR;
> -
> -	return 0;
> -}
> -
> -static void *occ_get_sensor_by_type(struct occ_response *resp, enum sens=
or_t t)
> -{
> -	void *sensor;
> -
> -	if (!resp->blocks)
> -		return NULL;
> -
> -	if (resp->sensor_block_id[t] =3D=3D -1)
> -		return NULL;
> -
> -	switch (t) {
> -	case temp:
> -	case freq:
> -		sensor =3D resp->blocks[resp->sensor_block_id[t]].sensor;
> -		break;
> -	case power:
> -		sensor =3D resp->blocks[resp->sensor_block_id[t]].power;
> -		break;
> -	case caps:
> -		sensor =3D resp->blocks[resp->sensor_block_id[t]].caps;
> -		break;
> -	default:
> -		sensor =3D NULL;
> -	}
> -
> -	return sensor;
> -}
> -
> -static int occ_renew_sensor(struct occ_response *resp, uint8_t sensor_le=
ngth,
> -	uint8_t sensor_num, enum sensor_t t, int block)
> -{
> -	void *sensor;
> -	int ret;
> -
> -	sensor =3D occ_get_sensor_by_type(resp, t);
> -
> -	/* empty sensor block, release older sensor data */
> -	if (sensor_num =3D=3D 0 || sensor_length =3D=3D 0) {
> -		kfree(sensor);
> -		return -1;
> -	}
> -
> -	if (!sensor || sensor_num !=3D
> -			resp->blocks[resp->sensor_block_id[t]].sensor_num) {
> -		kfree(sensor);
> -		switch (t) {
> -		case temp:
> -		case freq:
> -			resp->blocks[block].sensor =3D
> -				kcalloc(sensor_num,
> -					sizeof(struct occ_sensor), GFP_KERNEL);
> -			if (!resp->blocks[block].sensor) {
> -				ret =3D -ENOMEM;
> -				goto err;
> -			}
> -			break;
> -		case power:
> -			resp->blocks[block].power =3D
> -				kcalloc(sensor_num,
> -					sizeof(struct power_sensor),
> -					GFP_KERNEL);
> -			if (!resp->blocks[block].power) {
> -				ret =3D -ENOMEM;
> -				goto err;
> -			}
> -			break;
> -		case caps:
> -			resp->blocks[block].caps =3D
> -				kcalloc(sensor_num,
> -					sizeof(struct caps_sensor), GFP_KERNEL);
> -			if (!resp->blocks[block].caps) {
> -				ret =3D -ENOMEM;
> -				goto err;
> -			}
> -			break;
> -		default:
> -			ret =3D -ENOMEM;
> -			goto err;
> -		}
> -	}
> -
> -	return 0;
> -err:
> -	deinit_occ_resp_buf(resp);
> -	return ret;
> -}
> -
> -#define RESP_DATA_LENGTH	3
> -#define RESP_HEADER_OFFSET	5
> -#define SENSOR_STR_OFFSET	37
> -#define SENSOR_BLOCK_NUM_OFFSET	43
> -#define SENSOR_BLOCK_OFFSET	45
> -
> -static inline uint16_t get_occdata_length(uint8_t *data)
> -{
> -	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
> -}
> -
> -static int parse_occ_response(struct i2c_client *client,
> -		uint8_t *data, struct occ_response *resp)
> -{
> -	int b;
> -	int s;
> -	int ret;
> -	int dnum =3D SENSOR_BLOCK_OFFSET;
> -	struct occ_sensor *f_sensor;
> -	struct occ_sensor *t_sensor;
> -	struct power_sensor *p_sensor;
> -	struct caps_sensor *c_sensor;
> -	uint8_t sensor_block_num;
> -	uint8_t sensor_type[4];
> -	uint8_t sensor_format;
> -	uint8_t sensor_length;
> -	uint8_t sensor_num;
> -
> -	/* check if the data is valid */
> -	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> -		dev_dbg(&client->dev,
> -			"ERROR: no SENSOR String in response\n");
> -		ret =3D -1;
> -		goto err;
> -	}
> -
> -	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> -	if (sensor_block_num =3D=3D 0) {
> -		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
> -		ret =3D -1;
> -		goto err;
> -	}
> -
> -	/* if sensor block has changed, re-malloc */
> -	if (sensor_block_num !=3D resp->header.sensor_block_num) {
> -		deinit_occ_resp_buf(resp);
> -		resp->blocks =3D kcalloc(sensor_block_num,
> -			sizeof(struct sensor_data_block), GFP_KERNEL);
> -		if (!resp->blocks)
> -			return -ENOMEM;
> -	}
> -
> -	memcpy(&resp->header, &data[RESP_HEADER_OFFSET], sizeof(resp->header));
> -	resp->header.error_log_addr_start =3D
> -		be32_to_cpu(resp->header.error_log_addr_start);
> -	resp->header.error_log_length =3D
> -		be16_to_cpu(resp->header.error_log_length);
> -
> -	dev_dbg(&client->dev, "Reading %d sensor blocks\n",
> -		resp->header.sensor_block_num);
> -	for (b =3D 0; b < sensor_block_num; b++) {
> -		/* 8-byte sensor block head */
> -		strncpy(sensor_type, &data[dnum], 4);
> -		sensor_format =3D data[dnum+5];
> -		sensor_length =3D data[dnum+6];
> -		sensor_num =3D data[dnum+7];
> -		dnum =3D dnum + 8;
> -
> -		dev_dbg(&client->dev,
> -			"sensor block[%d]: type: %s, sensor_num: %d\n",
> -			b, sensor_type, sensor_num);
> -
> -		if (strncmp(sensor_type, "FREQ", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, freq, b);
> -			if (ret)
> -				continue;
> -
> -			resp->sensor_block_id[freq] =3D b;
> -			for (s =3D 0; s < sensor_num; s++) {
> -				f_sensor =3D &resp->blocks[b].sensor[s];
> -				f_sensor->sensor_id =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> -				f_sensor->value =3D be16_to_cpup((const __be16 *)
> -							&data[dnum+2]);
> -				dev_dbg(&client->dev,
> -					"sensor[%d]-[%d]: id: %u, value: %u\n",
> -					b, s, f_sensor->sensor_id,
> -					f_sensor->value);
> -				dnum =3D dnum + sensor_length;
> -			}
> -		} else if (strncmp(sensor_type, "TEMP", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, temp, b);
> -			if (ret)
> -				continue;
> -
> -			resp->sensor_block_id[temp] =3D b;
> -			for (s =3D 0; s < sensor_num; s++) {
> -				t_sensor =3D &resp->blocks[b].sensor[s];
> -				t_sensor->sensor_id =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> -				t_sensor->value =3D be16_to_cpup((const __be16 *)
> -							&data[dnum+2]);
> -				dev_dbg(&client->dev,
> -					"sensor[%d]-[%d]: id: %u, value: %u\n",
> -					b, s, t_sensor->sensor_id,
> -					t_sensor->value);
> -				dnum =3D dnum + sensor_length;
> -			}
> -		} else if (strncmp(sensor_type, "POWR", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, power, b);
> -			if (ret)
> -				continue;
> -
> -			resp->sensor_block_id[power] =3D b;
> -			for (s =3D 0; s < sensor_num; s++) {
> -				p_sensor =3D &resp->blocks[b].power[s];
> -				p_sensor->sensor_id =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> -				p_sensor->update_tag =3D
> -					be32_to_cpup((const __be32 *)
> -							&data[dnum+2]);
> -				p_sensor->accumulator =3D
> -					be32_to_cpup((const __be32 *)
> -							&data[dnum+6]);
> -				p_sensor->value =3D be16_to_cpup((const __be16 *)
> -							&data[dnum+10]);
> -
> -				dev_dbg(&client->dev,
> -					"sensor[%d]-[%d]: id: %u, value: %u\n",
> -					b, s, p_sensor->sensor_id,
> -					p_sensor->value);
> -
> -				dnum =3D dnum + sensor_length;
> -			}
> -		} else if (strncmp(sensor_type, "CAPS", 4) =3D=3D 0) {
> -			ret =3D occ_renew_sensor(resp, sensor_length,
> -				sensor_num, caps, b);
> -			if (ret)
> -				continue;
> -
> -			resp->sensor_block_id[caps] =3D b;
> -			for (s =3D 0; s < sensor_num; s++) {
> -				c_sensor =3D &resp->blocks[b].caps[s];
> -				c_sensor->curr_powercap =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum]);
> -				c_sensor->curr_powerreading =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum+2]);
> -				c_sensor->norm_powercap =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum+4]);
> -				c_sensor->max_powercap =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum+6]);
> -				c_sensor->min_powercap =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum+8]);
> -				c_sensor->user_powerlimit =3D
> -					be16_to_cpup((const __be16 *)
> -							&data[dnum+10]);
> -
> -				dnum =3D dnum + sensor_length;
> -				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
> -				dev_dbg(&client->dev, "curr_powercap is %x\n",
> -					c_sensor->curr_powercap);
> -				dev_dbg(&client->dev,
> -					"curr_powerreading is %x\n",
> -					c_sensor->curr_powerreading);
> -				dev_dbg(&client->dev, "norm_powercap is %x\n",
> -					c_sensor->norm_powercap);
> -				dev_dbg(&client->dev, "max_powercap is %x\n",
> -					c_sensor->max_powercap);
> -				dev_dbg(&client->dev, "min_powercap is %x\n",
> -					c_sensor->min_powercap);
> -				dev_dbg(&client->dev, "user_powerlimit is %x\n",
> -					c_sensor->user_powerlimit);
> -			}
> -
> -		} else {
> -			dev_dbg(&client->dev,
> -				"ERROR: sensor type %s not supported\n",
> -				resp->blocks[b].sensor_type);
> -			ret =3D -1;
> -			goto err;
> -		}
> -
> -		strncpy(resp->blocks[b].sensor_type, sensor_type, 4);
> -		resp->blocks[b].sensor_format =3D sensor_format;
> -		resp->blocks[b].sensor_length =3D sensor_length;
> -		resp->blocks[b].sensor_num =3D sensor_num;
> -	}
> -
> -	return 0;
> -err:
> -	deinit_occ_resp_buf(resp);
> -	return ret;
> -}
> -
> -
> -/* Refer to OCC interface document for OCC command format
> - * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Int=
erfaces.pdf
> - */
> -static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
> -		uint8_t type, uint16_t length, uint8_t *data, uint8_t *resp)
> -{
> -	uint32_t cmd1, cmd2;
> -	uint16_t checksum;
> -	int i;
> -
> -	length =3D cpu_to_le16(length);
> -	cmd1 =3D (seq << 24) | (type << 16) | length;
> -	memcpy(&cmd2, data, length);
> -	cmd2 <<=3D ((4 - length) * 8);
> -
> -	/* checksum: sum of every bytes of cmd1, cmd2 */
> -	checksum =3D 0;
> -	for (i =3D 0; i < 4; i++)
> -		checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
> -	for (i =3D 0; i < 4; i++)
> -		checksum +=3D (cmd2 >> (i * 8)) & 0xFF;
> -	cmd2 |=3D checksum << ((2 - length) * 8);
> -
> -	/* Init OCB */
> -	occ_putscom(client, OCB_STATUS_CONTROL_OR,=C2=A0=C2=A00x08000000, 0x000=
00000);
> -	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
> -
> -	/* Send command */
> -	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> -	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> -	occ_putscom(client, OCB_DATA, cmd1, cmd2);
> -
> -	/* Trigger attention */
> -	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
> -
> -	/* Get response data */
> -	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
> -	occ_getscomb(client, OCB_DATA, resp, 0);
> -
> -	/* return status */
> -	return resp[2];
> -}
> -
> -static int occ_get_all(struct i2c_client *client, struct occ_response *o=
cc_resp)
> -{
> -	uint8_t *occ_data;
> -	uint16_t num_bytes;
> -	int i;
> -	int ret;
> -	uint8_t poll_cmd_data;
> -
> -	poll_cmd_data =3D 0x10;
> -
> -	/*
> -	=C2=A0* TODO: fetch header, and then allocate the rest of the buffer ba=
sed
> -	=C2=A0* on the header size. Assuming the OCC has a fixed sized header
> -	=C2=A0*/
> -	occ_data =3D devm_kzalloc(&client->dev, OCC_DATA_MAX, GFP_KERNEL);
> -
> -	ret =3D occ_send_cmd(client, 0, 0, 1, &poll_cmd_data, occ_data);
> -	if (ret) {
> -		dev_err(&client->dev, "ERROR: OCC Poll: 0x%x\n", ret);
> -		ret =3D -EINVAL;
> -		goto out;
> -	}
> -
> -	num_bytes =3D get_occdata_length(occ_data);
> -
> -	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
> -
> -	if (num_bytes > OCC_DATA_MAX) {
> -		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
> -		ret =3D -EINVAL;
> -		goto out;
> -	}
> -
> -	if (num_bytes <=3D 0) {
> -		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
> -		ret =3D -EINVAL;
> -		goto out;
> -	}
> -
> -	/* read remaining data */
> -	for (i =3D 8; i < num_bytes + 8; i =3D i + 8)
> -		occ_getscomb(client, OCB_DATA, occ_data, i);
> -
> -	ret =3D parse_occ_response(client, occ_data, occ_resp);
> -
> -out:
> -	devm_kfree(&client->dev, occ_data);
> -	return ret;
> -}
> -
> -
> -static int occ_update_device(struct device *dev)
> -{
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
> -	}
> -	mutex_unlock(&data->update_lock);
> -
> -	return ret;
> -}
> -
> -
> -static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
> -{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret =3D occ_update_device(dev);
> -	if (ret !=3D 0) {
> -		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> -		return NULL;
> -	}
> -
> -	return occ_get_sensor_by_type(&data->occ_resp, t);
> -}
> -
> -static int occ_get_sensor_value(struct device *hwmon_dev, enum sensor_t =
t,
> -					int index)
> -{
> -	void *sensor;
> -
> -	if (t =3D=3D caps)
> -		return -1;
> -
> -	sensor =3D occ_get_sensor(hwmon_dev, t);
> -
> -	if (!sensor)
> -		return -1;
> -
> -	if (t =3D=3D power)
> -		return ((struct power_sensor *)sensor)[index].value;
> -
> -	return ((struct occ_sensor *)sensor)[index].value;
> -}
> -
> -static int occ_get_sensor_id(struct device *hwmon_dev, enum sensor_t t,
> -					int index)
> -{
> -	void *sensor;
> -
> -	if (t =3D=3D caps)
> -		return -1;
> -
> -	sensor =3D occ_get_sensor(hwmon_dev, t);
> -
> -	if (!sensor)
> -		return -1;
> -
> -	if (t =3D=3D power)
> -		return ((struct power_sensor *)sensor)[index].sensor_id;
> -
> -	return ((struct occ_sensor *)sensor)[index].sensor_id;
> -}
> -
> -/* sysfs attributes for occ hwmon device */
> -
> -static ssize_t show_input(struct device *hwmon_dev,
> -				struct device_attribute *da, char *buf)
> -{
> -	struct sensor_attr_data *sdata =3D container_of(da,
> -					struct sensor_attr_data, dev_attr);
> -	int val;
> -
> -	val =3D occ_get_sensor_value(hwmon_dev, sdata->type,
> -					sdata->hwmon_index - 1);
> -	if (sdata->type =3D=3D temp)
> -		/* in millidegree Celsius */
> -		val *=3D 1000;
> -
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> -}
> -
> -static ssize_t show_label(struct device *hwmon_dev,
> -			struct device_attribute *da, char *buf)
> -{
> -	struct sensor_attr_data *sdata =3D container_of(da,
> -					struct sensor_attr_data, dev_attr);
> -	int val;
> -
> -	val =3D occ_get_sensor_id(hwmon_dev, sdata->type,
> -					sdata->hwmon_index - 1);
> -
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> -}
> -
> -static ssize_t show_caps(struct device *hwmon_dev,
> -		struct device_attribute *da, char *buf)
> -{
> -	struct sensor_attr_data *sdata =3D container_of(da,
> -					struct sensor_attr_data, dev_attr);
> -	int nr =3D sdata->attr_id;
> -	int n =3D sdata->hwmon_index - 1;
> -	struct caps_sensor *sensor;
> -	int val;
> -
> -	sensor =3D occ_get_sensor(hwmon_dev, caps);
> -	if (!sensor) {
> -		val =3D -1;
> -		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> -	}
> -
> -	switch (nr) {
> -	case 0:
> -		val =3D sensor[n].curr_powercap;
> -		break;
> -	case 1:
> -		val =3D sensor[n].curr_powerreading;
> -		break;
> -	case 2:
> -		val =3D sensor[n].norm_powercap;
> -		break;
> -	case 3:
> -		val =3D sensor[n].max_powercap;
> -		break;
> -	case 4:
> -		val =3D sensor[n].min_powercap;
> -		break;
> -	case 5:
> -		val =3D sensor[n].user_powerlimit;
> -		break;
> -	default:
> -		val =3D -1;
> -	}
> -
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
> -}
> -
> -static ssize_t show_update_interval(struct device *hwmon_dev,
> -				struct device_attribute *attr, char *buf)
> -{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -
> -	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
> -		jiffies_to_msecs(data->update_interval));
> -}
> -
> -static ssize_t set_update_interval(struct device *hwmon_dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> -{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	unsigned long val;
> -	int err;
> -
> -	err =3D kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> -
> -	data->update_interval =3D msecs_to_jiffies(val);
> -	return count;
> -}
> -static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
> -		show_update_interval, set_update_interval);
> -
> -static ssize_t show_name(struct device *hwmon_dev,
> -				struct device_attribute *attr, char *buf)
> -{
> -	return snprintf(buf, PAGE_SIZE - 1, "%s\n", OCC_I2C_NAME);
> -}
> -static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
> -
> -static ssize_t show_user_powercap(struct device *hwmon_dev,
> -				struct device_attribute *attr, char *buf)
> -{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -
> -	return snprintf(buf, PAGE_SIZE - 1, "%u\n", data->user_powercap);
> -}
> -
> -
> -static ssize_t set_user_powercap(struct device *hwmon_dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> -{
> -	struct device *dev =3D hwmon_dev->parent;
> -	struct occ_drv_data *data =3D dev_get_drvdata(dev);
> -	struct i2c_client *client =3D data->client;
> -	uint16_t val;
> -	uint8_t resp[8];
> -	int err;
> -
> -	err =3D kstrtou16(buf, 10, &val);
> -	if (err)
> -		return err;
> -
> -	dev_dbg(dev, "set user powercap to: %u\n", val);
> -	val =3D cpu_to_le16(val);
> -	err =3D occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
> -	if (err !=3D 0) {
> -		dev_dbg(dev,
> -			"ERROR: Set User Powercap: wrong return status: %x\n",
> -			err);
> -		if (err =3D=3D 0x13)
> -			dev_info(dev,
> -				"ERROR: set invalid powercap value: %x\n", val);
> -		return -EINVAL;
> -	}
> -	data->user_powercap =3D val;
> -	return count;
> -}
> -static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO,
> -		show_user_powercap, set_user_powercap);
> -
> -static void deinit_sensor_groups(struct device *hwmon_dev,
> -					struct sensor_group *sensor_groups)
> -{
> -	int cnt;
> -
> -	for (cnt =3D 0; cnt < MAX_OCC_SENSOR_TYPE; cnt++) {
> -		if (sensor_groups[cnt].group.attrs)
> -			devm_kfree(hwmon_dev, sensor_groups[cnt].group.attrs);
> -		if (sensor_groups[cnt].sattr)
> -			devm_kfree(hwmon_dev, sensor_groups[cnt].sattr);
> -		sensor_groups[cnt].group.attrs =3D NULL;
> -		sensor_groups[cnt].sattr =3D NULL;
> -	}
> -}
> -
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
> -static void sensor_attr_init(struct sensor_attr_data *sdata,
> -				char *sensor_group_name,
> -				char *attr_name,
> -				ssize_t (*show)(struct device *dev,
> -						struct device_attribute *attr,
> -						char *buf))
> -{
> -	sysfs_attr_init(&sdata->dev_attr.attr);
> -
> -	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> -		sensor_group_name, sdata->hwmon_index, attr_name);
> -	sdata->dev_attr.attr.name =3D sdata->name;
> -	sdata->dev_attr.attr.mode =3D S_IRUGO;
> -	sdata->dev_attr.show =3D show;
> -}
> -
> -/* create hwmon sensor sysfs attributes */
> -static int create_sensor_group(struct device *hwmon_dev, enum sensor_t t=
ype,
> -				int sensor_num)
> -{
> -	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> -	struct sensor_group *sensor_groups =3D data->sensor_groups;
> -	struct sensor_attr_data *sdata;
> -	int ret;
> -	int cnt;
> -
> -	/* each sensor has 'label' and 'input' attributes */
> -	sensor_groups[type].group.attrs =3D devm_kzalloc(hwmon_dev,
> -						sizeof(struct attribute *) *
> -						sensor_num * 2 + 1, GFP_KERNEL);
> -	if (!sensor_groups[type].group.attrs) {
> -		ret =3D -ENOMEM;
> -		goto err;
> -	}
> -
> -	sensor_groups[type].sattr =3D devm_kzalloc(hwmon_dev,
> -					sizeof(struct sensor_attr_data) *
> -					sensor_num * 2, GFP_KERNEL);
> -	if (!sensor_groups[type].sattr) {
> -		ret =3D -ENOMEM;
> -		goto err;
> -	}
> -
> -	for (cnt =3D 0; cnt < sensor_num; cnt++) {
> -		sdata =3D &sensor_groups[type].sattr[cnt];
> -		/* hwomon attributes index starts from 1 */
> -		sdata->hwmon_index =3D cnt + 1;
> -		sdata->type =3D type;
> -		sensor_attr_init(sdata, sensor_groups[type].name, "input",
> -					show_input);
> -		sensor_groups[type].group.attrs[cnt] =3D &sdata->dev_attr.attr;
> -
> -		sdata =3D &sensor_groups[type].sattr[cnt + sensor_num];
> -		sdata->hwmon_index =3D cnt + 1;
> -		sdata->type =3D type;
> -		sensor_attr_init(sdata, sensor_groups[type].name, "label",
> -					show_label);
> -		sensor_groups[type].group.attrs[cnt + sensor_num] =3D
> -			&sdata->dev_attr.attr;
> -	}
> -
> -	ret =3D sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[type].group=
);
> -	if (ret)
> -		goto err;
> -
> -	return ret;
> -err:
> -	deinit_sensor_groups(hwmon_dev, sensor_groups);
> -	return ret;
> -}
> -
> -static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
> -					char *attr_name, uint32_t hwmon_index,
> -					uint32_t attr_id)
> -{
> -	sdata->type =3D caps;
> -	sdata->hwmon_index =3D hwmon_index;
> -	sdata->attr_id =3D attr_id;
> -
> -	/* FIXME, to be compatible with user space app, we do not
> -	=C2=A0* generate caps1_* attributes.
> -	=C2=A0*/
> -	if (sdata->hwmon_index =3D=3D 1)
> -		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s_%s",
> -			"caps", attr_name);
> -	else
> -		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
> -			"caps", sdata->hwmon_index, attr_name);
> -
> -	sysfs_attr_init(&sdata->dev_attr.attr);
> -	sdata->dev_attr.attr.name =3D sdata->name;
> -	sdata->dev_attr.attr.mode =3D S_IRUGO;
> -	sdata->dev_attr.show =3D show_caps;
> -}
> -
> -static char *caps_sensor_name[] =3D {
> -	"curr_powercap",
> -	"curr_powerreading",
> -	"norm_powercap",
> -	"max_powercap",
> -	"min_powercap",
> -	"user_powerlimit",
> -};
> -
> -static int create_caps_sensor_group(struct device *hwmon_dev, int sensor=
_num)
> -{
> -	struct occ_drv_data *data =3D dev_get_drvdata(hwmon_dev->parent);
> -	struct sensor_group *sensor_groups =3D data->sensor_groups;
> -	int field_num =3D ARRAY_SIZE(caps_sensor_name);
> -	struct sensor_attr_data *sdata;
> -	int ret;
> -	int cnt;
> -	int i;
> -
> -	sensor_groups[caps].group.attrs =3D devm_kzalloc(hwmon_dev,
> -						sizeof(struct attribute *) *
> -						sensor_num * field_num + 1,
> -						GFP_KERNEL);
> -	if (!sensor_groups[caps].group.attrs) {
> -		ret =3D -ENOMEM;
> -		goto err;
> -	}
> -
> -	sensor_groups[caps].sattr =3D devm_kzalloc(hwmon_dev,
> -					sizeof(struct sensor_attr_data) *
> -					sensor_num * field_num,
> -					GFP_KERNEL);
> -	if (!sensor_groups[caps].sattr) {
> -		ret =3D -ENOMEM;
> -		goto err;
> -	}
> -
> -	for (cnt =3D 0; cnt < sensor_num; cnt++) {
> -		for (i =3D 0; i < field_num; i++) {
> -			sdata =3D &sensor_groups[caps].sattr[cnt * field_num + i];
> -			caps_sensor_attr_init(sdata, caps_sensor_name[i],
> -						cnt + 1, i);
> -			sensor_groups[caps].group.attrs[cnt * field_num + i] =3D
> -						&sdata->dev_attr.attr;
> -		}
> -	}
> -
> -	ret =3D sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[caps].group=
);
> -	if (ret)
> -		goto err;
> -
> -	return ret;
> -err:
> -	deinit_sensor_groups(hwmon_dev, sensor_groups);
> -	return ret;
> -}
> -
> -static int occ_create_hwmon_attrs(struct device *dev)
> -{
> -	struct occ_drv_data *drv_data =3D dev_get_drvdata(dev);
> -	struct device *hwmon_dev =3D drv_data->hwmon_dev;
> -	struct sensor_group *sensor_groups =3D drv_data->sensor_groups;
> -	int i;
> -	int sensor_num;
> -	int ret;
> -	struct occ_response *rsp;
> -	enum sensor_t t;
> -
> -	rsp =3D &drv_data->occ_resp;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(rsp->sensor_block_id); i++)
> -		rsp->sensor_block_id[i] =3D -1;
> -
> -	/* read sensor data from occ. */
> -	ret =3D occ_update_device(dev);
> -	if (ret !=3D 0) {
> -		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> -		return ret;
> -	}
> -	if (!rsp->blocks)
> -		return -1;
> -
> -	ret =3D device_create_file(hwmon_dev, &dev_attr_name);
> -	if (ret)
> -		goto error;
> -
> -	ret =3D device_create_file(hwmon_dev, &dev_attr_update_interval);
> -	if (ret)
> -		goto error;
> -
> -	if (rsp->sensor_block_id[caps] >=3D 0) {
> -		/* user powercap: only for master OCC */
> -		ret =3D device_create_file(hwmon_dev, &dev_attr_user_powercap);
> -		if (ret)
> -			goto error;
> -	}
> -
> -	sensor_groups[freq].name =3D "freq";
> -	sensor_groups[temp].name =3D "temp";
> -	sensor_groups[power].name =3D "power";
> -	sensor_groups[caps].name =3D=C2=A0=C2=A0"caps";
> -
> -	for (t =3D 0; t < MAX_OCC_SENSOR_TYPE; t++) {
> -		if (rsp->sensor_block_id[t] < 0)
> -			continue;
> -
> -		sensor_num =3D
> -			rsp->blocks[rsp->sensor_block_id[t]].sensor_num;
> -		if (t =3D=3D caps)
> -			ret =3D create_caps_sensor_group(hwmon_dev, sensor_num);
> -		else
> -			ret =3D create_sensor_group(hwmon_dev, t, sensor_num);
> -		if (ret)
> -			goto error;
> -	}
> -
> -	return 0;
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
> -
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
> -}
> -
> -
> -/* device probe and removal */
> -
> -enum occ_type {
> -	occ_id,
> -};
> -
> -static int occ_probe(struct i2c_client *client, const struct i2c_device_=
id *id)
> -{
> -	struct device *dev =3D &client->dev;
> -	struct occ_drv_data *data;
> -
> -	data =3D devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	data->client =3D client;
> -	i2c_set_clientdata(client, data);
> -	mutex_init(&data->update_lock);
> -	data->update_interval =3D HZ;
> -
> -	occ_create_i2c_sysfs_attr(dev);
> -
> -	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
> -
> -	return 0;
> -}
> -
> -static int occ_remove(struct i2c_client *client)
> -{
> -	struct occ_drv_data *data =3D i2c_get_clientdata(client);
> -
> -	/* free allocated sensor memory */
> -	deinit_occ_resp_buf(&data->occ_resp);
> -
> -	device_remove_file(&client->dev, &dev_attr_online);
> -
> -	if (!data->hwmon_dev)
> -		return 0;
> -
> -	occ_remove_hwmon_attrs(data->hwmon_dev);
> -	hwmon_device_unregister(data->hwmon_dev);
> -	return 0;
> -}
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
--=-eVCSNS1jBxHPObVfCPZV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX/EV4AAoJEJ0dnzgO5LT56REP/il1cw4oQC6X1Aem5NqcwZPm
Puy3BHGrhSvh4uwihjSE1senueMLUBBZu6fYWvaA1EvQvHGuTotHLeHBEd3RxKQk
hFPWPHdjnlPDQnkHQQNVzPn/lQRY8WxHjwnMI88Ejnb+feTFuMaqFH+djbmKqPFU
6CIVmGokLvlyKQ6q88uBEMBECCEWXm9atC8xVHBuK9wgItVCjo7fAx/2WWQAnspZ
Dx/AHWPQO4pM8/H/HSdHqohPrZoQpMlSY+5mTfOcaBqUGN1OFHsWYzMOrmPrC2O+
vFsAIF3lyHVpKKroKctIYdOEPgszsy7iaQm3qTgoyx56tWkuGirieZLMffFMaQmw
PaxLaOZCuTzFAINCpwmpRcIXSL5GhdmzDIaiiq9DZml5HL90QnC9xeu6093P1AUq
tn4eYVHdGDF91FQy7ezlx4JwrrCQu7D6hWpUnXQylcN7L5D5pFFJAyZqX+X6o12G
fe2bf2fHIARF/67Uem2pUtWhcGxOKFy3jMbC8J4KRB0135HyusyLyUnXEC0B4ocO
70x6QpeAmOQoaeBkDLm6XifXNqX6OSy0D/FQgxCbgKFk0tNW9taC5KhYX2yMSxdW
izcL2dgc8gwVFoYdK9Oq3Gty0M+7kSAdXKVghx1Si9QgDZToz+CL1ojQsEstOVmQ
nTg1x2WzSqR4VbcnmSfh
=O5gH
-----END PGP SIGNATURE-----

--=-eVCSNS1jBxHPObVfCPZV--
