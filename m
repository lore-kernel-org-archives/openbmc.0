Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PTnGF1hL"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bVhm5nByzF39x
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 00:47:04 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id c8-v6so14335780plo.9
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nOUqgsLalH2b3niyB618xYBjNP3sFmj4HBaC5HNiQmg=;
 b=PTnGF1hL1pc8hODZgOKbZFSI+0SPc1Teq4EGlaWtA6+bxrN7J4NZSkZ/KZQ19BNRai
 RnGWdtXJv1AL1x7ApZoU8TU1knUx5AHYOKG/aylHMqKv789xp+OpQTqtInMIa+5lhQZv
 Dcy+5iaTUWnbGDLhE+d/9rsEpBrwsThzXyEpHUJgA6ZWkpyGDDvmRKbvbuOk1AIc/Kzy
 KBQoOBT39e4s3y1vpYAmyLU2/7xFPGL/rHEgyA4bc4r2LIqh0/6Uh9z49mJ/Hzxx0afd
 HOztuT9qVqkuChba4J3D1l38eNFFgWp/N3xRp51USThCwKM0DV2x3hlxbaFYNqfEiO71
 7jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nOUqgsLalH2b3niyB618xYBjNP3sFmj4HBaC5HNiQmg=;
 b=YHUOS9/PO+/gZyCzC/NgtD+i2LExUQcj0nm3JfOsePmn/981qzl7ice94aE+Ow6Eql
 +MMBdg6l39QZg/53mTMhQ1UlDF1l2xEYHnZs7KtGMKU4oudyC9ZdYQwE+IfJpCNQIMo1
 QisvgNFR1EruIhJfWGLDpITZ290SpNb2OGU93VTyI0G8EyUfM2O+HVBtOjDfLAC/G3aX
 PFfJrz26hbusBd53TGy2keCEOK4eJOGg/4c/LBxOD5ulGtLjpDznq2ggiSbL61uBYIur
 bHqVr8BwUlQgFXvwGrEEFbiRDshjorldMPAbuyG6Y+wtJKIKZoD6htJhsOn3NkWTjs3v
 dN8w==
X-Gm-Message-State: ABuFfog/UBPokiEbBUy67AgojrDcp/AbCBokq5WOV7DDFvpUqY8ZdBV1
 uW/wjyoMeEOkJE4dLP68dx0=
X-Google-Smtp-Source: ACcGV62dBGXuZaF4MXwC9Z3R5ORP1u6OYnXblCyw8SonTe2+tPd4v5Xxs85FoJtTOiPjx5tOuSc8pQ==
X-Received: by 2002:a17:902:7203:: with SMTP id
 ba3-v6mr20037993plb.321.1539870420969; 
 Thu, 18 Oct 2018 06:47:00 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id o2-v6sm35079045pgi.62.2018.10.18.06.46.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 06:47:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (isl68137) add accessors to enable/disable AVS
 mode
To: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, Robert Lippert <rlippert@google.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20181017225622.8366-1-kunyi@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8c1fdf5d-0d54-da8b-a11d-0e74ea8ce974@roeck-us.net>
Date: Thu, 18 Oct 2018 06:46:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181017225622.8366-1-kunyi@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2018 13:47:05 -0000

On 10/17/2018 03:56 PM, Kun Yi wrote:
> From: Robert Lippert <rlippert@google.com>
> 
> This patch adds sysfs files avs(0|1)_enabled underneath the I2C device
> to control the AVS state of each rail and perform the appropriate
> hacks when enabling AVS.
> 
> The ISL68137 has issues wrt AVS operation mode that require it
> to be enabled/disabled at runtime.
> 

This is quite unusual. This would usually be handled in ROMMON/BIOS for
devices like this. What are those issues ?

