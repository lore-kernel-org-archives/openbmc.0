Return-Path: <openbmc+bounces-2322-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B037C53219
	for <openbmc@archiver.kernel.org>; Tue, 28 Jul 2026 21:15:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h8pC42l9jz2yhY;
	Wed, 29 Jul 2026 07:15:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785273312;
	cv=none; b=cejg0/Fy1VaYgyHT77jDezzjQYO0GMcF71rC5GsN/BxsVjv/3fCJdshV5iSG+BWhYYv4uQ0KJSeSsWTZoLsmfvOI6DYqVOAQuTYYbtTlfpOYIHA53uiVu6UjsrSmfwJNd/0j5EV1gGeVRPr0goov1i9TbZBwb1rX/yQL2aMiD2qffa80ie706i6JVCua9hLSeo/qUTX9Sa8Px1bH7QpuOEkLgQAQhO0rO8dCJWNEWGexWouPzmTPUKcMgWAyzJq7hxdB+whAo0LkF8ytmoUG+aHoj4B9Fc8CmiLVRvRxMe4mZwoPw/Ayi0irAW6XKZjCfxBoeR0e5IeR9pYy/yu3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785273312; c=relaxed/relaxed;
	bh=ETJTb72goFKmsExh0rWtuWEGrY06VrxO/4I2OvR2Y5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4Ae8+UrrMSU9WT0/mWqdzzbgkohgaovLTe0NTPybq2fzV5uuVRgnSIQzCVGRbURH8UNRLRM4CMJ8Ah17T9ZhSRoPs1cRiM/DMoFwL2B4Pqg9iPDpKa20iwvT89YYTZCctW2mdvUTwr9+1H8XWLAN22IeTa1pMdgplSeW+d10tJwcyesvWdkKGftfly5Zqm97krECgfQFTTreKp3h4W+pbrrVrT4POYLOeW3KNVEcf11j6kcQK6x2e0DdDR0jsVax21pu2ONh6gRMQ116XLMqi5fIOutMQPu5WW/1gsaAXk1sGKGzoAs6/AbADAXCROf+jUbuKMBfkWb7OoKLM5Zdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WTKVoGSw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WTKVoGSw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h8pC163kQz2xYg
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2026 07:15:08 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso971932a12.0
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2026 14:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273305; x=1785878105; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETJTb72goFKmsExh0rWtuWEGrY06VrxO/4I2OvR2Y5g=;
        b=WTKVoGSw8N2mE9VTq6TcSxUSNKAR1Y/+vcFc21hofcS2g6VcNUStR1LFtB9GBGjsGo
         jsixxc2htz7I6yCnw+llW3fw0TWAVTi0bzX8WI8uc58JhDJXFUJq8uJ5zmPWAtMtr77f
         5RC6TdGYoplweyEz4+vx5tVBtGOjppa5OU6VDNgpgdPsib2tK0hGsBdVYPfclekeOmJH
         WpzsB1SBELTgMjbWw8yt/RVG5UGUPlOr1qmtQZZLVpX0LUnuJ23WYzYBS3l8hZJbRBYf
         Y3Vd6UHO3fEH6cLEqF5yItf3mEpotANhigbbPaRw5LWTYRVOByA1o0ErNYpupNencxmK
         Cnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273305; x=1785878105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETJTb72goFKmsExh0rWtuWEGrY06VrxO/4I2OvR2Y5g=;
        b=CbDvdqgFUcmoNzpqH8f9/zKIS9REzHgf9rxdH7cki29mLQjZa4/2nBe9uzcMy+OEqE
         J6MTAP4U5E5hGaBGAnXszURHaC7nkSvHuXT/v3bno3B1BZ5JHWReV+4ocJvlre3JME28
         9bb7GPErSIOUjKU+TCR+haP0q8jeQijRVkUNJ0+Gsv8TDL7oMR0Fo0zbCXKYTxyXT6ke
         Mza+m3BCi/O9iTjcafERW68pKT4hdpom9DrOKCmJpI6tsNQ10aBjBSNQWj2SfdigovZ0
         sSxMnxpShZujSMMqJ59zXaP4ZO5XuWcNpgjoOu/tVbZ+2zHQv59Xf9aUyAuWzgOfNCV3
         vzWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwKyxh/66DensrBABFBspXWgiBaiIfipmsL2mkgIfJipjDe/IvqLq6nDCaXx0/up188sP6C4tZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywu4VqOM1p5lkKM2x1i15rKd3eM3GYS0VxTVLrP1vxoQLRJYtBx
	n3/I4xht4WuuFCp+jhz4SY49gz/UWSTFVuJvMFHC+NaN/ovSWHxNKzX6
