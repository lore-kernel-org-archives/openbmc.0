Return-Path: <openbmc+bounces-1799-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490FEF45A12
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:56:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsywn2SC5z2yk6;
	Sat, 11 Apr 2026 12:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::729" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775720660;
	cv=pass; b=iLBhTTgg+fFzaSZdMubA99X13zZydGWPz+vVs8uKAhPxd8jih7bOR6JTcEERFHOfD4vjLze4kbrbqPm0IdMqZ+dpizGpSLKbIUHryZq7KbiG4ARhYNgwA6kOHm6K7jcR5mapQASn/WKNlOJhpK7VyEcIGUqr81lxgEOaUnIOMOD9uOeF54k6CWEf8G+TvhQVDlDh54whPUEMysdodYqQyrg+TbspR3bUe35NOEOy1Ne3alTKpGH+zyS7b/2MO4Srih2IafduEPqIMjMJN1YXaQebDgGmG8dRAV+Y3R9S9Ef31XtNf6RZE9gzuUYMvXVBcj88FLXNaZS9Hclg5qVk8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775720660; c=relaxed/relaxed;
	bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1Z31QpDJHlR4AL48N7pGytxImp19HH5y8pQcY705QcGGKv4gmbrUZEs6NeDc2itjOUOZPUsq7k6qBjr2HlQhy8VwNbHbs3EvloqVq/uVdx0cOr4pdd+uqHuOXRWJaNxJ7yoMt2zZJ97B4t/SL/6I5wFWFYip/yrI8Zmtvq3gsXUgM+xh1Fg0Bu1l8R9MRQ1m5KK504E0kqQdfMH6dkIJ61hFhZYlQdyezcEhUmlZOB2h9zFYtJD1WUIPtKJhK0RNqG2hGGr3EExJGi1snQuhg4twtUTEZX3j+0F4rVsQvve01dKOfHS5yV5VMAaZt1Pxl9eVWCr9xEAEAks+rwT9A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a9/FfOpA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a9/FfOpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frsQC4Q0Lz2xld
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 17:44:18 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8cbb6d5f780so44430885a.1
        for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 00:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720656; cv=none;
        d=google.com; s=arc-20240605;
        b=IHw36c7Ql8JnzNKBCPFfpa2G1hSOD61c2cOjCKk+jepfvcMKMBIOpPVuBKmGjpllNI
         cCC68k+/8gqDLdjQKP7wJubog5+8qLjxkVuVQTQb7O2yCr4JcM12t1u1sMGnodyUmD7r
         4wWkZxlTDXA8vnOj34Cq1Z5fpeAGLnFyPi2sYC1SAnSaGTjjseXBA17osg30aopxkJTX
         p3xkbmocxzsaPdk/EzJ5LOhNgyMapZweP5FZ+S7NdjLH8PDXlkipw7CNARwQUnmK1ept
         MG5I2CGX3jCz8zpkylCqEt49OTpTNlHnzE55WjZd6pHwuqspDaCQoAfi0CmSXUB8ufPl
         ojGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        fh=0ehFB0r56ydAs536Wk8+Kvw13A8s5WPcRsMBRujtBWQ=;
        b=Wr3/UbT/pdw2lRUjm1cAjm2c2T1T7tzJKDCDIsnuQSfB/Ze4S5F+YHoEJu0Qd0wnGD
         4+8zu8NKI7ls6dsddXZWXH/foWfX0L/+43VAFa5ca/+crpJ8nka1B6JjhrpMI8NghitY
         w5pVs+lVj3PlPlZPE285Z6Y9dx9p+Zq/NRBLW0Y2GuK2umdOWZQuBJkwz7mQKm3ecIA2
         el+XrYWHywZkgxO81I49BVITvHFvISxRlRI4DJCc9syh3s3n6inQVJi/CpMQNNpcSyJQ
         ddV/5tqWDkxBgDLS6IsO+2YHjj3GWR9Hq6FvhHi8/ThT66fH8ixsVZJHnNI+1BYdeJsj
         TpcQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720656; x=1776325456; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        b=a9/FfOpAGCG5at4Iot5WXjY9DXeCs5oyCzpm2Nr8a32ESt8CDgsQJ/hetePxkHwKZz
         0jzLkiPD1082HVtu3jRTlwr26wSqo1mTGyViBUk74l/J0+MPrDVbbQNF3VXnqPJpXsT7
         7UC16sJs5lWzrVShQVtnfGI0DSZx+lnggEiqTKkB/aY61vHXmdnxfwNaGWj7/WLtmZSS
         JB0KS4b7b7bA2+hS/spM6mqzxWiAqu/wMvGnCXwGAT5KbCyEe9O/bHzs7q7m84E2MBUX
         4kBnLpK0YHhBqIkl19BZTh48qaRW7BGB7/jbSuxzLCCS7hfxFFqKjGCGOXHcNfEhEQ24
         mnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720656; x=1776325456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        b=qrdk77ySwWHR8EtfbDo6/ryyShqa7i4lZgATjnj/f/cDY2sFzAXJ3TLi19srxndVEB
         PIYQJE5Y9F5zY9G0e7XOQKhuu0VzNIey5ImQSveZ5dVjpSr5ucNrNoieHIxcwuaUg8QX
         foaZBtwPaKob/UPK048xuuGKMpuSc1SzF38zG4qitOu8nFu13W8HYuMnHht2K9ypaJBk
         3ELHY5lvlyLfQgG99kz1pj20/0uJ/eFp8lyGm8zFSUi7t9yeUVGLtmmy6YBhlb6CJT28
         GdAf0zGIs1wTWog2w2wIZkslepnoEqeq/aq1XkUn1BZ1Uuhew+awwdPbsjx11mtGEr0q
         21FA==