> Additionally enabling AVS mode requires a hack to set the VOUT value
> before enabling to make sure that the device does not switch to
> an old cached AVS provided value and is instead in a "clean" state
> before booting.
> 
> Signed-off-by: Robert Lippert <rlippert@google.com>
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>   drivers/hwmon/pmbus/isl68137.c | 120 ++++++++++++++++++++++++++++++++-
>   1 file changed, 118 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 2a5322e4a286..94e2894f13bc 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -19,8 +19,11 @@
>   #include <linux/init.h>
>   #include <linux/err.h>
>   #include <linux/i2c.h>
> +#include <linux/hwmon-sysfs.h>
>   #include "pmbus.h"
>   
> +#define ISL68137_VOUT_AVS 0x30
> +
>   static struct pmbus_driver_info isl68137_info = {
>   	.pages = 2,
>   	.format[PSC_VOLTAGE_IN] = direct,
> @@ -56,10 +59,123 @@ static struct pmbus_driver_info isl68137_info = {
>   	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
>   };
>   
> +static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
> +					     int page,
> +					     char *buf)
> +{
> +	int val = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> +
> +	return sprintf(buf, "%d\n",
> +		       (val & ISL68137_VOUT_AVS) == ISL68137_VOUT_AVS ? 1 : 0);
> +}
> +
> +static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
> +					      int page,
> +					      const char *buf, size_t count)
> +{
> +	int rc, op_val;
> +
> +	if (count < 1) {
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
> +	switch (buf[0]) {
> +	case '0':
> +		op_val = 0;
> +		break;
> +	case '1':
> +		op_val = ISL68137_VOUT_AVS;
> +		break;
> +	default:
> +		rc = -EINVAL;
> +		goto out;
> +	}
> +
Please use kstrtobool().

> +	/*
> +	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is
> +	 * switched to PMBus control. Switching back to AVSBus control
> +	 * restores this persisted setpoint rather than re-initializing to
> +	 * PMBus VOUT_COMMAND. Writing VOUT_COMMAND first over PMBus before
> +	 * enabling AVS control is the workaround.
> +	 */
> +	if (op_val == ISL68137_VOUT_AVS) {
> +		int vout_command = pmbus_read_word_data(client, page,
> +							PMBUS_VOUT_COMMAND);
> +		rc = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
> +					   vout_command);
> +		if (rc)
> +			goto out;

Does it make a difference if bit 1 is set in the operation register ?

> +	}
> +
> +	rc = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
> +				    ISL68137_VOUT_AVS, op_val);
> +
> +out:
> +	return rc < 0 ? rc : count;
> +}
> +
> +static ssize_t isl68137_avs_enable_show(struct device *dev,
> +					struct device_attribute *devattr,
> +					char *buf)
> +{
> +	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
> +	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
> +
> +	return isl68137_avs_enable_show_page(client, attr->index, buf);
> +}
> +
> +static ssize_t isl68137_avs_enable_store(struct device *dev,
> +				struct device_attribute *devattr,
> +				const char *buf, size_t count)
> +{
> +	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
> +	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
> +
> +	return isl68137_avs_enable_store_page(client, attr->index, buf, count);
> +}
> +
> +static SENSOR_DEVICE_ATTR_2(avs0_enabled, 0644,
> +			    isl68137_avs_enable_show, isl68137_avs_enable_store,
> +			    0, 0);
> +static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
> +			    isl68137_avs_enable_show, isl68137_avs_enable_store,
> +			    0, 1);
> +

Why ATTR_2 ? That seems quite pointless.

I would suggest to use _enable as attribute name, but I understand this is POV,
so I won't insist on it.

> +static int isl68137_remove(struct i2c_client *client);
> +

Please move the remove function to this location.

>   static int isl68137_probe(struct i2c_client *client,
>   			  const struct i2c_device_id *id)
>   {
> -	return pmbus_do_probe(client, id, &isl68137_info);
> +	int rc;
> +
> +	rc = pmbus_do_probe(client, id, &isl68137_info);
> +	if (rc)
> +		return rc;
> +
> +	rc = device_create_file(&client->dev,
> +				&sensor_dev_attr_avs0_enabled.dev_attr);
> +	if (rc)
> +		goto out_fail;
> +	rc = device_create_file(&client->dev,
> +				&sensor_dev_attr_avs1_enabled.dev_attr);
> +	if (rc)
> +		goto out_fail;
> +
This creadtes the device files after the hwmon device is created,
which may confuse userspace if it is triggered by the creation of the
hwmon device. You might consider creating the device files before
registering the hwmon device. That makes removal on error a bit
more complex, though, so I'll leave it up to you.

> +	return rc;
> +
> +out_fail:
> +	isl68137_remove(client);
> +	return rc;
> +}
> +
> +static int isl68137_remove(struct i2c_client *client)
> +{
> +	device_remove_file(&client->dev,
> +			   &sensor_dev_attr_avs1_enabled.dev_attr);
> +	device_remove_file(&client->dev,
> +			   &sensor_dev_attr_avs0_enabled.dev_attr);
> +	return pmbus_do_remove(client);
>   }
>   
>   static const struct i2c_device_id isl68137_id[] = {
> @@ -75,7 +191,7 @@ static struct i2c_driver isl68137_driver = {
>   		   .name = "isl68137",
>   		   },
>   	.probe = isl68137_probe,
> -	.remove = pmbus_do_remove,
> +	.remove = isl68137_remove,
>   	.id_table = isl68137_id,
>   };
>   
> 
