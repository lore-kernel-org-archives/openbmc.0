Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jqfLI2Cc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NOFdC/2L"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R5XD1t9NzF35b
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 16:25:15 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A886021DB7;
 Thu, 12 Jul 2018 02:25:12 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 12 Jul 2018 02:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=wWCI4CtuJb3LbHsVqq3m8qhaGMzxo
 kpPIcjwkS0GXoE=; b=jqfLI2Ccbg/cexfVNt4lhKBs3U43CdchZqwmG87At/ThZ
 /PTvlqyeJhwAcCx+szKhvhaQOR5Wm5fAL1DuP5oyeJIKlW0J5FymflhcA3iTjbjj
 /9jnjJgYlJdrLsNkY757terx5Oa1qlu/TGubrNr3lKH6xpZDsHwkBwvz6iAsuTlX
 P51tPLskdWfXGjAJGYoZqSgC/ajkRAZUMm2ZXDlneagTGfNqxSvKqvXswKiL+kBC
 eUFNDineDqwZ8vgS3GRLMewvJjH5ceraMikAR06ZoKbFjH9gclk3lR+sw4MJGXbd
 aA+5hGYbK0xLJZNKa6xYV6ZjGWCud0X04sKlYsrjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wWCI4C
 tuJb3LbHsVqq3m8qhaGMzxokpPIcjwkS0GXoE=; b=NOFdC/2LCQjz9J2LG2OAJ/
 UD0VAT+BXqgb610EFA3CiorMbc9SjoPXKKEmZj2/TgX4aZMSq2qkuSVtPqqiWG04
 sx6w91v5yX9Kk0DKHySCY3CuO2/NKqx3sb/NZMaYmKLur27HpLygx5S0vy/N/1yi
 /H9WprwJivyEKG61ouF3HvPtHnj80zDssKxh4VGHhPsEpRQeMQjZiSvjTM8bGjyz
 7qzYqHG5iCfmLe9sol/O62zrQttVyw97+QUP97u2KzqUeva+fYgPJTulkYabXG1c
 h6Dq5y8H5QafFstzmvNv04SYcG5h3BDptdSa/uEUKAe+2h5gqA76h11Q5079bnSg
 ==
X-ME-Proxy: <xmx:SPRGW3rl5enjmpWLgwJY-aFyiesGs7YqTxmVV3jFEQFWsoUmzIwNzg>
 <xmx:SPRGW51h-D3Zkx-yVzXeBp_xyZf3dEOBmd2nnBLSefepbvz7viaTQQ>
 <xmx:SPRGW_xfqzZVGdWcjNSMgwHjzAZrT-mjxg2Y1PJ_J1tTS2Yx8XLOBw>
 <xmx:SPRGW1jM_KWO9rcynKkJNQzr3YKts0rZpuw2PHnQxXephv4oFCsO6g>
 <xmx:SPRGWypVqHTVCR5upHueV9_5g53P1TcXn_GGqQBLJR9Z3a_p7eNTuQ>
 <xmx:SPRGW6ehEz5z3cyixq-R9FMWhmhWWMVQI8OSFfJksYwDdGN7CQxxGw>
X-ME-Sender: <xms:SPRGW-nmb4apMf_iqmx20ULLbmVL6Z8eZFml5PChqEoqBY0rMhwqEA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 2E413BA4CF; Thu, 12 Jul 2018 02:25:12 -0400 (EDT)
Message-Id: <1531376712.1293029.1438140208.6ECCC683@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-957169fa
In-Reply-To: <20180712061742.10283-1-joel@jms.id.au>
References: <20180712061742.10283-1-joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.17] ARM: dts: aspeed-g4: Expose SuperIO scratch
 registers
Date: Thu, 12 Jul 2018 15:55:12 +0930
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
X-List-Received-Date: Thu, 12 Jul 2018 06:25:21 -0000

On Thu, 12 Jul 2018, at 15:47, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I'm breaking this with what I'm proposing upstream, but we'll work around that given the g5 already has this gunk.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 87 ++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index e86fa80712e5..6af12872ee74 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -316,6 +316,10 @@
>  						interrupts = <8>;
>  					};
>  
> +					sio_regs: regs {
> +						compatible = "aspeed,bmc-misc";
> +					};
> +
>  					mbox: mbox@180 {
>  						compatible = "aspeed,ast2400-mbox";
>  						reg = <0x180 0x5c>;
> @@ -1366,3 +1370,86 @@
>  		groups = "WDTRST2";
>  	};
>  };
> +
> +&sio_regs {
> +	sio_2b {
> +		offset = <0xf0>;
> +		bit-mask = <0xff>;
> +		bit-shift = <24>;
> +	};
> +	sio_2a {
> +		offset = <0xf0>;
> +		bit-mask = <0xff>;
> +		bit-shift = <16>;
> +	};
> +	sio_29 {
> +		offset = <0xf0>;
> +		bit-mask = <0xff>;
> +		bit-shift = <8>;
> +	};
> +	sio_28 {
> +		offset = <0xf0>;
> +		bit-mask = <0xff>;
> +		bit-shift = <0>;
> +	};
> +	sio_2f {
> +		offset = <0xf4>;
> +		bit-mask = <0xff>;
> +		bit-shift = <24>;
> +	};
> +	sio_2e {
> +		offset = <0xf4>;
> +		bit-mask = <0xff>;
> +		bit-shift = <16>;
> +	};
> +	sio_2d {
> +		offset = <0xf4>;
> +		bit-mask = <0xff>;
> +		bit-shift = <8>;
> +	};
> +	sio_2c {
> +		offset = <0xf4>;
> +		bit-mask = <0xff>;
> +		bit-shift = <0>;
> +	};
> +	sio_23 {
> +		offset = <0xf8>;
> +		bit-mask = <0xff>;
> +		bit-shift = <24>;
> +	};
> +	sio_22 {
> +		offset = <0xf8>;
> +		bit-mask = <0xff>;
> +		bit-shift = <16>;
> +	};
> +	sio_21 {
> +		offset = <0xf8>;
> +		bit-mask = <0xff>;
> +		bit-shift = <8>;
> +	};
> +	sio_20 {
> +		offset = <0xf8>;
> +		bit-mask = <0xff>;
> +		bit-shift = <0>;
> +	};
> +	sio_27 {
> +		offset = <0xfc>;
> +		bit-mask = <0xff>;
> +		bit-shift = <24>;
> +	};
> +	sio_26 {
> +		offset = <0xfc>;
> +		bit-mask = <0xff>;
> +		bit-shift = <16>;
> +	};
> +	sio_25 {
> +		offset = <0xfc>;
> +		bit-mask = <0xff>;
> +		bit-shift = <8>;
> +	};
> +	sio_24 {
> +		offset = <0xfc>;
> +		bit-mask = <0xff>;
> +		bit-shift = <0>;
> +	};
> +};
> -- 
> 2.17.1
> 