X-Forwarded-Encrypted: i=1; AJvYcCX5cely9wl1SeJSjR3wnV7Igsozq/ZpmmPptcQJv7UdTBvoDS6ZkdVABHH2YoV2o4rZyxK1odPW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwF3QXaMrY4av1YxH9e5YEpRdQOcTtbzal4poGArTYUDDmcJ8i7
	sG0TWT9wduvd24JGm5e8K33nnrEpuiPfUsNESoVJpE4DddxWLFbRsbI6THfT7aN3FtkUybhpTYx
	QOl3OD8cE2Vk1WElTHsU/dykrfca08uI=
X-Gm-Gg: AeBDieseMXrSSMSC5DiTPf3ad9SgTLPwSCJY5igikgCvhi9vJNb8JXAmf/spOOp/Zzt
	lUa9k2feo16r3yczoF5PUtEnNih9pu1jLBI2FhbK7bf9R/qwIoS0/um7cTcKKXv2kKCLxvCr9dg
	OOzrbE6hIAmHu+qd+XoYCJpcejEZbJmc9lEAdPWXAHpZlif996KMQAf7bDASZW8BFiohgIxxBoD
	eqYInQpGOfjyPVE/gHDMqtRJlIify8N1HftIOhw4ke9iGNi/Fc6edVnu/IDfMnTLMi+Q7db/ygv
	0uOD66MyheHeW50qA/I=
X-Received: by 2002:a05:620a:448e:b0:8d5:26e2:661f with SMTP id
 af79cd13be357-8dc3d65d215mr363217385a.42.1775720655867; Thu, 09 Apr 2026
 00:44:15 -0700 (PDT)
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
References: <cover.1775717959.git.tomato1220@gmail.com> <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
 <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
In-Reply-To: <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
From: David Wang <tomato1220@gmail.com>
Date: Thu, 9 Apr 2026 15:44:43 +0800
X-Gm-Features: AQROBzCF7F3D8qQZzH4nVF7DtpNul6eHMhQM5j4hlrJJj6BRCmL9I0ox9rpAVNY
Message-ID: <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@aj.id.au, 
	avi.fishman@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	ctcchien@nuvoton.com, mimi05633@gmail.com, openbmc@lists.ozlabs.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davidwang@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Apr 9, 2026, at 15:23, Krzysztof Kozlowski wrote:
>
> On 09/04/2026 09:21, David Wang wrote:
> > Add "nuvoton,ctrl-reg-val" vendor property to allow optional
> > initialization of the RTC control register (0x0A).
> >
> > This allows platform-specific configurations like 24h mode and
> > write ownership to be defined via Device Tree.
> >
> > Signed-off-by: David Wang <tomato1220@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yam=
l b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > index 4f9b5604acd9..0984dfb77170 100644
> > --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > @@ -24,6 +24,10 @@ properties:
> >
> >    reset-source: true
> >
> > +  nuvoton,ctrl-reg-val:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Initial value for the control register (0x0A).
>
> 24h mode is not a property of a board. I don't know what "write
> ownership" is.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for your feedback. Let me clarify these two points based on the
NCT3018Y datasheet:
1. Regarding "write ownership": The NCT3018Y features two I2C
interfaces (Primary and Secondary). The TWO (Time Write Ownership) bit
in the control register determines which interface has the authority
to write to the RTC. We need to ensure the interface connected to our
SoC is granted this ownership during probe=E2=80=94especially for factory-n=
ew
chips=E2=80=94to ensure the RTC is writable.
2. Regarding "24h mode": This bit determines the internal data format
in which time is stored within the RTC hardware. Setting this ensures
the hardware's internal storage layout matches the driver's
expectation from the start.

Best regards,
David Wang

