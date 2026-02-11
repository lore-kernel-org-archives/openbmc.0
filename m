Return-Path: <openbmc+bounces-1360-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47CCEB2700
	for <openbmc@archiver.kernel.org>; Wed, 11 Feb 2026 10:22:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9vd56LvXz2ySS;
	Wed, 11 Feb 2026 21:22:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770805353;
	cv=none; b=bKCfBi//gVHzfDafo7BDbxdh9qn15rrDZkzi7rWv6c26DkCE1e1G3HleCRq8+IKtUT13Kb3VffbFIVQCwQ5oTEXrLzn89vrgldE+Bd21TrLrRvX7zZbGdd/G/md1Oy69wxKDypwsy4un0xRbv7o4v+ApeKffvmw9GOAf7ZFprxePpSykBej3w+10BjbbOgWMNzA+BnfAVoPvq73GLYggwsRKn/O9gboEYAMMGl5ASaJAq6mexaZYeX4UKJ5Hbqzce93qbZCuVWX+FG/H8RI/1786kE3UTa3cLXMtzOcmlreVCvqa3CuXyH+O4rXDmRnIEs3C+P3urXGlNr1YYrkPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770805353; c=relaxed/relaxed;
	bh=x26RJEZzvywxmqhbMuzA7A8coQZewEhYsgXJn0+8VIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDO2ooctNH9gzrsdX/I/HGWvNjnP5G06tTMicloJUtumxCryTF3E1PZE9+/F9zXaJGQlHMstQxNoRJrrJ5jxIHu3thAiw+x+PGfGdNcCGwBJ4bVIyerSpqcC8OExePH7C98QN9/6RqbWxoBhdbPneF3WKDOh0pL8fJltY5tGiqRfp890Fguw3zKVsm0zoq4tsBKTJnNS3Fk3FXxX5rBbLk6MJPwL0TXboQdxWCTjvUJXKxC119LKiHSfbKBerwEaEQgGIrY9dAzOnYfPW3SLM9zdozLYQpPPi2AqdDnM/LSMxGMfWOh+5rYxMqkb/JRAlF0z2yNCOAlIl1QhjBOV5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=z4W1LRrY; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=z4W1LRrY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9vd315Gdz2xlp
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 21:22:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x26RJEZzvywxmqhbMuzA7A8coQZewEhYsgXJn0+8VIw=; b=z4W1LRrYkYWx83Y554+BLK4ps/
	kVIQ8R/xWaPBtSIVRSxNeQxUZR9q/qriUgI3IuFK/p+PhIWjaONg3mJu2RR/6f8/QTOZlhlqusSwg
	fkFoLU6UFJH/2vU5HeOMWorE3bHSPb5/aGh3gmzBViiPULwhubt4MLzZ00LMDV8A/V2u3P8UMCZUJ
	gT3QvTwSTWt7MvCSEIysqM6eXS6tX5YmDPQOBIjSfWpOX1z5pE60m5+Z8SR6jlEBJurVc3bBM+/1V
	BRp3ICKDwKulxr0GcBRYHmaLH4jh+TUOf1wacGWYe0JN6tDHwSQhA0J7sP2wDET0dBBh1GwXRPq0R
	JHoTO1jQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55616)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vq7MD-000000003Ij-10GA;
	Wed, 11 Feb 2026 10:22:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vq7M6-000000003hT-07hu;
	Wed, 11 Feb 2026 10:21:58 +0000
Date: Wed, 11 Feb 2026 10:21:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
 <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
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
In-Reply-To: <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Feb 11, 2026 at 05:52:21PM +0800, Joey Lu wrote:
> > Is this register preserved over suspend/resume ?
> 
> It is not preserved by the GMAC suspend/resume flow and therefore needs to
> be treated as a system register rather than a GMAC local context.

That is another reason to use .set_phy_intf_sel as that will be called
just before GMAC soft-reset in the .ndo_open() and resume paths.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

