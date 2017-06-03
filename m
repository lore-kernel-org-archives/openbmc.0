Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfyl3326KzDqFH
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 20:59:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="UWERhHZG";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ooEXc8qHxQm91del4MsjIrJGycOsUipoEZnsX1+GMXQ=; b=UWERhHZGhiuUo0AsAUtMps/T1U
 vlKe8XRNTZDdaqKS6flJ3xSsM+2Z3wXuWf6VKEx7jzx6F/FTDKiT/1oR3hr9K67l/BYK/FmObw7Yc
 LCpPYqVayrbc7HoFs9N0Lj1zoIqJAanGIUKrdTswwBVnwClHtG1hI1SEF0WW7Yn4YnsrxrYVa53wF
 6aqmFB/DcHLiSvXwhVyTrN2uvX0mQoAeXeW1eMK0bojhEO3AJKmsxyXEde2wVDyx/ZaxT2VzSiOSB
 HMhK3WjsNrhG9UV8PskK1XHrqUDLaHJfAKjHnRnQADGMS+wpfC1O9piYqW7dIUFE13tE22gvn1OdN
 PTJJr3ng==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:42494 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.87) (envelope-from <linux@roeck-us.net>)
 id 1dH6mC-001Uji-V0; Sat, 03 Jun 2017 10:59:25 +0000
Date: Sat, 3 Jun 2017 03:59:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Schaeckeler <sschaeck@cisco.com>
Cc: Joel Stanley <joel@jms.id.au>, Jean Delvare <jdelvare@suse.com>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH] drivers: hwmon: aspeed fan driver: make fan/pwm names
 start with index 1
Message-ID: <20170603105924.GB16274@roeck-us.net>
References: <20170602194328.GA24663@sjc-ads-246.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170602194328.GA24663@sjc-ads-246.cisco.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Sat, 03 Jun 2017 10:59:27 -0000

On Fri, Jun 02, 2017 at 12:43:28PM -0700, Stefan Schaeckeler wrote:
> Make fan and pwm names in sysfs start with index 1 in accordance to
> Documentation/hwmon/sysfs-interface conventions.
> 
> Current implementation starts with index 0 making tools such as sensors(1)
> skip the first fan.
> 
> Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>

