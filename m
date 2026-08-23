Return-Path: <openbmc+bounces-2482-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C306C5DF81
	for <openbmc@archiver.kernel.org>; Sun, 23 Aug 2026 19:50:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hSl5f12ywz2y8m;
	Mon, 24 Aug 2026 05:50:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787514645;
	cv=none; b=BgjINHPRpbvkOAYB6Cn5d+m3PIur45HBptaNAI4Z1/Lmr8o8qWRGRh1Cu5ni9P514pPvxxXtDRLiN/klXctDqdTbYcAwNsWLojU2eyUJjP4cbS7ePkC6qqkxs7NN8Iszlbu6bo532hCR1Zb/dkf9ULuhVGTx7x7TFXPsVhFVJaQrOA9RabZMPi56LoSqyadnGuJYhfVVp9L47d2VlyzmOx88lamAURO7tXO6BEfbkP+0luGk5ike1w8xEVVZ5CJVkyALe9u5nO4uD4YirBfHnmcBAY0NPg02yrbIi0lI6TOiJRuUspbiudPAbB5WOgdxEKRwsd9zBQ5NiFdBSet4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787514645; c=relaxed/relaxed;
	bh=FI8iZwkb9AvvBWAVl1SifeWOG9uPTOrrRE1ZW7PiES0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aw1dzuOd9c1qheSl4EbTXJbPAJj8ytWvoVr1GvpwtcTk9qUBiWAIarLY+DSvJ+cSQK8gwfP3SeSvC6FJ4/AJD8ItqwG5DktfabymMuMWgQa2pCwY+vUfbydsy9cgjL+LbUXSXGibsA5mpw4aHQwLQLm3df3/9ILXc0IKFVMwa3j+f/BAj9rjd6LI4DOk8yDzmjbJ7eblpeGNwZb6Sg2rx/AlO8HLux5sCPU6+5pMPcl69o38lRfpi+BIjJFbbSyuTUmpYKqfjRDe3z3/hk+fQqdPytx4HUgsRNS3+OJXYvaUxnrFJF3jku+QlD3S897hAwLGLcseMC/8BOigzoKZIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zT0+RV6X; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zT0+RV6X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hSl5b2pwjz2xnv
	for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2026 05:50:40 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DDF5A1A17D2;
	Sun, 23 Aug 2026 19:50:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9767C60378;
	Sun, 23 Aug 2026 19:50:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A0C311C78576;
	Sun, 23 Aug 2026 21:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787514629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=FI8iZwkb9AvvBWAVl1SifeWOG9uPTOrrRE1ZW7PiES0=;
	b=zT0+RV6X0lDfRVw2+6MB1Vq6VeJNkBZiZJ4CTJrFwV6lYaB2LqE90RriDutE0RSnPUZDqH
	7FmKvvsO8/Gmv1cIcQYTNTWKPXhIQTlZYJpZGvoa+wiZBHh3tc5+5xIABv/Pka7HigYBBS
	BPl7XytZcj+lhP5sZddnYmRS8/BWwAYV4Ef01PEgjEBFI1yCBwDNlUg9xTEAAao8Qxx/DX
	vJz8WgtU1qnh/T4JSjAYnvaN25SowSFJVEIcqgBdaSIM1aIOcfvpUf7eYuOyUCaEt1tFWG
	3aGIFVhOls7QE8Ma4JZv8sqWC8jFpp/3yFZf11oXbxE02ZDAjHxRvt5Cky4u7Q==
Date: Sun, 23 Aug 2026 21:50:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] rtc: Make sure clk_init_data is fully initialized
Message-ID: <178751460908.816082.16865012450264727395.b4-ty@b4>
References: <cover.1787241693.git.geert+renesas@glider.be>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787241693.git.geert+renesas@glider.be>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 21 Aug 2026 12:09:01 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> [...]

Applied, thanks!

[1/5] rtc: hym8563: Make sure clk_init_data is fully initialized
      https://git.kernel.org/abelloni/c/db005bdaa5ff
[2/5] rtc: m41t80: Make sure clk_init_data is fully initialized
      https://git.kernel.org/abelloni/c/bdcedfee8b87
[3/5] rtc: nct3018y: Make sure clk_init_data is fully initialized
      https://git.kernel.org/abelloni/c/096c7ef4ef66
[4/5] rtc: philips: Make sure clk_init_data is fully initialized
      https://git.kernel.org/abelloni/c/5ef3d51a3aaa
[5/5] rtc: microcrystal: Make sure clk_init_data is fully initialized
      https://git.kernel.org/abelloni/c/a12eac458814

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

