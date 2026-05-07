Return-Path: <openbmc+bounces-1904-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221EFCD3427
	for <openbmc@archiver.kernel.org>; Thu,  7 May 2026 04:32:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9zrC5njvz30Bd;
	Thu, 07 May 2026 14:32:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2001:4860:4864:20::2c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778128363;
	cv=pass; b=Fh/+kM49oaKpSdpO98vtoUnAYs4LG3aX0+ZsGXDg3i56BC/AhQM2g2MZCVbzjUtAdPH4AlZXhgqJLbR1HLqTlrEahHwQgsc1MDf70H1KgaGVvs3x+9PgZzceuhrGnEdgvstzV9ddvU81BQ5wCsnBY8QsmjwzfaxgC8CDXlZ7cIMkb3zw0veqWiNyBwcQtMYDNx0eDYXP50wYyUp4CTfIqF3o0Y4MZU6JgH9dOd/zgsu52BETQ9uuYlQy9gUOUV8aKgAqohrhwasNZInvK0RsrYZezDTrpQF6uXrg4p7JwlY29XztJZPB/ecuvXwCUa3pAi3K9ImAxgFChW7vzMK/ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778128363; c=relaxed/relaxed;
	bh=6LxWRta8jVoFPg3bNy8jRRVGBdR1fKMJ1vsZZUxThcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv8R9JHyLw4qEfJcrkK+yl2hdF2vyA/J6wv5U2r0rvnOo8PfasvitbS7xk33nCBecQmDXUktOJ4PWAxjO0TPiFRG7pyH38c5PM/mp8ES4Bgp2VMheA4/Q3xL6PgCZ2rdky2OrrNatbAEjtpK4Vl+WRl8s8+PufZmir47ZMutCJ98AmElvUoj+KB6bNPUEN/uze2bQINPfh4QeB1cpWQd7CY/cdaxPEVJa6zS3BdcFhnXAfDAeYZWNF0UIm9pQt16M/JPVNfhibtphQfAhl7YBpFt+sVkgpFg8rHGGV/7Y3yjKkJCXr+3Il3UYfMFIkmVoBHGayjotSLBRc1lj6dIAw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WeO85adW; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WeO85adW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g9zrB1Fd2z2xlm
	for <openbmc@lists.ozlabs.org>; Thu, 07 May 2026 14:32:40 +1000 (AEST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-40974bf7781so1437378fac.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 May 2026 21:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778128357; cv=none;
        d=google.com; s=arc-20240605;
        b=kfs505o9gGiGtOuSu7MSA8xmFEZt3kJ9MgvXdtOmAsv1BggJ8+A4TVmLAavTwXPAiL
         fi1E21rjvvjD9/t/pRexqHPxM2JGa4IaxZG9BSDBZ3WoieDmMvfyClwGPHjNfPEyBNly
         W1MzsjVZacFJ3HQKUZf1+FG8oeomJosKo4phAqPsfrhUJ+ARW0yZzT3f74uHvYpKhOTn
         7OXcmz67kWcZrjP7EkJh+Zo2AX7tl+5+IVwZtf41DdimuJlBY0CPm+CZdIZQxdaXjpT6
         wXA05OTlIBfIFgHXSihpU3f85q+cyz+qSTpffaAImt612uCN+IkyjO/iCtFqw6vA9KNk
         BykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6LxWRta8jVoFPg3bNy8jRRVGBdR1fKMJ1vsZZUxThcU=;
        fh=LjD2CtxUvU6KQSJzHdjEM3dQTbvHKJeKBIqR2x8u/iQ=;
        b=AdWr7odm8p2oLuxlrop0sVAohhGFeZ2BD64ziVIeHblqdQQr0TNHDCSyR+uf88KCZR
         mSLyjZRjqveABVmI8ZseN8yvqbhfJLw4NQP22P2R7UuDXBwpZ/eVinUTuRddxxI98y8o
         JwaIoV2jsKF7yeIEt492h2ak26SPmymXDyB2jeXFaHUVkDADm48sLzjXAL0qI78khc8i
         hJWDfIe8aHRjRKwWjqLzW+llNKQ12Q9Q3N+Mdysl/hD+C1/ojknfP68dF2TEReZYYEHb
         Ly+42fPF0vOV6+R2yu1Wqxq6bFXQ05ZwtqNtml+zy0iQsu9zazhC8vMQ3XSCEvrcM6Y0
         wqOQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778128357; x=1778733157; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LxWRta8jVoFPg3bNy8jRRVGBdR1fKMJ1vsZZUxThcU=;
        b=WeO85adWbQWWTCFWYn+d1bIYR1UTKXNHbOwGntl+RCgiUwpbSp0dbDAInV+jnoaK6V
         TRzJvPB9vTtHfWHh5hxlh3wLd1y3kOi4ZFCezcA3HEEi5Kxy1EiLtw2LvH4MjFL/nGqU
         WplZqmbcOMTZfST4tyDwoWOp/G54Ep42FJ8B2u7oepi9vw+TeRLUu+fgvzqpSrG1ORDv
         gqsdxEDvgndq5vxu3y8UYth2erOLXlOEbjZBul0Lai5fOkls388vsutKHmWZj6VyvhKF
         DRp+M+Yuw8Cwej8lBHUkk82pV7UR8hkS5V7usS27BqndIC+wP0c3fY5lyFgbwenzSOMF
         NRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778128357; x=1778733157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LxWRta8jVoFPg3bNy8jRRVGBdR1fKMJ1vsZZUxThcU=;
        b=C17jlY9nK1cKb5cYczpzHlyTACbDICn3AmXDVOWmZMS2NdGYndBkqV/jpX26FjDK+E
         ilqDufi/fdGHh3m4Cwj+3SQLPpvICegT5ZDvZtdNd9qU24oMzwSEJ3JVuDNHgmj7UoWZ
         kaaNIr6v/8DeJj41TBjJv1BV5r2RqQgisQ1y03CwKcqSY+pUqlCPrxligNHC6f9Xwm0U
         NSW8XwQbRa3hjXrXp+ZMLPPG2Ve57PvBq21/QOjZo0rxRCl7znCr8vP+eyeF6seKjK64
         hDS9cKOOxd9YMB7EhMnPVgqA3/8hV/VvbMAnw9RLPyw6Hgy4f4nndqw9/SjCoJocb46o
         2Rvw==
X-Forwarded-Encrypted: i=1; AFNElJ+vRfFbSiIHJSI7sEe0b7IqzyrWmEBunjtERcIKTp0FurdUcG5abMZO9dy0GKWO5mpFEEN9ZXop@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz55OQmvoLn6SEpjyN6gK0aEs5UC0dc97DCavNZecXvEE+2FAc1
	rkTyBuzEIsh9fRyGdKbAbWPdxIlLDOYEiKCSACt8hi0nhZJdDqT9AXw50D/xGHI1j7KPJRQPpdj
	JVaIrIphNEldHPagHIFncqgnt9cDHBgc=
X-Gm-Gg: AeBDievQtHzE0HpKdIoqXWP70NNH6BD/QXClsLNoUVj1uuAX1rfmIvNQxpDm9rL6kV8
	xq9BtSGNVkcpOABeHbExgcLOwJSYnj28mYMLcyE+kYxnRz4MyLKZ5ON683E4pa56xrX32ldGANA
	5fw7h1L2+hIhJow/DCoTb8cl9BcFUT52LqY25h8Zz6BxYXm6t/iojYBRrM+5m4oH6PaXeEMfzvu
	qHUMLBLO2tjDXKFTJpBJffFdxQtUriejSrLnca4yyC2VfbwVifO4Dt6/BtHyCXX318myYBfsk1R
	NYcXUhh51Qwjok4KNg==
X-Received: by 2002:a05:6870:1708:b0:41c:9797:d1e6 with SMTP id
 586e51a60fabf-43526a897a0mr887878fac.14.1778128356742; Wed, 06 May 2026
 21:32:36 -0700 (PDT)
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
References: <20260429070650.28931-1-aladyshev22@gmail.com> <afrlSbCqDeLYb-Ps@vault.lan>
 <0198cd6c-dc28-4199-9f9a-6527064f3600@9elements.com>
In-Reply-To: <0198cd6c-dc28-4199-9f9a-6527064f3600@9elements.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Thu, 7 May 2026 07:32:26 +0300
X-Gm-Features: AVHnY4KtfhVzaFRc74PQFC42QbK6mLMSBhvgpPki1JICiGZAhIam23Eq7-JH-AY
Message-ID: <CACSj6VWpBRv_NOYb6Yv_-_shTzS6DjnwTgB6oStZA-Zne3R2rg@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.18] eeprom: ee1004: Fix build error
To: Tan Siewert <tan.siewert@9elements.com>
Cc: Johannes Truschnigg <johannes@truschnigg.info>, openbmc@lists.ozlabs.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think this is specifically an OpenBMC kernel problem.
I don't see this error neither in upstream Linux master
https://github.com/torvalds/linux/blob/master/drivers/misc/eeprom/ee1004.c#=
L341
nor in Linux 6.18
https://github.com/torvalds/linux/blob/v6.18/drivers/misc/eeprom/ee1004.c#L=
341

