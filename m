Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 558911A033D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 10:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SLkpeRBE; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 63so2188429pfe.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2016 15:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o31TIU1i0JvbZg+/YwtjRiEFQsSI1YhJ1XipSL99g8M=;
 b=SLkpeRBE5cLaJ4VhhichNg6+m5M5lpMCw6ebdwUvCDwlD2bIshMp2jCWhEgVaZYGvK
 1UVf+Wt7dxJv91mLhCQD09IPN1LGbLDviiKoeaWqsZBnBZrQIzuQJzn+/bfxIpA3yulI
 p27u5egmjLinoxa8cmZbiO2QorDR5LAu3Z19jir4qD98ixqaJJqbPhPbo3hxZhCn0M93
 ZmftK6UE8ImQOeF7Pg7zjrcOB3++zAo05XrAsskdzyad7w0DIVVLIbJrLXFYba21XapX
 IHA96YIdCOMKnt8zAFIATtVL+3PXa8lQ5usQuVtDxv09KzI0Rw33CEPWzIWKGpzRA0KA
 8Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o31TIU1i0JvbZg+/YwtjRiEFQsSI1YhJ1XipSL99g8M=;
 b=iXhA6JsY200e/rCug+EnLDU0CTtmStJBpsTGfGULSsGLkjuQx3xZTKxXqf/KEGj+Gi
 Gs2y5cJUeKxI+bLd/Sug8ZqOnIN+u9ahnHeKtYvJzJqoliRKv+SLy/u0WF9/rKdO2h8a
 +OHE2zfGe3C6jPBJ3q7RLL+E4qkfav5OpVkZkHiZe+5bl0gss4KsdylFV/saGoqdLsIt
 thGgMu4OEHMM2NK/DxCmsBdOXVYUMwqZFaetur6iAmNrnAHEUcWZ3vQapmWJQFWanEiH
 TpV02h5nsgE+3Htj1F4boTr20yct3YXNFYdmGnTd5sGceB4xGLfTzIUl79oP+g9w4jCh
 afnQ==
X-Gm-Message-State: AD7BkJKvLjHBv/JS969k4kyRP1PUDnoVzRMexGKElhzXGJ5DdAqzgxrAQCA0zhe9DMdzmg==
X-Received: by 10.98.68.209 with SMTP id m78mr28088772pfi.153.1457480314585;
 Tue, 08 Mar 2016 15:38:34 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s14sm7392525pfa.3.2016.03.08.15.38.32
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 08 Mar 2016 15:38:34 -0800 (PST)
Date: Wed, 9 Mar 2016 10:38:26 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: adamliyi@msn.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux v2 2/2] hwmon: Hide error message in OCC hwmon driver
Message-ID: <20160309103826.2b356b38@camb691>
In-Reply-To: <1456999831-12589-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456999831-12589-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456999831-12589-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Mar 2016 23:38:37 -0000

On Thu,  3 Mar 2016 04:10:31 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Yi Li <adamliyi@msn.com>
> 
> This patch fixed issue in: https://github.com/openbmc/openbmc/issues/191
> 
> User application will poll OCC when host is powered off. OCC can handle
> the poll request, but no sensor data will be responded. Currently OCC driver
> will report error message when reading sysfs hwmon sensor attribute in this case.
> The error message is harmless but is anoying.
> 
> This patch hides the error message. Reading sysfs hwmon attribute in this case
> will still get an error code, but no more error message.
> 

Hi Adam,

Patch looks good. I'm not super sure the "ERROR:" string is needed in front of
all the messages, I suspect it will be obvious. However I'm far more in favour
of consistency ("ERROR:" everywhere) and you've done that so its fine with me.

Just one question: You turned all the _err into _dbg except in one hunk for
set_user_powercap() where you used _info. Might be worth a mention in a comment
and/or in the commit message why that one is special.

Thanks,

Cyril

> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  drivers/hwmon/power8_occ_i2c.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/power8_occ_i2c.c b/drivers/hwmon/power8_occ_i2c.c
> index 37280a5..6352487c 100644
> --- a/drivers/hwmon/power8_occ_i2c.c
> +++ b/drivers/hwmon/power8_occ_i2c.c
> @@ -370,7 +370,7 @@ static int parse_occ_response(struct i2c_client *client,
>  
>  	/* check if the data is valid */
>  	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
> -		dev_err(&client->dev,
> +		dev_dbg(&client->dev,
>  			"ERROR: no SENSOR String in response\n");
>  		ret = -1;
>  		goto err;
> @@ -378,7 +378,7 @@ static int parse_occ_response(struct i2c_client *client,
>  
>  	sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
>  	if (sensor_block_num == 0) {
> -		dev_err(&client->dev, "ERROR: SENSOR block num is 0\n");
> +		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
>  		ret = -1;
>  		goto err;
>  	}
> @@ -526,7 +526,7 @@ static int parse_occ_response(struct i2c_client *client,
>  			}
>  
>  		} else {
> -			dev_err(&client->dev,
> +			dev_dbg(&client->dev,
>  				"ERROR: sensor type %s not supported\n",
>  				resp->blocks[b].sensor_type);
>  			ret = -1;
> @@ -617,13 +617,13 @@ static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
>  	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
>  
>  	if (num_bytes > OCC_DATA_MAX) {
> -		dev_err(&client->dev, "ERROR: OCC data length must be < 4KB\n");
> +		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
>  		ret = -EINVAL;
>  		goto out;
>  	}
>  
>  	if (num_bytes <= 0) {
> -		dev_err(&client->dev, "ERROR: OCC data length is zero\n");
> +		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
>  		ret = -EINVAL;
>  		goto out;
>  	}
> @@ -670,7 +670,7 @@ static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
>  
>  	ret = occ_update_device(dev);
>  	if (ret != 0) {
> -		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> +		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
>  		return NULL;
>  	}
>  
> @@ -1161,10 +1161,12 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
>  	val = cpu_to_le16(val);
>  	err = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
>  	if (err != 0) {
> -		dev_err(dev, "Set User Powercap: wrong return status: %x\n",
> +		dev_dbg(dev,
> +			"ERROR: Set User Powercap: wrong return status: %x\n",
>  			err);
>  		if (err == 0x13)
> -			dev_err(dev, "invalid powercap value: %x\n", val);
> +			dev_info(dev,
> +				"ERROR: set invalid powercap value: %x\n", val);
>  		return -EINVAL;
>  	}
>  	data->user_powercap = val;
> @@ -1219,7 +1221,7 @@ static int occ_create_hwmon_attribute(struct device *dev)
>  
>  	ret = occ_update_device(dev);
>  	if (ret != 0) {
> -		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
> +		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -1244,7 +1246,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
>  			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
>  				&occ_temp_attr_group[i]);
>  			if (ret) {
> -				dev_err(dev, "error create temp sysfs entry\n");
> +				dev_dbg(dev,
> +					"ERROR: cannot create sysfs entry\n");
>  				goto error;
>  			}
>  		}
> @@ -1258,7 +1261,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
>  			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
>  				&occ_freq_attr_group[i]);
>  			if (ret) {
> -				dev_err(dev, "error create freq sysfs entry\n");
> +				dev_dbg(dev,
> +					"ERROR: cannot create sysfs entry\n");
>  				goto error;
>  			}
>  		}
> @@ -1272,7 +1276,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
>  			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
>  				&occ_power_attr_group[i]);
>  			if (ret) {
> -				dev_err(dev, "error create power sysfs entry\n");
> +				dev_dbg(dev,
> +					"ERROR: cannot create sysfs entry\n");
>  				goto error;
>  			}
>  		}
> @@ -1286,7 +1291,8 @@ static int occ_create_hwmon_attribute(struct device *dev)
>  			ret = sysfs_create_group(&drv_data->hwmon_dev->kobj,
>  				&occ_caps_attr_group[i]);
>  			if (ret) {
> -				dev_err(dev, "error create caps sysfs entry\n");
> +				dev_dbg(dev,
> +					"ERROR: cannot create sysfs entry\n");
>  				goto error;
>  			}
>  		}
