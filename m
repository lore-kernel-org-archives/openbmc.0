Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PXfCwusR"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynCtY2vrgzDr8x
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 08:13:09 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id p84so2128893pfd.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 13:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rfwm1ldv2srAEGc7bj5oG/HIqorrXapmGPzpOM3wfkk=;
 b=PXfCwusR0Vx11y7TtFwGlAVSRt0OZcokeLAS2rCkkDNKwClUvx1DuhWofRzvLV+fWl
 alblS63mhvdtuVMsCfP7tLeLznCb6DMZZgVW42x5JIm0q7qGWD0y0z34o0ewlrejJToU
 yKiIYiIe2X1LU9niJfUDbylo6LmcVPIDR0tf42dR1v+32lT7FkVYoUC06e5QyJ1IJIM/
 fmaLOHppxZ/WwJbve5qLerFS5TP2cfPYUAuvLWfoyJLRFP2ob00BZQMZKJWbpUJ0/baB
 DWfsMuazUXCksoxKzz/NPHwHEv0ruMyoatz/w91Am1BXirejr86uTX+/RBcL82GyX/o5
 8KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=rfwm1ldv2srAEGc7bj5oG/HIqorrXapmGPzpOM3wfkk=;
 b=qWG5p5hTRQJKhzeUy6nN9C43L1vWiBVXWmjj3m5+ZMYeSKsSntFSzWgwWJa+3o4Lwn
 AuoGNixx4NhMLCINFx9u/Tw/kz6GCcrzXxbgNjelMlhCTWIGIgCx37Q3/fZkLgWi1xV+
 oQ0ztf+RqXHL4UYr0wReV0zfRCeR3VtqoDKUKGMuZVzpG3IdZyqrv949AVupsILkOpuR
 bQTYHCSZQDdeJ7ZUf65NC912Z60AoJBQfOuEgC+73TQefAbgVyq8bAC3gv0q86SwIs02
 knSIp2uIqZgVPQur+7/oUkARqpj8i3/ylK7RYvfZWz5SXIaTBica26r9lmR4LYsdYBOC
 5SOw==
X-Gm-Message-State: AJaThX5tBJJFFBq9MTnqhslb53ybpUS2/bcfZuGmjUZ82aKLNsHTueNU
 Qa7RV51RnrfNOGHP7wN0luw=
X-Google-Smtp-Source: AGs4zMZXx8S3aFBG54CEZjXCtHLDzL8KsgjzjR8S3P3qGumWtmAk/Ft5VaFCJerCKRGkLI/ujYmUTQ==
X-Received: by 10.98.130.4 with SMTP id w4mr4246822pfd.238.1511989987269;
 Wed, 29 Nov 2017 13:13:07 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id c79sm4979318pfj.49.2017.11.29.13.13.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Nov 2017 13:13:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Nov 2017 13:13:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v6,2/4] pmbus (max31785): Add fan control
Message-ID: <20171129211305.GA22082@roeck-us.net>
References: <8c06a1a1fcb67745fb9015b5c3f69f6f12ae0b0f.1511152748.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c06a1a1fcb67745fb9015b5c3f69f6f12ae0b0f.1511152748.git-series.andrew@aj.id.au>
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
X-List-Received-Date: Wed, 29 Nov 2017 21:13:09 -0000

