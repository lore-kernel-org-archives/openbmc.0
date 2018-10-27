Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NLC0XcV8"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42j7BD6Ft3zDrPm
 for <openbmc@lists.ozlabs.org>; Sun, 28 Oct 2018 04:28:36 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id bb7-v6so1885989plb.13
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WzeWoNq9R2q/Cd1gpDcQa9tXtdMfumudqSqZRf4jZGA=;
 b=NLC0XcV8en7WWHJhfvu+Rt+/UcU7zbEPHbrPAnOawhZ/eHYchTH+qDYfCjmrb8o7TI
 3cA9iGMpdpKKci0EhzFKW0XggigGEkKCg7W+AEeWOCeFTpwHkQkMvcPYMaJVxuaJvj4N
 0+Sc3cPEZfhJzhFqSl1YV33ATvf//WLBKgrxdulE4Q4Ql9yZBupJAPkQ8Lx+gXS/JB57
 XZld8NtPtCbpFm9G/jLECl/HEgV4ug7W+3bGaJP9AzfEdUOj+u54/0v63d4m2ssm3Xq4
 rPaE/TOQmMuBUscbDsJUsBfi6XyZqZWjIm9qRj/r8MQCjjDLvNFdg/DVG2zWfANao53C
 TDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=WzeWoNq9R2q/Cd1gpDcQa9tXtdMfumudqSqZRf4jZGA=;
 b=KnmhC6xNWKKWwt6o6VJbd+x/GMnfgFUEuFcU1ZSCaFYYGor2G1fnynkIqtUzudmWNm
 IgIqTGgX8OaplcGlEddPec/kffmkVrJ5xGm5AJrwneDWYJK+BQNG1fsxIIWr/GH13RmD
 EyXBRV5cxRS7/llN7sWDYXNMpoxXnLspoaIrU3kBIaTBbTn9PpTjWJlmZRrlElPR4vO9
 hlZ4ohNzXjU5Frm+Dqmz3wTh48Zn5u2sONuuazsHtYoVqciTxUsaBBJg2yZ2xqCG+v1d
 pzM+5lTro0ivZvs7ZUk+x+pFyIUAQmlFH+YmgnMIHftHxortc3ALqtZDxpvTVgbaQPYp
 T4GQ==
X-Gm-Message-State: AGRZ1gLk0floaEoecR7zXSBFbKPDwS95Fl4FcSMUhayeMphkU6Jz0/jk
 GKuvTQTVCFvGk2BwUUOB/A8=
X-Google-Smtp-Source: AJdET5fPV0z7QqYVbr09YWEU+Ev7l34as4u4dwgp5LefVS3NuzMw702A5dogZhCWy1RlCH+OPItucw==
X-Received: by 2002:a17:902:788d:: with SMTP id
 q13-v6mr7585667pll.329.1540661314900; 
 Sat, 27 Oct 2018 10:28:34 -0700 (PDT)
Received: from localhost (99-61-165-247.lightspeed.sntcca.sbcglobal.net.
 [99.61.165.247])
 by smtp.gmail.com with ESMTPSA id t4-v6sm15229706pfb.44.2018.10.27.10.28.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Oct 2018 10:28:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Oct 2018 10:28:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: no To-header on input <;, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (adm1275): Allow setting shunt reg value
Message-ID: <20181027172833.GA25052@roeck-us.net>
References: <20181017222639.254434-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017222639.254434-1-kunyi@google.com>
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
X-List-Received-Date: Sat, 27 Oct 2018 17:28:37 -0000

On Wed, Oct 17, 2018 at 03:26:39PM -0700, Kun Yi wrote:
> The ADM series of hotswap controllers support extending
> the current measurement range by using a sensing resistor
> value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> sensing resistor doubles the maximal current can be measured.
> 
> Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> meaning for other resistor values, hwmon will report scaled
> current/power measurements. This patch parses device tree parameter
> "shunt-resistor-micro-ohms", if there is one.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> Changes in v3:
> - splitted hwmon and device tree binding patches
> 
>  Documentation/hwmon/adm1275   |  3 +++
>  drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
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
