Return-Path: <openbmc+bounces-1529-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106FBD58B21
	for <openbmc@archiver.kernel.org>; Mon, 16 Mar 2026 06:06:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZ4Nl6KPsz2xlP;
	Mon, 16 Mar 2026 17:06:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773641207;
	cv=none; b=kLquY2dY5dGvDuxDxB/jh3j5nXVjZrKjIPT3Eji8iT+04lfcZWxFbzIfDuFuN4JbNbj/svBO3JA0Mk2eNg/IE7Ok5QeqUhSMx8gI7f8Xr6esaUdz35+VMT1P1t7sW6hd5BmiSGubiykubSdqCpgQ7ASx+ZaXUAsl/IAgyqvJ3sVSLff8F3gom5sgsmw1QoJz7oTXth7uMC0EH2qSbYHLXLqaEU46xKKNfeJ0sCjNWFj3Ag70vpSaW0zhCXWyDItjsmF7t6Ogssiouk66M+DbaQQxSK5uCB7t44zmhLoAb9C0rt5UE/OWIW6f2yhK1jSA7Vu68l1p1tC99b0pHgFzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773641207; c=relaxed/relaxed;
	bh=xykCT9BKujCqkA2IArKY3bjqd+RsxJe4XdOgeQgUVOQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OlH8FBf5MqbAkFR0GFJj7gyh9Ql5uiLzDgljak0MFTQ3vrzjWNYiugdWf2Rm26xEYrpm/M6ANl7ZNTH0vqo24pLxdZVlBdEecIEucYuAb6ofJpY1ecV/NWSvAFriXC95YHNjQuEYykE7OFAoQIGWDSRYIV1aBzBu2f1WDu9t59l1RqzVlkPnnqq2TQpruGXg2EHHCLpMvNjd9aqwo0VIQb1UGCwX74KZIzhZkR3lhmCr9y54aCXcs3RsbQWfpKmCbZkL4QkRW/eApfpbV9q51U8jGGOcg6F7SjZekG7ZUY37vxP0Ze2806Jrai6fXyrMe5DiSa85aJ/aF+a2xGbROA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=agLCFVYi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=agLCFVYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZ4Nk3RRtz2xln
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 17:06:45 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a13323ba85so4831041e87.3
        for <openbmc@lists.ozlabs.org>; Sun, 15 Mar 2026 23:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773641202; x=1774246002; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xykCT9BKujCqkA2IArKY3bjqd+RsxJe4XdOgeQgUVOQ=;
        b=agLCFVYiq1wkhir6GhFh7W2AqNVP4FLcEReA+UfTXNEe+nfnXK0WpkHSVSUx/M0TKo
         IPgNrrKsU0mEuU8LuTA4Vc+yqQApswfaWjZ1cFt2JrPEG40pQ1bkOADVmZ+KuPM7H+Yu
         g+12zrUgsM+WxtGGNz5s0ABVCbId9LnnMSJfCE/GHAvcPvSOLVW+EtHOlXnOTd+XrVdb
         /f5Wl6x3etEg0srSaHQGMRvdUVobXIT8m7USZ6PxFXZ5rXWqUR4hdHLcS2kEel5P4F/M
         YIT30R5CsWZIieV0AgiwHnDM4Qsz79vqMMwTZvwPsWqTjWOZQf4+pBHROoSIkTRphVP5
         plTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641202; x=1774246002;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xykCT9BKujCqkA2IArKY3bjqd+RsxJe4XdOgeQgUVOQ=;
        b=X/PtkyoWYGYghnfCXYW/UzOc78j5b7IFjisYL9+Jwa0VnMS2k4ZurT8H8KxXAE3zPD
         58IkvtPtoavXrdStooJph7SimYqoIX6wrQFLHmeyxmw4h6V1aye7J6Je1Aglxa/IjPQ9
         vVfy11iyKs+CGKB5ECVoh2ztfGXUUGztzkHZKWflSdLd6MgN9eezjgmV3zYaPCL9LE6p
         77ZXgjDRAepGOiR0aMzH9gt9Q+TgtHJmzx2T4bJu5BKmR7RaleCnIEbW6s9BKWKOfbxe
         HWOPjPSAw0hcFC0gcJ04rwcA017esV/h+rdlSLyMjA79SQaZoUPLbC7gdwmzlh849V5C
         1LIw==
