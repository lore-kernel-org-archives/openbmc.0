Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::243; helo=mail-pl0-x243.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CMV1Vd+5"; 
 dkim-atps=neutral
Received: from mail-pl0-x243.google.com (mail-pl0-x243.google.com
 [IPv6:2607:f8b0:400e:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynD0C2MjVzDqC2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 08:18:02 +1100 (AEDT)
Received: by mail-pl0-x243.google.com with SMTP id 1so2852348pla.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mn3fuugoq3IHDUXpnGXXIPA5vfI2jNJwAef9lpeSWEQ=;
 b=CMV1Vd+5Zv1cdv1v8xTRD67OK0WuUew0c+vymUONiPld4U8Fybg5Z7D28T7Zfi+YRr
 kCrhukAzCUFKYArj/ge19c18zhVvKlROidbwkRWBH4eu2BLPswJziHoMRQhIiaX5hchk
 zqvnmVxPfyTtW3rf6ufr4DOQfiEnCbZBcBVJ4By4wpnCa9KlayOhQb1lCqdGks2LYdtg
 ybM8YlpC/UUnJ5+MpzdSogeiWUkLzN0DDhR7CCeyvUA55bliFztf8ccUJ+dImJITOTVi
 HqSehKPN7dAvC/KWRP6cK+n1ypHV7rFO7fKvvq+CYPhE9+0EAJr5GSonOQbzNL3OIQ76
 Zixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mn3fuugoq3IHDUXpnGXXIPA5vfI2jNJwAef9lpeSWEQ=;
 b=XDfkcn+nNnwDneoQwkjfK8Kc88vEES8JKnqzjZY4/sKDKOdzcKgx+1T43//pS7H4ab
 Gb1xFMtQ5UOIP5SRNkFdTfKIcLwEtj3O1A2iemsEP+l3ilAAZhhVIZDzBiWE+8chmYZ9
 tdXalR7Ac0YIr2GSYTxMSow1FVM/kN8WXWqv1+DCpjoT4wmpxZU5097oU0dLgXnkQyxX
 gEWabBn/pT7pW4pIOWoCDV4kEvEkQNEa1hk8V/TlzG2vw/cZ5clTvoUWqKYjui5uAu6m
 FYPSQ7zCMqF5La7O9f/tZJdzZCcoZ3I5DYR9xTt1oa/B6JZMz0PqMZY4VRCyoaEReDvb
 RcyA==
X-Gm-Message-State: AJaThX68e+R96s3pZHukOycBdOSHajFAGFs9aPPWwcuCQ/nJP8OKDZh5
 dc8Fr+jUr7XIiobccXROmhQ=
X-Google-Smtp-Source: AGs4zMaJ5yHfnyHUAozaZ+j4GxWPsTpA+EmcLff35i9zEAL7jb5X/EW0riRAKa0w5/4BUKvV4tTxAg==
X-Received: by 10.159.216.142 with SMTP id s14mr217773plp.173.1511990280838;
 Wed, 29 Nov 2017 13:18:00 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id w9sm4665621pfk.16.2017.11.29.13.18.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Nov 2017 13:18:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Nov 2017 13:17:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v6,4/4] pmbus (max31785): Add dual tachometer support
Message-ID: <20171129211759.GA22504@roeck-us.net>
References: <49a5c6db7eb5dd1c53d326e0f7314e8f9e258997.1511152748.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a5c6db7eb5dd1c53d326e0f7314e8f9e258997.1511152748.git-series.andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 21:18:04 -0000

On Mon, Nov 20, 2017 at 03:12:06PM +1030, Andrew Jeffery wrote:
> The dual tachometer feature is implemented in hardware with a TACHSEL
> input to indicate the rotor under measurement, and exposed on the device
> by extending the READ_FAN_SPEED_1 word with two extra bytes*. The need
> to read the non-standard four-byte response leads to a cut-down
> implementation of i2c_smbus_xfer_emulated() included in the driver.
> Further, to expose the second rotor tachometer value to userspace the
> values are exposed through virtual pages. We re-route accesses to
> FAN_CONFIG_1_2 and READ_FAN_SPEED_1 on pages 23-28 (not defined by the
> hardware) to the same registers on pages 0-5, and with the latter command
> we extract the value from the second word of the four-byte response.
> 
> * The documentation recommends the slower rotor be associated with
> TACHSEL=0, which corresponds to the first word of the response. The
> TACHSEL=0 measurement is used by the controller's closed-loop fan
> management to judge target fan rate.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/max31785   |   8 +-
>  drivers/hwmon/pmbus/max31785.c | 147 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 152 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> index 7b0a0a8cdb6b..270c5f865261 100644
> --- a/Documentation/hwmon/max31785
> +++ b/Documentation/hwmon/max31785
> @@ -17,8 +17,9 @@ management with temperature and remote voltage sensing. Various fan control
>  features are provided, including PWM frequency control, temperature hysteresis,
>  dual tachometer measurements, and fan health monitoring.
>  
> -For dual rotor fan configuration, the MAX31785 exposes the slowest rotor of the
> -two in the fan[1-4]_input attributes.
> +For dual-rotor configurations the MAX31785A exposes the second rotor tachometer
> +readings in attributes fan[5-8]_input. By contrast the MAX31785 only exposes
> +the slowest rotor measurement, and does so in the fan[1-4]_input attributes.
>  
>  Usage Notes
>  -----------
> @@ -31,7 +32,8 @@ Sysfs attributes
>  
>  fan[1-4]_alarm		Fan alarm.
>  fan[1-4]_fault		Fan fault.
> -fan[1-4]_input		Fan RPM.
> +fan[1-8]_input		Fan RPM. On the MAX31785A, inputs 5-8 correspond to the
> +			second rotor of fans 1-4
>  fan[1-4]_target		Fan input target
>  
>  in[1-6]_crit		Critical maximum output voltage
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 8706a696c89a..bffab449be39 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -16,9 +16,79 @@
>  
>  enum max31785_regs {
>  	MFR_REVISION		= 0x9b,
> +	MFR_FAN_CONFIG		= 0xf1,
>  };
>  
> +#define MAX31785			0x3030
> +#define MAX31785A			0x3040
> +
> +#define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
> +
>  #define MAX31785_NR_PAGES		23
> +#define MAX31785_NR_FAN_PAGES		6
> +
> +static int max31785_read_byte_data(struct i2c_client *client, int page,
> +				   int reg)
> +{
> +	if (page < MAX31785_NR_PAGES)
> +		return -ENODATA;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		return -ENOTSUPP;
> +	case PMBUS_FAN_CONFIG_12:
> +		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
> +					    reg);
> +	}
> +
> +	return -ENODATA;
> +}
> +
> +static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
> +{
> +	if (page < MAX31785_NR_PAGES)
> +		return -ENODATA;
> +
> +	return -ENOTSUPP;
> +}
> +
> +static int max31785_read_long_data(struct i2c_client *client, int page,
> +				   int reg, u32 *data)
> +{
> +	unsigned char cmdbuf[1];
> +	unsigned char rspbuf[4];
> +	int rc;
> +
> +	struct i2c_msg msg[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = sizeof(cmdbuf),
> +			.buf = cmdbuf,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(rspbuf),
> +			.buf = rspbuf,
> +		},
> +	};
> +
> +	cmdbuf[0] = reg;
> +
> +	rc = pmbus_set_page(client, page);
> +	if (rc < 0)
> +		return rc;
> +
> +	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	if (rc < 0)
> +		return rc;
> +
> +	*data = (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
> +		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));
> +
> +	return rc;
> +}
>  
>  static int max31785_get_pwm(struct i2c_client *client, int page)
>  {
> @@ -62,9 +132,30 @@ static int max31785_get_pwm_mode(struct i2c_client *client, int page)
>  static int max31785_read_word_data(struct i2c_client *client, int page,
>  				   int reg)
>  {
> +	u32 val;
>  	int rv;
>  
>  	switch (reg) {
> +	case PMBUS_READ_FAN_SPEED_1:
> +		if (page < MAX31785_NR_PAGES)
> +			return -ENODATA;
> +
> +		rv = max31785_read_long_data(client, page - MAX31785_NR_PAGES,
> +					     reg, &val);
> +		if (rv < 0)
> +			return rv;
> +
> +		rv = (val >> 16) & 0xffff;
> +		break;
> +	case PMBUS_FAN_COMMAND_1:
> +		/*
> +		 * PMBUS_FAN_COMMAND_x is probed to judge whether or not to
> +		 * expose fan control registers.
> +		 *
> +		 * Don't expose fan_target attribute for virtual pages.
> +		 */
> +		rv = (page >= MAX31785_NR_PAGES) ? -ENOTSUPP : -ENODATA;
> +		break;
>  	case PMBUS_VIRT_PWM_1:
>  		rv = max31785_get_pwm(client, page);
>  		break;
> @@ -157,11 +248,15 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
>  #define MAX31785_VOUT_FUNCS \
>  	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT)
>  
> +#define MAX37185_NUM_FAN_PAGES 6
> +
>  static const struct pmbus_driver_info max31785_info = {
>  	.pages = MAX31785_NR_PAGES,
>  
>  	.write_word_data = max31785_write_word_data,
> +	.read_byte_data = max31785_read_byte_data,
>  	.read_word_data = max31785_read_word_data,
> +	.write_byte = max31785_write_byte,
>  
>  	/* RPM */
>  	.format[PSC_FAN] = direct,
> @@ -208,13 +303,46 @@ static const struct pmbus_driver_info max31785_info = {
>  	.func[22] = MAX31785_VOUT_FUNCS,
>  };
>  
> +static int max31785_configure_dual_tach(struct i2c_client *client,
> +					struct pmbus_driver_info *info)
> +{
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < MAX31785_NR_FAN_PAGES; i++) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {
> +			int virtual = MAX31785_NR_PAGES + i;
> +
> +			info->pages = virtual + 1;
> +			info->func[virtual] |= PMBUS_HAVE_FAN12;
> +			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int max31785_probe(struct i2c_client *client,
>  			  const struct i2c_device_id *id)
>  {
>  	struct device *dev = &client->dev;
>  	struct pmbus_driver_info *info;
> +	bool dual_tach = false;
>  	s64 ret;
>  
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
>  	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;
> @@ -225,6 +353,25 @@ static int max31785_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = i2c_smbus_read_word_data(client, MFR_REVISION);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret == MAX31785A) {
> +		dual_tach = true;
> +	} else if (ret == MAX31785) {
> +		if (!strcmp("max31785a", id->name))
> +			dev_warn(dev, "Expected max3175a, found max31785: cannot provide secondary tachometer readings\n");
> +	} else {
> +		return -ENODEV;
> +	}
> +
> +	if (dual_tach) {
> +		ret = max31785_configure_dual_tach(client, info);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	return pmbus_do_probe(client, id, info);
>  }
>  
