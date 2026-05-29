Return-Path: <openbmc+bounces-2011-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17224CD5BD1
	for <openbmc@archiver.kernel.org>; Fri, 29 May 2026 01:41:08 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gRQzx1ZWpz2yRC;
	Fri, 29 May 2026 11:41:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780018860;
	cv=none; b=bdmASqxnFekXVo98r8AZDKnjYUd9V/m+yuhx6pOP2ow50ErbwSccBMVbYGPDwpxC29ySI0qCWAVZps08XuMh4H2OCZxyVygPoXIbVSDtdhxXtW9w5PjbCrKG0EJa4sdfddI6a/sExzVls9bjQRq8vKOnIzmVGPnnWQF8fHybSXAy6jiErIwmVK59SBcNh6C1rjlHsscDnOLXknf/EjSF3L1jXciTUYFD8x9O71E1nk7t8zlspRO/nejUBTz055ydquDfXF/xy6KUfkiExkSNSt/cbyE+bT8TahwmbimnNI1TLiaEk31K+pEpR+TxIl3DVErHSKDQTKDovij4bbHwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780018860; c=relaxed/relaxed;
	bh=CTUizjeIAVN6d9tWGbtcPUZn1oLnHGcDN8AgOec9NAQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Se4no+emychle9+mE+jQtmb/mcjcKa2DQDfNXTxpiT6d96PhduEuXuw1dM9f2iVSshX8E8Lm8vEUkKXo1KTa/A13MOfe7piDDK/0Ljd98bbfNGqW9kOhWyOJScoqyxBA/fDz3Z47N1+sBHQqgZRPAuc0rozEFckVcqJbrNwKofKYHD1VUCOlFD2YR4W1vbaZCrrBS7vKss0ZJSk6Bh58ndLMGiqbt6XdXy+IVxjx1IB3p/x5K/neXAbqEobVxIwY+aCx/gbj5Ut/xuanEKkvwSasnrvzpuBsm9qcZhGC9215HusaQCA+/1FxWvJCapRstpsICs+fD4nRALvBEjs1bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B0ViO8wC; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B0ViO8wC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gRQzv4Dknz2xM6
	for <openbmc@lists.ozlabs.org>; Fri, 29 May 2026 11:40:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780018857;
	bh=CTUizjeIAVN6d9tWGbtcPUZn1oLnHGcDN8AgOec9NAQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B0ViO8wC+6cUlyQ3Q1Wtq561QN7epl0MmZN/7iiE4b2zXOC3eeyVaQhm7hm8qCr2z
	 fqJhMp39sB0XKQs4jR06mZdaGrEIOa2RvekIpjvOb9OT8hsHoPYwsJEFycy0NNjxlK
	 PzxbHUtfflRx3xyaQgeIKsWc1gX6HnjbbmGnaD/ct8hoiBozklv3lmyY/sfg/SLc1L
	 O1IuabAEFkjAvcY2GJJwUXL5J8OFjLLwiGBJWWXNTA+ESaCPSg7UBlJkDZEknqe11V
	 2+TamLychBlRBKgbwDxmwxE0TKIxYqQD1CzGtFpaNAnKBIuGBINOYzgYfu+fL8aK/S
	 gXquTMFNqqnsQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E10CD64798;
	Fri, 29 May 2026 09:40:56 +0800 (AWST)
Message-ID: <610af357c6a0acfeec2d4efaa3ae17ce973bc102.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v3 1/2] clk: ast2600: set default clk-delay for
 all ethernet macs to 0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ender Hsieh <andhsieh@nvidia.com>
Cc: Anirudh Srinivasan <anirudhsriniv@gmail.com>, joel@jms.id.au, 
	openbmc@lists.ozlabs.org, Marc Olberding <molberding@nvidia.com>, Chia-Wei
 Wang	 <chiawei_wang@aspeedtech.com>
Date: Fri, 29 May 2026 11:10:56 +0930
In-Reply-To: <20260525-asus-kommando-v3-1-e6a0ca1b4a3e@gmail.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
	 <20260525-asus-kommando-v3-1-e6a0ca1b4a3e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Mon, 2026-05-25 at 21:03 -0500, Anirudh Srinivasan wrote:
> u-boot currently setups non zero values for the ethernet mac clk delays.
> This is not always needed (depending on the board design), and prevents
> us from using rgmii-id as the phy mode in u-boot and linux. u-boot
> already has the funationality to read and use values for the clk delays
> from the DT, so based on the discussion here [1], update the default
> values for these clk delays to be zero instead.
>=20
> Also update the DTs for 3 existing boards to add scu nodes with the
> existing default value for the clk delay. ast2600-fpga and msx4-bmc use
> mac0 for networking, so that particular clk-delay value was added.
> ast2600-slt uses all 4 macs, so all 4 clk-delay values were added.
>=20
> Newly added boards that require no clk delays can use rgmii-id mode
> directly, and boards that actually require a clk delay can set it via
> the scu DT node.
>=20
> [1] https://lore.kernel.org/openbmc/a7d364d72bbfa4ed3d41e9f7282f8e87a783c=
f48.camel@codeconstruct.com.au/
>=20
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
> The fpga and slt DTs don't seem to have the DT nodes sorted in any
> order, so I added the scu nodes at the end of those files.
>=20
> Setting a non-zero clk delay for the msx4 BMC device with
> rgmii-id as the phy mode feels wrong. But that's the current state of
> the tree (DT + default value of clk delay), so I've kept it as is.
>=20
> Ender, Marc, would it be possible for someone from nvidia to test this
> on the mx4 platform?

Ender, Marc: Have you had an opportunity to test this?

>=20
> Should we test this on the aspeed fpga and slt platforms too? Would
> someone from aspeed be able to do this?

Aspeed people: same query here.

Andrew