X-Forwarded-Encrypted: i=1; AJvYcCXg76lPGoECeIYtDP4vpnByx83h3lTpWbQ8ZmZsAJxNewzH9j1+5c65ipe8CIcOu6FmIAx4UHIJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzplH/84bUlS2daWM8XhlH5TdxDX76Ev8kR9Jke7Qxgoh2dCUJu
	J+Ok4S9ZlDg1FQlDhDUlT9PtyWGFHMXMIzLzsQKfG1sufgUz//JDfWqs
X-Gm-Gg: ATEYQzyg9Gna/n3cSMGMPVzq2TrWPmkX+gGgemReq8zFKDpwlEvQSEDK3NfqsPy1sua
	62huCmT9/6yLSls6levBrXiSlk6tR7brDyh/I+kgCtb+WRHNU6rqR3QgUySBpy8L5SdfBpPkKLG
	x50+LxLO1eW8v2LBVzp6QTZYf6K2uTNRRXeoj1QuOisJMmK3yLOWvfSmItV6dGJS0S/eIC81aIC
	LSoOKUp8KfZqlecaGmU+Ql/F5fwrKtTyuPXyf1XwlJl9K7jIePJwIbw+sbKojmw7QQUzNGuHH2b
	eLfDYl02eXIuCFNdM3rGt1jM3ShWH7QV3rAewClrj4txfoy1hIsBqOMtBCo23TZiN91oiVGVFgh
	Fzc/bv2MBiAtZ1TslRyfqpnYwHBCXOGCY5s5ZtaKBMpnM9UiALlsINVssiVIgRiJiuymh2fNb0E
	Eh9JtWT9MV0uxxFAMdBwZZkrP2
X-Received: by 2002:ac2:428d:0:b0:5a1:1862:67a0 with SMTP id 2adb3069b0e04-5a162b2fa48mr2657409e87.45.1773641201430;
        Sun, 15 Mar 2026 23:06:41 -0700 (PDT)
Received: from [192.168.1.161] ([81.200.11.23])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f1asm29442921fa.2.2026.03.15.23.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:06:40 -0700 (PDT)
Message-ID: <4400f95392163ddc3997cbbc0b298f50910fe6f2.camel@gmail.com>
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, aspeedyh
	 <yh_chung@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery	 <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, 	maciej.lawniczak@intel.com, Mark Brown
 <broonie@kernel.org>
Date: Mon, 16 Mar 2026 09:06:36 +0300
In-Reply-To: <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
	 <20260313-energy-casket-ca8adc1f1fd1@spud>
	 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
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

On Fri, 2026-03-13 at 22:36 +0100, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 17:24, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 06:07:35PM +0800, aspeedyh wrote:
> > > This series adds initial support for the eSPI controller found on
> > > ASPEED
> > > AST2600 BMC SoCs.
> > >=20
> > > The series introduces a eSPI controller framework for ASPEED SoCs
> > > under
> > > drivers/soc/aspeed/, adds AST2600-specific controller support for
> > > peripheral and flash channels, defines the corresponding
> > > devicetree=20
> > > binding, and adds the AST2600 eSPI controller node to the SoC
> > > dtsi.
> > >=20
> > > The driver is intended to support host-BMC communication over the
> > > BMC-side
> > > eSPI slave controller present on AST2600 systems.
> >=20
> > This all seems to be in the wrong places entirely, shouldn't an
> > eSPI
> > driver and bindings go in the spi subsystem?
>=20
> From an initial reading, my impression is that patches 1, 2, 3 and 7
> should be modified to use the normal SPI interfaces to implement
> an spi target driver, possibly a combined host/target driver.
> Reworking this should be fairly straightforward because the
> interfaces
> to the SPI core are well documented.

Arnd, that's would be nice if it would be standard SPI device. But what
if eSPI would be a bus? So, I assume all other which lying underneath=20
eSPI would be much easier to implement as standard driver data set
SPI/GPIO/I2C with something like devm_regmap_init_espi(like for i2c/spi
or anything else) for example as common part for these drivers.

Thanks.

