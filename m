Return-Path: <openbmc+bounces-2140-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974DACDB47F
	for <openbmc@archiver.kernel.org>; Thu, 25 Jun 2026 08:37:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gmBxv2cjBz2ySg;
	Thu, 25 Jun 2026 18:37:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782376643;
	cv=none; b=QxGV/LKs1oLHxAlP6TymE3THNNluNv3zrxPJvGDxn9CJZZg13avtaj5rvrI1yeA9Qoxgy7m25FQbcCFuuTBKQjDU35nNZx4OF+kGDmkYC7Xrrq5hG/NAe9fKLgCP7OpehFu7FuB6+v7wJHmkOi+29rFH7Xozq2U0f0o9c6XvCRf8/kuPET8wmd0CoT28ETvIbWREo88PMVowMlHLK2cKrcUGLtYwGxQgHQDymhZKOIic6nmT66wyH1GDqur84mi3Y64geDSr+vfJ0ou6ZVfqi6IQ1lmiRCBlTBRnoFMGgQ/9YxJvqkk/ElcDo4VuPSJc/P1nnIoIIukC7mPNyPKcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782376643; c=relaxed/relaxed;
	bh=GZ/6gl2mZGB4EltKgIBsWIFNC8c9VLErzktIljvJXhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zhjikjnsnk6FR2QEsUcZkQn+5BLVfLxMAGwrO3A9jaaiUsFpAWJ1RxqSq8oyb1k+mMgPxOhSvqoxkkCqJ15F0T3vccr5pnW5VuaLwxSLZpaomlyekNVk1T7qbTNeAhjpmvKjW7mDfcoVnf3cpUdH/UOGZRwEAkxg0QIBeBqVzIDbWxJaHdQlbMMXnseDTRnkDtuEaTaTuRnCi6u/YhgZgtgPreR5z0bOC5FaggmnJSZD667IzNiKlJN3Viyz565vDGtL/t4Z5foUdrholr9Mnuzv1SZPX/Nkhq+5amYslPeg4lBOTfTH2iyiVtmEnroWmne5lVt/5NpwVWgSlJ1IPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=KD5F5Fsh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=KD5F5Fsh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gmBxs5SqCz2xLm
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 18:37:20 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-462bb734793so1325530f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782376636; x=1782981436; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZ/6gl2mZGB4EltKgIBsWIFNC8c9VLErzktIljvJXhQ=;
        b=KD5F5FshFTwNtHtL8p2r27UkPSmSiLu2GmJIBaUnKPRmJyDpjQU9MY8hT3q2AXBS4H
         6tzvKtrKFfYpcl+QA6sfXfdbi9Qn4jKyzqZyCsr/Ea+NmudEbTvE15HMbj5a3//2yEDR
         xhWGOywnoUhdpwt8tCJGGIyUSETStV5jk+AiyOkKZ5TEsvgY4uCHeu+tuRy0mRmGjjH2
         4pGy8g2eHCX6C15xoN6V5D94s9aJazr0btftV28ODVmf391+kf6d+ikNSIY75xFMqxFc
         JooTTslsVvxHIH8CsAgVqQLSdy7jdkjMFqWoE+69xSsaeWbaRq9YIjY3Tg7OkqYAsOxg
         4e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376636; x=1782981436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ/6gl2mZGB4EltKgIBsWIFNC8c9VLErzktIljvJXhQ=;
        b=AKBESQbQWnCvxh/Zk2lIA4RXkxSyUgyE+Ro51+GdyBU1JnBRrOTCHHdTJlpLoCRxdP
         +lwD8uz6FJsfpOIPmKrKL1ivdmrsxiRCNOeE7qGYNelqA2Xij0QuYiK29CNEp+irALIU
         4WRUlDpS21h6tO7uLDVHqaU784Y7RWZ6Ve0ZruWWCJZS7oIZ25wqMJEeSKzsSSakjZgS
         dS4frAMO6n8xMYc0nfCKyacIBqKwePf+AV20aUizM0B6vdEgP1wLtwDcm2YTA3Zf2I3R
         m5Yt/qBx4BGtGjTiVAl9ZsvzsrxNAn1eqbyjzQkko7fjIuw1PM06BkF6nrM6GUTvqu3I
         Qjwg==
X-Forwarded-Encrypted: i=1; AHgh+RouKJPPszd2PgkGeBNoW9+kpUfwMEuVRxrMqZ2lNqnQh2w280Jl9QkD51VAFxGXgGb5SGQxy4Re@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8QlaCLnhxq3VHi8yk54rxxdxo4GZds2u1SDzBajH8oT7i5LyS
	mOaredHXLrhxHtq3bXlWzc7a1CzbpMNNLtwGHRrcXxEgEDqw4TBDopT2Gw4TKgFhcaNmtVJ8lUq
	fexZ9
X-Gm-Gg: AfdE7ckuVRdodXQczC+P84VzRkRWNlVzy8BcuERv4Vuo4ZB7QXfBfEVi67uEvho3zFO
	+ZVJA/YSWzGildDAdlxhVxzISdgFFqFB6HFOrFtG/kE6mCtjRDza1bEQEaBzRIGz9i8Mag0WTnO
	5wwE4CEwx2Fb632MW1PhJ+X5L1iSJLOLyftn8HyDRZUD80ziSO0MyWAsaiJiqHUqbpIumcylKAW
	MSe/b/tYYEdSOITzlKgaUeEjB7aUM9GMxqBhl0Yx6mTKtLoubdmjjYJhqpaUo7+yjLBsaZ2wvTB
	gyS7zXndQxSVnIzK3cOtX6Jd+Mb761qTgM0Fu7yv98fmzJ6KTRwORGVHGC8M3+wd0kJkhdxJj7f
	MaSm6M7QYSc1pOzu9Zfm7+RmGiuJnAc6ReE1/TLqmbJgegBdHnCjsn0XLl1EXabu0lRJ6nSczwE
	IHkGVygbbRvHTrSkfjzH/rovhwk2estNWvM69Pt7OAd9WZkf0bhKH8T/SOF48bNKWGtQ==
