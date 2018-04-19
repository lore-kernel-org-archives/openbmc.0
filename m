Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GG1sIozt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HcWRjsjr"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RSvY4Jv4zDqhm
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 15:58:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 61EA3217FD;
 Thu, 19 Apr 2018 01:57:59 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 01:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=GD4HP8tbe6YU1hjewdKZAQizbyGIp
 X42X2X/+0bQ7to=; b=GG1sIoztOFUKsOWCRyqyaxELhn44m7Gk6xEXblGF7NZU/
 qvYeod+rt66jBUgBHWeFlmo2q7yK33rlJE8oNXu54YnsZ2WI8RYRBr7sudgKB8tz
 tAHM+6awRB9rOoU+jbXh8syo3BeCvAD7X8YrYL4kGgif7ILc8+xJBroO3AypwayI
 9XNm8Bmc93HTAgPew57NO/venEUXJoENqspoAGRrLKVMv03n4Rd/6cAJ2yhZdVvR
 l8TYJqjpL7xENPr3tFFnp+en/yCp0xKoDayN1YQxmkUso+5H/U2+oYqgu3JRmkOP
 P68LtypjOaYO2db0l/JJ6IDUz6QCEaTjk2s7zrcZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GD4HP8
 tbe6YU1hjewdKZAQizbyGIpX42X2X/+0bQ7to=; b=HcWRjsjrd90YGbadY+AQgz
 A1W0/qtVX/Roo5dV3fErvCLex+0TOB4NyoV4VdBICl77CrXHeUHWhIzCNiwEIw5q
 lq55fU3wlqVohPQIzZD+FTLNt3eZu+NcCk/erO59dHSUsAv+5pOgmJio88r4Re6u
 LDxSoGnpzXJW1MkI/a6fkerU/tNBmBkna8NagydPdo0T95OeAHNhOmVipacHcJd9
 /XYfuB4kVJ6Rl5/gu/b127na4kY9ghWKuPEmB5KuObqFr4c/4kCx24MV+Kiwzm7d
 QBf6b76hCP6YYTlVi6kCIqhHFEHKuy8vDv7cOqCu62mZ2NLSMJC0IQuYPgLxNBqw
 ==
X-ME-Sender: <xms:5y_YWhQI7Q4nSBgcXesQXc5Ug5CF12ff8XRxqF5xAh_EUtjLZmQhhg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 07F444256; Thu, 19 Apr 2018 01:57:59 -0400 (EDT)
Message-Id: <1524117478.2472615.1343250272.196BFE6E@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Subject: Re: [PATCH linux dev-4.13 4/5] ARM: dts: ast2500-evb: Enable the GFX
 IP
Date: Thu, 19 Apr 2018 15:27:58 +0930
In-Reply-To: <20180419042004.25168-5-joel@jms.id.au>
References: <20180419042004.25168-1-joel@jms.id.au>
 <20180419042004.25168-5-joel@jms.id.au>
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
X-List-Received-Date: Thu, 19 Apr 2018 05:58:02 -0000

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
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/
> dts/aspeed-ast2500-evb.dts
> index 45efac8f8806..c0a7f51e7eb6 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -13,12 +13,26 @@
>  
>  	chosen {
>  		stdout-path = &uart5;
> -		bootargs = "console=ttyS4,115200 earlyprintk";
> +		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
>  	};
>  
>  	memory@80000000 {
> +		device_type = "memory";
>  		reg = <0x80000000 0x20000000>;
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
>  };
>  
>  &fmc {
> @@ -80,3 +94,8 @@
>  		reg = <0x4d>;
>  	};
>  };
> +
> +&gfx {
> +     status = "okay";
> +     memory-region = <&gfx_memory>;
> +};
> -- 
> 2.17.0
> 
