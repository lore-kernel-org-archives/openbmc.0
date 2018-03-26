Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r83sE0DF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HA5hV7yZ"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 408mwb6jXvzF1vk
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 19:07:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A29E20D5F
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 04:07:56 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Mon, 26 Mar 2018 04:07:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=Uioze/kZCe1NWRtNA1A6NStTZxszA
 x7Vy2yoKS6H4bw=; b=r83sE0DFlGym62CKv4Ga31zkqxh5P3DFIPwEHzzxEsnH0
 4BmMgn7eLaG7xBUXFHT2tdrQGTh6kv4btOV1awh62wrCknVRkJ3M+H85COIm0qrs
 QMt+FQB2enBW+UFkfI1pht/x4F+g61KayIwxbCdu5VXLgB7SB4TkG6nFmEYA1N63
 hEPh4RIofVVeL+obj551E/B+TS8la9HdOUYUSrVpijUv3VH4Z5I5cf9syhAU6lAa
 qy8JUNxq6NcRM0D+ld8DFs4G49yAOISxY1pGpne50OP3vgmuXj3GbnO5t7h/9+my
 jEBcPgfbk7O2SZT+5huhW/NX1O/q7EYfREReqFS9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Uioze/
 kZCe1NWRtNA1A6NStTZxszAx7Vy2yoKS6H4bw=; b=HA5hV7yZRKm43zB2PvukKZ
 dsEdHgo7NKZKPxtAftObZ5JVjEXMb3NGtaoeBhRNl/eP/1tFb0unPyZ9ryW99dQP
 WVh5OJqEqtb48vpyBLrccfxfs9xtoeekfIs38ulFXVZ9J2WBZl6txIC2iFggMLuG
 c3fez2bOiFILFETZvcc+bi5kM6UI2dmfOhBicLMOPUqeEOeH+yaf1s6+1VXPj+R5
 3/72x/7vLH++EXCCAzVSASukoH0IJtUI4LwZlDygnA/UVXBJFFmogAfG1jXGiX14
 T2MoKVUOqmwtRs6p+RkqTfd7Eg4BzWnf71oUAtuyyjfkF7p+8jaBgQHHcz9jucNQ
 ==
X-ME-Sender: <xms:XKq4Wj7WnMy9LjB3_TgjEC_-pi3sF4zqoqZNubVxQrscB38saNMjOA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 34E129E0AB; Mon, 26 Mar 2018 04:07:56 -0400 (EDT)
Message-Id: <1522051676.1429236.1315961632.273FE2FC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-5ce6c4ba
References: <20180326051639.16555-1-joel@jms.id.au>
In-Reply-To: <20180326051639.16555-1-joel@jms.id.au>
Date: Mon, 26 Mar 2018 18:37:56 +1030
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Mark bclk (PCIe) as critical
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
X-List-Received-Date: Mon, 26 Mar 2018 08:08:02 -0000

On Mon, 26 Mar 2018, at 15:46, Joel Stanley wrote:
> This is used by the host to talk to the BMC's PCIe slave device. The BMC
> is not involved, but the clock needs to be enabled so the host can use
> the device.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/clk/clk-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 5af80b4e673e..5be88f0a0678 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -97,7 +97,7 @@ static const struct aspeed_gate_data aspeed_gates[] = 
> {
>  	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
>  	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	
> CLK_IS_CRITICAL }, /* SDRAM */
>  	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video 
> Capture */
> -	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	0 }, /* PCIe/PCI 
> */
> +	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	
> CLK_IS_CRITICAL }, /* PCIe/PCI */
>  	[ASPEED_CLK_GATE_DCLK] =	{  5, -1, "dclk-gate",		NULL,	0 }, /* DAC */
>  	[ASPEED_CLK_GATE_REFCLK] =	{  6, -1, "refclk-gate",	"clkin", 
> CLK_IS_CRITICAL },
>  	[ASPEED_CLK_GATE_USBPORT2CLK] =	{  7,  3, "usb-port2-gate",	NULL,	0 }, /* 
> USB2.0 Host port 2 */
> -- 
> 2.15.1
> 