On Wed, May 6, 2026 at 6:30=E2=80=AFPM Tan Siewert <tan.siewert@9elements.c=
om> wrote:
>
> On 5/6/26 8:52 AM, Johannes Truschnigg wrote:
> > On Wed, Apr 29, 2026 at 10:06:47AM +0300, Konstantin Aladyshev wrote:
> >> Currently driver compilation fails because of the undeclared
> >> 'ee1004_groups' variable.
> >> [...]
> >> Fixes: 79d0df36b541 ("eeprom: ee1004: Add nvmem support")
> >
> > Ftr, this patch on (top of 80ec78d (6.18.26)) fixes building linux-aspe=
ed with
> > CONFIG_EEPROM_EE1004=3Dy configured for me, which has otherwise been br=
oken
> > since around October 2025.
> >
> > I recommend merging it :)
> >
>
> It'd be great if the patch could be sent to LKML and let it be
> backported to the upstream 6.18 LTS tree instead of having it only in
> the OpenBMC tree.
>
> To cite the kernel development doc [0]:
> "Submit your patch upstream. It doesn't need to be upstream, but it
> should be on it's way, and not have any unresolved design concerns."
>
> [0]
> https://github.com/openbmc/docs/blob/92b89c6ac71f8b94f67f508102704a1cf38e=
68cb/kernel-development.md?plain=3D1#L29
>
>         Tan

