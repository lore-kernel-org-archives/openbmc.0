Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46A251A0032
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 11:51:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oGAkX0kU; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 184so2288833pff.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2016 16:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLQDh7EgleUydd/jgoIXyJKsa0/Kx4X1yPebxOQ2msg=;
 b=oGAkX0kU6rwaRLxLIxeaZDEJmHo9Gy5KjxKJjoTbD895J/kHph5fhy3ZTmUOXY5Jti
 8FEHrEp/rqd8Cz4Cw9BdnYwMjuoykGsdb64GeyaMfuWyNPHZxFmkiR6Scl3QOp9Gqq7K
 rn0qOD1pM0sCPk9pGOfj1SHkqdjjHZiWHhUr5bPklvKolk8hotdu9uQvISxSL4FgLzvt
 vYH6wj/y8tpTCuSritKMnTNmbQroP3l/3akUqA/0tCS0XyeiiuYoK5hKBTlkViPsPSbs
 wrV0VassLTfKix7jot5p8NF177Y5zQR/SArJ2ao+BclXQjLkJZufLtIpCpNbfDE6gXEX
 yyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLQDh7EgleUydd/jgoIXyJKsa0/Kx4X1yPebxOQ2msg=;
 b=RaQICVwOsYRauVJfPaCihJY0JCXOsjmM7y6h96CakguEQLutIl7xDacD+54zkDW2QR
 PgOH0/lFFNZIX8Ruzs5mIjsd0OpkmWHycXRKTGR4hiiEwMHGwr5eycFCI94QmL2IBpnk
 u3y+zKwLSjXxV274p2lm1PzbGXSiXMvFnncJjGcqbCS9LCu/izUGw077378pph3EttTf
 cvrBVvqdJdIBYbWirKGThXlBv2JiyVqzq9RUOs3nl0zPaMdz4uWt4jXY9w0yaThcpbpg
 /KX2abhmk5j/31pTs9s7piwpifQuRKxAJ1V7d7ZLq4GpQQoOVwBrJkCqiH5zHhHl3ru4
 tgww==
X-Gm-Message-State: AD7BkJIjbxOK6yQPdUDnXG00t3eKmPGYGDduKqa/vCffg0ueBA+uXcdl84cRV/1DkWmP0Q==
X-Received: by 10.98.89.22 with SMTP id n22mr46357884pfb.55.1457484702344;
 Tue, 08 Mar 2016 16:51:42 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 23sm7566139pfs.34.2016.03.08.16.51.39
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 08 Mar 2016 16:51:41 -0800 (PST)
Date: Wed, 9 Mar 2016 11:51:33 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: adamliyi@msn.com, joel@jms.id.au
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux v2 1/2] hwmon: fix occ hwmon driver compile
 warning message
Message-ID: <20160309115133.27b2291e@camb691>
In-Reply-To: <1456999831-12589-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456999831-12589-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456999831-12589-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 09 Mar 2016 00:51:47 -0000

On Thu,  3 Mar 2016 04:10:30 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Yi Li <adamliyi@msn.com>
> 
> Fixed warning message when compiling occ hwmon driver.
> The issue is tracked by: https://github.com/openbmc/linux/issues/44
> 
> Signed-off-by: Yi Li <adamliyi@msn.com>

Hi Yi,

Sorry for not responding to you on V1, in future don't hesitate to poke me when
I get too sidetracked.

What I'm sort of talking about for declaring data void * is that you can have
accessors which will allow you to either avoid the messy looking cast or hide
it in one place.

This is the kind of thing I'm talking about (I got talked out of void * ing
everything), I haven't compiled this, just an example:

diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
index c9c70d1..edf35fd 100644
--- a/drivers/hwmon/power8_occ_i2c.c
+++ b/drivers/hwmon/power8_occ_i2c.c
@@ -351,6 +351,21 @@ static inline uint16_t get_occdata_length(uint8_t *data)
        return be16_to_cpup(&data[RESP_DATA_LENGTH]);
 }
 
