Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oarDIdZp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dbAHqhgu"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RSnr27wrzF220
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 15:53:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2922421D50;
 Thu, 19 Apr 2018 01:53:01 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 01:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=4j+EvHjDuouDgU/T5QVEG4Koq17h9
 Yity+bX5REPlQ0=; b=oarDIdZpA2t2O7UMfeXhRW5EYnf5GYpGoCOhL6NgA8VFP
 Mt0JS0YTJKw0ri7259/NbV2FwgnrvHT5WKRLF+owX6dtZtm/kUE0KPOSCNFxJNL0
 O4G4mxDBRYDEeIcA8TOUkvOA4pVYAcLlyvbWaztHVPmzxpVGZBpJ45WUODIFfHLU
 LjuotrmIK2D7KUGOxy7ZzhU62s8EF9kQ9+VE+GKSsb0b35zkQxU3vZuIIF4t7wDo
 naS+giOmY3DFXxbmP4k88pq01GwRAFkecP3EnaIz4euL5ovD7px9ZXAJJkE6CB2x
 mrVhQ96Duj2TU3c7hTk0CTvkxgR2djeI/O9FbnE/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4j+EvH
 jDuouDgU/T5QVEG4Koq17h9Yity+bX5REPlQ0=; b=dbAHqhguSZsNn0xdWQl7ut
 gsW/Fdlhi+bss1+FT6AUkntV7afJNTFIBMSzvRtCOtfEI5EGWcbyr+FEj4Zkbnal
 ReHZwXBouYQB1WUkpkxnHZxAP25YqiHt2uCqsG7sv1tGus6i2YX4EOqLDeGtE7lw
 NxU0z8hoB59DaXqOS/jZgA+QgS4zUOkGeDZjlFjioLySBgRXgsv8KT2u8z6XN76q
 sZvSKMFLAg6lPaDQ6QGtGOKRAfmapSG6qGV2J30Y+kfT+a/RnCM7yye6QwzMBBUQ
 DtqXvBd/gufIrsxQ3INZQsEVaqsxImDBw5WLTUxI5TnQG3MIkBqlazMGAhFmAdog
 ==
X-ME-Sender: <xms:vS7YWi0Pv5Nql-ePfTyqI1prPOYnfQOA8dXxay9jEVPfKiKK_KZYdg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id DD3484256; Thu, 19 Apr 2018 01:53:00 -0400 (EDT)
Message-Id: <1524117180.2470565.1343247416.56A216DB@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Date: Thu, 19 Apr 2018 15:23:00 +0930
Subject: Re: [PATCH linux dev-4.13 3/5] ARM: dts: aspeed-g5: Add resets and
 clocks to GFX node
References: <20180419042004.25168-1-joel@jms.id.au>
 <20180419042004.25168-4-joel@jms.id.au>
In-Reply-To: <20180419042004.25168-4-joel@jms.id.au>
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
X-List-Received-Date: Thu, 19 Apr 2018 05:53:06 -0000

On Thu, 19 Apr 2018, at 13:50, Joel Stanley wrote:
> The ast2500 has a reset for the CRT device that must be deasserted
> before it can be used. Similarly it has a clock gate for a clock called
> D1CLK that must be set to running.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 25a88dd44d91..4ca4bc463347 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -175,6 +175,10 @@
>  				compatible = "aspeed,ast2500-gfx", "syscon";
>  				reg = <0x1e6e6000 0x1000>;
>  				reg-io-width = <4>;
> +				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
> +				resets = <&syscon ASPEED_RESET_CRT1>;
> +				status = "disabled";
> +				interrupts = <0x19>;

Bit of a nit, but it would be easier to reference the documentation if the interrupt was base 10...

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>  			};
>  
>  			adc: adc@1e6e9000 {
> -- 
> 2.17.0
> 
