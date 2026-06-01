Return-Path: <openbmc+bounces-2016-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD97CCD6E56
	for <openbmc@archiver.kernel.org>; Mon,  1 Jun 2026 09:26:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTT9v2jqwz2ydQ;
	Mon, 01 Jun 2026 19:26:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780306003;
	cv=none; b=JHZGdi4G/FRawOp35gPJ8/+Raa/6Zm2H3e+/aAwdjkBq2BssrR65d/oN6j7oODO6uFDLWjgPIh1NU9LlvJrqGYX/3ZAUCFvlZWh+EWtTiJup12ketr+seLElaVuLg+OhQbi+1HAuLD4l5UWvtLDHhhycWmOzOyYCSTw0aDWqjSgniRG3C4o26JH4C/peaOC7lEGU/7fj2TIsAzgxUurPJGkf5lCVJbZvJOrzN6/SKFbUCoDcjUO2gYkEES7Y6xIRu7pmsDd+PkuXUGfgRid/rRRX5nzIXnr2JUivdmUetgpFkvI4Sdi44Hk/3HWjsKEkSHpY6IKFBRmXfC8HGcAdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780306003; c=relaxed/relaxed;
	bh=sAombFaAMaFPCaT4hnjmDXk3aVd313PJ/tF982Tlldo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0dP7onBcXxO9HCRlrFmJdKKArqNLQCY057YxrepDNJs2+ZC4MeQ9PPIIG7arNP8/QYBgT6cVg8++el4GE/p9JglJ2zdgpn1Co9BbphkkhPaFqwQ7fxA+4nSDk9MGDM5mYN2Ue6lfYcLEiY8PE6mm72HUw6/FKs85ufgQHBPJHDZ/wpXGW4gLJ2HvyhnpcK2FFBOSADP+gE+GPWPeLIcJaILjMukJ+wYf5Yd8mUBxKeXxoJmGCh5+vcEOlAt5ZDl0U04m3tHQ+uqVydevs/JOjSPBfCgYnVhO2z02wzP39ChHW9+W5mK3RRekItYvTN9o/yTRfgefL7Ylmil48+HDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=NXJMq1Mc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=NXJMq1Mc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTT9r3SG2z2xdb
	for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 19:26:39 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so14459481fa.3
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780305995; x=1780910795; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAombFaAMaFPCaT4hnjmDXk3aVd313PJ/tF982Tlldo=;
        b=NXJMq1McYuEAWj4hwVb5oMy5qAUkSh8w1H89ZJY7I7NTjuNiDUoQolBBDOMvWs+vp7
         TxwPkLzt0kircwIvHsMetx13J6LIua8cqMJgFvh16z8eYW8aAksD3sOQ8d2xTXn9xhJ9
         LlOJSf+NmG36Zszod3Wt4Ud6AABuAUzDG7mpmqGd9vI8KdccoARJZYdqK5Q7RTJfkOU9
         NyCMdfPIvn5/nrru5Do4uTTWxe/A0L3oNO38TRxHRoyYz/AcECmfqXdFyZejhVqxa63H
         44OnPPJfSVLD++MsUllRpzEuTMZZ4d4eSfcHVls4oLH/rcXmZ8ZySwPBeXkweaS9oUXm
         Np4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780305995; x=1780910795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAombFaAMaFPCaT4hnjmDXk3aVd313PJ/tF982Tlldo=;
        b=UXr1GS0CbE/uHDZkVWDBtnafifREnXn8es54W3IrG0gpbJYNR1GWXs9e5sruMcd0LJ
         zuR8TtxyZvKxHzI1dbIjcYr2m+hgzfyJtbP6BdPCxDGccO1DxXhJ+q5EVOf9Oixethle
         wCS1ztfuGuU94vkZjaDgrzfPHlOC0wQ5qjonIkgrcsuZRacnqkuXk+stCiaX2xoZUJYW
         iDlxpzlEw6chs+JeNiZykk2FhSTuMbAQ70qZUxGmhyBLv8bGGkeTziNWDNv7I42/+kZU
         JO4bK7ugiNj6n0DUJ0UfcWkT2Mke5gL3wls+VFJzaFQiOyoW8BjgrEdBduM3WiG+0E1p
         o5PQ==
X-Gm-Message-State: AOJu0Yzvh/kHfbduxzvcAZrrS0kOgfmB1zr/QODnopq8I+YRp7FsEagn
	b5Fd32vbuoP7rsdkIjxrL4svuwUl5qAgM1f1HaPCjveFkxWzrLkxxboCX2Jd8fxq1bnTVyF7z99
	ivIW7TvXcIA==
