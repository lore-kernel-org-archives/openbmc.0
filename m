Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eKLQLqxC"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVJrX6Lq9zDr5J
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 02:04:44 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id p87so5836418pfj.3
 for <openbmc@lists.ozlabs.org>; Sun, 05 Nov 2017 07:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t11jIGrwpM/57xJH5RO+0WOelY39Q0wEvnWetOTgpXo=;
 b=eKLQLqxCsSIMWR5tkmdqSOfXScBNZZD8fF+PB+gSL0lYULkoHcwiUUxHOVADlawB6Y
 0NqSL5sVZ7Vd/Oyeli+P64soDeH4JKk7ZcDxUkRYmhWaKhVyfKQeTnOSTUK4tnSTM2W5
 kIwRHAlyP8dvaDNcLBEZkrYg1Kf7NDS02M319ToQDJO2+q9/rTwVc3xagldWBwZV4DEb
 4Y8PdeGe0Q7PfPvcfcCS2dIKzX0JNo6r0y6JFIW2uuz+Jfkro1JwSASbk0b9sT3NqnoF
 geYNXQQN/bNFzT/SZr/vUbcY8DAW/OEZTrBH9vRff7QwbbUnXASds46ExKYzn55eW+Ov
 zWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=t11jIGrwpM/57xJH5RO+0WOelY39Q0wEvnWetOTgpXo=;
 b=ts5uKO45AAJMtkbpf2Q/7cwbZW35jC5p/PO8ji3kY9RB6cDqOUMzDhRwkPq4G9QLGl
 VcHFFMYC/C1CrX2eI+oZZEugfiZ4EdqtQn9RNg6v/Vzys9hPHHRDHYKaNXn/FzNS+xgm
 h+OWF6CEmzpSaUA01lCHnN8eUcsPS6EB7YfW1bODmq9inWFPjSNJ25ulHfq+09+RjILY
 D/ZXy/9jqt/BUQRNDoZ/qYmo099URDJ3CJH4gKwlXtxOcy6nUE3sGkIeQrX6TuAE8/gu
 0uyCiagKJgvKo5TtgA1WffX3o8HrYnw/OkWH4dSn6Jy3Q70872hsADFyj6M2rVoRL32g
 rbFw==
X-Gm-Message-State: AMCzsaX1D6Xpauobuuqc3qN8NdQkxO4socn6pAzyYg+AH0++UdmvshsB
 SHJwWcI6GieuesOrLgfAG+Q=
X-Google-Smtp-Source: ABhQp+T79UUWXk4KK5odtWE4IV2n0kBjb6+VRdx7CzYDYV1uA0dVDcz++kP2I9j/dwzC3I7PTQ+7jA==
X-Received: by 10.98.95.197 with SMTP id t188mr13685672pfb.230.1509894282569; 
 Sun, 05 Nov 2017 07:04:42 -0800 (PST)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id t25sm17695886pfh.67.2017.11.05.07.04.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Nov 2017 07:04:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 5 Nov 2017 07:04:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4,4/6] pmbus: max31785: Add fan control
Message-ID: <20171105150441.GA26191@roeck-us.net>
References: <20171103045306.26448-5-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-5-andrew@aj.id.au>
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
X-List-Received-Date: Sun, 05 Nov 2017 15:04:45 -0000

On Fri, Nov 03, 2017 at 03:53:04PM +1100, Andrew Jeffery wrote:
> The implementation makes use of the new fan control virtual registers
> exposed by the pmbus core. It mixes use of the default implementations
> with some overrides via the read/write handlers to handle FAN_COMMAND_1
> on the MAX31785, whose definition breaks the value range into various
> control bands dependent on RPM or PWM mode.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/max31785   |   4 ++
>  drivers/hwmon/pmbus/max31785.c | 104 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> index 45fb6093dec2..e9edbf11948f 100644
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
> @@ -44,6 +45,9 @@ in[1-6]_max_alarm	Output voltage high alarm
>  in[1-6]_min		Minimum output voltage
>  in[1-6]_min_alarm	Output voltage low alarm
>  
> +pwm[1-4]		Fan target duty cycle (0..255)
> +pwm[1-4]_enable		0: full-speed, 1: manual control, 2: automatic
> +
>  temp[1-11]_crit		Critical high temperature
>  temp[1-11]_crit_alarm	Chip temperature critical high alarm
>  temp[1-11]_input	Measured temperature
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 9313849d5160..0d97ddf67079 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -20,8 +20,102 @@ enum max31785_regs {
>  
>  #define MAX31785_NR_PAGES		23
>  
> +static int max31785_get_pwm(struct i2c_client *client, int page)
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
> +	if (!(config & PB_FAN_1_RPM)) {
> +		if (command >= 0x8000)
> +			return 0;
> +		else if (command >= 0x2711)
> +			return 0x2710;
> +
> +		return command;
> +	}
> +
> +	return 0;
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
> +	if (!(config & PB_FAN_1_RPM)) {
> +		if (command >= 0x8000)
> +			return 2;
> +		else if (command >= 0x2711)
> +			return 0;
> +
> +		return 1;
> +	}
> +
> +	return (command >= 0x8000) ? 2 : 1;
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
> +		if (rv < 0)
> +			return rv;
> +
> +		rv *= 255;
> +		rv /= 100;
> +		break;
> +	case PMBUS_VIRT_PWM_ENABLE_1:
> +		rv = max31785_get_pwm_mode(client, page);
> +		break;

I do wonder ... does it even make sense to specify generic code
for the new virtual attributes in the pmbus core code, or would
it be better to have it all in this driver, at least for now ?

> +	default:
> +		rv = -ENODATA;
> +		break;
> +	}
> +
> +	return rv;
> +}
> +
> +static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
> +
> +static int max31785_write_word_data(struct i2c_client *client, int page,
> +				    int reg, u16 word)
> +{
> +	switch (reg) {
> +	case PMBUS_VIRT_PWM_ENABLE_1:
> +		if (word >= ARRAY_SIZE(max31785_pwm_modes))
> +			return -EINVAL;
> +
> +		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
> +					max31785_pwm_modes[word]);
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
> @@ -32,11 +126,19 @@ enum max31785_regs {
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
