Return-Path: <openbmc+bounces-2584-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E07C88E59
	for <openbmc@archiver.kernel.org>; Sat, 12 Sep 2026 15:11:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hhvxj6Plbz2yqX;
	Sun, 13 Sep 2026 01:11:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:39::11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789225865;
	cv=none; b=O8oOqal+S7PWN/dXqUH61qjx1U0YBDxVrCOSj3NxjdDsyO1E+wyre+oj/HFBUnRBK6XtH+YnOCQATT7pcodiZibcPUOahbElUvI1MqGXcGrBR7RcuTtOoGiXt1DMEBRVLn9Ur9plRZQhRBGi9QI4c+RPDAimDW3VXGhnoF4xV13nUN6A5kIaVSe53bVf/PfXh+GTP292lm/Vfg6y6Da2FDiuhZtl5xqTbLYehqcMUKciod2CwPAA8MSqczeKdjEBRUqxhWnXqSFrR4FnlQnsb1rFe6MRINdWOVe0K8vc6ANryICikoTAJH6WdSkNVo4buRXlL7UD+oRRwMvUHZFhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789225865; c=relaxed/relaxed;
	bh=lwWJbmOTPaeL9kmJZ34Rm916nOQbLgwTXi0dTNNuCMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2WkrXDdl97K5q3+kC/RzYFCXuHgtwG3rzQkj2GLahPPSrRgiB68QR2umMFejHtEjnomzrBlHFucQx08+UTzHsU8C0gDEL9YvxEhIsEY3L/WkqkXRunvSCFYbru+uyhitYh5bULgvIhKkRk3v7/BUlyKXXSdHpvHA9Y03xIRFAu3gBS5E+3GQAJVOhDnmkJGZZ0lNIc95MJl7IsOxTrnRwWqXxt835RW4uC38an7urgWEhr5LMG/Bia6rbJHUr5K6koc40sQ0hwcP5E1pVGIpdLMhzKkRBFVyytgMlU/kT3JyawEiTFaMleIdhjlojt8LKfhu1jqxxDLbXhDUNSXiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F06JKhPw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:39::11; helo=mail-pj2-x11.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F06JKhPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:39::11; helo=mail-pj2-x11.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj2-x11.google.com (mail-pj2-x11.google.com [IPv6:2607:f8b0:4864:39::11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hhvxh1l4Xz2xnn
	for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2026 01:11:03 +1000 (AEST)
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso774741a91.3
        for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2026 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789225861; x=1789830661; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwWJbmOTPaeL9kmJZ34Rm916nOQbLgwTXi0dTNNuCMI=;
        b=F06JKhPwPVT+dNgrpPDQoSw/bItplbSlqBI/8QAPmnQy6U210YmGkjrqCkatbdua3s
         YvHqZHeRM0YknJhDzjY88iDGJSJQ417v1IFY6Hg99nAqDdn2JFp2uWzfVogH8NmP79RF
         pXUnHpE+oyKrs258FGnzujUeTPqQqDlv4gvi8h+CmSIyB4Bf8n4LW8QZZI7ALvOODJEQ
         b0jU1Ny7gF/B9+ke+xosBQqovrSCzWx+BqXnH7MWZXEV7/MwaV1klu/PDIAr4ZQq9qJy
         E+iAxY3Hebquphyv19nBU+VpQOiyY7ltZLS7/FaHFmxHmONLu6Vz8vR3WvztEMdWGKIe
         Ac6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225861; x=1789830661;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lwWJbmOTPaeL9kmJZ34Rm916nOQbLgwTXi0dTNNuCMI=;
        b=NbzSmnApyQMmx0GHBq3+R9JWxoeov6rTj1TjIhPI20Bj4S9HsK55/6zT10Gx1jqmAl
         k8tft20kC51EDpepFNdU9nQrVDui5L3WpXyjeTKJqKPoGYJCNw2IpIaRlat4oo7Pa0ab
         SRuWASKKDGldUyyE5S1WZ+RQA8pJtGaRxwjQKPrljYPLZFI1Gzz24d0w1c9tYycAEWOY
         KalogvN7Jud38jvYQ6fx3WNkAUERbf1Z2sa407dNQSpIIZ79jepGEhQ4m4x5/XSj4UdC
         gqrE8dvV3yHuSkkJe5AF1P59MQQCyldQR+WPlH1yuJhDAPsqvLygASz1RccO3zL0BHmr
         I7fA==
X-Gm-Message-State: AFuF++mEsmZZiE45i0F0HbeWk27FY6O5UcY4gx6B3cLHz+tvH+M5HcJG
	VLmuq/StL98qEf1ZgRnmZnuHZNYMVIO2BfJRdZYAUmx7r8TE0tBzhLzRJDxq3Kin
X-Gm-Gg: AYBFou0EbBDbyJy8G7fN+OWyKW+M+gZu65duWa4E28GaCKCT1YPtAtj1H0dclLCCI7M
	yRbu/q/tIbk0eXe7Gx1OJsJ7WXyk7weLEvHiVj5g2MAmNBoP0unS80+BnYx7Nh/5WuSxiTI+NDs
	6kBcHk6Y0MKWdwZjkRRsPBgq+qHewMeoj6/ImfBnS4U1rFTXnkRXSKiGzIunKLUghQP5R3cAm+J
	LHDY1WDNmKm0rqYxku4WS4hzTPMHGYGnWD/OjscfSnr35uVnLKv7/vqt3v26US52LR1UH0s++hO
	K58/DjD4qEa/D23B1qX/q1X6SUCD6vRaTlYUroNfR/2UqPSVdECcABBsop0l6Grc9pZgMzmmFGy
	mCy9TTZIdluUMhu9lugf+CYSFCOoBN+L6fyuknMgM/GO08Q8B4UFIoM50o/SbK7TjOM3HYjOTtj
	LBiN7Ibjj/RH5gwK3OKikcteBbIBgU0JDM3pRyH1OI5vGvd3rXlk9K1921tj5x/1Bl1n7PisQGQ
	HbhOa0HNITXzvqdoSjsVSv2Aq8J7FJe1Whj01P7oEw8fLQT
X-Received: by 2002:a17:90b:1f8e:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39d9bd9917cmr18150781a91.8.1789225860997;
        Sat, 12 Sep 2026 08:11:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cf9a6sm10595547a91.10.2026.09.12.08.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 08:11:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
Date: Sat, 12 Sep 2026 08:10:59 -0700
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
Subject: Re: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-7-changhuang.liang@starfivetech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903133408.110847-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:34, Changhuang Liang wrote:
> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
> monitoring driver.
> 
> The GNR platform has different DIMM topology from previous generations,
> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
> channel. Define these new constants and update CHAN_RANK_MAX to use
> the GNR value since it represents the maximum across all supported
> platforms.
> 
> I am not sure whether it differs from previous models, but on GNR,
> requests to read DIMM temperature thresholds (DIMM_TEMP_MAX/
> DIMM_TEMP_CRIT) via PECI are rejected with completion code 0x90
> (invalid request). To handle this, the read_thresholds callback is not
> defined for GNR, and the visibility logic is updated to skip exposing
> the max and crit temperature attributes when thresholds are not
> supported.
> 

Are you sure this doesn't just require different parameter conversion
when calling peci_pci_local_read() ? The translation from dimm_order
and chan_rank to the register number seems to be different for each
architecture.

> The minimum PECI revision required for GNR is 0x40.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>   drivers/hwmon/peci/dimmtemp.c | 36 +++++++++++++++++++++++++++++++----
>   1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> index bd3e8715dfec..9e98effeb928 100644
> --- a/drivers/hwmon/peci/dimmtemp.c
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -34,8 +34,10 @@
>   #define DIMM_IDX_MAX_ON_SPR	2
>   #define CHAN_RANK_MAX_ON_EMR	8
>   #define DIMM_IDX_MAX_ON_EMR	2
> +#define CHAN_RANK_MAX_ON_GNR	12
> +#define DIMM_IDX_MAX_ON_GNR	2
>   
> -#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
> +#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_GNR
>   #define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
>   #define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
>   
> @@ -125,6 +127,9 @@ static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
>   	if (!peci_sensor_need_update(&priv->dimm[dimm_no].thresholds.state))
>   		return 0;
>   
> +	if (!priv->gen_info->read_thresholds)
> +		return -EOPNOTSUPP;
> +

This check is unnecessary: The attributes are marked as not visible
if read_thresholds is NULL, and this code will never be called.

Thanks,
Guenter


