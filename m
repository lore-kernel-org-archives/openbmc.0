Return-Path: <openbmc+bounces-2579-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05572C88E41
	for <openbmc@archiver.kernel.org>; Thu, 10 Sep 2026 23:35:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hgvDw5KXBz2ygK;
	Fri, 11 Sep 2026 09:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789059242;
	cv=none; b=fDTXCk1p+KRWPagJQj6MJRqa4tn0FILEAgybWrRDcAZ1HxAhCRGJc9F1r7o2gyLU0oq/5rTRSS+F0lqqAg5SV+xW15xLUWkA4pjrgQb6iKzAvNUQS9oz2i2y7XyWeQyD3cu/E33v/kEc0tnkN/V9oYkkkIlm148t2Fg63BGabmjKqflRQVagXnfeBAv8wASmesGUYtLqID03t1UfsBemoIKNympgCigQI5xNn2Zd8IXd2dQ4ONFD16k3hi+zTRbnYOlX48Z19fi8ZuKpW8Y+e9FfaRLy0Qepc7WEY3aLPGigjZL3lyQ+H72bTH/yEj/dVv8HpKZacCE8pwrjWdDjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789059242; c=relaxed/relaxed;
	bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfFvIV/HHeEJ1HswKabq7u6M/t04yGM/ObnKjKdhrGPgGEhO1ikFRFJPq0PkMQoB945hGe+L7RY0HOpjjDkz3K2n/ZEf1ppUKrJ7CIOEjv6cI2H6JjgfxznUPP1jWCh6G03pZSab3xTAP14Mgsy8fh8YtToxnWQL6in/5EstkkFq5w47HTPZtzsS8AUE/KSC/ua75sP3lpuF0ScB+DmOcUoYmHGjWFZKjcrlHKHuBidELWkmocwCd/qnCyx0kNVKppPp04d9C8mrsWuFZzZy87AxBdVi/togNS8Ry1demO7YFzYunOgzfBr+EuHwxfk2IU/SprqCLY/YltUkyFZuRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lk7TroNW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ychuang570808@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lk7TroNW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=ychuang570808@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hgkKP50qpz2xkr
	for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2026 02:54:00 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so45411a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2026 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059238; x=1789664038; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=Lk7TroNW0fhkVopBYlX/yQrxxO947UplNy/sz/4RHPJW2KINpWEX6kHbY188jmo4oQ
         O4LeSGDZbeZbEOBcmglFGebA5gPGtf6YBjhWNH6m1JS5Mr8SlGTGRRLgnQnHMD2cyNEP
         qJkQZ3NUSFMCd71jP7D7pBUYRTM4CSoHAGrJ3iRAFrFPneaLOdD+tabyZSPXdYm4hirx
         PyeyX1deK9tjX9khBc7AtJ1mVRmhQCY3MI7vzmystz5NTQU1Z8ptZuicuHg0rWxJ+6VM
         T/t0f3en4ITA9oPui0iM2KVrsaIpo3OydCaX+kQHaOAmXqqX5bYYSJacC4fDPBoy0wjN
         UP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059238; x=1789664038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=s4oJwqpPO3LsNkajGYUFeXhaMKSoUGtw9Gwv2K3HfwRSYqGv+XtpgD7ZvF5HumzZBl
         2L92AyXKJ+rcAx9JLdIJzpYOsNbC4M4fTUID/yATKs3gk9GBBEw4h8F2Yj6TdXq37W35
         6ZJIlwaxFa+h3RFNun+oh1ZPQFfMphxT3Rsks+UOM7n0TA0ufiaBn8Ly6b++uac0X4qD
         Xd4002haKe1xawAD5k48t+u0gx441fNdaRlrjmuJEEaqh2irJtOwogFSpGx+uERn7bNA
         DI8SgFdGU5zwAgEXUR3FCTTgyWdP5MBciw0JMMvI/NV2BqO8vw8tM8ciSP0NOPIP+pCp
         oPEw==
