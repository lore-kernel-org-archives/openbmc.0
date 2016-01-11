Return-Path: <dja@axtens.net>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A53801A0050
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 10:14:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=OMOF95fZ; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id e65so4131213pfe.0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 15:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=sVGWzDLKPB6MVUdFwNJQbixGc+CDOQPpPfLoRZxn1e0=;
 b=OMOF95fZ7KjGHAw6nyHugPTiWDIg149n25Ck3teJisCMFtfIPmROLj/Bu+xeTr659y
 fUJC9zjGRJvkvpuowOkq2Mwx+qfVFaT4EQR6BbW2FydGedVX7qELrmdJ2sPflnnRBe6w
 INhDN9lZf251olbB3RZS8SsXSiihuQmLFHQMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=sVGWzDLKPB6MVUdFwNJQbixGc+CDOQPpPfLoRZxn1e0=;
 b=P69KDYiGWCUTEGDZfop9uOSSprHOeYnh5dmZeut84+O/jn+wd7LEMYJkjR+LCTrGdq
 v6KZHfqmc22QBZ5qdOQKkS7XxEMEP9DkDxURqjQG152+mCfWGnzf083Scy3RNisF9aQ/
 gGK5EIckaxYU07Pd8YXm/LHnqYHhdt10cshsuGHch0nLOH5fwGM32tscapVpZLfDllpM
 OydkQfuG/X5NbKfljitDAggY8ojMdIyYm6bOsAI2pxj/qsg4+Iv45tdr0FjLA/kZJsKx
 vTo7+i+Kxmb3vAilsPd5pSBVZFxHjdd6cUCZCK8UJ31yzZMs2liAMjmGzGYCuXWClMmf
 IK0g==
X-Gm-Message-State: ALoCoQnW46wkh/yLdEHl19KEbC2ci2uxINDgSdUwaiOg8gS/T10R5BH2N12WkNLO+Mqde6Ou+7A+llzcrJZMDIwO5VjSwdRa3g==
X-Received: by 10.98.79.4 with SMTP id d4mr29505167pfb.46.1452554093300;
 Mon, 11 Jan 2016 15:14:53 -0800 (PST)
Received: from localhost (ppp121-45-193-224.lns20.cbr1.internode.on.net.
 [121.45.193.224])
 by smtp.gmail.com with ESMTPSA id x10sm91723227pas.37.2016.01.11.15.14.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2016 15:14:52 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux] HWMON: Add OCC hwmon driver
In-Reply-To: <1452492639-27344-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452492639-27344-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452492639-27344-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 12 Jan 2016 10:14:43 +1100
Message-ID: <87a8ob7lp8.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 23:14:56 -0000

Hi,

I had some comments for an earlier version but I accidentally sent them
to openbmc-patches rather than openbmc@.

Most of the comments still apply, so here is the old message:

====

Hi,

Thanks for your patch.

I think for community acceptance, you will need to split this up into
two patches:

 1) add hwmon driver for OCC
 2) add this driver to the dts files

This is because the drivers/hwmon and arch/arm parts of the kernel will
be managed by different people.

I have also read the code and have some comments below.


> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 9e0f3dd..d6fa923 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_SENSORS_NCT6775)	+=3D nct6775.o
>  obj-$(CONFIG_SENSORS_NCT7802)	+=3D nct7802.o
>  obj-$(CONFIG_SENSORS_NCT7904)	+=3D nct7904.o
>  obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+=3D ntc_thermistor.o
> +obj-$(CONFIG_SENSORS_OCC)	+=3D occ_i2c.o
I may be mistaken because of the extra indentation from git and the
email reply, but it looks like you need an extra tab here so it lines up
with the lines before and after?
>  obj-$(CONFIG_SENSORS_PC87360)	+=3D pc87360.o
>  obj-$(CONFIG_SENSORS_PC87427)	+=3D pc87427.o
>  obj-$(CONFIG_SENSORS_PCF8591)	+=3D pcf8591.o
> diff --git a/drivers/hwmon/occ_i2c.c b/drivers/hwmon/occ_i2c.c
> new file mode 100644
> index 0000000..38be953
> --- /dev/null
> +++ b/drivers/hwmon/occ_i2c.c
> @@ -0,0 +1,1339 @@
> +/*
> + * BMC OCC HWMON driver - read IBM Power8 OCC (On Chip Controller)
> + * sensor data via i2c.
> + *
> + * Copyright (c) 2015 IBM (Alvin Wang, Li Yi)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
Officially code is supposed to be GPLv2 only. Lots of code is already 'v2
or later', so this is not a big issue, but it would be nice to make it:

 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 of the
 * License.


> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +
> +
> +#define OCC_I2C_ADDR 0x50
> +#define OCC_I2C_NAME "occ-i2c"
> +
> +#define OCC_DATA_MAX	4096 /* 4KB at most */
> +/* i2c read and write occ sensors */
> +#define I2C_READ_ERROR	1
> +#define I2C_WRITE_ERROR	2
> +
> +/* To generate attn to OCC */
> +#define ATTN_DATA	0x0006B035
> +/* For BMC to read/write SRAM */
> +#define OCB_ADDRESS		0x0006B070
> +#define OCB_DATA		0x0006B075
> +#define OCB_STATUS_CONTROL_AND	0x0006B072
> +#define OCB_STATUS_CONTROL_OR	0x0006B073
> +/* See definition in:
> + * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Int=
erfaces.pfd
> + */
> +#define OCC_COMMAND_ADDR	0xFFFF6000
> +#define OCC_RESPONSE_ADDR	0xFFFF7000
> +
> +/* OCC sensor data format */

