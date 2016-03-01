Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 01E761A0008
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 14:45:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bgX5BGL6; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id w128so10064439pfb.2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 19:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fBULgnGir1y7I1wmg6CGy9xmzAFWw+K6qx0V2LhBuQw=;
 b=bgX5BGL6ywzmEQsGd6Qa6tbQ2QMjf6oqomOXzWFeGd1Z97KB0xkBz94/g8YT1UmWNR
 o+myeMKaFfdyMQcfUE9fR1/rl3NCgKCkBhzXLCy2mbC89Xqkcqmcq48GyOpySLH4U+dK
 qyv5VVzPcfgUmb3C4uSXdOU56XOM7hIez1xdnfd4yYlOTvuKJNHnXWJ0UH8ch3IOhbtw
 YdIQjkyHFnPZB4zV/4tnHZfY6Yt2GRanFveb1xpVSAJ8zoMy4AQxdRJJIjFVpFY4P9pZ
 5bNoQCA9uhl9oFY7hKj3/pu5CRnLur3g3zJU5luMhMzWNWbY7KVo3oZ2LqWZNWUkFqdm
 l+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fBULgnGir1y7I1wmg6CGy9xmzAFWw+K6qx0V2LhBuQw=;
 b=Sduw2eR5CqYH+ZdZ09h7ZQdJWq/5tiI8e++Pun05bXz7JG/vF/51X0XfuO3mE34Im8
 pQYvDI63frynne+6kpR7Oa5ZJf8zwJ+X6NxG2Ot3Y5mPrHUfu60xoZLjmbLdNKGBz3U+
 JcXaIgNiJVzH34Svab0CCRJTbDXN+7WebC3LDaKI5Qn6LRqAzpr7PeocjpjfU3Ko3+a1
 6XitcJ4YCPPrrm/R0BEi26ncqhzdJ+9ptEcO+Ujblu80KcckxKtHgb4jFk33H8RTk+DM
 FMiqUyVUvPxd/xMg7wvNxnjdahNh2vR6ra4AS/HvlD2ib9rvT+OJPUieB2e5UZRtx1rx
 Umeg==
X-Gm-Message-State: AD7BkJLzC67oLUeKB4BQZCsPxJZG4wgdSeveAGIGogZ+orAG74rTefy7yGPEPV6VGqUeuw==
X-Received: by 10.98.72.24 with SMTP id v24mr26963530pfa.15.1456803900218;
 Mon, 29 Feb 2016 19:45:00 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 74sm41240410pfs.33.2016.02.29.19.44.57
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 29 Feb 2016 19:44:59 -0800 (PST)
Date: Tue, 1 Mar 2016 14:44:51 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, <adamliyi@msn.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux] hwmon: fix occ hwmon driver compile warning message
Message-ID: <20160301144451.094f4da3@camb691>
In-Reply-To: <1456743642-23362-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456743642-23362-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456743642-23362-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 03:45:02 -0000

On Mon, 29 Feb 2016 05:00:42 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Yi Li <adamliyi@msn.com>
> 
> Fixed warning message when compiling occ hwmon driver.
> The issue is tracked by: https://github.com/openbmc/linux/issues/44
> 

Hi Adam,

I'm not sure what the accepted way of doing it is here, just thought I would
double check that __be16 is the accepted type here?

I wonder if you declared data as a void * and then had 8 16 and 32 accessors
for it? That might be nicer...

> Signed-off-by: Yi Li <adamliyi@msn.com>
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
