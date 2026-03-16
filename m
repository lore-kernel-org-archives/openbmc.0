Return-Path: <openbmc+bounces-1537-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C809BF53D6D
	for <openbmc@archiver.kernel.org>; Mon, 16 Mar 2026 16:47:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZLcD1yqVz2ygm;
	Tue, 17 Mar 2026 03:47:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773679660;
	cv=none; b=ALTlci2dnJ4WBI1sjdq1J+UxxeWruoSNbDnpQVF4ObvQLLF3oI7qztLwBU6uVhXMqztHUurybY+ttG63479kEci7VM9SfKWdm3tqaLjYWl8xKtuyGfIQMbwemoiwm6byNf26Cmzqqq+eaoU3+SPGIilBGs8sbRAtbkAVIIkKslsjqPwCoJXVGvFZ+caYMcCurbDkaXse4T3FUv4o7pH0kLBnwd6Nm93tp6ZarOX0LJ3f3j8nS01A4bBKtqafmesddOXzLEd9/ee9gl73szVGshGvA6n29BfGzZ/jPpRXRpXaiK9MklCvz1DOS0utJOr0jm2oS/LNfDk9xeoxHytkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773679660; c=relaxed/relaxed;
	bh=KWa+RXyopymTRjjpFJkMzMT8GIqPd4802R8XJ+/wxvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrbyyuourKB/1tPIJy0YEHgkiBQJPeee1ZdfQLKayFGoBaEdVYU9o1DdhW7k6njlXsGn7ZYYTSYRRzKcOU2YJZIZfoURBC84847K6NLosfyIX6G/TVLx+zeOVehZms/46KLpumrSP90VcKWdHSgdHx9WhfUDFMgQ4DceIDVLggut2beOFyXn9DscHbX0l/fQEM6Kct2FvTWZHlm753TKViityzS64J9fjX7in5z6ZCNaQYCvO1/cnHdBxgyI8zdF3D8pfbj0znRXh9FUcmwxHwX3WScNXkXuXSDULWI+uCErxXjRgPiueDn/4nhsPkeMj1LnAJaIlbqXW5QT6UOskw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cGtekfTq; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cGtekfTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZLcC097dz2xS3
	for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2026 03:47:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE0126012B
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 16:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E84C2BCB3
	for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773679656;
	bh=+rAbjFpJLF5ELTGsyzXHo5dgEzatb5tWHpqXy6BTmYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cGtekfTqFvVrF7VJ1xDN/03QTDPDcdo5LNi8MIeHSIezK4Gd2z+GQ94TdThe3wfdg
	 6+jwBMmOqzF85kgS9jF7LvwgP5JGWXJpkAzraz3vFcajQZUHBvO0WRYzQJE7J0Ytmi
	 Gwi/li0g/v/vcXP34ZAq++FsOnJ7YYiJJNUFiQULiaw3n4kJ58eE6KrMSVjMGnsO4u
	 IMN7zeBsIcQrt2UTsOQo2nDc2fI+SGolMG21oQW9QYbqop+gZh52CvuNSngMbBymF3
	 pYqZPEns6Yy1LnHWMLVS9x1ZnrWuY6XLupN9bxQWg7FscMFBB3zIghh1qubhnfJmuf
	 WBpxVo36e6R+A==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso199723666b.3
        for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 09:47:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxjG/uwp+2xwNQ0v8SD9VThoHDlNRPFhjg/ELXvANpIRiXpVZ+s+sJ20Fl4+fycldI7nieFyBi@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkEhRgjJM5KvrHGvZ2Bs1LNCvkbs8RDjYUCGvDfy6Mn+7i/UJn
	1mP1QiUmHjZLFl1+4zWbmqpYhwlZuDP1nDX4cG85BVXH0u1ywn+AXV+z5sxFpFc0kw4RaKgIXgZ
	IIMO+2KMjH5R/bFLFkevtSb+lhVT14Q==
X-Received: by 2002:a17:907:708:b0:b8a:f2cb:8088 with SMTP id
 a640c23a62f3a-b9765392113mr794224266b.33.1773679654788; Mon, 16 Mar 2026
 09:47:34 -0700 (PDT)
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
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com> <20260313232125.GA3618633-robh@kernel.org>
 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
In-Reply-To: <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Mar 2026 11:47:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
X-Gm-Features: AaiRm51ex9uUeaeovsj_EfQkcC7S4igdlkgu0QdNDXmYleGKXTFGbzYmU6uj8IQ
Message-ID: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 8:50=E2=80=AFPM Jeremy Kerr <jk@codeconstruct.com.a=
u> wrote:
>
> Hi Ryan & Rob,
>
> > > > +  aspeed,transfer-mode:
> > > > +    description: |
> > > > +      ASPEED ast2600 platform equipped with 16 I2C controllers eac=
h i2c controller
> > > > +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buff=
er mode), and
> > > > +      share a DMA engine.
> > > > +      Select I2C transfer mode for this controller. Supported valu=
es are:
> > > > +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> > > > +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. =
(default)
> > > > +                    Better performance then byte mode.
> > >
> > > Good, I like worse performance so I can use byte mode.
> > Thanks your review.
> > Will remove performance statement.
>
> I don't think that really addresses Rob's point there.
>
> The selection of mode is somewhat a driver implementation decision (and
> so would not belong in a DT binding) - *except* that there are
> considerations around the use of hardware DMA channels, as covered in
> earlier review.

Am I supposed to go read the prior 25 versions?

> [My understanding is that the mode needs to be defined here to select
> which i2c devices have a DMA channel allocated to them. I also
> think that byte mode may be useful in some scenarios, but that
> consideration certainly does not belong in the DT binding spec]

But this is selecting DMA for the bus, not specific devices. I would
think the decision would be dynamic based on some xfer size. Certainly
if the xfer is less than the buffer size (32bytes), then there is no
advantage of DMA.

Or do you mean some instances of the I2C controllers have DMA and some
do not? If so, then ...

> So, how about we refine this to *just* the hardware-specific component:
> whether a DMA channel is allocated. A driver implementation can then
> select the appropriate mode (dma, byte or buffer), depending on
> implementation-specific details.
>
> In that case, we would just have a boolean property, like:
>
>     aspeed,i2c-dma-enabled;

... yes, this is fine.

>
> - to signify that this controller may use a DMA channel. The choice of
> actual mode is left up to the driver implementation.
>
> Rob, would that suit better?
>
> This way, we don't have ambiguity on "buffer" default vs. absent
> property, and we're no longer specifying actual driver behaviour in the
> DT.
>
> Cheers,
>
>
> Jeremy