Do these structs need a 'packed' attribute? If you're directly copying
From=20the OCC output into the struct, you will need to make sure the
compiler is not injecting any padding that you're not expecting...

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
> +	uint8_t num_of_sensors;
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
> +	int temp_block_id;
> +	int freq_block_id;
> +	int power_block_id;
> +	int caps_block_id;
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
> +	struct occ_response	occ_resp;
> +};
> +
> +enum sensor_t {
> +	freq,
> +	temp,
> +	power,
> +	caps
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
> +	p->freq_block_id =3D -1;
> +	p->temp_block_id =3D -1;
> +	p->power_block_id =3D -1;
> +	p->caps_block_id =3D -1;
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
Should you block the write if this is the case?
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
> +	int i =3D 0;
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
I may have missed this in the docs, but why does the buffer need to be
reversed here?
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
> +	switch (t) {
> +	case temp:
> +		sensor =3D (resp->temp_block_id =3D=3D -1) ? NULL :
> +			resp->blocks[resp->temp_block_id].sensor;
> +		break;
> +	case freq:
> +		sensor =3D (resp->freq_block_id =3D=3D -1) ? NULL :
> +			resp->blocks[resp->freq_block_id].sensor;
> +		break;
> +	case power:
> +		sensor =3D (resp->power_block_id =3D=3D -1) ? NULL :
> +			resp->blocks[resp->power_block_id].power;
> +		break;
> +	case caps:
> +		sensor =3D (resp->caps_block_id =3D=3D -1) ? NULL :
> +			resp->blocks[resp->caps_block_id].caps;
> +		break;
> +	default:
> +		sensor =3D NULL;
> +		break;
> +	}
> +
> +	return sensor;
> +}


I think your deinit and renew functions might be slightly
overengineered. In particular, I'm struggling to understand the flow of
memory allocation and deallocation.

If I understand correctly, you're deinit/renew setup allows you to avoid
malloc-ing/freeing memory in parse_occ_response unless the number or
type of sensor changes. As I understand it, a call to parse_occ_response
is almost always because of a sysfs read.  Would it be simpler if you
simply unconditionally allocated and freed the memory each time the
sysfs file is read?

(I would imagine that given we already need to do i2c reads and writes,
the extra overhead of malloc and free is pretty small.)

However, I could have completely misunderstood your code, so let me know
if that's the case.

