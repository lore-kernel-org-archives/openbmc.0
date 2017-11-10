Return-Path: <groeck7@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="utvEXZOr"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yYCLM3qkJzDrKG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 19:07:06 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id p87so6215768pfj.3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 00:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U0rXkSi+Q5DHM9zxlpngBCxDTKso8BJa9dSTWYXDz9c=;
 b=utvEXZOr3As5Dpl5BQq6eEEUHBQfiK8VoZuce80eLU19fh5duAgIEW1AixwanOg/kJ
 fkb0tr3/HmwcKQj1OtkYbt6TdfMhT1qT+YQF3drsMftJNlCNkzjGVzhdyX+YKhyykVX5
 3U7UQfvQBAGSqn0JCHoWrUkRdGKd+wo/dkdpm4wXSZchnBYd4PtQg4YzppznRVhYFZFM
 idAwtC4Z8KpQ32/xamqq6LvYP0yjJD0E48j1MtjtjF2aaMAF/43kUz6jsmo3JMyoVY0s
 EtlmOLfaERGz7iLgnNcQN8/LfbpxjknVJ7C2zromr9KoIP/x0+xgLY1P+nXqpYa0SGvy
 gDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U0rXkSi+Q5DHM9zxlpngBCxDTKso8BJa9dSTWYXDz9c=;
 b=HEFi8VPm6hsCaDAW5DvKCCcSraIymv+mMNEN2Lth/GTTOD7LJpm9zVwnmhNYxGHVeA
 G7jV+hnp4x/cXqbZC2YxqGt2fFQk/Cj/vIHhbHZvjcHnANc5ZOk2AhIVJ1v7aB1d6H/V
 UIiPQi0290xDMPajxLxlot34BJavqHn323rIBdOiAVwDPqfPhbHwbGO3ttIowQhvuYS6
 zamg9fq6Es/nzcIIY+z/OsyNmuTPFh6fxw49AngEO1mHKHAF6QbqMR28E6cJUy3h1yBc
 vAQ4Ktq7Xst0CvbaYK3fC5zY6Na2u0UrahyLXEzVkmcvoYYHO3qV9ZP3ZsV+r9g9cJGs
 smGQ==
X-Gm-Message-State: AJaThX7xcZ+zDeqH+VshjGWz3s+SbqAsk9+P5rKLRUnTyAzLncky1fvC
 LkTyVBVYcBHmVR2SLtt7V39/xQ==
X-Google-Smtp-Source: ABhQp+Tw+jbZNWlvOKq4FOxH0MfibrDeYslLpSTxl6kwk22xb/nWIG0BxLLy1DgG3ySHPpmVTW+qmQ==
X-Received: by 10.84.128.229 with SMTP id a92mr3355675pla.278.1510301224749;
 Fri, 10 Nov 2017 00:07:04 -0800 (PST)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id w69sm16003792pfd.22.2017.11.10.00.07.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Nov 2017 00:07:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [v4,4/6] pmbus: max31785: Add fan control
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
References: <20171103045306.26448-5-andrew@aj.id.au>
 <20171105150441.GA26191@roeck-us.net> <1510283416.4287.43.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b67d4fd5-3a3f-44b2-03af-530599356606@roeck-us.net>
Date: Fri, 10 Nov 2017 00:07:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510283416.4287.43.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 10 Nov 2017 08:07:08 -0000

