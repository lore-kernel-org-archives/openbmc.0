Return-Path: <openbmc+bounces-2053-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13432CD8CA7
	for <openbmc@archiver.kernel.org>; Mon,  8 Jun 2026 23:44:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZ7sx5jQ1z2ysW;
	Tue, 09 Jun 2026 09:44:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780906781;
	cv=none; b=XVM7/duYR9clt0XGPP7JoFrTS7I2oBjBFLXRa2dKYe4umUk2giftHIMji9SkVYK2PtK5zFh7GKDxvGCbnIc/7trPgEzmAD8tF++0WtTuEhSIUM/QFsbM0i9IacFoujtC2azuANquQzOfZr1jhaC6yPIkCAg9Lsiqsg8F5GSj8tXxWp+w8qMZqIVoWAo9mL+2syR8iOeuGRP3v/+jQr8YdJYAaoBjrQv7V+p6HjWMQJhEYVqGAm34oCIG7I2rK8+vCz+vhggFMHAq0+R96JxLuwblZuN8gf1OQ5V/XF1CKyYRBUSXPYI/8IpJzbbxIXZBBkE4nLAoeuaQkzzBaJGukA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780906781; c=relaxed/relaxed;
	bh=P9V8bpEqH6X4qmiHHTngsXUmKEwdN1ijUIAKzpeA0e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I62Fzl1Lc14V6VpSKUhB60NyFAnPWiuMyNbSJmaP5BXQnD9hEXK/n8p9raDsS6sAxTGQuPYmmCDgrFGVBw25sD7b2x7i1bn5xVgSav78RNdi2b/5jBL9va+gBoJPEov1BgpwHNJFNxuCmTq8YS7pI/KccK0Kh6wGjzZgigeE427wi2FnJhEYUPruKEuiymA+PWnqKUrMYUzVrHclYXPKYDq0NTXmR3RfOgGeomchcghTef/s40q3QSl7FafIUubtVOxqWxJ9H4nk9ULAQHgsloqRaaKQaIV9d+x0znedxVzR2ZdejqEiN8l1QTkq8y4WebcdjmEAEBB6ctqylVl0BQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdyPmYcZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdyPmYcZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gYlMJ24sYz2xWP
	for <openbmc@lists.ozlabs.org>; Mon, 08 Jun 2026 18:19:40 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 878DE40C23
	for <openbmc@lists.ozlabs.org>; Mon,  8 Jun 2026 08:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADF31F0089B
	for <openbmc@lists.ozlabs.org>; Mon,  8 Jun 2026 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906777;
	bh=P9V8bpEqH6X4qmiHHTngsXUmKEwdN1ijUIAKzpeA0e0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jdyPmYcZAAj5zajRoCfCfEUTkYIVOgfPo3QAIyGqN11uGTToJ96WZpRYI0Lx1V1I3
	 2eDiVxAVrjMD+r/rHA0O6EN+Xl/szMs37czo6pzDR2xjCsJaqy4C2T8XQUhardqcC4
	 wOVSKLeTDhpcRDpmIuCcZCuGpajZ+Z6yMKp+XxQYO40vtow7leMRui1N0onxuNgo6d
	 Y6kupuQzlyi3bLPrd1WFHetFqT79kvx1hKimlQO9ryGMPBJdXGGAG1N3GEuEkvV+F8
	 /KKqDFEeFmZlnACZo8EBEMPgG7o8c/hTqIRVA1Rj3USn5jfsJV3biifp/Q5X5nPDHu
	 IP9tg38RSj/aQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso4061464e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Jun 2026 01:19:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8w3/0MUN8SfubYPY747/v9kwiBoHSq6Sz5yeDIg/DWhaszhXXqQ3+0qqj0Ifw0DU/9U+ubOziL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWTAJpDXtDp+VK2S9N1j7BmR5v+/NMoCGnhfNzrBQpolb9mKad
	+V0Z3ak1r4N2j18v/9erwIftnb14jWPZIYsPXThKmihQylHArwMD9D+VgUCVNqfjuWwGLErFI9v
	EXxbaf7AnIc8QYyaB5YqnSoOPbNFt2VI=
X-Received: by 2002:a05:6512:611:10b0:5aa:703e:ce64 with SMTP id
 2adb3069b0e04-5aa87b6fe39mr2685769e87.14.1780906776095; Mon, 08 Jun 2026
 01:19:36 -0700 (PDT)
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
References: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
In-Reply-To: <20260605-pinctrl-fix-v1-1-3d8cf7a6c348@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:19:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL==MdwmEM_9aHqfCnTfd4=g174Ytk3dZti0pwqcfU_UOw@mail.gmail.com>
X-Gm-Features: AVVi8Cd0BwjOsWouqsrdYZ6Spm4i_Ll_H2pHRD9M65EFtdOV_cK55fSj8mFOoj4
Message-ID: <CAD++jL==MdwmEM_9aHqfCnTfd4=g174Ytk3dZti0pwqcfU_UOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO mux value for ADC-capable balls
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 8:38=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> aspeed_g7_soc1_gpio_request_enable() unconditionally writes mux
> function 0 to route the requested pin to GPIO. This is wrong for the
> ADC-capable balls W17 through AB19 (ADC0-ADC15), where function 0
> selects the ADC input and function 1 selects GPIO. Requesting one of
> those GPIOs therefore muxed the ball to ADC instead.
>
> Write mux value 1 for balls W17 through AB19 so the GPIO function is
> actually selected.
>
> Fixes: 4af4eb66aac3 ("pinctrl: aspeed: Add AST2700 SoC1 support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied! Will be for v7.2 at this point.

Yours,
Linus Walleij