X-Gm-Gg: AR+sD10az2LEc1daPPbXHohZQpQ5ai+hfpFMwyvmpyriDMfgBF5SYyJ2SPHVRok2+dy
	sWO4n87v1+mFgEYNeqAIORhy4KQLLZ3ZnLb8Z1uWd0vOx0sOsP5VZSD+AlMsD3avHsLKogwt6eC
	FLEcW7B1l8aaEY+nXlTjwSS/+GbU3ADjE6L5ecdQzqDHYTKgXo2j5PKbqpIlY1jzeZm3eF92/sd
	3TgCFG6hzhvPSkv/vTbl/MKAFtdKjMwr1VfX0D2b4IuwKb0PlmZODKZyF4S9HaCdLg8AU0f2XN6
	L0dnEpqN3XZisbH4WOcoI65/fK2l/+GeX1vL4/px7VUXjvt1arHPvOIDSrcERhWyinH0WyVS2Qo
	8ohBGy+oMwsNVsf7gZnARTIJeszVc2332g7s3EO0I9WmG2WR47Ay5dkFuxtasLikmUxcB9aea2g
	+k9pBKBOJGiyjz2vSZyWPkygbcnd/QZtdocxjC5OuQq9hqgIkDyFTLGR6cNiX+2vlB1HaZEQiEG
	5zemhL4JzNG
X-Received: by 2002:a05:6a21:1bc4:b0:3c3:7dfd:22bb with SMTP id adf61e73a8af0-3c8abb6cdbbmr4297229637.13.1785273305363;
        Tue, 28 Jul 2026 14:15:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb824d421sm77132a12.10.2026.07.28.14.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:15:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 28 Jul 2026 14:15:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: jianhao.xu@seu.edu.cn, andrew@codeconstruct.com.au,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (npcm750-pwm-fan): stop fan timer on device detach
Message-ID: <851962b9-10a0-4fbf-a962-4c2981ba647c@roeck-us.net>
References: <20260728075535.251-1-getshell@seu.edu.cn>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728075535.251-1-getshell@seu.edu.cn>

On Tue, Jul 28, 2026 at 03:55:35PM +0800, Hongyan Xu wrote:
> When a fan tach channel is present, npcm7xx_pwm_fan_probe() starts
> fan_timer. The timer callback polls tach state and rearms the timer, but
> the driver has no remove callback or devm cleanup action to stop it. On
> device detach, the devm-managed driver data and I/O mappings can be
> released while the timer is still pending or running.
> 
> Register a devm cleanup action before starting the timer and shut the
> timer down synchronously from that action.
> 
> This issue was found by a static analysis tool.
> 
> Fixes: f1fd4a4db777 ("hwmon: Add NPCM7xx PWM and Fan driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/hwmon/npcm750-pwm-fan.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index aea0b8659f5..6503d28ed7b 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -358,6 +358,13 @@ static void npcm7xx_fan_polling(struct timer_list *t)
>  	add_timer(&data->fan_timer);
>  }
>  
> +static void npcm7xx_fan_cleanup(void *data)
> +{
> +	struct npcm7xx_pwm_fan_data *fan_data = data;
> +
> +	timer_shutdown_sync(&fan_data->fan_timer);

Why not pass the pointer to the timer as parameter to devm_add_action_or_reset()
and just pass it on here ?

> +}
> +
>  static inline void npcm7xx_fan_compute(struct npcm7xx_pwm_fan_data *data,
>  				       u8 fan, u8 cmp, u8 fan_id, u8 flag_int,
>  				       u8 flag_mode, u8 flag_clear)
> @@ -1016,10 +1023,16 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
>  	for (i = 0; i < NPCM7XX_FAN_MAX_CHN_NUM; i++) {
>  		if (data->fan_present[i]) {
>  			/* fan timer initialization */
> -			data->fan_timer.expires = jiffies +
> -				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
>  			timer_setup(&data->fan_timer,
>  				    npcm7xx_fan_polling, 0);
> +			ret = devm_add_action_or_reset(dev,
> +						       npcm7xx_fan_cleanup,
> +						       data);
> +			if (ret)
> +				return ret;
> +
> +			data->fan_timer.expires = jiffies +
> +				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);

Your patch does not explain why this assignment needed to be moved. Please either
explain or keep at the original location to reduce the size of the diff.

Thanks,
Guenter

>  			add_timer(&data->fan_timer);
>  			break;
>  		}

