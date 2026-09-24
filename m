Return-Path: <openbmc+bounces-2652-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB768C98318
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2026 09:15:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hsMPH5pvMz30Tm;
	Sat, 26 Sep 2026 19:15:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790251593;
	cv=none; b=GNAiAMTVd0+Sg9bDdTIh88zDmbKEpqhl6ldVl7Nbg+4erh8B/NYns6KrgZs0CWeVvDeH3Zk2OTJg2zXHyZbSo6eeNLoqZWGLwINxfKreUjY2XNqBID8cjFk6XGKZfxRLurDBSfbJymJiljxe6fxEdD9ZWECjhkq14EjkjvpKU+UbcY18+u/m3F3z0qAQ7i7YeO5JF6n4ksvGj9rZrUF1dvhA2CkaARxaIsbOKAMSzjZwoarP3HfdGXfI4kq1T55qndXHF65F//jnRpVrq6KkMThJlqwmVj/y3/coVo/tQDrYrQJbeDnrp8TZWjtrNhyn3jZ5rtLrt/hBwbJAqjm4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790251593; c=relaxed/relaxed;
	bh=AMda9b2M0HE7bDg1/E+8Yg0zmUKaV5CLAKi97xEwv68=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMO1y+1YKOAnvY3A71iO6dmeTxLOYakomDRgDCnhOBPHtM7VhwYdtXqIEquoT0FqY402nBtR8/lN99ZlMOQ9JzcwGMdJ2d8jl42eXMbk/wRSr+2ecBJaaisz4YWQ8HpRGxm9XGVoVtDgZn57naRZNuisNBC0ccQ+8ocEIfMjAUs1yC2aJs4Og0T5v4nsJicYuMBzM4RtlTXSpADkZW53OCtJtqCOEPyNs9CuViXTD6yrKRnGiC3pgkclnvHlfw1PJF7eGo04z70lYxqfOn6HCi1nMPzHnfSn6hoCAeRHixZemam2ZbxhWONYF79Tdy+W2rr/oz3mW1WYytSiW6ICgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AN2eipIw; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AN2eipIw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hrCHF2m3gz2y7Y
	for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2026 22:06:33 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CBA243444
	for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2026 12:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0176A1F00898
	for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2026 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251591;
	bh=AMda9b2M0HE7bDg1/E+8Yg0zmUKaV5CLAKi97xEwv68=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AN2eipIwmtVZ4M5Ny3OwliN67dMXjEm7YmJn4+ad6DexfVZp3CDJtiYnaoFksqodn
	 mwZ1b4SVH63NPUXV2EYeIbJRRnrYEqDgJ1aM+hTpYkpLxQ5NV73qb7D1u2ByBnsLeP
	 Zl/DJDHTqT6OiaH1vubVrlpERsPaD3Mgx1WPdPuV2fXw3E7nHMRQJbcEbRckmRj7yG
	 gAfxCXLubigONN5I0PrBpD2HatKrJBxPWMsz/eb3BPSEVakQ0QFCs7J7hyRnjtVFT/
	 4LqPzByO1QeWXrKGOuxdQ7j+UV3m6HYuvu8nlQbIgjj6b8xSrvdI9ggm13W8104LNs
	 lIZXxp6e0q25g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso1998481e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2026 05:06:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxk/gZkWWwnzEeTy6LvAei2PHdeNavTVTUZEJ0+fCY0Iy+L00VyLeDlrBPFhhi22oKArb0i4GxB@lists.ozlabs.org
X-Gm-Message-State: AFuF++lx/pkY9+ud8WQROmswmg2TWQsKZPRmVYQ1/EN+tXu4DKl44M3T
	z90icUNm4wglBFeQxV7cqZny3Es/orSZRk683qTtTk5n+ZMLnyKvgT1sdfUxeHtQyOxzq0wsVAe
	SibsMRhYHPZB2wDZsdYKv2asV/CoDLnQ2udvqr/zpZQ==
X-Received: by 2002:a05:6512:1192:b0:5b6:423:9fa7 with SMTP id
 2adb3069b0e04-5b8df1f3ec5mr826739e87.31.1790251589716; Thu, 24 Sep 2026
 05:06:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:06:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:06:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
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
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Date: Thu, 24 Sep 2026 05:06:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdx6zH16Ej-7EDVw0cKix7+h2tOxSL8pc1PiXhptA_R-A@mail.gmail.com>
X-Gm-Features: AclHuK_9ekJ2IaIbciUj6wKN51mS4Pn8kPTOGKYEK1UcTaHgO2MIe0OH-x_Yx30
Message-ID: <CAMRc=Mdx6zH16Ej-7EDVw0cKix7+h2tOxSL8pc1PiXhptA_R-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>, 
	Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 09:20:21 +0200, Petar Stepanovic
<pstepanovic@axiado.com> said:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
>
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
>
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
>
> The driver uses gpio-regmap for GPIO operations and provides
> controller-specific interrupt handling.
>
> Tested on Axiado AX3005 platforms.
>

The series looks good to me so if there are no objections I'll queue it for
v7.4 in the next days.

Bart