X-Gm-Gg: Acq92OExMVtq61hB7NEzy1velWZCV2gUj7Vg+BBS4k38jHLlIWd4x4soJLiW7dOgqPs
	STWMtMnVhWa/Aes7I5Xhat+jA9qEu5NYvR5DMTK01D8FoQ8raOr4oLPmCp21PtlrUNiOql+NII0
	DRYlaAajEphs9ygiqsQBPX2FSjr2ovTi8YgJD//Zj8hhBwb4BbMvgrfaSCnQuR9grPbfjozrHD8
	PdWccIzwQ3ARy+5eHBA+l/lPEbJHxwXca/fnpHnVARQGoIeP3bvtJcRfItqWth6ue01ho8scM7d
	FcGRZBgcjTFaggGJ1Gt2sYPiXTgw4p5FUHQn3hmSb/2UHZ1FMfrtZ2ZVyuwjDBwn0pBR5QTEG74
	RHOBdAZdPVzBuk/ThxkBxJqasJr7N9OBWt30g6plGkkvSzKDz6iCQajDh43hZQPHfJVNNopp3f4
	auaJCbWSYjKG4I52zyZzD+WnWzg+OsD4K6ToxtSfCHPL2GJzRJJULh2kny+vPS3kThHCMmGuxIv
	U8PvIXTnLDOACCejRRzgr8JxlG/ssjgsbxWDJuKKhjBrcbMcW33KlytPXwwbU5Kot2u5Qwac7So
	/gfM4Tblgn8N
X-Received: by 2002:adf:d025:0:b0:45e:ebec:2542 with SMTP id ffacd0b85a97d-45ef6b7e75cmr13764482f8f.30.1780305984231;
        Mon, 01 Jun 2026 02:26:24 -0700 (PDT)
Received: from ?IPV6:2003:e6:6705:6500:3eba:c936:e58f:3e19? (p200300e6670565003ebac936e58f3e19.dip0.t-ipconnect.de. [2003:e6:6705:6500:3eba:c936:e58f:3e19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a037fsm24619653f8f.4.2026.06.01.02.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:26:23 -0700 (PDT)
Message-ID: <0a27f1ad-d5a2-49b2-a79a-c2134ad7b2d2@9elements.com>
Date: Mon, 1 Jun 2026 11:26:22 +0200
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
Subject: Re: [PATCH u-boot v3 2/2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, joel@jms.id.au,
 andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org, Ender Hsieh <andhsieh@nvidia.com>,
 Marc Olberding <molberding@nvidia.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
 <20260525-asus-kommando-v3-2-e6a0ca1b4a3e@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260525-asus-kommando-v3-2-e6a0ca1b4a3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/26/26 4:03 AM, Anirudh Srinivasan wrote:
> Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card.
> This DT has networking working in rgmii-id mode.
> 
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
>   arch/arm/dts/Makefile                            |  1 +
>   arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 92 ++++++++++++++++++++++++
>   2 files changed, 93 insertions(+)
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 5141c3dc3aa025e2f5c9b2bb98216ee5c72cdf70..fa6837be747da4fbe102ac27e60ee3d81e230cb7 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -682,6 +682,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2500-genesis3.dtb \
>   	ast2500-romulus.dtb \
>   	ast2600-ampere.dtb \
> +	ast2600-asus-kommando-ipmi-card.dtb \
>   	ast2600-bletchley.dtb \
>   	ast2600-dcscm.dtb \
>   	ast2600-evb-ecc.dtb \
> diff --git a/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..bad3b011bae63c058fecd4790e3243bb0df4b770
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model = "ASUS Kommando IPMI Card";
> +	compatible = "asus,kommando-ipmi-card", "aspeed,ast2600";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	aliases {
> +		spi0 = &fmc;
> +		eth0 = &mac2;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			clock-frequency = <800000000>;
> +		};
> +		cpu@1 {
> +			clock-frequency = <800000000>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};

Out of curiosity: which revision of the Kommando IPMI card do you have?
Asking because I have two R1.04s and both fail after a power cycle, but 
only if the SPI was probed by U-Boot before.

I'm still debugging the issue on my side, but based on what I saw with 
my logic analyser it appears that the FMC is in a wrong addressing mode. 
When it reads U-Boot, it's misaligned by 1-byte.
Blipping the /RESET line makes the card work again.

	Tan

> +};
> +
> +&hace {
> +	status = "okay";
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&mac2 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy2>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +&mdio {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mdio3_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ethphy2: ethernet-phy@2 {
> +		reg = <0>;
> +	};
> +};
> +
> +&sdrammc {
> +	clock-frequency = <400000000>;
> +};
> +
> +&uart5 {
> +	status = "okay";
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&wdt1 {
> +	status = "okay";
> +};
> +
> +&wdt2 {
> +	status = "okay";
> +};
> +
> +&wdt3 {
> +	status = "okay";
> +};
> 