On 11/09/2017 07:10 PM, Andrew Jeffery wrote:
> On Sun, 2017-11-05 at 07:04 -0800, Guenter Roeck wrote:
>> On Fri, Nov 03, 2017 at 03:53:04PM +1100, Andrew Jeffery wrote:
>>> The implementation makes use of the new fan control virtual registers
>>> exposed by the pmbus core. It mixes use of the default implementations
>>> with some overrides via the read/write handlers to handle FAN_COMMAND_1
>>> on the MAX31785, whose definition breaks the value range into various
>>> control bands dependent on RPM or PWM mode.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>   Documentation/hwmon/max31785   |   4 ++
>>>   drivers/hwmon/pmbus/max31785.c | 104 ++++++++++++++++++++++++++++++++++++++++-
>>>   2 files changed, 107 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
>>> index 45fb6093dec2..e9edbf11948f 100644
>>> --- a/Documentation/hwmon/max31785
>>> +++ b/Documentation/hwmon/max31785
>>> @@ -32,6 +32,7 @@ Sysfs attributes
>>>   fan[1-4]_alarm		Fan alarm.
>>>   fan[1-4]_fault		Fan fault.
>>>   fan[1-4]_input		Fan RPM.
>>> +fan[1-4]_target		Fan input target
>>>   
>>>   in[1-6]_crit		Critical maximum output voltage
>>>   in[1-6]_crit_alarm	Output voltage critical high alarm
>>> @@ -44,6 +45,9 @@ in[1-6]_max_alarm	Output voltage high alarm
>>>   in[1-6]_min		Minimum output voltage
>>>   in[1-6]_min_alarm	Output voltage low alarm
>>>   
>>> +pwm[1-4]		Fan target duty cycle (0..255)
>>> +pwm[1-4]_enable		0: full-speed, 1: manual control, 2: automatic
>>> +
>>>   temp[1-11]_crit		Critical high temperature
>>>   temp[1-11]_crit_alarm	Chip temperature critical high alarm
>>>   temp[1-11]_input	Measured temperature
>>> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
>>> index 9313849d5160..0d97ddf67079 100644
>>> --- a/drivers/hwmon/pmbus/max31785.c
>>> +++ b/drivers/hwmon/pmbus/max31785.c
>>> @@ -20,8 +20,102 @@ enum max31785_regs {
>>>   
>>>   #define MAX31785_NR_PAGES		23
>>>   
>>> +static int max31785_get_pwm(struct i2c_client *client, int page)
>>> +{
>>> +	int config;
>>> +	int command;
>>> +
>>> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
>>> +	if (config < 0)
>>> +		return config;
>>> +
>>> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
>>> +	if (command < 0)
>>> +		return command;
>>> +
>>> +	if (!(config & PB_FAN_1_RPM)) {
>>> +		if (command >= 0x8000)
>>> +			return 0;
>>> +		else if (command >= 0x2711)
>>> +			return 0x2710;
>>> +
>>> +		return command;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
>>> +{
>>> +	int config;
>>> +	int command;
>>> +
>>> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
>>> +	if (config < 0)
>>> +		return config;
>>> +
>>> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
>>> +	if (command < 0)
>>> +		return command;
>>> +
>>> +	if (!(config & PB_FAN_1_RPM)) {
>>> +		if (command >= 0x8000)
>>> +			return 2;
>>> +		else if (command >= 0x2711)
>>> +			return 0;
>>> +
>>> +		return 1;
>>> +	}
>>> +
>>> +	return (command >= 0x8000) ? 2 : 1;
>>> +}
>>> +
>>> +static int max31785_read_word_data(struct i2c_client *client, int page,
>>> +				   int reg)
>>> +{
>>> +	int rv;
>>> +
>>> +	switch (reg) {
>>> +	case PMBUS_VIRT_PWM_1:
>>> +		rv = max31785_get_pwm(client, page);
>>> +		if (rv < 0)
>>> +			return rv;
>>> +
>>> +		rv *= 255;
>>> +		rv /= 100;
>>> +		break;
>>> +	case PMBUS_VIRT_PWM_ENABLE_1:
>>> +		rv = max31785_get_pwm_mode(client, page);
>>> +		break;
>>
>> I do wonder ... does it even make sense to specify generic code
>> for the new virtual attributes in the pmbus core code, or would
>> it be better to have it all in this driver, at least for now ?
> 
> I think I'll pull the generic implementations out in light of my
> response on 3/6. At best the generic implementation for the PWM virtual
> regs is a guess. We can always put it back if others come to need it.
> 

SGTM.

Thanks,
Guenter