> +
> +static int occ_renew_sensor(struct occ_response *resp, uint8_t sensor_le=
ngth,
> +	uint8_t num_of_sensors, enum sensor_t t, int block)
> +{
> +	void *sensor;
> +	int ret;
> +
> +	sensor =3D occ_get_sensor_by_type(resp, t);
> +
> +	/* empty sensor block, release older sensor data */
> +	if (num_of_sensors =3D=3D 0 || sensor_length =3D=3D 0) {
It seems you only use sensor_length here at the very start. Is it
required, or could you omit it?
> +		kfree(sensor);
> +		return -1;
> +	}
> +
> +	switch (t) {
> +	case temp:
> +		if (!sensor || num_of_sensors !=3D
> +			resp->blocks[resp->temp_block_id].num_of_sensors) {
> +			kfree(sensor);
> +			resp->blocks[block].sensor =3D
> +				kcalloc(num_of_sensors,
> +					sizeof(struct occ_sensor), GFP_KERNEL);
> +			if (!resp->blocks[block].sensor) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +		}
> +		break;
> +	case freq:
> +		if (!sensor || num_of_sensors !=3D
> +			resp->blocks[resp->freq_block_id].num_of_sensors) {
> +			kfree(sensor);
> +			resp->blocks[block].sensor =3D
> +				kcalloc(num_of_sensors,
> +					sizeof(struct occ_sensor), GFP_KERNEL);
> +			if (!resp->blocks[block].sensor) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +		}
> +		break;
> +	case power:
> +		if (!sensor || num_of_sensors !=3D
> +			resp->blocks[resp->power_block_id].num_of_sensors) {
> +			kfree(sensor);
> +			resp->blocks[block].power =3D
> +				kcalloc(num_of_sensors,
> +				sizeof(struct power_sensor), GFP_KERNEL);
> +			if (!resp->blocks[block].power) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +		}
> +		break;
> +	case caps:
> +		if (!sensor || num_of_sensors !=3D
> +			resp->blocks[resp->caps_block_id].num_of_sensors) {
> +			kfree(sensor);
> +			resp->blocks[block].caps =3D
> +				kcalloc(num_of_sensors,
> +					sizeof(struct caps_sensor), GFP_KERNEL);
> +			if (!resp->blocks[block].caps) {
> +				ret =3D -ENOMEM;
> +				goto err;
> +			}
> +		}
> +		break;
> +	default:
> +		sensor =3D NULL;
> +		break;
> +	}
> +
> +	return 0;
> +err:
> +	deinit_occ_resp_buf(resp);
> +	return ret;
> +}
> +
> +/* refer to OCC interface document for Poll Return Packet format
> + * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Int=
erfaces.pdf
> + */
> +#define RESP_DATA_LENGTH	3
> +#define RESP_HEADER_OFFSET	5
> +#define SENSOR_STR_OFFSET	37
> +#define SENSOR_BLOCK_NUM_OFFSET	43
> +#define SENSOR_BLOCK_OFFSET	45
> +
> +static inline uint16_t get_occdata_length(uint8_t *data)
> +{
> +	return be16_to_cpup(&data[RESP_DATA_LENGTH]);
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
> +	uint8_t num_of_sensors;
> +
> +	/* check if the data is valid */
> +	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) !=3D 0) {
> +		dev_err(&client->dev,
> +			"ERROR: no SENSOR String in response\n");
> +		ret =3D -1;
> +		goto err;
> +	}
> +
> +	sensor_block_num =3D data[SENSOR_BLOCK_NUM_OFFSET];
> +	if (sensor_block_num =3D=3D 0) {
> +		dev_err(&client->dev, "ERROR: SENSOR block num is 0\n");
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

Regarding my earlier comment about packed structs - this is an example
of something that could go wrong if the struct is not packed.

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

It would be nice to say that byte 4 is reserved - I initially thought
something was missing here.

> +		sensor_format =3D data[dnum+5];
> +		sensor_length =3D data[dnum+6];
> +		num_of_sensors =3D data[dnum+7];
> +		dnum =3D dnum + 8;
> +
> +		dev_dbg(&client->dev,
> +			"sensor block[%d]: type: %s, num_of_sensors: %d\n",
> +			b, sensor_type, num_of_sensors);
> +
> +		if (strncmp(sensor_type, "FREQ", 4) =3D=3D 0) {
> +			ret =3D occ_renew_sensor(resp, sensor_length,
> +				num_of_sensors, freq, b);
> +			if (ret)
> +				continue;
> +
> +			resp->freq_block_id =3D b;
> +			for (s =3D 0; s < num_of_sensors; s++) {
> +				f_sensor =3D &resp->blocks[b].sensor[s];
> +				f_sensor->sensor_id =3D be16_to_cpup(&data[dnum]);
> +				f_sensor->value =3D be16_to_cpup(&data[dnum+2]);
> +				dev_dbg(&client->dev,
> +					"sensor[%d]-[%d]: id: %u, value: %u\n",
> +					b, s, f_sensor->sensor_id,
> +					f_sensor->value);
> +				dnum =3D dnum + sensor_length;

> +
> +static int occ_get_all(struct i2c_client *client, struct occ_response *o=
cc_resp)
> +{
> +	uint8_t occ_data[OCC_DATA_MAX];
> +	uint16_t num_bytes;
> +	int i;
> +	int ret;
> +
> +	/* Init OCB */
> +	occ_putscom(client, OCB_STATUS_CONTROL_OR,  0x08000000, 0x00000000);
> +	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
> +
> +	/* Send poll command to OCC */
> +	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> +	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
> +	occ_putscom(client, OCB_DATA, 0x00000001, 0x10001100);
> +
> +	/* Trigger ATTN */
> +	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
> +
> +	/* Get response data */
> +	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
> +	occ_getscomb(client, OCB_DATA, occ_data, 0);
> +
> +	num_bytes =3D get_occdata_length(occ_data);
> +
> +	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
> +
> +	if (num_bytes > OCC_DATA_MAX) {
> +		dev_err(&client->dev, "ERROR: OCC data length must be < 4KB\n");
> +		return -1;
> +	}
> +
> +	if (num_bytes <=3D 0) {
> +		dev_err(&client->dev, "ERROR: OCC data length is zero\n");
> +		return -1;
> +	}
These messages are a bit confusing. As I understand it, they occur if
the OCC sends back >4kB or 0 bytes. When I read the messages I first
thought the user was responsible for causing the error. Should the
messages say that the OCC has done something wrong?

> +
> +	for (i =3D 8; i < num_bytes + 8; i =3D i + 8)
> +		occ_getscomb(client, OCB_DATA, occ_data, i);
> +
> +	ret =3D parse_occ_response(client, occ_data, occ_resp);
> +
> +	return ret;
> +}
> +

> +MODULE_AUTHOR("Li Yi <shliyi@cn.ibm.com>");
Your module author name does not match your Git email address or your
signed-off-by line.
> +MODULE_DESCRIPTION("BMC OCC hwmon driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.6.4

Regards,
Daniel

>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
