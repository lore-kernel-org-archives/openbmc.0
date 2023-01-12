Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA91C54EBC
	for <openbmc@archiver.kernel.org>; Thu, 12 Jan 2023 08:46:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsypB5R62z3c6S
	for <openbmc@archiver.kernel.org>; Thu, 12 Jan 2023 19:46:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 626 seconds by postgrey-1.36 at boromir; Thu, 12 Jan 2023 19:46:05 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsynT4Zxyz3c6S
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 19:46:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BC5C13D5;
	Thu, 12 Jan 2023 00:35:46 -0800 (PST)
Received: from [192.168.1.12] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 166103F71A;
	Thu, 12 Jan 2023 00:35:01 -0800 (PST)
Message-ID: <83d4a222-9870-0de9-561b-eed8717b0209@arm.com>
Date: Thu, 12 Jan 2023 09:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [PATCH v2 14/23] arm64: dts: Update cache properties for nuvoton
To: LKML <linux-kernel@vger.kernel.org>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-15-pierre.gondois@arm.com>
Content-Language: en-US
In-Reply-To: <20221107155825.1644604-15-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

(subset for cc list)
Hello,
Just a reminder in case the patch was forgotten,
Regards,
Pierre

On 11/7/22 16:57, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
> index 12118b75c0e6..4c196140634b 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
> @@ -49,6 +49,7 @@ cpu3: cpu@3 {
>   
>   		l2: l2-cache {
>   			compatible = "cache";
> +			cache-level = <2>;
>   		};
>   	};
>   
