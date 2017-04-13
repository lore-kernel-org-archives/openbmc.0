Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3x052kH6zDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 08:53:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h70KWVUZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bKbkxDSC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD6DC209CA
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 18:53:03 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 13 Apr 2017 18:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=ruw82cnut+2xDhHENxgUCJ1BshduA
 j8r75lWwgJUbZI=; b=h70KWVUZItCGCQ48lDh2GZcmf9Rj3I6dHt5i7MEHd6HXm
 Hsv1HuWYNXjdvCUIVDdH901VqKwHPevYhh8GPM7TzS2ZRFImBcbT9H7+oQo03xSR
 Zmq4h9kJ0FaADfaP5mm+JZtbFhMDNwUnnZJ34GhOnCkSVHIoNBj017TVxCPm/L13
 IzevbbwVM5qvW0wTRIlCJvO1tb/1Pw02h3PaKsmu94t8fcWUDMr9CIwkHsDHmWpZ
 dHXO4pL54G2idLbd3fNfIMjWzKb//QAud9Mclm1ihRn7TkCFYnbSm9kxd6GfaBNH
 DThiWjee1/BEPFHDqVFiUB6K9IBSCN00sr7fS1/qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ruw82c
 nut+2xDhHENxgUCJ1BshduAj8r75lWwgJUbZI=; b=bKbkxDSCS3eka364TviR7E
 S0S9gnRpuD/r46VqZASnPKll0TOb4M6PVCILPjZta46q5okVrQmmgJpIxmc8yYMu
 pHM5vejAXKdDtYrQoBGenGjP3MmgCpo+8roRHsCCd1usu5geQ5HAvqVgDXl2E4jr
 5UhWCr3HMoLqCB38OE3c3uEhLMW579CHGc3JPu3gu/CpARyuMKZlmvaUg1A72avO
 GT1XOILf17qq76wBdvJsD6hRmFQIjl0kua6yhE6E7/qTPT5V3G3KLEbJj2ckc6Kj
 AscsA5ui5oF0fQ/Ktq8Gzw5TDJO/Qkzliu2LRz9O0PuI1ykekrqBEO0KBUsPJDyA
 ==
X-ME-Sender: <xms:TwHwWEY2is22LBjQk8f0WP2ILu3rUbmsAgLcF028R79dh8LuHVy6Dw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 9CF14BAB6E; Thu, 13 Apr 2017 18:53:03 -0400 (EDT)
Message-Id: <1492123983.2866362.944182344.6EE25D8F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0b509d77
Date: Fri, 14 Apr 2017 08:23:03 +0930
In-Reply-To: <1492112248-28396-3-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492112248-28396-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492112248-28396-3-git-send-email-bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Apr 2017 22:53:11 -0000

Hi Brad,

On Fri, Apr 14, 2017, at 05:07, Brad Bishop wrote:
> Enable gpio-keys events for the checkstop and water/air cooled
> gpios for use by applications on the Witherspoon system.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index e3a7b77..4a68b30 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -31,6 +31,22 @@
>  		};
>  	};
>  
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               air-water {
> +                       label = "air-water";
> +                       gpios = <&gpio ASPEED_GPIO(B, 5)
> GPIO_ACTIVE_LOW>;
> +                       linux,code = <&gpio ASPEED_GPIO(B, 5)
> GPIO_ACTIVE_LOW>;

This doesn't look right to me. linux,code doesn't appear to be anything
more than a single value cell in the documentation: 

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/input/gpio-keys.txt?id=refs/tags/v4.11-rc6

I expect you just want the macro,  and not phandle or gpio flags. I was
expecting to see:

linux,code = <ASPEED_GPIO(B, 5)>;

Is there a reason you've done it this way? Have you checked reading
values from userspace gives the expected value?

Andrew

> +               };
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(J, 2)
> GPIO_ACTIVE_LOW>;
> +                       linux,code = <&gpio ASPEED_GPIO(J, 2)
> GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> -- 
> 1.8.3.1
