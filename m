Return-Path: <openbmc+bounces-1991-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053E2CD5BC9
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 01:05:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPZLW2jTSz2yD6;
	Tue, 26 May 2026 11:05:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779696400;
	cv=none; b=gWrLDU2da+90ECNHNFsIAHZ7KBd+1ei1/i7Sm4NSh9dY44Hbal1pAuNi0Eg0njEvouSnhsBoMgpRVGKsjGhpBN40QFMiYxwCk1vAlQ25d6TwSGhdfZMRIQo8IVyac84ynQnAiVv5Zxuj9hk2mT2ECyyvKZNJcLICYQlFA9LhPrfObpyTwauvrc0s5TWCd3gVagn83e2RCbJUw5m3/J1CsGJhppZxLw3sl03uCLHtgDZus6iMxvNZGbaOVOVRgDfL72Z59SYZzVmq+/bWvAVkEfVxScxE5gyexOY/jqdDwf72NEDAzMp65x50pDUzf/syGGMxo6ppitPkm1gnVfedVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779696400; c=relaxed/relaxed;
	bh=XBdwrpDpVLZphgnQqjfINiqHGCa1lpywck29IxJWjLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOwNOyNfEHBp7ORJDdz4aGGmFUY5GIwalSNyGdEpjXv23SzHyMw3EY17PFJM5qNDaGPqxPv3wXW8J/wX5lLuivgzC57i4KGgHKLDyD+DlPRcuvWLHfFEbHuwnfR1Eu9sY/WXni8fK0i8PpBeb+69cHUITDtuAEUQ1QfA9dAaVys7elAf6eENb/57oYkRLcpqSsgJbHw8thvgSb129prIIR+Z5nMko419oZakNJDVJBtfG45iZxqYVd9piQVWmbF9ss11R3i/F4+ekS2iDISZJNcjnIKReFoEAdXiph/ei1ckYGvVlTpwzCoAnp2ENY/OqYjxOjaQOJhHUQ3YjVRzXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDLEwigv; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDLEwigv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gP7kl56v5z2xk7
	for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 18:06:39 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21D1A44567
	for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 08:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CFB1F0155A
	for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696397;
	bh=XBdwrpDpVLZphgnQqjfINiqHGCa1lpywck29IxJWjLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fDLEwigvfx3SKEy+abqKr/OzEu8M1uZr5lZwv82fmKYtK+YvG9058zhlwLGw4oST5
	 0478577WUe+Uc5wobNxLnJxUxHa0w2WEc4p42UrWv0+7pcuOFtgl5uQywyTZ7VPHod
	 m5h2YUwU66j6aPQnq84kLOkJiAEg6CCu5bJ6qOal41l2D+aYc8NwfZslUrXD3TEXEo
	 mdqDKnNJXIYIGlGCmp01Qc8O939wTaNiQ0pd7s7tO2h+dEgrhDnjIz6ydkBi29LCXe
	 UCHXvyb1Ig/C7O67TkPG3ciG5fITPX7NAAC6/M4R671dFZbM76Lk0FYLmh0crQXTpu
	 Imm1SJsoC+Ebg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8dc2606a0so9620170e87.2
        for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 01:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+S5CbLNejRi8zeG+gG3DlQDUtbDX/iLxlYLK7wszXDdPyu16SdaDoO0MPM7yYYAe5Bp1U/GwnB@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxk1vfit3ZsBkM2YKtktSpqPt3L/v27OMCTEPOiof1+Ecg34BiS
	oRVLeL7Gup71pZZa4ZBKJ41VxnIovrwx8YsHO/B1EZUbBkN+VpRJA2cB6XbYvpF5HIUsZ68zxaq
	WymAyU+LaJwY0NZurd0Wd2sxRw8wWeXE=
X-Received: by 2002:a05:6512:692:b0:5a8:fc25:3843 with SMTP id
 2adb3069b0e04-5aa323a49d0mr3894276e87.39.1779696395729; Mon, 25 May 2026
 01:06:35 -0700 (PDT)
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
References: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:06:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLnxMGux88CCXH70hwEGiQXn9FCJ=vucLaS=JLhp_C48VQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaI0HREPthKKhQrYPPwj27_NpiZglEh2S216je37LkMgP9M9Luyc3lYsg
Message-ID: <CAD++jLnxMGux88CCXH70hwEGiQXn9FCJ=vucLaS=JLhp_C48VQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Lee Jones <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, 
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 11:17=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Legacy ASPEED pin controllers have historically not had a coherent
> register interface. Control fields often had no consistent mapping to
> individual pins, and configuring a function frequently required
> coordinating multiple control bits across several registers. As a
> result, the existing ASPEED pinctrl drivers rely on complex macro
> infrastructure to describe the dependencies between pins, functions,
> and register fields.
>
> The pin controller for SoC1 in the AST2700 breaks from this legacy
> design.
>
> For SoC1, each pin maps directly to a dedicated function field in the
> SCU register space that determines the active mux function for that
> pin. This results in a much more regular register layout compared to
> previous generations.
>
> While the behaviour is conceptually similar to pinctrl-single, the
> register layout and configuration model differ enough that reusing
> pinctrl-single directly is not practical. Therefore this driver is
> implemented as a SoC-specific pinctrl driver using static data tables
> to describe the register layout.
>
> The binding reuses the standard pinmux and generic pin configuration
> schemas and does not introduce any custom Devicetree properties.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches 2 & 3 applied to the pinctrl tree, thanks Billy!

Sashiko is moaning about something, look into it but my confidence
is low since it is using weasel words like "critical" for things that are
certainly not critical, if there is some validty to these comments it
can certainly be fixed up in-tree.

Yours,
Linus Walleij