X-Received: by 2002:a05:6000:310d:b0:45e:f631:2c73 with SMTP id ffacd0b85a97d-46dbec3fcbfmr1960897f8f.9.1782376636188;
        Thu, 25 Jun 2026 01:37:16 -0700 (PDT)
Received: from ?IPV6:2a01:599:844:5d7d:4f6b:517f:39b1:33ad? ([2a01:599:844:5d7d:4f6b:517f:39b1:33ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46dc10e8f3bsm4300295f8f.2.2026.06.25.01.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:37:15 -0700 (PDT)
Message-ID: <a49f7189-4633-46ee-a040-fda065e921f9@9elements.com>
Date: Thu, 25 Jun 2026 10:37:14 +0200
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
Subject: Re: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
To: Jacky Huang <jackyhuang@nvidia.com>, openbmc@lists.ozlabs.org
Cc: andrew@codeconstruct.com.au, joel@jms.id.au
References: <20260624172052.752986-1-jackyhuang@nvidia.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260624172052.752986-1-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/26 7:20 PM, Jacky Huang wrote:
> Adds a dts for the NVIDIA VR-NVL BMC board, an AST2600-based BMC for
> the Vera Rubin NVL platform.
> 
> MAC0 uses phy-mode = "rgmii-id" with no SoC-side clk-delay node, so it
> relies on the zero default introduced by commit 3f6198c0db1c ("clk:
> ast2600: set default clk-delay for all ethernet macs to 0"). With that
> change in place, MAC0 brings up its MDIO bus and establishes a link
> with the on-board PHY.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>   arch/arm/dts/Makefile                  |   1 +
>   arch/arm/dts/ast2600-vr-bmc-nvidia.dts | 222 +++++++++++++++++++++++++
>   2 files changed, 223 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-vr-bmc-nvidia.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index fa6837be74..4db765dd83 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-fpga.dtb \
>   	ast2600-gb200nvl-bmc-nvidia.dtb \
>   	ast2600-msx4-bmc-nvidia.dtb \
> +	ast2600-vr-bmc-nvidia.dtb \

Sort alphabetically (i.e. after ast2600-intel.dtb)

>   	ast2600-greatlakes.dtb \
>   	ast2600-intel.dtb \
>   	ast2600-intel.dtb \
> diff --git a/arch/arm/dts/ast2600-vr-bmc-nvidia.dts b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
> new file mode 100644
> index 0000000000..f8856b1e59
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-vr-bmc-nvidia.dts
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model = "AST2600 VR-NVL BMC";
> +	compatible = "nvidia,vr-nvl-bmc", "aspeed,ast2600";
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
> +		mmc0 = &emmc_slot0;
> +		mmc1 = &sdhci_slot0;
> +		mmc2 = &sdhci_slot1;

Do you use those on real hardware? If so, then you must enable them too.

> +		spi0 = &fmc;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		ethernet0 = &mac0;
> +		ethernet1 = &mac1;
> +		ethernet2 = &mac2;
> +		ethernet3 = &mac3;

ethernet1, 2, and 3 are not enabled. No need to give them an alias.


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
> +&uart5 {
> +	u-boot,dm-pre-reloc;
> +	status = "okay";
> +};
> +
> +&sdrammc {
> +	clock-frequency = <400000000>;
> +	aspeed,ecc-enabled;
> +	aspeed,ecc-size-mb = <0>;

aspeed,ecc-size-mb defaults to 0, no need to set it explicitly:

$ grep -A2 -B3 aspeed,ecc-size-mb drivers/ram/aspeed/sdram_ast2600.c

         if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
                 u32 ecc_size;

                 ecc_size = dev_read_u32_default(dev, 
"aspeed,ecc-size-mb", 0);
                 ast2600_sdrammc_ecc_enable(priv, ecc_size);
         }

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
> +
> +&mdio {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mdio1_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	ethphy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +	flash@0 {
> +		compatible = "spi-flash", "sst,w25q256";

Compatible is unnecessary for all flash nodes. It defaults to 
"jedec,spi-nor" which is also a valid compatible in sf_probe.c.
Also, sst,w25q256 does not exist as compatible in this u-boot tree.

> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +
> +	flash@1 {
> +		compatible = "spi-flash", "sst,w25q256";
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +
> +	flash@2 {
> +		compatible = "spi-flash", "sst,w25q256";
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	num-cs = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
> +			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
> +			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
> +
> +	flash@0 {
> +		compatible = "spi-flash", "sst,w25q256";
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +
> +	flash@1 {
> +		compatible = "spi-flash", "sst,w25q256";
> +		status = "disabled";

This node is disabled by default. No need to define it then.

	Tan

> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
> +&spi2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
> +			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
> +	num-cs = <1>;
> +	flash@0 {
> +		compatible = "spi-flash", "sst,w25q256";
> +		status = "okay";
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +



