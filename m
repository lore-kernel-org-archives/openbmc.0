Return-Path: <SRS0=FqcK=KI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E596C433ED
	for <openbmc@archiver.kernel.org>; Thu, 13 May 2021 01:35:03 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1A861404
	for <openbmc@archiver.kernel.org>; Thu, 13 May 2021 01:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA1A861404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgZ391pvPz2yqC
	for <openbmc@archiver.kernel.org>; Thu, 13 May 2021 11:35:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=QYAPy4NF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=r3b7d7XK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.26;
 helo=wnew1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=QYAPy4NF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=r3b7d7XK; 
 dkim-atps=neutral
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgZ2c5CTCz2xvD;
 Thu, 13 May 2021 11:34:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7E1A01FDC;
 Wed, 12 May 2021 21:34:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 12 May 2021 21:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=SWVR8Emae5xp73d7j3kk9BUVMAV+TJP
 pcPLvVYttHEI=; b=QYAPy4NFRvDeoipjFKZtMfKy7SsQAQAdE1qgEDJXLKBP1u6
 4kWpDvtUQgvtcN4I9v1YpdLFW36cLnrUZij45Pf5J9CzXAZ2si7rGkDAbaBN4zAV
 8zm/LJ6KJodfkRYB8qK9VRGjKmnYmSG7QrbEMaHF8RnQc8t13dxz0wHXHNnch+RF
 aHa6u7WLlq68BdFIehVaGSDXSHTzION+Ve+4rZ3DOJV3Ael5nbqHDfF6sayl7FZO
 rOkmKXt5nbRnZrog4uXLLI46L+WA/t+2enI0YBA0d43IY+OVpMg3V/XWHOOzw9/4
 XLD3A7kgySSTlMHohjN6Gn16/WBQ4aENriPZ1ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SWVR8E
 mae5xp73d7j3kk9BUVMAV+TJPpcPLvVYttHEI=; b=r3b7d7XKm3AEANfyaa0MPq
 oTUBY1VA3eRDIwVUQFHjdizMuFd0fQc6xHCqzkA31DX/ufrEr5ZYb0sMYcbhfPPh
 23u8qUe1lm4udWmxpkQBJeUw1OE++AG7uXHtjfLX8VkAD6gXvBxAF6yptIToSmSR
 lHsOtSsOC0iGaXvU3nuHbOQgqXGWUKV+pM+5L6Cu0PxPsGzfXIxotlvdjZnMtOzK
 aDGYo8gDNq2yoHCBEHq8FjH4MAf9zvZJXjBLjtowVlqyQoTWPQ/C/T0ZvKe2oO3I
 NLbwuykJWcgAO+Sxbh+ow1cZ7p0ZXH2mh76OdfqTZqiQ/p1eWVfA25k+kIQt6mRA
 ==
X-ME-Sender: <xms:IoKcYPYAcrA-ektTVMh_s0FTU3GrHaivuPK3XWTiLdQEctQu0w76ww>
 <xme:IoKcYOaIJQy8BucmVvwV2BEO6a5gxXvSGIlWHLx_ojnKzMbrwVUB1_-y_MHUHd0mS
 hDPPCU9u5OYowhF-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IoKcYB9GYoSK00WkYVTCKhz42FvY_-lFtGbytKYkGVm7tV9fcZZ5AQ>
 <xmx:IoKcYFohT3SBwuvlr9DhIgfSl9Haddig_rBDsj-OLjMJh-goJz0Hvg>
 <xmx:IoKcYKrT46SoI-qphwnsTaVVRyGzodsqutHI3MDInuWqqzN71d_kKg>
 <xmx:JIKcYGf0Ov-KiUGmAOFbQfNwr5X29TGoLSA5oaleTqS0llwFYlJdfJWbs9Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B0692A00079; Wed, 12 May 2021 21:34:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <6d4338e2-d9be-411a-aeb7-7d46121b73d4@www.fastmail.com>
In-Reply-To: <20210510014231.647-3-zev@bewilderbeest.net>
References: <20210510014231.647-1-zev@bewilderbeest.net>
 <20210510014231.647-3-zev@bewilderbeest.net>
Date: Thu, 13 May 2021 11:04:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_2/3]_serial:_8250=5Faspeed=5Fvuart:_initialize_vuar?=
 =?UTF-8?Q?t->port_in_aspeed=5Fvuart=5Fprobe()?=
Content-Type: text/plain
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On Mon, 10 May 2021, at 11:12, Zev Weiss wrote:
> Previously this had only been initialized if we hit the throttling path
> in aspeed_vuart_handle_irq(); moving it to the probe function is a
> slight consistency improvement and avoids redundant reinitialization in
> the interrupt handler.  It also serves as preparation for converting the
> driver's I/O accesses to use port->port.membase instead of its own
> vuart->regs.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c 
> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 9e8b2e8e32b6..249164dc397b 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -349,11 +349,9 @@ static int aspeed_vuart_handle_irq(struct 
> uart_port *port)
>  			struct aspeed_vuart *vuart = port->private_data;
>  			__aspeed_vuart_set_throttle(up, true);
>  
> -			if (!timer_pending(&vuart->unthrottle_timer)) {
> -				vuart->port = up;
> +			if (!timer_pending(&vuart->unthrottle_timer))
>  				mod_timer(&vuart->unthrottle_timer,
>  					  jiffies + unthrottle_timeout);
> -			}
>  
>  		} else {
>  			count = min(space, 256);
> @@ -511,6 +509,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  		goto err_clk_disable;
>  
>  	vuart->line = rc;
> +	vuart->port = serial8250_get_port(vuart->line);

The documentation of serial8250_get_port() is somewhat concerning wrt 
the use:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/8250/8250_core.c?h=v5.13-rc1#n399

However, given the existing behaviour it shouldn't be problematic?

Andrew
