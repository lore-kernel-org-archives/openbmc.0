Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gsMGYfMz"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42MKx83gLjzF3JD
 for <openbmc@lists.ozlabs.org>; Sat, 29 Sep 2018 04:30:36 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id q19-v6so5036820pgn.10
 for <openbmc@lists.ozlabs.org>; Fri, 28 Sep 2018 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=32/7XWNEzVwRcXeZ5fyBjyl7sCV1kGTe57NVQ6FhLBM=;
 b=gsMGYfMzYymyhKGon1baQXq9kLANJyKFtkW5+bqRUNXar9SW31sAkVBJ9GDhHObRQ0
 5FsUREJgqJlkRe5a1ibow8cD487+OmkRo7srVQgbgbwhYhkaBEGK/+OoVBCGrgGmFzR5
 EpmwvQoJrUJYx12lIGoFRrlRAwgdwyE7QHLi4P2CLGLCh4m4Vx+GhXzRtOC93iwLmApa
 G7r8WM1q4JRszEpIzk3leauuklgmuXjthE/euzm4uxvL8w09s6oV3nUD3CnJkEGydhXU
 5++vYxMYkWJbWastMqY/Rej4UoqA/onSU32jzl6Y7PEuWDQtPSUm6dfSdnXCjJM3CRFP
 QUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=32/7XWNEzVwRcXeZ5fyBjyl7sCV1kGTe57NVQ6FhLBM=;
 b=agRtshwfnVf793H2aKiYYoppCn1vdv/BIEvsBquyGyLc340LGYXDhwgrFnYTuc84UV
 pwKqDIwX2NNOx+NgnXVeteDNF6S9DdUGEL8PL72ZnpMeFer+Z2CE+cAUQMtADwd+nbnZ
 +HiC8A87z20UCLL7OoWD2KzOFAg4m/LAWlMz8oZjged3AC0sdkUAHz5UFU8XMt7tvlM+
 pAKF7kERmWFtvT8tzeiAtJyr9cnl+x66AbWSTmpgK7dcmlryCjYCJG6VwMwpoGr6Tnuz
 yTY5vhxruwn8u2NoYpsh4L0QIsk8bMm6HxAI7cipRbJhVQ0oiisEkPkTBQ24Zqr0MhkA
 7jCA==
X-Gm-Message-State: ABuFfojLvUt5WUSp7f5/ZDqMhj5cf2P7cfZYJLWXidu6eWAFWf708r4Y
 nUzMYHhsRWbY8dLT2uuJb9g=
X-Google-Smtp-Source: ACcGV63WLoNonXRJ0sllblyHgnv7DlNHlpFgA4N8ETA5ogbUPw4g9lNx25xzPkxQcLA+ZT3ylkC/bg==
X-Received: by 2002:aa7:8319:: with SMTP id
 t25-v6mr17990637pfm.81.1538159434164; 
 Fri, 28 Sep 2018 11:30:34 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id m15-v6sm9261322pgt.28.2018.09.28.11.30.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 11:30:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Sep 2018 11:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: linux-hwmon@vger.kernel.org, rlippert@google.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] hwmon: (adm1275): Add device tree param for shunt resistor
Message-ID: <20180928183031.GA24293@roeck-us.net>
References: <20180928174500.18538-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180928174500.18538-1-kunyi@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 28 Sep 2018 18:30:37 -0000

On Fri, Sep 28, 2018 at 10:45:00AM -0700, Kun Yi wrote:
> The ADM series of hotswap controllers support extending
> the current measurement range by using a sensing resistor
> value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> sensing resistor doubles the maximal current can be measured.
> 
> Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> meaning for other resistor values, hwmon will report scaled
> current/power measurements. This patch adds a device tree parameter so
> that individual boards can configure its shunt resistor value.
> 
Please copy DT maintainers for all DT changes.

> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 19 +++++++++++++++++++
>  Documentation/hwmon/adm1275                   |  3 +++
>  drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> new file mode 100644
> index 000000000000..a182fa195ed1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> @@ -0,0 +1,19 @@
> +adm1275 properties
> +
> +Required properties:
> +- compatible: Must be one of the supported compatible strings in
> +  Documentation/hwmon/adm1275

It would be more appropriate to list those here as devicetree properties.
The information in Documentation/hwmon/adm1275 does not include the "adi,"
prefix.

Thanks,
Guenter

> +- reg: I2C address
> +
> +Optional properties:
> +
> +- shunt-resistor-micro-ohms
> +	Shunt resistor value in micro-Ohm
> +
> +Example:
> +
> +adm1272@10 {
> +	compatible = "adi,adm1272";
> +	reg = <0x10>;
> +	shunt-resistor-micro-ohms = <500>;
> +};
> diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
> index 39033538eb03..5e277b0d91ce 100644
> --- a/Documentation/hwmon/adm1275
> +++ b/Documentation/hwmon/adm1275
> @@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not support internal voltage
>  or current scaling. Reported voltages, currents, and power are raw measurements,
>  and will typically have to be scaled.
>  
> +The shunt value in micro-ohms can be set via device tree at compile-time. Please
> +refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for bindings
> +if the device tree is used.
>  
>  Platform data support
>  ---------------------
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 13600fa79e7f..f569372c9204 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
>  	const struct coefficients *coefficients;
>  	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
>  	int tindex = -1;
> +	u32 shunt;
>  
>  	if (!i2c_check_functionality(client->adapter,
>  				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> @@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
>  	if (!data)
>  		return -ENOMEM;
>  
> +	if (of_property_read_u32(client->dev.of_node,
> +				 "shunt-resistor-micro-ohms", &shunt))
> +		shunt = 1000; /* 1 mOhm if not set via DT */
> +
> +	if (shunt == 0)
> +		return -EINVAL;
> +
>  	data->id = mid->driver_data;
>  
>  	info = &data->info;
> @@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
>  		info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
>  	}
>  	if (cindex >= 0) {
> -		info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
> +		/* Scale current with sense resistor value */
> +		info->m[PSC_CURRENT_OUT] =
> +			coefficients[cindex].m * shunt / 1000;
>  		info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
>  		info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
>  	}
>  	if (pindex >= 0) {
> -		info->m[PSC_POWER] = coefficients[pindex].m;
> +		info->m[PSC_POWER] =
> +			coefficients[pindex].m * shunt / 1000;
>  		info->b[PSC_POWER] = coefficients[pindex].b;
>  		info->R[PSC_POWER] = coefficients[pindex].R;
>  	}
> -- 
> 2.19.0.605.g01d371f741-goog
> 