+static uint8_t get_occdata_u8(uint8_t *data)
+{
+       return *data;
+}
+
+static uint16_t get_occdata_u16(uint8_t *data)
+{
+       return be16_to_cpup((const __be16 *)data);
+}
+
+static uint32_t get_occdata_u32(uint8_t *data)
+{
+       return be32_to_cpup((const __be32 *)data);
+}
+
 static int parse_occ_response(struct i2c_client *client,
                uint8_t *data, struct occ_response *resp)
 {
@@ -376,7 +391,7 @@ static int parse_occ_response(struct i2c_client *client,
                goto err;
        }
 
-       sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
+       sensor_block_num = get_occdata_u8(&data[SENSOR_BLOCK_NUM_OFFSET]);
        if (sensor_block_num == 0) {
                dev_err(&client->dev, "ERROR: SENSOR block num is 0\n");
                ret = -1;
@@ -403,9 +418,9 @@ static int parse_occ_response(struct i2c_client *client,
        for (b = 0; b < sensor_block_num; b++) {
                /* 8-byte sensor block head */
                strncpy(sensor_type, &data[dnum], 4);
-               sensor_format = data[dnum+5];
-               sensor_length = data[dnum+6];
-               num_of_sensors = data[dnum+7];
+               sensor_format = get_occdata_u8(&data[dnum + 5]);
+               sensor_length = get_occdata_u8(&data[dnum + 6]);
+               num_of_sensors = get_occdata_u8(&data[dnum + 7]);
                dnum = dnum + 8;
 
                dev_dbg(&client->dev,
@@ -421,8 +436,8 @@ static int parse_occ_response(struct i2c_client *client,
                        resp->freq_block_id = b;
                        for (s = 0; s < num_of_sensors; s++) {
                                f_sensor = &resp->blocks[b].sensor[s];
-                               f_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-                               f_sensor->value = be16_to_cpup(&data[dnum+2]);
+                               f_sensor->sensor_id = get_occdata_u16(&data[dnum]);
+                               f_sensor->value = get_occdata_u16(&data[dnum + 2]); 
                                dev_dbg(&client->dev,
                                        "sensor[%d]-[%d]: id: %u, value: %u\n",
                                        b, s, f_sensor->sensor_id,
@@ -438,8 +453,8 @@ static int parse_occ_response(struct i2c_client *client,
                        resp->temp_block_id = b;
                        for (s = 0; s < num_of_sensors; s++) {
                                t_sensor = &resp->blocks[b].sensor[s];
-                               t_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-                               t_sensor->value = be16_to_cpup(&data[dnum+2]);
+                               t_sensor->sensor_id = get_occdata_u16(&data[dnum]);
+                               t_sensor->value = get_occdata_u16(&data[dnum + 2]); 
                                dev_dbg(&client->dev,
                                        "sensor[%d]-[%d]: id: %u, value: %u\n",
                                        b, s, t_sensor->sensor_id,
@@ -455,12 +470,12 @@ static int parse_occ_response(struct i2c_client *client,
                        resp->power_block_id = b;
                        for (s = 0; s < num_of_sensors; s++) {
                                p_sensor = &resp->blocks[b].power[s];
-                               p_sensor->sensor_id = be16_to_cpup(&data[dnum]);
+                               p_sensor->sensor_id = get_occdata_u16(&data[dnum]); 
                                p_sensor->update_tag =
-                                       be32_to_cpup(&data[dnum+2]);
+                                       get_occdata_u32(&data[dnum + 2]);
                                p_sensor->accumulator =
-                                       be32_to_cpup(&data[dnum+6]);
-                               p_sensor->value = be16_to_cpup(&data[dnum+10]);
+                                       get_occdata_u32(&data[dnum + 6]);
+                               p_sensor->value = get_occdata_u16(&data[dnum + 10]);


Please note the spaces around the '+', I believe the Linux style guide says
there should be spaces.

As I was doing this I thought I'd try to address the problem with incrementing
data. Not really sure this is necessary... might be too much... maybe Joel can
chime in here:

diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
index c9c70d1..27b284f 100644
--- a/drivers/hwmon/power8_occ_i2c.c
+++ b/drivers/hwmon/power8_occ_i2c.c
@@ -351,6 +351,32 @@ static inline uint16_t get_occdata_length(uint8_t *data)
        return be16_to_cpup(&data[RESP_DATA_LENGTH]);
 }
 
+static void inc_occdata(uint8_t **update, int amount)
+{
+       *update = (*update) + amount;
+}
+
+static uint8_t get_occdata_u8(uint8_t **data)
+{
+       uint8_t val = **data;
+       *data = (*data) + sizeof(uint8_t);
+       return val;
+}
+
+static uint16_t get_occdata_u16(uint8_t **data)
+{
+       const __be16_t val = *((const __be16 *)*data);
+       *data = (*data) + sizeof(uint16_t);
+       return be16_to_cpu(val);
+}
+
+static uint32_t get_occdat_u32(uint8_t **data)
+{
+       const __be32 val = *((const __be32 *)*data);
+       *data = (*data) + sizeof(uint32_t);
+       return be32_to_cpu(val);
+}
+
 static int parse_occ_response(struct i2c_client *client,
                uint8_t *data, struct occ_response *resp)
 {
@@ -400,13 +426,15 @@ static int parse_occ_response(struct i2c_client *client,
 
        dev_dbg(&client->dev, "Reading %d sensor blocks\n",
                resp->header.sensor_block_num);
+
+       inc_occdata(&data, dnum);
        for (b = 0; b < sensor_block_num; b++) {
                /* 8-byte sensor block head */
                strncpy(sensor_type, &data[dnum], 4);
-               sensor_format = data[dnum+5];
-               sensor_length = data[dnum+6];
-               num_of_sensors = data[dnum+7];
-               dnum = dnum + 8;
+               inc_occdata(&data, 5);
+               sensor_format = get_occdata_u8(&data);
+               sensor_length = get_occdata_u8(&data);
+               num_of_sensors = get_occdata_u8(&data);
 
                dev_dbg(&client->dev,
                        "sensor block[%d]: type: %s, num_of_sensors: %d\n",
@@ -421,13 +449,18 @@ static int parse_occ_response(struct i2c_client *client,
                        resp->freq_block_id = b;
                        for (s = 0; s < num_of_sensors; s++) {
                                f_sensor = &resp->blocks[b].sensor[s];
-                               f_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-                               f_sensor->value = be16_to_cpup(&data[dnum+2]);
+                               f_sensor->sensor_id = get_occdata_u16(&data);
+                               f_sensor->value = get_occdata_u16(&data);
                                dev_dbg(&client->dev,
                                        "sensor[%d]-[%d]: id: %u, value: %u\n",
                                        b, s, f_sensor->sensor_id,
                                        f_sensor->value);
-                               dnum = dnum + sensor_length;
+                               /*
+                                * Is sensor_length going to be 4 here? Should this be
+                                * double checked?
+                                * If not then (assuming it can't be LESS than 4...):
+                                * int_occdata(&data, sensor_length - 4);
+                                */
                        }
                } else if (strncmp(sensor_type, "TEMP", 4) == 0) {
                        ret = occ_renew_sensor(resp, sensor_length,
@@ -438,13 +471,13 @@ static int parse_occ_response(struct i2c_client *client,
                        resp->temp_block_id = b;
                        for (s = 0; s < num_of_sensors; s++) {
                                t_sensor = &resp->blocks[b].sensor[s];
-                               t_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-                               t_sensor->value = be16_to_cpup(&data[dnum+2]);
+                               t_sensor->sensor_id = get_occdata_u16(&data);
+                               t_sensor->value = get_occdata_u16(&data);
                                dev_dbg(&client->dev,
                                        "sensor[%d]-[%d]: id: %u, value: %u\n",
                                        b, s, t_sensor->sensor_id,
                                        t_sensor->value);
-                               dnum = dnum + sensor_length;
+                               /* See previous comment block */
                        }
                } else if (strncmp(sensor_type, "POWR", 4) == 0) {
                        ret = occ_renew_sensor(resp, sensor_length,
@@ -455,19 +488,19 @@ static int parse_occ_response(struct i2c_client *client,
                        resp->power_block_id = b;
                        for (s = 0; s < num_of_sensors; s++) {
                                p_sensor = &resp->blocks[b].power[s];
-                               p_sensor->sensor_id = be16_to_cpup(&data[dnum]);
-                               p_sensor->update_tag =
-                                       be32_to_cpup(&data[dnum+2]);
-                               p_sensor->accumulator =
-                                       be32_to_cpup(&data[dnum+6]);
-                               p_sensor->value = be16_to_cpup(&data[dnum+10]);
+                               p_sensor->sensor_id = get_occdata_u16(&data);
+                               p_sensor->update_tag = get_occdata_u32(&data);
+                               p_sensor->accumulator = get_occdata_u32(&data);
+                               p_sensor->value = get_occdata_u16(&data);
 
                                dev_dbg(&client->dev,
                                        "sensor[%d]-[%d]: id: %u, value: %u\n",
                                        b, s, p_sensor->sensor_id,
                                        p_sensor->value);
-
-                               dnum = dnum + sensor_length;
+                               /*
+                                * See previous comment block... although this time it
+                                * would be 12?
+                                */
                        }
                } else if (strncmp(sensor_type, "CAPS", 4) == 0) {
                        ret = occ_renew_sensor(resp, sensor_length,

> ---
>  drivers/hwmon/power8_occ_i2c.c | 54 ++++++++++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
> index c9c70d1..37280a5 100644
> --- a/drivers/hwmon/power8_occ_i2c.c
> +++ b/drivers/hwmon/power8_occ_i2c.c
> @@ -348,7 +348,7 @@ err:
>  
>  static inline uint16_t get_occdata_length(uint8_t *data)
>  {
> -	return be16_to_cpup(&data[RESP_DATA_LENGTH]);
> +	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
>  }
>  
>  static int parse_occ_response(struct i2c_client *client,
> @@ -421,8 +421,11 @@ static int parse_occ_response(struct i2c_client *client,
>  			resp->freq_block_id = b;
>  			for (s = 0; s < num_of_sensors; s++) {
>  				f_sensor = &resp->blocks[b].sensor[s];
> -				f_sensor->sensor_id = be16_to_cpup(&data[dnum]);
> -				f_sensor->value = be16_to_cpup(&data[dnum+2]);
> +				f_sensor->sensor_id =
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
> +				f_sensor->value = be16_to_cpup((const __be16 *)
> +							&data[dnum+2]);
>  				dev_dbg(&client->dev,
>  					"sensor[%d]-[%d]: id: %u, value: %u\n",
>  					b, s, f_sensor->sensor_id,
> @@ -438,8 +441,11 @@ static int parse_occ_response(struct i2c_client *client,
>  			resp->temp_block_id = b;
>  			for (s = 0; s < num_of_sensors; s++) {
>  				t_sensor = &resp->blocks[b].sensor[s];
> -				t_sensor->sensor_id = be16_to_cpup(&data[dnum]);
> -				t_sensor->value = be16_to_cpup(&data[dnum+2]);
> +				t_sensor->sensor_id =
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
> +				t_sensor->value = be16_to_cpup((const __be16 *)
> +							&data[dnum+2]);
>  				dev_dbg(&client->dev,
>  					"sensor[%d]-[%d]: id: %u, value: %u\n",
>  					b, s, t_sensor->sensor_id,
> @@ -455,12 +461,17 @@ static int parse_occ_response(struct i2c_client *client,
>  			resp->power_block_id = b;
>  			for (s = 0; s < num_of_sensors; s++) {
>  				p_sensor = &resp->blocks[b].power[s];
> -				p_sensor->sensor_id = be16_to_cpup(&data[dnum]);
> +				p_sensor->sensor_id =
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
>  				p_sensor->update_tag =
> -					be32_to_cpup(&data[dnum+2]);
> +					be32_to_cpup((const __be32 *)
> +							&data[dnum+2]);
>  				p_sensor->accumulator =
> -					be32_to_cpup(&data[dnum+6]);
> -				p_sensor->value = be16_to_cpup(&data[dnum+10]);
> +					be32_to_cpup((const __be32 *)
> +							&data[dnum+6]);
> +				p_sensor->value = be16_to_cpup((const __be16 *)
> +							&data[dnum+10]);
>  
>  				dev_dbg(&client->dev,
>  					"sensor[%d]-[%d]: id: %u, value: %u\n",
> @@ -479,17 +490,23 @@ static int parse_occ_response(struct i2c_client *client,
>  			for (s = 0; s < num_of_sensors; s++) {
>  				c_sensor = &resp->blocks[b].caps[s];
>  				c_sensor->curr_powercap =
> -					be16_to_cpup(&data[dnum]);
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum]);
>  				c_sensor->curr_powerreading =
> -					be16_to_cpup(&data[dnum+2]);
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+2]);
>  				c_sensor->norm_powercap =
> -					be16_to_cpup(&data[dnum+4]);
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+4]);
>  				c_sensor->max_powercap =
> -					be16_to_cpup(&data[dnum+6]);
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+6]);
>  				c_sensor->min_powercap =
> -					be16_to_cpup(&data[dnum+8]);
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+8]);
>  				c_sensor->user_powerlimit =
> -					be16_to_cpup(&data[dnum+10]);
> +					be16_to_cpup((const __be16 *)
> +							&data[dnum+10]);
>  
>  				dnum = dnum + sensor_length;
>  				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
> @@ -539,6 +556,7 @@ static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
>  	uint16_t checksum;
>  	int i;
>  
> +	length = cpu_to_le16(length);
>  	cmd1 = (seq << 24) | (type << 16) | length;
>  	memcpy(&cmd2, data, length);
>  	cmd2 <<= ((4 - length) * 8);
> @@ -1132,7 +1150,6 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
>  	struct occ_drv_data *data = dev_get_drvdata(dev);
>  	struct i2c_client *client = data->client;
>  	uint16_t val;
> -	uint32_t powercap;
>  	uint8_t resp[8];
>  	int err;
>  
> @@ -1140,8 +1157,9 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
>  	if (err)
>  		return err;
>  
> -	dev_dbg(dev, "set user powercap to: %lu\n", val);
> -	err = occ_send_cmd(client, 0, 0x22, 2, &val, resp);
> +	dev_dbg(dev, "set user powercap to: %u\n", val);
> +	val = cpu_to_le16(val);
> +	err = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
>  	if (err != 0) {
>  		dev_err(dev, "Set User Powercap: wrong return status: %x\n",
>  			err);
