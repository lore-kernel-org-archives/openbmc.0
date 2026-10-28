Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88625606A31D
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2026 03:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBh1kbGj
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDsc65yv0z2y7p;
	Wed, 28 Oct 2026 14:02:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1136" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793156566;
	cv=pass; b=iAtKUD1xwTZp27Vwssaunwp0vAmLh39hbfA1uxgBGznGlnmx6bycd1R3Qu0BcIk3ycpm3fJz0/6MH6uSUbBwGyJzAZEDBf/HRXLum0qC/FoLex4rSgFdzYsonIjl4jDQgB8Nn06q49lb7A1DXCyLKFLcJbehkhPpMJW782WtTt0/wf6ozw1O4cDYt15E58RFf0xTV1S3XOT4BBLYzBUMjBHBwAjeZGR9EWLgQwpt+ISRZeJIuKYpIDd/xzl7JSZ0+UCWfZIPCsrxEKWqIQl4s0Q91T1Cckxn3CRHlmO23fYFCjaHYC7+M6cQKXkDtdZ1UwPB7Xf9BSZSAfhtMBTh0w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793156566; c=relaxed/relaxed;
	bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+gs/go9vjjvzdOpRw3+HAicFpbMJKJX8OJCGX43vF9zeRpwFiu0FPA7icCuIwFxJIKnaF+aJUgwxI4uSai3Vf2Lrr9SLzJAI367PqCu3vV7uX3cnpCQnTvaSTBBJbbSJM7gCbJeJpi958lQKqe/NBd+kj/Az3ZzuV0iDWcL9LDLr0Xp/WKgh1ioulm/XBqiPrfO2ReTIwv3J+zwTAHzVPsrJdD8gigMetWFii0OJ2GLEUFAalK0EnTNllecoJdS63SFrqsj2yHocIbJbe956e9DQd9dESb15wRUXTq6M9voNIjB3mfBfU6sfb+wDk1APdk6OIH+cHQaqkNOYZBc6Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBh1kbGj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qBh1kbGj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDsc53T2zz2xHP
	for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2026 14:02:45 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-8b10d24345dso4472967b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2026 20:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156563; cv=none;
        d=google.com; s=arc-20260327;
        b=mhGlw4tFH03CgJ359MFLZQNSGDnIlibsz/NiZVvOnPrRMIGZ1i8pRhvKZPihMNlzNy
         0bbFzwA4+EJWYmdSHxRdE7f2BQQLdIBu47AQ/jhASp3bP38+Ssteh2VB1H6MtScg6TKs
         SQ+xhGHmu82d8+QiypKdiJW1iu8Xe1AAJtrkZjsgrkDEqke8syHBa/W9zGWI2XxNsERN
         6a6y1RRpRG1FlcT8AfwLi06eq7oavu/gzQDnxipkDV9c18YOPxRBSkaoNgtLmMnII5ZG
         bY21zZ+jaUqMme25jAyKSOs8s/j+y1lolkQfuJCsymzCVHY3fve9uMiOYXyS/zReef+U
         YqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        fh=5ElRSQZQNckVQSgzgcveOnh9qm9Vl7rhUkc2FbaQZn8=;
        b=fILGfftTrfBD29f9TYaxJfs79hqJkc0plcX+VmjMey92Vj1MTwKdOMBHLz/Uou3RRU
         dkGUHYj0EYZAg0W7MXW5E1fGjpv0XXadqGDluWki0gDNGY+M391zH794MRSaZZ20svOu
         +rqNfCBqk00wy1lx0nsirc7vcwdBtvAQ0OiLA92o/fDlaarZYP+3U205/Wkouzx+6EXk
         Hq4GiwY1ASS8MQ2xJg8Efcn1ZolXZNxyK5Q13p8sPU7etuo2pf8CMJraYkGs41HP9NjR
         ilWSWhdDnbpof5CaNq8Ws/8ePvqhnC2fwXtrt/ykx+rJ48y3wcCDZPQhEnboIcApZ22J
         EAog==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156563; x=1793761363; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=qBh1kbGjiAR82Wyxv6bsf93nB02NO6LOSdSEbmqu9rlI1Oq+1l+Jf61rYC/1GZRsCa
         Q6O9t80GD3OsK6PDoSgpWHaudMBzUhJ1xHal63wLDcvL66gBsIAt4vE5ar9fpeFWJn+G
         9y38U47Lb9sjTH61EOTyhqAl8kUOEzLdfpfCnQvwLXFN9O9VD7lMEzkB3LQ7e/14HV5O
         NBcS6T//g3ZlbSh2s5hiV0ODs3nKwMiN+NTo5dEkEHrY6cful2OIPVd8n1TfpXdbQyOX
         9VB7+NT/bTQSdYgcindqRElj2Qw+BLjkG5tF7mratpRsSDz+r+z0b6bhqkgdW0sVYCdx
         2/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156563; x=1793761363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=fHxeGH8paJvWjTr89GV6QzaNHkdti3S5YVGaiGdBK9Jx7fRaj2wBmViXZ8V0VLeata
         /PgawSuyCl5Ph9lLg6zqmkc27JVMbB2cF7+33KPGo2QIm8WVn4xHmvVl6FvPPoDaGMvR
         HgAN5zj5NWPfMTkfvmCtwE+uebWqGVojJ6sPaxtJd69GYFlmPrRnti6CKNB4Hl6i0gaD
         bpzg89Gst8OOuDsdMSJ88t8HSXaLRI7Nb61f1IuVqANNhCchl19DNh/OqCRzuuprNPVd
         Bxe6Y5lch8zXn+o8h1OQyj1Pq25Sseae0V6VLNa3WlXFxzMY1nWzLfbip0fxWtZ48pEP
         r/Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzpqS+QUEYVljHKfR1qkaFiNNafIUWeOIioeafUhIFYSFGsryh6xEXJ2qI1D1oviHX+oWAnFryW@lists.ozlabs.org
