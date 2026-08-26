Return-Path: <openbmc+bounces-2508-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8840BC5DF97
	for <openbmc@archiver.kernel.org>; Wed, 26 Aug 2026 23:47:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hVhBS6qllz2y32;
	Thu, 27 Aug 2026 09:46:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b12d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787731482;
	cv=pass; b=R9UlRXANZ78slno3UIlf/VRaw72xNsicW6FG0BA3OPADrEwV4D/OV3gyBgDElSs5P/4BsciHrGS2aglFFgJqSKusnOOAQGRBGk8eyzeNbWo7Do7QRd8ridMFztn6BeVSPG6A28qzqsf1cRisgpVjaotzscupZnaCsgW3eMoeSCG0OxqLUuaPBNMbAJc+wwCggrExhqcUHAhh1q9ybB+itiW6tCEb8tDWsT7aeLwzSHMcxJArY9n6OcyeGNoGkVPNWyHMWT/gz3UbN7tKTPrUWyWNOLSU3l1AVPj2/NS7NlbDE6nLSkoRKgAzpqKnLnbP2EO7Hs5YC3C6lgXdrV+4sg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787731482; c=relaxed/relaxed;
	bh=gljENqI22pecVC7PFj3mqQuHtHE6FZCK6uxJWQ0B0nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUZKrtdU57hNjcYGPHRFtKN8h4ce7h5j+noAebVjKWxojNLIv6MH+T9gDGe9wuhY8ISRPzojCWxdy+kiBZSwRBuYF3tp8+EKJIwURwnt4Pzesfl0ap37TEdra5Ay/1AAyh5ZaXVqwA/t/1Oj7t9JzwTT/oIKp9o0pU8GrM+ghP4s8PgGZBOAaEz2Yy8ShajGskW4HriLKK5ddCe9b0OoMh3FWLbyoumzt6GGxWq2qHbW/RX+aN91rjcQAotFwf5lbG9YRLOIMQk2QjCKwQSni0uuoO2dKANuep596h7I3fj9j25k6+A3OmlzaFj2ICGZcbgLN+HI5npL7GgbVJHs1g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O3NpGeCH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12d; helo=mail-yx1-xb12d.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O3NpGeCH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12d; helo=mail-yx1-xb12d.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12d.google.com (mail-yx1-xb12d.google.com [IPv6:2607:f8b0:4864:20::b12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hVHHY2wZRz2xLq
	for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2026 18:04:40 +1000 (AEST)
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-66d146f04cfso547939d50.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2026 01:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731477; cv=none;
        d=google.com; s=arc-20260327;
        b=CxwyYY/ysvujY40jNAmPKgXKz/0NHAG83NN4tgMR2jweKq9eyHFOSKzYgsjins8X5L
         ppIit4j1BiHApox0Al7bJKNwJsPvE8/aEdYRb15d5wlPsBoJbGY59eT0H8JRMTpwroRM
         FygSSpdmyee2xqvLdH4j8jPFjrOGPGENpKCzUuUOxXfPKD8qUO6parnNJ5lyU5v4wE5D
         6XKbfgaX5URH036Mq6A/bcF9H3Ewt2Q2jnSgpvwY2o8vZQnAd++/Sl7HfToI7JGDhouI
         GYrtZjiQGrQMVA6X86eJYNMtPEkdjKJD0PLHJrA6w60m74XwmpCDkFfVPWoKTUwNzha0
         pPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gljENqI22pecVC7PFj3mqQuHtHE6FZCK6uxJWQ0B0nc=;
        fh=BdSXJCPG6ucCtfo8AuU9Bk6ERXIsCffDiMjTDvw14b8=;
        b=ZwymSKGus9beqNwcZeqpJi1tRJYth0oSaTl+4J/TeYRjfgPSN1YxHhoIabl1hqDp1A
         2gQqaEgSWrEWmpsO+iS01yuJyC7MLurf1w36mOurbk5LOLAupPUD5RM0T5rW+rX/tnwy
         C6oKZ8e05CCT0pEuqRcWGfy+x4yX6DClAlesnV+8xBAGVOBFEAu6ffaIebHUA0gWOMVR
         zV0SGSTeDKU7YP4SPUbqUwNOTV+ELcOjlU+Gp76WpuJhmOJ6Gy5Gb3K6W8383TqNVFt6
         nHKo924IcQnqiWsU01/9Q8GVa4hXE6ZZVfTQo+dsLF92C0T9438aB1+Fai466Elk2xGq
         ywvQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731477; x=1788336277; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gljENqI22pecVC7PFj3mqQuHtHE6FZCK6uxJWQ0B0nc=;
        b=O3NpGeCHt2BOlV97O6sE63m2CX34qaWneUrutVM7yLF5jGEEVXg1f1fyLk9RYo32ke
         Z3INF1/WeHqmcPSLDpZsF8ZGphqBgcjIcxCUs6GrgeOPyktcJwEjUbUEvDlnG7ndJVZr
         97DgjMVLI9tWGPlacVfWq+MVmrI7k5iNthyvgRj9lAzCwUkkpwVFTuGWYn/PbsylC50s
         hKJ/El8QGkrXud9sthKMpeqw3fyB9Swfn37sIQvdr0NaHBbgY7EpO3hZuskjyzlS5A6s
         Ni9M8PcXlVqkGvFuZ7/MQ15L1kpHf2Y/m98okljzlily/JWnL4y02Q1v+cKHsx+NNSEJ
         RVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731477; x=1788336277;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gljENqI22pecVC7PFj3mqQuHtHE6FZCK6uxJWQ0B0nc=;
        b=c7c7bWAAjnmLuNVrnWFWGh12NhcP8w/0aEr+fwihu4hmYHvzjp0V0qkvQe6HG4DMcy
         mwcSAQeRqnx0EXtPOPgvbkE5QoGAF1KZfQvCZR5fV3Ue1/LtvT0YMGuaHr2q5Qqs+5Ig
         GHCj2ZFMFpZ55b8ByLL+K98rutYDEkW6mMiouTwrYAWRJAWnLlwh0LIwyV+SSg1g878Q
         ipNInNHDSbFQ3ztVXo8p8QdRiZAofgEJIrbTGJc4DIgbnDBdcXB8+qzcM8hihTLmDaI2
         SecOMQcno/y0FCOUqmum+TkbTU5gHAy1J+ugVzha266KSXf2odbNfYXuVbbFhsmDKO6I
         Wp4g==
X-Forwarded-Encrypted: i=1; AHgh+Rphu3Sqhv9pQrzFSNSlhm3BujMxu0LUEIxE7UsbWYK8CXXPfFOkVUB0kAI3ytsNrvaZTCwdCOnC@lists.ozlabs.org
X-Gm-Message-State: AFuF++muRAb5J0uNnnqU7jFxbL6DEZHWAopGEC5urvmKx2eaMxzasDw/
	CuCHVf6RkjqM1LJ/wfl/wx3/WsUoVm8G3wu/Sy5OsqcDoY2x8/oDzHA6yYESafAqOAeK2C4so2u
	trl0xCiW61h0m9T+Xses4k1A9Tohnweo=
X-Gm-Gg: AR+sD12nsuaSytrq9MIEdUP30oagnRTmZaTKzee5kYE5Js2rrzEL7B7+kNYmQUJvV3W
	bnDOr8LZ3lKeIPyyP8pI5NNtiZ3emn8fKCLrO4xd01xJ5Wxhd2EfFs3Robcseg0c58DeAlo2bl9
	HNmdNRtL3DXg7pgKgt6IIDhyMXW8YtdNNlMBSKQ2+zcRRAWMolw0J9jzr9CL7QqOvghSsEiuAl9
	dBeKPtaGYO1rAM+nRd+QrHC76fDY9MUXQt+K06B33R6l7wED15UIBmSyljFXPPCA/AYPCLtobq3
	LLvrIlWMOBbOyWlUjRLDvyp5D/x86UCsBeDLJ0eLHYTw5qU=
X-Received: by 2002:a53:ac9c:0:b0:668:9fa5:b9cc with SMTP id
 956f58d0204a3-66d2551013fmr1633452d50.0.1787731477460; Wed, 26 Aug 2026
 01:04:37 -0700 (PDT)
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
References: <20260808073748.2649808-1-lgs201920130244@gmail.com> <9e6142fb-bb69-459b-b7e7-4aaf2bbc3bc4@kernel.org>
In-Reply-To: <9e6142fb-bb69-459b-b7e7-4aaf2bbc3bc4@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:04:24 +0800
X-Gm-Features: AcwNN1WTArxH-Wd9ybxPgMiQ8kdpjWn5ZJku5MGMoyUD_P2LJqYmH3XojzLPzC0
Message-ID: <CANUHTR-Kqb+fw1EfPoD5W4SMYR6euBcy47jfGVYF0P0y7gfVtQ@mail.gmail.com>
Subject: Re: [PATCH] hwrng: npcm: fix usage_count leak when autosuspend_delay
 is negative
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Daniel Thompson <danielt@kernel.org>, 
	openbmc@lists.ozlabs.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:49, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 09:37, Guangshuo Li wrote:
> > npcm_rng_probe() calls pm_runtime_use_autosuspend(), but neither the
> > probe failure path nor npcm_rng_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> > probe failure and remove paths before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: c98429297d8b ("hwrng: npcm - add NPCM RNG driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo

