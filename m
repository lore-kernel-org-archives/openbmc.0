Return-Path: <openbmc+bounces-1786-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9863EA3C59
	for <openbmc@archiver.kernel.org>; Thu,  9 Apr 2026 13:48:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fs1Vc2D2Hz2yhD;
	Thu, 09 Apr 2026 23:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775742520;
	cv=none; b=RgEbiJsvKQdroOPBHgvFFw1wf32rsfZ/ZZJuvf6nbuRwtSdxWa60IaPRO4oMQmXvI7WDFh2sDVp3DrjP1e+PTwFYO293V0MpQ1hW3xbvO2COdoK8hMb+0W/uInM9oMTDBoXZ1tLwt2MJI74TnAosKJsg+tyr/Hw4ecWu8UaIc1ddrQFM+KKWv1JwXPPnBJFnUmP5Vu5+ZVaiFF7j4ulQuRtErbu7Mp9uFHM62UZR8v1lziHgsZYfNKBUQZmvC+vubKYKM+vbDDzPZZOixBN95UBWtVqftSeDaFKoZbsetVlNthe3augWBrabcrUV4u9RMpNemAYL8vpuSKs2Lh0S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775742520; c=relaxed/relaxed;
	bh=FfLf9FSJQ4bbwNckexl7akFIsYHUqdf4UFIJBjk7jgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEiwIjR7odGqytK3mqNo9Mjjhx3VOdqISLdZ5BsD0U/4SFMfb7U3BFm0ocozrSxpfcQ7VYXD/WB9F2coNju0/YgJBDCUcyxk/DRKaYjth70mXypWtirRU2t7dwPJwABaTcymji+MmWIpm1OUa3/QC7rc0sjTdYoHS8X/uzTYrmIkJf1uhZgdHctJnKW1lFkqLX7m/otR1c4RpgyIGk/jv/CCRY1aB3Ect35dwMtC27hKOW84O5++5H2nA6Q4PG9AGmiU6BsCwMdgVhAaBPA/4XNnRFg6F4qcZz2Im2Ahu7Z9dQUq0ZTnavg05FjwhlhcmqpWknEJogpCSye2o+riOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Gt+DdS+8; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Gt+DdS+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1064 seconds by postgrey-1.37 at boromir; Thu, 09 Apr 2026 23:48:38 AEST
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fs1VZ1JLrz2yfS
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 23:48:36 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 400D6C5C185;
	Thu,  9 Apr 2026 13:31:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6809E5FDEB;
	Thu,  9 Apr 2026 13:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 150E2104500B5;
	Thu,  9 Apr 2026 15:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775741443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FfLf9FSJQ4bbwNckexl7akFIsYHUqdf4UFIJBjk7jgU=;
	b=Gt+DdS+85NbhlyHCtmfUuYrNwTpMkZ8ewS6xuIdlV2LbbNIkromilVSWoJ99XsMgfK95z6
	x44zRQaVCTbEEXJYmuH5ZvClzrF6SSK946ex3qwZLS0V3ESiAfEZUHUKM0kpnpQIXdveNe
	POv7VhGh5NzPLX7xcXd6T0YO1K4MCAoZ4G+XnnzLx7W34Y6WNqD9z75m6WKnbiJ8oECQ8X
	vhSlUDAkT/618naR3BauZorB/ivgxxPtnKWtlrCHIlMP4/fuaolcPxuK9ThFHZhDS5MWl8
	Qbqo6w6b8K8MhdCZny9AYliVrQTatBAcA98+gY3XFIWorSEsRxhsB3+H1Bu+Kw==
Date: Thu, 9 Apr 2026 15:30:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: David Wang <tomato1220@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, a.zummo@towertech.it,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@aj.id.au, avi.fishman@gmail.com, tmaimon77@gmail.com,
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, ctcchien@nuvoton.com, mimi05633@gmail.com,
	openbmc@lists.ozlabs.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	davidwang@quantatw.com
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val
 property
Message-ID: <20260409133036512b9819@mail.local>
References: <cover.1775717959.git.tomato1220@gmail.com>
 <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
 <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
 <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
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
In-Reply-To: <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 09/04/2026 15:44:43+0800, David Wang wrote:
> On Apr 9, 2026, at 15:23, Krzysztof Kozlowski wrote:
> >
> > On 09/04/2026 09:21, David Wang wrote:
> > > Add "nuvoton,ctrl-reg-val" vendor property to allow optional
> > > initialization of the RTC control register (0x0A).
> > >
> > > This allows platform-specific configurations like 24h mode and
> > > write ownership to be defined via Device Tree.
> > >
> > > Signed-off-by: David Wang <tomato1220@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > index 4f9b5604acd9..0984dfb77170 100644
> > > --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > @@ -24,6 +24,10 @@ properties:
> > >
> > >    reset-source: true
> > >
> > > +  nuvoton,ctrl-reg-val:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: Initial value for the control register (0x0A).
> >
> > 24h mode is not a property of a board. I don't know what "write
> > ownership" is.
> >
> > Best regards,
> > Krzysztof
> 
> Hi Krzysztof,
> 
> Thanks for your feedback. Let me clarify these two points based on the
> NCT3018Y datasheet:
> 1. Regarding "write ownership": The NCT3018Y features two I2C
> interfaces (Primary and Secondary). The TWO (Time Write Ownership) bit
> in the control register determines which interface has the authority
> to write to the RTC. We need to ensure the interface connected to our
> SoC is granted this ownership during probe—especially for factory-new
> chips—to ensure the RTC is writable.

You need a write-access property. For NXP, we settled with
nxp,write-access.



> 2. Regarding "24h mode": This bit determines the internal data format
> in which time is stored within the RTC hardware. Setting this ensures
> the hardware's internal storage layout matches the driver's
> expectation from the start.

The driver needs to always write 24h mode but can support reading both.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

