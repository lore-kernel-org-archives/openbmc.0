Return-Path: <openbmc+bounces-2151-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACE9C43327
	for <openbmc@archiver.kernel.org>; Tue, 30 Jun 2026 23:50:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gqfzS0l2Rz2yVP;
	Wed, 01 Jul 2026 09:50:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782820388;
	cv=none; b=SkfODUCwIYL8zC32YJAWklP/nDBFzXYQMil2doyIoWoQzJmcIDcEAXQrSzW9XS4VsrztSMizPjsMFtIssFKvrlQwEfZu2W4S+rI9N4qzAWfKkgGMPotnqIFVJAJgJ52/I5Z8b7R5R2tot1oK4lxW13gC7OD/rZ/9DYBLwqhHsXlTtkpdDI7uwN7PbWWeMZEsDLxZ/ErEHpJAlu9bA7Ftg97PNzT7kCXFLPmom8DTjoHJYOyE49S0mbWyJuCsKx+WQHbKcfg/2StmGz+Xsnb7qQP3gdpiXBvotE96L4xq0RmBL2Qj1SegL8JnJ0k24NX4g8F27emrsQtr88q40FiSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782820388; c=relaxed/relaxed;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpGs+9DutdkpdBOB92oHqk5dEF5YsHEACStj8BJ6tjhVw8h0wcpghPFi5OiNiOAWnRyCTC7gqK0RRpUy7S8xdqEHfSOYzMYwN1IZJVnBuGLOlxgtznnjLNUs11PRu+amnVA8VJ/TXY1jY8U0yJ2D/fZRJLqJ5tR2ryK/Heh04r1egKBi12IB6erHUHPqosjtQZ7dScnYyCEOjqjm16pt+w0tBSyiR/gxxAxgI8kczeJNqPRkIFreaWY/8z79UK/sqS7oDQUdi/UUhapwbw6unenjBGjA5R8WumRfeyNgTGg3GKgndq+gaR4FYB7xl/mFNjeSGz52QGznec01qViu7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrlJJAyQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrlJJAyQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gqM3Q4WDrz2xq0
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2026 21:53:06 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3735443EFE
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F63D1F00ADF
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820384;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrlJJAyQZ3DwijrvkQSaLW/aK3tq35nYYm/c5Fotxi0Uq/sxm/MTtkXjQNgg0Fgxp
	 KeYk1xrd8xyH45/0n3famjiuhyGtB6ePQFrOG+P4ANJc9Ou8bDFFyq+PNnitfddnlu
	 nn8vBTyx8KO13fiCz1xG/2id40eL/RmVJCjK3vGEmGii8y2HbrdEeYthuisNvkEIXh
	 CCCVjANnb6ziEZe65ted0H7vtlp+DAVwnUfFYjeCgc3a3U6n7+/78RExC2z3Wm3HG3
	 7kx01Gi09g0a+U5y8Tp+vSCr7ClStQFBUwDMXbdFuGNBF84FtfwlnzLaY2irwtKLJ8
	 R7rE517rnSYuw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b293079d1so613741fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2026 04:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqe4NUaTBErGbyZEG5XTbNLpMD2eAfWh4V+y08qEq1UHciYWQ7jbMctEVzjhYXWHcFuEMo6h1Ee@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywe0Eys9sxfSyLCVzjguQDguVr1KUWZ1yB+a8w5PlgjAuzYVWhQ
	aD5tnXIPXwW2/33uQnWyfIn5pg0BNewXqKiy4+9jXMSDsQfnglOperEOh4sIb4LfELztraXl+og
	SVAA4pLjVymM6gqAQV/rQhgn5Y77nJPY=
X-Received: by 2002:a05:6512:15a3:b0:5ae:afec:8afb with SMTP id
 2adb3069b0e04-5aebdbdd0bfmr741396e87.48.1782820382868; Tue, 30 Jun 2026
 04:53:02 -0700 (PDT)
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
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:52:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
X-Gm-Features: AVVi8Ccukh9jeKMJzDntWFmdET_gKKyPu4vZydSTvGPFTsmFqpaNo79r5YLA3x4
Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: aspeed: Make AST2700 SoC1 JTAG master TRST optional
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 4:30=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> The JTAGM1 pin group of the AST2700 SoC1 includes ball D12, which
> carries the TRST signal. TRST is an optional signal for a JTAG master:
> designs that do not wire it may need the D12 ball for other functions,
> but with TRST embedded in the group they cannot use the JTAG master at
> all.
>
> Split D12 into a new JTAGM1TRST group under the existing JTAGM1
> function, so TRST is only muxed when a board explicitly requests it.
> Patch 1 adds the new group to the device tree binding and patch 2
> splits the group in the driver.
>
> Note that this changes the meaning of the existing JTAGM1 group: boards
> that do use TRST now need to select both the JTAGM1 and JTAGM1TRST
> groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches applied!

Yours,
Linus Walleij

