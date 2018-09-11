Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EjoNJVH7"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428xXs3XyBzF38B
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 06:37:01 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id l63-v6so12829528pga.7
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=c8TTdPuuvCGXUA3V2ZnGhBssHB5PseHdVS2qVoCb3Ck=;
 b=EjoNJVH79cit4diOeaskKSgXf11fdCj88e0oZi0rjqHikuus4DJ2wCipm4Tpa5afng
 pU2MZSvfd/lvV3pzOAJYlfbalDVT2d9LSOuMOLgxet0yuRkomxz52iku1mz/1vhFCHhp
 Od//GYL6nclJNtz9cRm86DDMOSv2h8h3Y6+qHU9U9DdtqmBNO9TNb6M9y5yuLEIGkLYL
 Qtkf6cp3UObtHL/ejDaYZ3uml8nYEvndWxE25KFcSs3dNKx97MZO7B0La2o9rSVh+PBX
 ltxjcoTtQxHm2+l6dNq9gk3aqXSBb5jyot8RB9Sk+m0STZHKBS8LwpI+jm5v4lm+Jpvl
 l8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=c8TTdPuuvCGXUA3V2ZnGhBssHB5PseHdVS2qVoCb3Ck=;
 b=bm1itbiWMvUKf5AnwEYVXB/xZtb4S/R1Re7mOu+c8qFjt5tHp3Ux834m6QE0M9XViw
 egJRwYpXj9aKvZeeCoJQtCiqlty8qUv9E4qOkkliFG3WiFJx/RwhuMviJ+5y+GEA4IEr
 xKqp3x4sRLlSc/xv4psBPhpQCUi4S7Ghcs4LHWwYGnX8yOUcX7IOGK9TfIujWoI2TpHY
 iWnVcJJYjfN0Gt3L0wzeu/htjzhKVzruVx5ltQa5d6G5/z4CN6N9IHmdOygeswu/KMXw
 AdB/JlQ+ujkHtrSWajog54B5mHNnsYQcd4ivjQDMiTkl7iGsRxQ4A/YkB1yB7FsGeAO3
 x0wQ==
X-Gm-Message-State: APzg51D6imJRlsTD1981/xpj+5shP4HE1in0/ZtuhbF+rAfJJ1n0wkVx
 MTXru6ociaSMVaU/8PBJ0ho=
X-Google-Smtp-Source: ANB0VdZaQRPMFhbxbRIx5jxVPVYn8jyUlr8d9t/eomc4kBCu0z+6LCykm8EAboGMtr9k8cEJH2C8DA==
X-Received: by 2002:a65:6455:: with SMTP id
 s21-v6mr30667990pgv.25.1536698219346; 
 Tue, 11 Sep 2018 13:36:59 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id c1-v6sm24936589pfi.142.2018.09.11.13.36.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Sep 2018 13:36:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Sep 2018 13:36:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: linux-hwmon@vger.kernel.org, frodol@dds.nl, openbmc@lists.ozlabs.org,
 rlippert@google.com, benjaminfair@google.com
Subject: Re: [PATCH] hwmon: (lm75) Add MAX31725/6 support
Message-ID: <20180911203656.GA25948@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 20:37:03 -0000

On Tue, Sep 11, 2018 at 01:25:58PM -0700, Kun Yi wrote:
> MAX31725/MAX31726 are local temperature sensors with +/- 0.5 degree
> Celsius accuracy and 16-bit (0.00390625 degrees Celsius) resolution.
> They have a register mapping and encoding compatible with the lm75
> series drivers. Address scan and extended temperature range are
> not supported by this patch.
> 
> Tested on real hardware and verified temperature readings are correct.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/lm75 |  6 +++---
>  drivers/hwmon/lm75.c     | 18 ++++++++++++++++--
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
> index ac95edfcd907..2f1120f88c16 100644
> --- a/Documentation/hwmon/lm75
> +++ b/Documentation/hwmon/lm75
> @@ -17,8 +17,8 @@ Supported chips:
>      Addresses scanned: none
>      Datasheet: Publicly available at the Maxim website
>                 http://www.maximintegrated.com/
> -  * Maxim MAX6625, MAX6626
> -    Prefixes: 'max6625', 'max6626'
> +  * Maxim MAX6625, MAX6626, MAX31725, MAX31726
> +    Prefixes: 'max6625', 'max6626', 'max31725', 'max31726'
>      Addresses scanned: none
>      Datasheet: Publicly available at the Maxim website
>                 http://www.maxim-ic.com/
> @@ -86,7 +86,7 @@ The LM75 is essentially an industry standard; there may be other
>  LM75 clones not listed here, with or without various enhancements,
>  that are supported. The clones are not detected by the driver, unless
>  they reproduce the exact register tricks of the original LM75, and must
> -therefore be instantiated explicitly. Higher resolution up to 12-bit
> +therefore be instantiated explicitly. Higher resolution up to 16-bit
>  is supported by this driver, other specific enhancements are not.
>  
>  The LM77 is not supported, contrary to what we pretended for a long time.
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 49f4b33a5685..e6e5a1080f09 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -47,6 +47,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>  	lm75b,
>  	max6625,
>  	max6626,
> +	max31725,
>  	mcp980x,
>  	stds75,
>  	tcn75,
> @@ -64,7 +65,6 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>  static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
>  					0x4d, 0x4e, 0x4f, I2C_CLIENT_END };
>  
> -
>  /* The LM75 registers */
>  #define LM75_REG_TEMP		0x00
>  #define LM75_REG_CONF		0x01
> @@ -76,7 +76,7 @@ struct lm75_data {
>  	struct i2c_client	*client;
>  	struct regmap		*regmap;
>  	u8			orig_conf;
> -	u8			resolution;	/* In bits, between 9 and 12 */
> +	u8			resolution;	/* In bits, between 9 and 16 */
>  	u8			resolution_limits;
>  	unsigned int		sample_time;	/* In ms */
>  };
> @@ -339,6 +339,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		data->resolution_limits = 9;
>  		data->sample_time = MSEC_PER_SEC / 4;
>  		break;
> +	case max31725:
> +		data->resolution = 16;
> +		data->sample_time = MSEC_PER_SEC / 8;
> +		break;
>  	case tcn75:
>  		data->resolution = 9;
>  		data->sample_time = MSEC_PER_SEC / 8;
> @@ -415,6 +419,8 @@ static const struct i2c_device_id lm75_ids[] = {
>  	{ "lm75b", lm75b, },
>  	{ "max6625", max6625, },
>  	{ "max6626", max6626, },
> +	{ "max31725", max31725, },
> +	{ "max31726", max31725, },
>  	{ "mcp980x", mcp980x, },
>  	{ "stds75", stds75, },
>  	{ "tcn75", tcn75, },
> @@ -471,6 +477,14 @@ static const struct of_device_id lm75_of_match[] = {
>  		.compatible = "maxim,max6626",
>  		.data = (void *)max6626
>  	},
> +	{
> +		.compatible = "maxim,max31725",
> +		.data = (void *)max31725
> +	},
> +	{
> +		.compatible = "maxim,max31726",
> +		.data = (void *)max31725
> +	},
>  	{
>  		.compatible = "maxim,mcp980x",
>  		.data = (void *)mcp980x
> -- 
> 2.19.0.rc2.392.g5ba43deb5a-goog
> 
