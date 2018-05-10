Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AL4UF2Yr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CcO36lLd"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hGhc0XhczF1n3
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 12:02:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 98ABA229B5;
 Wed,  9 May 2018 22:02:53 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Wed, 09 May 2018 22:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ajIX2E7YIJeKLiCP5qEeti+M8CYya
 L0hWR/1qp/FYVo=; b=AL4UF2YrJDZVqZmP9Te00Fpa3d0iyif77+7wzO6p/Tw76
 qVzH+mPG7+K3iyWT0XPDMTsbVJYUjLlNzoaUFLjPCQGmJS430/co3VGnMcpFaebN
 I77YIiONKgE7gUYChcPlba3e1LXUM3kKEh2/WBdk6g1nVlfLiWfFzFPEvL9TQhR3
 ATC67F7xfRl6xYFEgljgCDTZR5yPtBXJFkzUgB8QUWIflBapnTo9fLo2qpcFwN4c
 6PHuav10Dc22KVxMUV3MYQFIK7NQpa0mDcvTyJULSu0xdc48nS0mhHZIBhhSdPRM
 S098nwMeuWWiyDMYrP/Jo50zOnDYTymhGkYVo1L7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ajIX2E
 7YIJeKLiCP5qEeti+M8CYyaL0hWR/1qp/FYVo=; b=CcO36lLdTWmMBWeFjpMHPE
 RlFyP6GyJ+zzL0IHOx4oalpD5PnQLE6vqD96dD79qj/4V3q/Js482C5DhQ3+Gx09
 QNQypRMrdEVJA3d3WwFEi3w5MsCQ6/A03yVfmpdtmI/Pc7THmFW0yRqC74hZmbyj
 Dypvys8esMJ/0GeMc7tL7NDtxjtrsobreYzrAqpn6mAn7fEW5EpxZlODFZnI5zhg
 T20Sbmpmk4XroTOimJ23yfBm1ajjmznkqY+Ycar/wVBYX+rDjzTfFbzJGtN01waO
 PSeMB/OczedbQGv8sNweKrXYiG91kreHSOBbpR1MNtEKZIYABvYB+fOoRcjLY3Hg
 ==
X-ME-Sender: <xms:TajzWt4QjE9BVhUZfcK8DcLJ7N1i-JBBgizQLj963Fh9sytRkNcoSg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6786E412B; Wed,  9 May 2018 22:02:53 -0400 (EDT)
Message-Id: <1525917773.2419605.1366930024.0B69BF3D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org, jk@ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
References: <20180504024313.19645-1-joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.13] ARM: dts: aspeed: Move random number device
In-Reply-To: <20180504024313.19645-1-joel@jms.id.au>
Date: Thu, 10 May 2018 11:32:53 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 02:02:56 -0000

On Fri, 4 May 2018, at 12:13, Joel Stanley wrote:
> Move the node out from under the syscon/simple-mfd.
> 
> Being a child of this node causes the driver to fail to probe, as
> platform_get_resource returns NULL due to dev->num_resources being zero.

Ugh. I'm frustrated by the schism that simple-mfd/syscon introduces. It looks like such an attractive solution right up until its not, when you have existing drivers like this that you want to plug into MMIO space already covered by the syscon/simple-mfd.

Do we have a way out of this kind of mess?

What about adding regmap support to the timeriomem_rng driver?

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 12 ++++++------
>  arch/arm/boot/dts/aspeed-g5.dtsi | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 3d391b428b25..50bc661b8fff 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -120,13 +120,13 @@
>  				pinctrl: pinctrl {
>  					compatible = "aspeed,g4-pinctrl";
>  				};
> +			};
>  
> -				hwrng@78 {
> -					compatible = "timeriomem_rng";
> -					reg = <0x78 0x4>;
> -					period = <1>;
> -					quality = <100>;
> -				};
> +			rng: hwrng@78 {
> +				compatible = "timeriomem_rng";
> +				reg = <0x78 0x4>;
> +				period = <1>;
> +				quality = <100>;
>  			};
>  
>  			adc: adc@1e6e9000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 01b66359e6d6..e9e039a6407c 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -161,13 +161,13 @@
>  				vga_scratch: scratch {
>  					compatible = "aspeed,bmc-misc";
>  				};
> +			};
>  
> -				hwrng@78 {
> -					compatible = "timeriomem_rng";
> -					reg = <0x78 0x4>;
> -					period = <1>;
> -					quality = <100>;
> -				};
> +			rng: hwrng@78 {
> +				compatible = "timeriomem_rng";
> +				reg = <0x78 0x4>;
> +				period = <1>;
> +				quality = <100>;
>  			};
>  
>  			gfx: display@1e6e6000 {
> -- 
> 2.17.0
> 
