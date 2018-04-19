Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I0gtyG23"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XbbYDZNk"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RSwB70n3zF1pj
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 15:58:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A8AAD211C9;
 Thu, 19 Apr 2018 01:58:32 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 01:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=NNENotBYsjvzs8sK1Ywnu0GN+h+Zq
 /Mv/1lMyAnqLns=; b=I0gtyG23gWTrZP1afuWNCXfuWpQby/UwlHIDbbBIBK0bT
 bJfg4QBVQmj9DcMkZpZYb5cWpaJ6WrTWngMCShQAD1YtcM9sTVVnKB9K5bshISYJ
 +0xnmrKNaY61jYuApK+Mq9dV/7YuPIVLsvbfIQF5BZMuArTQM548v7edKuEj2iVt
 483xIL1QgoOrJA8GtZ2pTwrn3IOp/rOJxFrgfVyRua3Bx5CUloPu8ZM9IeFM8zJ7
 x9Wbh42Q0h3c9riMytFDXMKWDpIgfmDos5kRZbh5mxTKCcpU/auvJ+y7OTjXbHMl
 akyVl7i0g1Ddn6k/s4+SGNaVrr3UHcG8anZHvUerg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NNENot
 BYsjvzs8sK1Ywnu0GN+h+Zq/Mv/1lMyAnqLns=; b=XbbYDZNkxwnnaxVF43TfZH
 vfdURaf2aUNqnUtOO1VbXmPE8ZCn/QJVI4P2ztCNpNBXl2m6fLnDOPyB8BNaYz6D
 VBp8fC0/AQG8tp3Y/iDK3mo3FF9wvBBewn0tjeOGwnCPfC2dvG6qTY8woX0cFAFk
 D9ZEtR7Xq4P6iWTt1dSR8ablHxZhXenHakNb/KcnOrPK8LdYmdqxIYMX4K+GvEdL
 noLvo+BXhLMpwrYvX1E5uVHA85L33iJU5fFXeVee0pq3bHxeTjg/GKdIr9SqWOXy
 B+bvtIgBwSKOpK8f/LwH3LPHknlu0OAxIuc7H1Reb3KytITM6iwJrloqKONmQIiQ
 ==
X-ME-Sender: <xms:CDDYWgabfzjeWqCexFChfrO_PmeDfq71_dr1s6mL-cWPy2I3Dgrf1g>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7B8604256; Thu, 19 Apr 2018 01:58:32 -0400 (EDT)
Message-Id: <1524117512.2472690.1343250512.1F985982@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
References: <20180419042004.25168-1-joel@jms.id.au>
 <20180419042004.25168-6-joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.13 5/5] ARM: dts: witherspoon: Enable the GFX
 IP
In-Reply-To: <20180419042004.25168-6-joel@jms.id.au>
Date: Thu, 19 Apr 2018 15:28:32 +0930
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
X-List-Received-Date: Thu, 19 Apr 2018 05:58:35 -0000

On Thu, 19 Apr 2018, at 13:50, Joel Stanley wrote:
> The GFX controller is the internal graphics device used by the SoC
> (opposed to the one connected via the PCIe device and used by the host).
> 
> This configures it with a framebuffer region and adds it to the command
> line so kernel boot messages appear on the display.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/
> arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index e8e4d305a9cf..596608f4b936 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -26,6 +26,13 @@
>  			no-map;
>  			reg = <0x98000000 0x04000000>; /* 64M */
>  		};
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
>  	};
>  
>  	gpio-keys {
> @@ -617,6 +624,7 @@
>  
>  &gfx {
>  	status = "okay";
> +	memory-region = <&gfx_memory>;
>  };
>  
>  &pinctrl {
> -- 
> 2.17.0
> 
