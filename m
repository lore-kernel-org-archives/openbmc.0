Return-Path: <openbmc+bounces-1707-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4794FEC11D
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 22:51:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgQJS2xtCz2yVB;
	Wed, 25 Mar 2026 09:51:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774247476;
	cv=none; b=JVMp5TwE9WV5dWxicZu0MxO3vSxV2WfRsHVgtplUSis5pqBvbJ4T/v0aK8nWsYC7wjSVSqOyJpmD0EEXXUQ7W3+1mUYS/pPa4jB3/U2CtUO0BLWaKzTnLrZof+2Hy+MJ+EA/h487XWnVWuB1ovP0PQqwGfPGRtguDbUZGODCqsvg6lrMZ1cd8BSDuTAxriH4sEMpDRZzD+PfNVzfzOwjaXGOhZGFuvTu/0pLdvpV5oQCsEQ/47MrYq3l/TW5etoKrAYKlXgOGB4VJMgv90LeRKzSgooMEl1OP/XyvErHvMbHjZoH2Cyuj/yRKuP7620sdzswDMMBkslu64APTlQ7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774247476; c=relaxed/relaxed;
	bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=as4bdRjx2Ps1pLOe9i0ImFg8KwBvczrqWBihaDkPQew6IFMSTfwyMB2F04EjiKf+HCe050s/IdPyu91hunbLQ/O9WFObuoGlKyiUag+1ZNnftjdWi9qQPVS1n/MpfzaTKEDc0zcwzWRdex7WhLim0n9IIC/ZEJNQpiwP8TRNYLM81Yk017zMYpx4rA+hzHSTQQ7biyJoTGWgRC7HnWshPd6AuwF0kfbe96wFF0YiLCDw/FMnlbDcqIzxKts+rbOB9rXOKKzM5LnwYwo1gHkZCGCobtvDshrCLDoHs1PeiGS34HGXvyeQW1hkwTZSDhk0Jnsa15uJeRtCwwIMm9JGfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dghtzsaz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dghtzsaz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffNbk4Zjrz2xHX
	for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 17:31:13 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8296dabef74so3201580b3a.1
        for <openbmc@lists.ozlabs.org>; Sun, 22 Mar 2026 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774247470; x=1774852270; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
        b=dghtzsazLwwh9v/5RhtA/WpHg8neC5J/1t82OtnYrklctodI5niuJuPzVP/SwH+0RG
         Ye40Yf0LLEvqb0izXJy7Ek3cu9c7xQKFTvfaPxNpT79S35lZfgumrJ+XjYta/ddHysgW
         8fwLCVXA8FTcleY7/y5h1spbdqHcdZAKldDVvfzjhXN8mAbu2sLpfThImCLwu2kfoFSi
         K+snf894fEoA1/dqCMC9zZce60ofyzGKa2dbmS9wgOsd7ia5i7vV5BG0pl9dFTGgG1B8
         qVFCUwnH0lNcTNxYXOqZJMsUb485tzw1pHJf38TcON9xINKqtmnMgf/xT0TkDA4BjB5E
         o+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774247470; x=1774852270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uJOOsx893BHAo1XKwzCoPb5W2B/EQDBZpSJL6AVlTw=;
        b=b+3MBOWQALq5mE5aljvca0n6mV83hVXDYvewrR35lruEzlt4H/G6a66vdiMx8zqAlt
         TXka7MDV6R8spNsfFbrX2onv97NDur0U6OPGHFWxMQ1k5c5We27KmEBWSabJrnOBz6pS
         22PZL+hz9geRZGLtJrGCFMcZ8BZ6OguH6EA4C4GW6sY/QqG1CrydMR6LEPW4lMJ4Vko5
         5X9b1gmSwEE8xNW7sQwYeYpBwdb0EbCDfUmZTm30goo8qNBwgEgpwn7J0/y8jaRXhcHo
         dkvYD6G22q5FwPi0JY+HEjOKzdHT6iHgVpfCOqYIHfeuJmSg27u17hsyGeZohhlGFOcL
         O47Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwId66efztLDxdx3CpDuwXNIc7pwyxn683v5UygkjFuekdR4WRgxzExA1l5GmaNhxPeetFm4oK@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgMpkYCYgM0MoBpTpK9yELYvm2FuuGrdB1nBqHxSZPxTNCwUb9
	nBG0kC7JoyURsMnRg+GLpbkNYWBECGJAF7yapqvVD/tnXFxntCBbi0gz