X-Gm-Message-State: AFq9FYKpCIOGnQ3rPn661aL0P8yoOF7NjXEt5STpzjtyHKDSkrEhTrul
	05WXIpxLuUspRWYiXKZzIC8KWQ/wmEB/erSJimmZqa/qa4z5gOani8yffkkNbzktjQVCamRvu9Q
	vUeB9TBUd7NtDAsX7CyHycgZU5MzGiyQ=
X-Gm-Gg: AYBFou0ofnOhDSlnMklD9aHkXxpYxinbJF8FMwns0+a4j3mtJFz6Amk4OW0ziqVPok5
	4x0+/X62g1xocWC1TichxikIjCzKqOi40M036AS6QKgAJyIPAIkO33Hkc0jPVXV5T0omWtLE7Zl
	acUdOielp2yFTGc/hejeO1OnGJmauhRbKYPGjzzUKbIi/PPCrgCfx9Vmz7Yi6tLuanbbR40uy2g
	E7+j3HhKP0wly5Lg0D+OMHI5ra1AdwVfXAYElXQS+Vj6VAKcV+B4MC1qm9pEAhIa0ARBmCieufs
	UhuI+V+0AM7/4KcmH0LA9+nLmovmkN5EfBqbmZGYW+fgdMxaNYCy0jJ7boVAP74Mifl1F/xFuhW
	QWtZyrX6f71I9winCjmtWxVbOdzoUaA2k7rRM
X-Received: by 2002:a05:690c:930c:20b0:8b0:893d:ccbd with SMTP id
 00721157ae682-8b1b5c7066bmr6133407b3.12.1793156562747; Tue, 27 Oct 2026
 20:02:42 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-2-prasanth.padarthi10@gmail.com> <20261027-savvy-powerful-seahorse-cc1079@quoll>
In-Reply-To: <20261027-savvy-powerful-seahorse-cc1079@quoll>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Wed, 28 Oct 2026 08:32:31 +0530
X-Gm-Features: AclHuK9lp_o8SK5eEXhK6dRTkFSMinl_ZrlydL6PeVvJqMGdIxhaqqqLV4JoCCc
Message-ID: <CAMFFDGhdzegMGoajgjfX8FRTBNF1p5VJ9CCcm9pPEVCA0xibQQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Thank you for reviewing. I omitted the earlier revision history and
discussion links, and placed the compatible incorrectly.

I will reconstruct the changelog, include links to the previous
versions and reviews, and correct the alphabetical ordering in the
next revision.

The intended changes since v8 were enabling both ADC engines and
adding the IIO-to-hwmon bridge. I retained Andrew Lunn's Reviewed-by
tag with its original scope limited to the MAC0 and MDIO nodes.

Regards,
Prasanth

On Tue, Oct 27, 2026 at 3:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Oct 27, 2026 at 09:19:10AM +0530, Prasanth Kumar Padarthi wrote:
> > Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index b7e70868e..3e6133e2b 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -79,6 +79,7 @@ properties:
> >            - enum:
> >                - ampere,mtjefferson-bmc
> >                - ampere,mtmitchell-bmc
> > +              - asrock,b650d4u-bmc
>
> That's v9, so where is the changelog? I see in cover letter only v8, no
> links to lore disucssions, either.
>
> What happened here with previous versions and reviews? And why is this
> placed in non-alphabetical order?
>
> >                - aspeed,ast2600-evb
>
> Best regards,
> Krzysztof
>