X-Forwarded-Encrypted: i=1; AKwUvBzGGwc5PCcoogvFLiGzwfcIduojH9nwGTKutBH183AkQ+k1LUNWWH470bnvv3kVHeyC07cHf3Mc@lists.ozlabs.org
X-Gm-Message-State: AFuF++nMFtlzGSlXIh1WBccKsx2jMQJB2FMIoglxRbguo9NO4Wt0jXjB
	zctdynMpbqlIeikmhpQEAKhPUzbpCNUQ3BYypAGnUcnXlyntqW5cMExiQa5YuQ==
X-Gm-Gg: AYBFou2T9xfPMu/Iuar/gZ1msgfIQoZJK2AWclAR/I/Z4ph/ExsQYMM4fGkeggFeBee
	r4ilHEquXSbl5PSFvbvSFTPrGo92IgQpLEn+B2WFmxJOBej+0tRR6vNjtycn61PZ+GGgKVmuwYM
	Xa7WYC9qLydrmiPzkwLjmPSJTKKDc5MqaHmUt1VXxLXjvuvMgjuQXuOyDcTrbsIDPxQyAC6DAEo
	Jkmu/A+94d7MxmCc2kiP0qY0L0Rh/Cia6TEeT8D5OPk8rjQGi5gg+q41RbZFN8qziiODpeUxd8H
	Ygt4sMgLkgDsaqzJfc7ueAxXdXP7hF1zvxNMvOOkhswyOoJuqdZmJzoAvIiXkHZbkp2d2bUzy/s
	jnL9Ba/QcXA5AFtPpKgOdneTeDk008MprHbBBj2tk5Kqa7AnNfK62UFPCL9CtSC19g9p0czVbdz
	hh1SClX7GxnJ1n2rjHPdVFcHCJhlTyA1biMA1iVCfPpBmX/n7a5qdWVLHEb31nnexx4EIqBHZiD
	VGmr/Syz5LA2KoVydt0elu4v7fNoWzjQ8vwpzmlNGN/4QQ5zCWjmoY=
X-Received: by 2002:a05:6a21:1b85:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3da3a0af14amr66467142637.21.1789059237749;
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm10825a12.21.2026.09.10.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Message-ID: <1ae22be2-b72e-4c23-9aff-ef1052a10c45@gmail.com>
Date: Fri, 11 Sep 2026 00:53:52 +0800
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
Subject: Re: [PATCH v2 3/3] arm64: dts: nuvoton: Add NuMaker board
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
> carrier board labelled NuMaker. Create a DTS including the SoM
> description. As a first external component, mention the SPI NAND
> connected to the Quad SPI controller.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
>   arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 42 ++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> index 3bc9787801a5..4c82109c885a 100644
> --- a/arch/arm64/boot/dts/nuvoton/Makefile
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
> +dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
>   dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> new file mode 100644
> index 000000000000..16c003998d3b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2025 Bootlin
> + * Author: Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +/dts-v1/;
> +#include "ma35d1-som-256m.dts"
> +
> +/ {
> +       model = "Nuvoton MA35D1 NuMaker";
> +       compatible = "nuvoton,ma35d1-numaker", "nuvoton,ma35d1-som", "nuvoton,ma35d1";
> +};
> +
> +&pinctrl {
> +       spi-grp {
> +               pinctrl_qspi0: qspi0-pins {
> +                       nuvoton,pins = <3 0 5>,
> +                                      <3 1 5>,
> +                                      <3 2 5>,
> +                                      <3 3 5>,
> +                                      <3 4 5>,
> +                                      <3 5 5>;
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
> +};
> +
> +&qspi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_qspi0>;
> +       status = "okay";
> +
> +       flash: flash@0 {
> +               compatible = "spi-nand";
> +               reg = <0>;
> +               spi-max-frequency = <30000000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +       };
> +};
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


