Return-Path: <openbmc+bounces-2345-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C9C5516F
	for <openbmc@archiver.kernel.org>; Sun,  2 Aug 2026 03:02:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hCPkJ2PtWz2ygl;
	Sun, 02 Aug 2026 13:02:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785509964;
	cv=none; b=CYrt6ZbtWJWeWaVivU+FcqOk2vqJCHPkN1ovb9DygdLkZhTQjgAXdR8zvc4/hhHUE2dBJiWA/+jdOIkeqBgRg0XDmK0p8UCTct9ov2/Bc9iVEBBNLTXKl+AITctcXxT5SpVTPwAgW+k5UfgkqRQDBTPnPQgHA6yBq5fSk/2b4LY7QIiiW36v+cT4qd7L/mGjHDEGKRjA4tH6pMT9OmgrfTENRRO+1Auf6hyz+PAX5xq4rertr3nnpvjMMQFp8s72rUNSR02Ju6rwrkJq96GS8ePyA2EVCVVgYJrcmzBM0u3sLl5ODVAZEBk2W/6lfsYZARawyEh9knAQdB6YNSL2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785509964; c=relaxed/relaxed;
	bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdfqB7ptSuNBlkcnP45ZCvvSyJY2c7uWJHLY27gVUBnT4w9W7X7dY1E5X48YnlKRgC8EWUXyGpmAGhxRTCl6XrixVwjjQG1nV9A0RrWPEBZLZkwGJBKD55Eo5izdRGU3HVQbphbOZ2Xti/ZUFPEN0VUBorKE/cQr5IpiOzxCHve3AVCoWbCDr6wNJLhdaTb7XtiioMKhYKLGSDaNzNIJ37JetDBofmaLvG9z2R2TO7mqlNqHv5BTkgn00HsI3exF7kRLSVqwk6cTaIbrdI3BLQMf1cS08jCS8x600gslv2kdZTDTdnYSXSqgBzxy8A0wkcpgtAG6EGnwZizbLRFrJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZettzXP9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=shaikhkamal2012@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZettzXP9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=shaikhkamal2012@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hBTk33FBrz2xl5
	for <openbmc@lists.ozlabs.org>; Sat, 01 Aug 2026 00:59:22 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cace91f112so11374615ad.0
        for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2026 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785509959; x=1786114759; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
        b=ZettzXP98coBnl4DNhaRsx3PY5JaRLwYX0XLfzHbmxAQBWXU7lwGSFUruGHOa7W8jU
         DCcP3zSHKJzjAWp7Ia1hVM48agsPU/tP7z1S6BB1ibabqa8Bl5d4RjlyC6QT+ihLCx1U
         LEXR5N/1o5SOeAUM2RICThOTElRGo2Frh0HeunnXq0Hjh49jLrUlW6hFJ2Ro4kVPXzBE
         H8+HS27uINZ+3cxDAM3P2+eLm8/WK9esI/oD/2wXTJkmgC0bJuE9x7PxOADpc9vdRJTT
         7oeUyTvdNwgHhfqH1ELOpwvDyJOndUCwo+S41hMC23jJn2tHH0s30tu2X3brh0Az3gNI
         Pjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509959; x=1786114759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
        b=po6xZd5PBmZHxC0Z9CWTvAsqStqGpkb5XFFHw/TDZruKk7EOb8s56k/xSAR97/OaUS
         K8hFWU5R3FCd28h9DdlPYqxtpzltXl5trlR9ebA+lS4Vf27TWadLXFVbnb7Yy4vTmtrN
         wshEjjdcU5fZqcXXQ6wjMDsD/uVzH6avNNs7E7WYgbM6O/0neh89oHEybPXwuux9EyTQ
         mQmwGilmV5gXMScG4qYzWfCM+N8mVOFeD31ZWv2EPRwjNdBWKtbs/pFyRzF/X2toCdWY
         0epyFsNgk0gfQCXaCgXIEf4c0nDEd4owc3WnL+j6+PDJ7lSu5qo1j+Xf1+N7UZ2kIYWm
         i3ag==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Jt+HUQW5efkeZ04tsMYRy2irCr6Q5xDKNI1AxVLdxfmp/rVQ4CNrh9yO2xkpswlhA9RK6bEp@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyQO83qLEvg9sY9GGl+sgFas1+pq9+KiHb9t1cZ5nhHpwa7uIi
	sDRXONZTJEydju0I2hBPihQe3INAnNkTu2SPY7BkeAnQs0ihR7WgbC2e
X-Gm-Gg: AR+sD12u71Cs7DTNacpHV8qZiyBa0Fpjo9Awf3fAiyUTwedpfzEJWvv21L6cBSBZLvl
	Y7L3V7XzAFYY9mDfN0xsNkKdCYeZQqNLQJytaQUjheiXWKmjv0hWojaRJWK0YecbvsCD7KGZQwp
	xAcIVlILL9msb8f8suxNhaTC7Eqe4VJDF9jhBp2KW9G+y9mYq2hKY88Nsy/jJgAjKmJRHg+QISu
	RMwxMdPz73s1AYKu42iq+Ik4LqRqEIlsIxJ7Y2P+FU5WGqrgoyhBb7co99Q5t73LOacjnb2VthB
	yr2H9a66PpG8+1TqPI0iF6Mr5qP5xkRzg3rzHLxy2g9fAE02Wh9dNb+tkTJdmXaqWij6HmeSGV9
	Cf4dCa4i9NM+WjXDTeEPl0N4P/gJiMSuCbO7YW+p5FC55p/T2Lu6PhYmAMiWg89unPuhHZzZMnE
	xqVEAuQ9gNHB1oVDNKJUo6xUbwNb1C1u9O+KHXgS0bTknF6edGZBcUPrKosF3Bf+o=
X-Received: by 2002:a17:902:ce0d:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2d0524723e0mr2815285ad.42.1785509959091;
        Fri, 31 Jul 2026 07:59:19 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb491sm6466105ad.42.2026.07.31.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:59:18 -0700 (PDT)
Date: Fri, 31 Jul 2026 20:29:16 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: nuvoton,npcm750-clk: fix 'suppling'
 spelling
Message-ID: <amy4RBUdtE8tTU5q@acer-nitro-anv15-41>
References: <20260726060354.18755-1-shaikhkamal2012@gmail.com>
 <8de9061a-dea3-4bdf-8dff-ad8ed4acc200@kernel.org>
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
In-Reply-To: <8de9061a-dea3-4bdf-8dff-ad8ed4acc200@kernel.org>

On Sun, Jul 26, 2026 at 01:26:49PM +0200, Krzysztof Kozlowski wrote:
> On 26/07/2026 08:03, shaikh.kamal wrote:
> > Fix spelling error reported by codespell: suppling -> supplying.
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/nuvoton,npcm750-clk.yaml          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> One patch for all bindings for such trivialities. This is just churn.
> 
> And wait for review to learn from feedback and do not repeat the same
> mistakes.
> 
> Name in SoB and From feels incomplete or as login...
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for the review, and apologies for the churn.

I have fixed my git configuration, so From and Signed-off-by now carry
my full name (Shaikh Kamaluddin).

On the granularity: understood, and I won't repeat it. A few of these
have already been applied by subsystem maintainers, so to avoid
duplicate work I plan to resend only the still-pending ones (iio, usb,
ipmi, clock, dma) as a single dt-bindings patch. Let me know if you'd
prefer them dropped instead.

Thanks,
Shaikh Kamaluddin

