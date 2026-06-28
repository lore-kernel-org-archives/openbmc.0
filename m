Return-Path: <openbmc+bounces-2143-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C81FC43458
	for <openbmc@archiver.kernel.org>; Sun, 28 Jun 2026 07:02:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gp0hZ0TSpz2yYy;
	Sun, 28 Jun 2026 17:02:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b133" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782630125;
	cv=pass; b=K1AwLNShL6KrerBRPOQ5+X9cDnkVh5u/fQJJg1Dcfl5jOPsOHFvUL5R6umB4HRRE6AYbqmGmzA3IqnYL0EVvZ2iOO1bc7J8/OSFrf2DlZ43EyEAUazrBgnGcakbQHqSim+6HlJByewOPWaqPVfT9lsay+IUDXWJrOHVIhANja77gwkTcrhH4hfxbpdoLbDoBv1BA9K6keSD8WmSyBQFUbzbNmiNWxPbdogyvVFoUw2w2G6tN9sc6MoEirYSLakqD3p3eLtU78KwWU2UBar0yA+GMazQlOvGhTrT7rF0lgLFfRW/aOwekhUfv9kaLPEIZ4j7WJT+7ijzQWKhbG5YesA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782630125; c=relaxed/relaxed;
	bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1g1++5mIFIG4S6TWYKHoUKOtqFZ67Q4QD5cj+FrNUj92CQ3TrStcPW5byd1eZ5q/nhjroAZyIIw6yXQkBW0/1uaRVczzwxeGt93ga9VpTbyM3StB7uBOFGUw4Ziokm3ZQQk+1Eox1aA7ZOgduoBPMPrApWfOEXzNS8cfSIZMYM1cGA9G1CmeRTCVVe0btEQdM0nF1BV2/XrNpgYgQefgggL2rgS1Iv4g6q8tAIdljE70qx2j6wwu8GuaYARGggd3/o/8ZuaP3I91ai6iLPQOLYpdIJGNd5mufZY1/6JKEYU14p39wdL1Vbx9Lg57nln8slXnchSaqRRD4X7MVpoXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HjdWRuzU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b133; helo=mail-yx1-xb133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HjdWRuzU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b133; helo=mail-yx1-xb133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb133.google.com (mail-yx1-xb133.google.com [IPv6:2607:f8b0:4864:20::b133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gp0hX0ddfz2xMQ
	for <openbmc@lists.ozlabs.org>; Sun, 28 Jun 2026 17:02:02 +1000 (AEST)
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-662ccb916c5so2627928d50.1
        for <openbmc@lists.ozlabs.org>; Sun, 28 Jun 2026 00:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782630120; cv=none;
        d=google.com; s=arc-20260327;
        b=cMhfhqHQA2rzX2kzmfEnLDkP/AxWVNEApY9NMtdSENI4ELf2R6OYCy7vxIt90Irnp5
         LnaSfphZK4H06PWUw0DxW2JqHO9xvVQhkMXeLlyjD18yLhY1XC2R6cW2/MMwEhsMiyN8
         /ZAJ3hIKqj52AYQj2EkSaFCRdvaeulTa1JtYSMk2S9eA8z01F9P7/rjJMVDXc/alZ3Ir
         /mg+cTXdWr+YuTM6ITDUbIsILgLQHyqZhx59A3+beFWiz2EQEwZNxTgramtObPtn6sck
         NMJDY5Jomcsydks+L7/xgHdc/IgcnIdfFjQ4l/2YC/n7iLNz5yMcPBhJL/ovKjV1xOYR
         FXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
        fh=5t0MNzM5LsA9HAYyEKtpn4IhQDeBO5t5ZZtGhm/U+RM=;
        b=lbdm5SqF9Ts+qXQ1oyd2hVZQ0a5N8p21DjHG/3hVimrxO9VonFo9l5hRegg/BgwMWS
         v1aFxaEkzsPggCgoR1zF1znkBvRqPOevM4tOd36JsTliflxtu7pVI86YecTbKOk0lpdx
         xeGyxtSI1/BsMduEMk7n0nCY4m6AoiOgSYgk+3WLXdCvwR9OJYJL4IwA0jfUJ3UyLdG1
         uxnh6gDmMSy3RCfkzvbYZUKwOitOSiUCdv+ERzIkzxX9YxyEkLGvUXU4bgqm9LHDCG5h
         7WfT7Za8DiU1KMiu8hDx5xkGL0VklDaO2uf1U8Cn+VPBeWnN+NR+qer4l0pCjpnh2a5c
         jK6A==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782630120; x=1783234920; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
        b=HjdWRuzULKtDczut65BHtRzpg+nM4pizvyc3UOJHjlFUkIsYCwUq/krIkmARJeMyp3
         FFViHFmFunQmoMw4t9X1vNE4DSVsoMU9efD973jsBg1MEiDZXoMOoxS0VEyoyP0LqQRQ
         5ptkaiF5dl3jWCjP4B72E4rmuX5pH23nEE/FGNVRVqgqpM/1zzoO9f+uW8TX4msvRPyB
         mkHHubbP9QcMF8oK6AJIv/Jj8zv8lneDVwEoovsLi2Q2S4+6LYbq4mPb/X7XsQxmcX0V
         gT1J5EjjdMPyIkrcyQpbwkTiKPiNWzzxxYN2hv1TULg//Kq5REXQIkk3MWJgKrBJY3Yd
         DJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782630120; x=1783234920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OId4Ok77F5YJbguyUedoxMERWa5HS2eOIQ/JijyeTg=;
        b=R8ejXXIpKnDK/5sHTIP/ZGo5lgmccXYBBEqP7uvx9POKm/jmytQQ9M9Q9Bl/VHFlQR
         +pSqdhzA15FTHcyHv0Kg3gghb2aTo2Iun/6tmsH0p0VwGE+o3IatOFYlihh/BTxQQsrE
         BjzGMUvTpz5CdcGqaY1evsb/vvDPPpfkXpFaECF4NFh7du0iT8GphayonI4r9b6M2g04
         IJtwtkHTiGnFuJws45FV81ciIm9zbQ36EEfHiEOqSbJiecpC3n3bThyOF60OOD+yNZhe
         dPx0wJ+AebWL0pAbKvWCf/A8pMQNHexhnFj4YEZZZyEVqd0VnqhvUUOsK1BVFZcm/2FS
         DVmw==
X-Forwarded-Encrypted: i=1; AHgh+RoehP9f232KLEQOc293Fj+trGPYSFz4nWwlU15Z09ayZ9nUhNqesBbcnxHkdYKOLj/5ype4FzCc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwT/sLSfBIdrD/5ww7blNQjaWOu8aNdPuCqt2iWmk+nXGLNJH5a
	xJT8Qh8WrBpEiN3HRgdQzh46BQe4IQoxxBdMaHmTAA14mkeZtb4X65rEimrsE+HCZnChBTABHsc
	6fpn3KezHC9MreQuXybdrVJqbjK3C29Y=
X-Gm-Gg: AfdE7ckqRY+KvyqUVkLSk/cy7SpZIU9J+BvxySZgWQReOm2VOgrr5GfWF6gIiLkRjUm
	16bNlDTbReNwEPL86NiidGn88VToPympsXh7fhqNuNJBD8cC9+Xb7CkObSbuklffEKCcUJe3DK+
	Q9mzB5EaNUGwv5MzsnqQ4keH9qRj37A+FQ30/8ByxgBTmtJfD/vPNQHsNrfC2sNvMx9I1bscTo4
	riAkh9QuZixOKiXHtBN+maHwy5xDbMRgV3d2O9Qeq5A7PlCz5QpOkg7Yqa5l6KabenxLJ3g5A==
X-Received: by 2002:a05:690e:4384:b0:65c:4b71:e6b4 with SMTP id
 956f58d0204a3-66488152a26mr8488609d50.20.1782630119792; Sun, 28 Jun 2026
 00:01:59 -0700 (PDT)
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
References: <20260622083046.3189603-1-tmaimon77@gmail.com> <20260622083046.3189603-2-tmaimon77@gmail.com>
 <20260623-ochre-spoonbill-of-security-a4bc42@quoll>
In-Reply-To: <20260623-ochre-spoonbill-of-security-a4bc42@quoll>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 28 Jun 2026 10:01:49 +0300
X-Gm-Features: AVVi8CfRBhsj1pRWdOM2CE0sqTqASlUrWhsQBJl0HJjSQATVDmJtM7eZQvBwA6g
Message-ID: <CAP6Zq1g-dBdt=cgqfxn=8qVX=UBs5-w09YqDvHfi1y=h4H9DKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, linux@roeck-us.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, joel@jms.id.au
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 23 Jun 2026 at 11:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jun 22, 2026 at 11:30:44AM +0300, Tomer Maimon wrote:
> > Describe syscon property that handles general control registers (GCR) in
> > Nuvoton BMC NPCM watchdog driver.
>
> Why? Well, you try to answer by saying something about driver, but we do
> not add bindings for drivers. Instead hardware should be the reason.
>
> Anyway, why is this needed now?
It is needed for accessing the reset indication registers. I would
mention it in the commit message.
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > index 7aa30f5b5c49..4f00f099b2d2 100644
> > --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> > @@ -40,6 +40,12 @@ properties:
> >    clock-frequency:
> >      description: Frequency in Hz of the clock that drives the NPCM timer.
> >
> > +  nuvoton,sysgcr:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
> > +      instances.
>
> Here you write also for what purpose.
>
>
> Best regards,
> Krzysztof
>

Thanks,

Tomer

