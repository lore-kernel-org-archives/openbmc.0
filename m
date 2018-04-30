Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mKThyzgW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Xhzde9EW"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Zg8s3NgwzF25b
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 09:04:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 443D821859;
 Mon, 30 Apr 2018 19:04:25 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 30 Apr 2018 19:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=s23v3ypBNy9AH8cl+PNhqTpn3zBET
 lJLxoRTtsTM4kY=; b=mKThyzgWkRydbaj8qG9B/zC/lVTppAg+IGhgeJGna9s5D
 EpNvU62urIH12zfY9+SRJyyDtErhhQhe/Dygg1izxgKMQcLW9C222QAKr2CUZJNr
 T1rikAPm+/pvSFidwKlEy1xaSwHT+3WKEQzLdJJfDweHBHYlhvUQc6wpR7vmi4id
 GWOqZlkLMRpvt76q4DXBhr4jNq324Ov8ojf8nhMQYTb/1C0+1drE/om1CCgPb068
 DY47ak/3kcDyHCeHYCvC6Pcxalsev+yBc6eBzo7Ol9qeZGRTD6OHcXWIdn/x60Wo
 GV6rxtdmy9DDvZ2lynOKPKw8u4qIMzvlNHJ27nIBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s23v3y
 pBNy9AH8cl+PNhqTpn3zBETlJLxoRTtsTM4kY=; b=Xhzde9EWJ3MP1YNeh84b5+
 PRRe+Og7INRMcxK1DjYvlxXtiI6XG+vJCAR3iPa8GL9WAGoRxsvhtR8h3lyX09Tb
 786Ahus9ex5i26lobCXZshz+yOmsg2PPiA8It7+gmt2B6mBvnOGg1cZSAboU/fBP
 Bpw/m9XXn4qi9hzk70xmrV9ym7wB4YqhwmOAK1u7NOthE7ejdr13wo7MxImgnwqS
 P7jP3l5tcLZBtzZobNN+zn2T9KKDwt/xyyjriNIsf0t/9fUX8YghTPRa/wyFslCW
 +Wbz3KHw/ELQ4FhhocKkUcZkd0/vX8mSiGx5skp3a5ejHkhyV6mv8aCyqjc1mNZw
 ==
X-ME-Sender: <xms:-aDnWqeRN-45lJUIzEluWZj7ZmhViJ4ZdwT9ndD8aiB8-mgb716j6A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 20D4E425A; Mon, 30 Apr 2018 19:04:25 -0400 (EDT)
Message-Id: <1525129465.240098.1356240360.493222DA@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Date: Tue, 01 May 2018 08:34:25 +0930
In-Reply-To: <20180426021026.12548-1-joel@jms.id.au>
Subject: Re: [PATCH linux dev-4.13 v2] ARM: dts: romulus: Enable the GFX IP
References: <20180426021026.12548-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 30 Apr 2018 23:04:32 -0000

On Thu, 26 Apr 2018, at 11:40, Joel Stanley wrote:
> The GFX controller is the internal graphics device used by the SoC
> (opposed to the one connected via the PCIe device and used by the host).
> 
> This configures it with a framebuffer region and enables the GFX node.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v2: Fix the commit message, as we do not output bmc kenrel messages to
> the VGA device with this change
> 
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-romulus.dts
> index 00812a2fecf0..d746e562e8fd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -30,6 +30,13 @@
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
>  	leds {
> @@ -280,3 +287,8 @@
>  &ibt {
>  	status = "okay";
>  };
> +
> +&gfx {
> +     status = "okay";
> +     memory-region = <&gfx_memory>;
> +};
> -- 
> 2.17.0
> 