Applied. Same comments as before.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 52 ++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index d9161cd..1dbd83e 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -591,24 +591,23 @@ static umode_t fan_dev_is_visible(struct kobject *kobj,
>  	return a->mode;
>  }
>  
> -static SENSOR_DEVICE_ATTR(pwm0, 0644,
> -			show_pwm, set_pwm, 0);
>  static SENSOR_DEVICE_ATTR(pwm1, 0644,
> -			show_pwm, set_pwm, 1);
> +			show_pwm, set_pwm, 0);
>  static SENSOR_DEVICE_ATTR(pwm2, 0644,
> -			show_pwm, set_pwm, 2);
> +			show_pwm, set_pwm, 1);
>  static SENSOR_DEVICE_ATTR(pwm3, 0644,
> -			show_pwm, set_pwm, 3);
> +			show_pwm, set_pwm, 2);
>  static SENSOR_DEVICE_ATTR(pwm4, 0644,
> -			show_pwm, set_pwm, 4);
> +			show_pwm, set_pwm, 3);
>  static SENSOR_DEVICE_ATTR(pwm5, 0644,
> -			show_pwm, set_pwm, 5);
> +			show_pwm, set_pwm, 4);
>  static SENSOR_DEVICE_ATTR(pwm6, 0644,
> -			show_pwm, set_pwm, 6);
> +			show_pwm, set_pwm, 5);
>  static SENSOR_DEVICE_ATTR(pwm7, 0644,
> +			show_pwm, set_pwm, 6);
> +static SENSOR_DEVICE_ATTR(pwm8, 0644,
>  			show_pwm, set_pwm, 7);
>  static struct attribute *pwm_dev_attrs[] = {
> -	&sensor_dev_attr_pwm0.dev_attr.attr,
>  	&sensor_dev_attr_pwm1.dev_attr.attr,
>  	&sensor_dev_attr_pwm2.dev_attr.attr,
>  	&sensor_dev_attr_pwm3.dev_attr.attr,
> @@ -616,6 +615,7 @@ static struct attribute *pwm_dev_attrs[] = {
>  	&sensor_dev_attr_pwm5.dev_attr.attr,
>  	&sensor_dev_attr_pwm6.dev_attr.attr,
>  	&sensor_dev_attr_pwm7.dev_attr.attr,
> +	&sensor_dev_attr_pwm8.dev_attr.attr,
>  	NULL,
>  };
>  
> @@ -624,40 +624,39 @@ static const struct attribute_group pwm_dev_group = {
>  	.is_visible = pwm_is_visible,
>  };
>  
> -static SENSOR_DEVICE_ATTR(fan0_input, 0444,
> -		show_rpm, NULL, 0);
>  static SENSOR_DEVICE_ATTR(fan1_input, 0444,
> -		show_rpm, NULL, 1);
> +		show_rpm, NULL, 0);
>  static SENSOR_DEVICE_ATTR(fan2_input, 0444,
> -		show_rpm, NULL, 2);
> +		show_rpm, NULL, 1);
>  static SENSOR_DEVICE_ATTR(fan3_input, 0444,
> -		show_rpm, NULL, 3);
> +		show_rpm, NULL, 2);
>  static SENSOR_DEVICE_ATTR(fan4_input, 0444,
> -		show_rpm, NULL, 4);
> +		show_rpm, NULL, 3);
>  static SENSOR_DEVICE_ATTR(fan5_input, 0444,
> -		show_rpm, NULL, 5);
> +		show_rpm, NULL, 4);
>  static SENSOR_DEVICE_ATTR(fan6_input, 0444,
> -		show_rpm, NULL, 6);
> +		show_rpm, NULL, 5);
>  static SENSOR_DEVICE_ATTR(fan7_input, 0444,
> -		show_rpm, NULL, 7);
> +		show_rpm, NULL, 6);
>  static SENSOR_DEVICE_ATTR(fan8_input, 0444,
> -		show_rpm, NULL, 8);
> +		show_rpm, NULL, 7);
>  static SENSOR_DEVICE_ATTR(fan9_input, 0444,
> -		show_rpm, NULL, 9);
> +		show_rpm, NULL, 8);
>  static SENSOR_DEVICE_ATTR(fan10_input, 0444,
> -		show_rpm, NULL, 10);
> +		show_rpm, NULL, 9);
>  static SENSOR_DEVICE_ATTR(fan11_input, 0444,
> -		show_rpm, NULL, 11);
> +		show_rpm, NULL, 10);
>  static SENSOR_DEVICE_ATTR(fan12_input, 0444,
> -		show_rpm, NULL, 12);
> +		show_rpm, NULL, 11);
>  static SENSOR_DEVICE_ATTR(fan13_input, 0444,
> -		show_rpm, NULL, 13);
> +		show_rpm, NULL, 12);
>  static SENSOR_DEVICE_ATTR(fan14_input, 0444,
> -		show_rpm, NULL, 14);
> +		show_rpm, NULL, 13);
>  static SENSOR_DEVICE_ATTR(fan15_input, 0444,
> +		show_rpm, NULL, 14);
> +static SENSOR_DEVICE_ATTR(fan16_input, 0444,
>  		show_rpm, NULL, 15);
>  static struct attribute *fan_dev_attrs[] = {
> -	&sensor_dev_attr_fan0_input.dev_attr.attr,
>  	&sensor_dev_attr_fan1_input.dev_attr.attr,
>  	&sensor_dev_attr_fan2_input.dev_attr.attr,
>  	&sensor_dev_attr_fan3_input.dev_attr.attr,
> @@ -673,6 +672,7 @@ static struct attribute *fan_dev_attrs[] = {
>  	&sensor_dev_attr_fan13_input.dev_attr.attr,
>  	&sensor_dev_attr_fan14_input.dev_attr.attr,
>  	&sensor_dev_attr_fan15_input.dev_attr.attr,
> +	&sensor_dev_attr_fan16_input.dev_attr.attr,
>  	NULL
>  };
>  
> -- 
> 2.9.3
> 