X-Gm-Gg: ATEYQzwi1Hp1ieorYiFe5DNd6E2BohaYf+goa9Luf+1NQXUQzeafI4dm7hIOwf5VcGD
	d3izRmqCTA1zx+A1rLN2BOCy2RzvDxBAZEiCM0gg90PWk4IjWsBlMGQShk8Za6F60BRMOx9LSV9
	LEzxQa5jt68p+dutvcvwv8ITxkhiLvq/s2kvIsoOU4K1xbt7TbWyAEUXK0a/llV9SmfNSsAgARt
	SYm2DBuOlNR9LElURjVHKhGxs+d0ZXv751NMeJFoyAKZtPMZPfMv38/tFtE9b7HkyvMdoeN3sgX
	d9Wnh7JhdbD1q7LVUJBsyXcxfO0xa/yG1//bdpmjo/KFL5qhEUtquyALXtbPqeXV5FgVGUiZSIc
	ow7H5fDFMcTSy6mS0Q1Aij3Ryqz79JrSFZa29dArr1SxoO03l35aiib1jVpc9CkBzP6x3Wrf6m9
	K3rNvBSsILrp/7ZnBMjmFM2Fgtx4hD7x+t86WNuhWvpFUVv/wP0Ffr29qW0Sxr8J2qJSJCTS9xF
	UNw
X-Received: by 2002:a05:6a20:7f82:b0:398:919a:ddf5 with SMTP id adf61e73a8af0-39bce9e9efemr10260089637.24.1774247470439;
        Sun, 22 Mar 2026 23:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a938743sm6476741a12.19.2026.03.22.23.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:31:09 -0700 (PDT)
Message-ID: <e381ce59-c13d-4cb4-b0d3-70f15a500999@gmail.com>
Date: Mon, 23 Mar 2026 14:31:05 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v14,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Simon Horman <horms@kernel.org>
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, conor+dt@kernel.org, schung@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, davem@davemloft.net, robh@kernel.org,
 yclu4@nuvoton.com, andrew@lunn.ch, mcoquelin.stm32@gmail.com,
 ychuang3@nuvoton.com, openbmc@lists.ozlabs.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com
References: <20260316055427.1310569-4-a0987203069@gmail.com>
 <20260318082346.1825390-1-horms@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260318082346.1825390-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2026 4:23 PM, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
> driver.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> @@ -0,0 +1,136 @@
> [ ... ]
>
>> +static int nvt_gmac_probe(struct platform_device *pdev)
>> +{
>> +	struct plat_stmmacenet_data *plat_dat;
>> +	struct stmmac_resources stmmac_res;
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *priv;
>> +	int ret;
>> +
>> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
>> +
>> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat))
>> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
>> +
>> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
>> +							    1, &priv->macid);
>> +	if (IS_ERR(priv->regmap))
>> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>> +
>> +	if (priv->macid > 1)
>> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>>                                                                                    ^^^^
> Does this code return the error on failure? The dev_err_probe() result is
> assigned to ret but the function continues execution without returning.
>
> Russell King's v12 review suggested using set_phy_intf_sel callback,
> which led to significant refactoring in v12. This refactoring appears to
> have inadvertently broken the error handling here and below.
>
> The code should be:
> 	if (IS_ERR(priv->regmap))
> 		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
>
> 	if (priv->macid > 1)
> 		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>
> See Russell's v12 review:
> https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

Sorry for missing that, I'll fix it so that function properly returns 
failure.

Joey

>
>> +
>> +	plat_dat->bsp_priv = priv;
>> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
>> +
>> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>> +}
> [ ... ]

