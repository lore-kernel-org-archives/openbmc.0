Return-Path: <openbmc+bounces-1259-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA927D262A7
	for <openbmc@archiver.kernel.org>; Tue, 20 Jan 2026 22:11:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwhPB0Ng3z2xrL;
	Wed, 21 Jan 2026 09:11:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768947085;
	cv=none; b=k2AvGzsuP+xo36RPFfwXqMTrw7sp81+dgEVgkzOm0RfxoaiX3zwvTTavIoHnYcqtkdh9QSqWQykI7apCKAFnwTeHqoUjqgcGrxZB5FLBaSHpSIxKeepMQHfvRyA1QzxsZRfqEHM6wMn7Y/9wpKuulVqlaZhbvrmCfBltuZWx7pyILyt19TYQm8jRrlqT6n6Y2aEAS8/b/qxUqNJL22NHCuLpSg3y0poz5qbHPRZcbXlf8u8RESyZfZ0O+Lg49OZWGQv33UJk2XN8IpNiL2of53ryr8QLtvqiAZU4g2Zy2uc5MliZCjw1d5GP41AHYrViqh1rF2La0pjkdmEzRKxPXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768947085; c=relaxed/relaxed;
	bh=cz8APhsseY0Zk6G5E1jpmPu9bX8/ov5VZe6gD1zzSmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fadjwa10uw+tkYAtyt/eO44T8zHhdQTv9X8zO65KnhNgFGaqZFF0i6y+1yoRUbZXwZNc3e0HIS3tMxGtPfQi6rqWMq4ObVdr1XrU0D+emc/6DQP639lE/H4lGogsNyWCuVOyK7SUe/bQ6VsdBTrzbUH1BaZKNIbtTM+kobZNz6b4XLcKMdD1SOlQ6+2dsjD7u+ukvhf8kLH4tdRECrV14RPaf78UjhH3aijuPi+ymJEntrdPWdRKXlUHMNk/PVowUfDJvE6drAlnkfUsaC3UjmlNeTAppjQyjpqVco1qeKrLuUv90x7PMlrOM6S+GFmUvmN8LrUwI/xDPnKcPIr/UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0WLm9SWQ; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0WLm9SWQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwhP807Dwz2xjK
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 09:11:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=cz8APhsseY0Zk6G5E1jpmPu9bX8/ov5VZe6gD1zzSmc=; b=0W
	Lm9SWQQov5SYd420XUzSP8tyaiF9Y4ujlBQzmY/Th4asNTZ50ub3BJd9Dlsrxalzcy+e9smXDK7uN
	NqKWIJLS3Yz9jukT5jfXlgISuHH38T+Dy7aAeX+CrQxUfBfk/HmRYj7G1QITxRhI94jWTECv3vxjD
	lw4a8v0h3Xo2qJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viJw7-003jIq-CF; Tue, 20 Jan 2026 23:10:55 +0100
Date: Tue, 20 Jan 2026 23:10:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <2e3f213b-d507-4290-91af-fba7492155d2@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
 <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>

On Tue, Jan 20, 2026 at 09:34:39AM +0800, Joey Lu wrote:
> Dear Andrew,

Please don't top post.

> 
> Thanks for the clarification.
> 
> In our design, the Ethernet PHYs are located on the base boards, not on the
> MA35D1 SOM.
> 
> The SOM base board routes two RGMII interfaces from the SOM to two external
> PHYs on the carrier board.
> 
> On the MA35D1 IoT board, there is no separate SOM and carrier board - it is
> a single integrated board.
> 
> I will update the DTS accordingly so that no PHY nodes appear in .dtsi.
> 
> Thanks!
> 
> Best regards,
> 
> Joey
> 
> Andrew Lunn 於 1/19/2026 11:22 PM 寫道:
> > On Mon, Jan 19, 2026 at 03:33:40PM +0800, Joey Lu wrote:
> > > Add GMAC nodes for our MA35D1 development boards:
> > > two RGMII interfaces for SOM board, and one RGMII
> > > and one RMII interface for IoT board.
> > > 
> > > Signed-off-by: Joey Lu <a0987203069@gmail.com>
> > > ---
> > >   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
> > >   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
> > >   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++

Does ma35d1.dtsi represent the SOM?

If so, what is ma35d1-som-256m.dts ? It looks like some odd sort of
carrier board with a few serial ports and some memory? But systems
like this put the memory on the SOM, not the carrier.

As i said, i'm confused with your naming here.

   Andrew