On Mon, Nov 20, 2017 at 03:12:04PM +1030, Andrew Jeffery wrote:
> The implementation makes use of the new fan control virtual registers
> exposed by the pmbus core. It mixes use of the default implementations
> with some overrides via the read/write handlers to handle FAN_COMMAND_1
> on the MAX31785, whose definition breaks the value range into various
> control bands dependent on RPM or PWM mode.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/max31785   |   7 ++-
>  drivers/hwmon/pmbus/max31785.c | 138 +++++++++++++++++++++++++++++++++-
>  2 files changed, 144 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> index 45fb6093dec2..7b0a0a8cdb6b 100644
> --- a/Documentation/hwmon/max31785
> +++ b/Documentation/hwmon/max31785
> @@ -32,6 +32,7 @@ Sysfs attributes
>  fan[1-4]_alarm		Fan alarm.
>  fan[1-4]_fault		Fan fault.
>  fan[1-4]_input		Fan RPM.
> +fan[1-4]_target		Fan input target
>  
>  in[1-6]_crit		Critical maximum output voltage
>  in[1-6]_crit_alarm	Output voltage critical high alarm
> @@ -44,6 +45,12 @@ in[1-6]_max_alarm	Output voltage high alarm
>  in[1-6]_min		Minimum output voltage
>  in[1-6]_min_alarm	Output voltage low alarm
>  
> +pwm[1-4]		Fan target duty cycle (0..255)
> +pwm[1-4]_enable		0: Full-speed
> +			1: Manual PWM control
> +			2: Automatic PWM (tach-feedback RPM fan-control)
> +			3: Automatic closed-loop (temp-feedback fan-control)
> +
>  temp[1-11]_crit		Critical high temperature
>  temp[1-11]_crit_alarm	Chip temperature critical high alarm
>  temp[1-11]_input	Measured temperature
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 9313849d5160..8706a696c89a 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -20,8 +20,136 @@ enum max31785_regs {
>  
>  #define MAX31785_NR_PAGES		23
>  
> +static int max31785_get_pwm(struct i2c_client *client, int page)
> +{
> +	int rv;
> +
> +	rv = pmbus_get_fan_rate_device(client, page, 0, percent);
> +	if (rv < 0)
> +		return rv;
> +	else if (rv >= 0x8000)
> +		return 0;
> +	else if (rv >= 0x2711)
> +		return 0x2710;
> +
> +	return rv;
> +}
> +
> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
> +{
> +	int config;
> +	int command;
> +
> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> +	if (config < 0)
> +		return config;
> +
> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> +	if (command < 0)
> +		return command;
> +
> +	if (config & PB_FAN_1_RPM)
> +		return (command >= 0x8000) ? 3 : 2;
> +
> +	if (command >= 0x8000)
> +		return 3;
> +	else if (command >= 0x2711)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static int max31785_read_word_data(struct i2c_client *client, int page,
> +				   int reg)
> +{
> +	int rv;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_PWM_1:
> +		rv = max31785_get_pwm(client, page);
> +		break;
> +	case PMBUS_VIRT_PWM_ENABLE_1:
> +		rv = max31785_get_pwm_mode(client, page);
> +		break;
> +	default:
> +		rv = -ENODATA;
> +		break;
> +	}
> +
> +	return rv;
> +}
> +
> +static inline u32 max31785_scale_pwm(u32 sensor_val)
> +{
> +	/*
> +	 * The datasheet describes the accepted value range for manual PWM as
> +	 * [0, 0x2710], while the hwmon pwmX sysfs interface accepts values in
> +	 * [0, 255]. The MAX31785 uses DIRECT mode to scale the FAN_COMMAND
> +	 * registers and in PWM mode the coefficients are m=1, b=0, R=2. The
> +	 * important observation here is that 0x2710 == 10000 == 100 * 100.
> +	 *
> +	 * R=2 (== 10^2 == 100) accounts for scaling the value provided at the
> +	 * sysfs interface into the required hardware resolution, but it does
> +	 * not yet yield a value that we can write to the device (this initial
> +	 * scaling is handled by pmbus_data2reg()). Multiplying by 100 below
> +	 * translates the parameter value into the percentage units required by
> +	 * PMBus, and then we scale back by 255 as required by the hwmon pwmX
> +	 * interface to yield the percentage value at the appropriate
> +	 * resolution for hardware.
> +	 */
> +	return (sensor_val * 100) / 255;
> +}
> +
> +static int max31785_pwm_enable(struct i2c_client *client, int page,
> +				    u16 word)
> +{
> +	int config = 0;
> +	int rate;
> +
> +	switch (word) {
> +	case 0:
> +		rate = 0x7fff;
> +		break;
> +	case 1:
> +		rate = pmbus_get_fan_rate_cached(client, page, 0, percent);
> +		if (rate < 0)
> +			return rate;
> +		rate = max31785_scale_pwm(rate);
> +		break;
> +	case 2:
> +		config = PB_FAN_1_RPM;
> +		rate = pmbus_get_fan_rate_cached(client, page, 0, rpm);
> +		if (rate < 0)
> +			return rate;
> +		break;
> +	case 3:
> +		rate = 0xffff;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return pmbus_update_fan(client, page, 0, config, PB_FAN_1_RPM, rate);
> +}
> +
> +static int max31785_write_word_data(struct i2c_client *client, int page,
> +				    int reg, u16 word)
> +{
> +	switch (reg) {
> +	case PMBUS_VIRT_PWM_1:
> +		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
> +					max31785_scale_pwm(word));
> +	case PMBUS_VIRT_PWM_ENABLE_1:
> +		return max31785_pwm_enable(client, page, word);
> +	default:
> +		break;
> +	}
> +
> +	return -ENODATA;
> +}
> +
>  #define MAX31785_FAN_FUNCS \
> -	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12)
> +	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_PWM12)
>  
>  #define MAX31785_TEMP_FUNCS \
>  	(PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
> @@ -32,11 +160,19 @@ enum max31785_regs {
>  static const struct pmbus_driver_info max31785_info = {
>  	.pages = MAX31785_NR_PAGES,
>  
> +	.write_word_data = max31785_write_word_data,
> +	.read_word_data = max31785_read_word_data,
> +
>  	/* RPM */
>  	.format[PSC_FAN] = direct,
>  	.m[PSC_FAN] = 1,
>  	.b[PSC_FAN] = 0,
>  	.R[PSC_FAN] = 0,
> +	/* PWM */
> +	.format[PSC_PWM] = direct,
> +	.m[PSC_PWM] = 1,
> +	.b[PSC_PWM] = 0,
> +	.R[PSC_PWM] = 2,
>  	.func[0] = MAX31785_FAN_FUNCS,
>  	.func[1] = MAX31785_FAN_FUNCS,
>  	.func[2] = MAX31785_FAN_FUNCS,
