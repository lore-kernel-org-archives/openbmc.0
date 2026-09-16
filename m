Return-Path: <openbmc+bounces-2597-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C41C88E77
	for <openbmc@archiver.kernel.org>; Wed, 16 Sep 2026 09:37:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hlDMP177Xz2yjw;
	Wed, 16 Sep 2026 19:37:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789551472;
	cv=none; b=U4JPqLSreoNRvgSc3bEEDacZpUkWgK9Y1ou3siqmrmX1GfHUfXYiTuY0A6dy+9476ABUPWKh9/jK58onBHT23qWwn2b64OIzaz1qH2Ux8o+5/2HQAoXmSb5QHrlonX+GvIR4e0k43CQqSy+HOEjD2c6psLsfdtwTnu7NRKrxfmRzs8ir7E7UNvZpP4O9zij0CCNNi7tj9ONsVfGMiBL4dwJn+bBpeb87or6B0OGSdqUP3S5kov1XTPYuP6LNphMzSVGsHUVDUNTG5jfTNbm0E5O9AYrFWF2SPpXkbF1CaHQNx2MuzVMlnDTuw7fpRtg6XSoN7ukIRjPdN4QlF0/t7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789551472; c=relaxed/relaxed;
	bh=SETz7CJf8S538EoP4hMRAVzbgEhBD6ecA2dpfx+2GfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpDEgEes3OEHH/szkzjwW1N2ZSKHeMDfDzl6TlcMk5NHUeQ4ZuNVLsLRDONOpcFWkDkcywyXLE7TwHqvOgXo7yAO9G6TIy+DME2JIroGux+CCxg9DvqkT4L8bjb9m4j1FNOrQxfNwcM1m2TUHiVF212c5TlyyPJ7V7DipDuRtuBw0gdojh+kzYsjVOsArgbcPLhPhyG6VoP1Cvo4WlHtCmn8RGnVzLFW4GkV1S4iX+3q2W8yBB4Uuy9kVi/rwGhEoDC0GiXTRIsCIU1j8/KyTVoD04mYqQ6YV1liy9fVhpkVx7Wgx/uob0K1+BsE6RJ2MUasJ0D/azVGkEyaj869Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=aHCG0UXa; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=aHCG0UXa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com [IPv6:2a00:1450:4864:34::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlDMM6RCNz2ySf
	for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 19:37:51 +1000 (AEST)
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c2953a01240so137589866b.0
        for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789551469; x=1790156269; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SETz7CJf8S538EoP4hMRAVzbgEhBD6ecA2dpfx+2GfY=;
        b=aHCG0UXahsZbBtQE5+8b5wJtwa8KoF1/H+tTqCsGHqFe37AnfBwifkbqEHt2Gkl0wL
         eQWGjR+MWLGJy00mBW6xDTd4+CLUE3KBPOoVj6eXXnacdePQRUsbJXS/8i4bppCgHv9e
         KGlx4ermlrERz/E3hwaJLVdX7Vf98ndpiDIoBb/OHQE06qFDImUepXEXf5HY+edNFEAl
         p4GviL2Clr8agByDWgFUCLCfWYkbv7ClP6vgxCAa5SXw4v4GvXgbOQukrCKSA/wyia6t
         FU+jmXQrDpTW3ehWAGP2DCDCAc2hzaNFQoMX4UnpK7H6tq9awdv7G9PmcXQ70EJaG/kB
         dgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551469; x=1790156269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SETz7CJf8S538EoP4hMRAVzbgEhBD6ecA2dpfx+2GfY=;
        b=AVotH2HW5JBd5QzqdbEhBYaBDfiCaiNPUvNmbwUfPZS3BfjJG+J8mUvyGPrH2V8xkE
         7TvFtcflsnIJEKxvkGHzQ2CSUhj7fCN6efJJ3vcAWakow9WpIClbD3EUJVw0Zu2v/Zyl
         mGl8VmJ1MhzaaM1osWHG/qmfD6X4af1hGRqIe1sEmlEWg+KK2+L6J68Ef6uU1CL0KEl+
         ZCLYIIzxX2YU9Tkh6z/yTEvU/IbE1AxYyDnQKNPtdP6yWwjyjVy5aIcpGBMGUHx9HjKi
         pa7SJY4aL1qSQTH3EXcSlL75/txvVTzUkXue3ELZ2cH4Ma9RqVTJ42UD/2lmrzKlB+8i
         WP+A==
X-Forwarded-Encrypted: i=1; AKwUvBziFyGzdWoGZBEYZTDodiU2zHtZklYwewjC+3/TYM0jIdSQvOkLd6JFKab+G7afhJl9si3jGPzJ@lists.ozlabs.org
X-Gm-Message-State: AFuF++muEHNiFmyOvhEpe1fxqqQSsATzZ5W4GWmehJ690bhv4Cy69XkY
	GkpefTey/3vvLxsK4CYZqLaSOII1AKoDKM7Joogz9pbZddGhbOPEUUJMMbzXBrLTYTQ=
X-Gm-Gg: AYBFou2tvHUhNQxfxUwzKSv/NT3vXnX0qJvbHruy7zjlm9O5SHacKz5W3dz63vG2Lh3
	8UWtJmKVn7NjC2CfL+CvRAwW+hyNu1AuZXFWU8ums+JXE7V50Dzdr2XykrXvD9FmLC+qLjdm33w
	tqd8lkM/+RmwddfFeGBQX1xSdwcLyomAWgUkM0n7NkmasncBlYV6dqyUWgEM2jdUVXH6qslZP2b
	B6KEKa/qnMR2XM5D4IPBRHNqZZJ68HjmgtKFqOh2q9dfhZi1Pz6Gyw/8jitBE/TmWSyKMvwA8oj
	LYqod9lKSmKJfZePOdPGlv2ZNOn2L7QtZSzqBKUDgHGmmHNOQ8jXgsOdInI/gb92k5qB4jSXDgB
	2w15pnIPKHlGrrfpZZRnXUD/d/Rn+OTXtGsKceCs2P2zIsNGR5H4Vg+Hrqc+IBZKHXRDqJzFpJd
	NhOihDqfni2Lv4vjj2Ul4LKEUdHPkh2dMkQlCON6JSnDH46X9OLsAYNHuqfHQVSW3lVr6RFOhh/
	r0PKZYaqQ==
X-Received: by 2002:a17:907:9621:b0:c29:439b:d5c1 with SMTP id a640c23a62f3a-c29e5207ad9mr130353866b.16.1789551468667;
        Wed, 16 Sep 2026 02:37:48 -0700 (PDT)
Received: from [10.27.65.31] ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de086960sm101878366b.1.2026.09.16.02.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:37:48 -0700 (PDT)
Message-ID: <2e1abfea-ea80-4bb0-99f0-eb5858c30e8a@9elements.com>
Date: Wed, 16 Sep 2026 11:37:48 +0200
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
Subject: Re: [PATCH linux dev-6.18 0/4] iio: adc: aspeed: Backport battery
 sensing patches
To: Cosmo Chou <chou.cosmo@gmail.com>, andrew@codeconstruct.com.au,
 openbmc@lists.ozlabs.org
Cc: cosmo.chou@quantatw.com
References: <20260805061310.1740724-1-chou.cosmo@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260805061310.1740724-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/26 8:13 AM, Cosmo Chou wrote:
> Backport the ASPEED ADC battery sensing fix series to dev-6.18.
> 
> Billy Tsai (4):
>    iio: adc: Add battery channel definition for ADC
>    iio: adc: Enable multiple consecutive channels based on model data
>    iio: adc: aspeed: Replace mdelay() with fsleep() for ADC stabilization
>      delay
>    iio: adc: aspeed: Reserve battery sensing channel for on-demand use
> 
>   drivers/iio/adc/aspeed_adc.c | 72 +++++++++++++++++++++++++++++-------
>   1 file changed, 59 insertions(+), 13 deletions(-)
> 

All commits are missing the `cherry-pick` reference and have no DCO 
sign-off. Please see [0] for more.

For this series:

NACKed-by: Tan Siewert <tan.siewert@9elements.com>

Tan

[0] 
https://github.com/openbmc/docs/blob/f5a34e78837e099e539c9ff5d020fd2d1db513bb/kernel-development.md#tldr 


