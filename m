Return-Path: <openbmc+bounces-2705-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4796CCA5FCE
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 10:19:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hyJQh6nGHz30TL;
	Sun, 04 Oct 2026 21:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b131" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791109148;
	cv=pass; b=AT0xVEnfEW9LaI5Tz+ZGKySNKpbH9BxGkm/YwWpI5qsQzKqEBQea7fAE6eGuK9N/AfeIL35H1o/CkDIvo1dnkWnetsoOHXUTiwuzjjaO5IqoFvWBfu9vNfUT9iDBWxSKtXaTZev21gfdRjS10E0smYxwvV8eLq3/BnxZCzzhpwAPB+8dly+UVjXymRWVP51rzgy3ulR6/WpAidbQPAjkw61AxAwsPitFLg59/dasFE4tet1Id0cHjjms8rU2+8TWjha9a5upglhHX2lcM0xKYKzNw06ajOrbT0/JKid1cXOZXK70KffVlZmDoo5HxbX1MOhPPIagvIugRqy3xjVNkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791109148; c=relaxed/relaxed;
	bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bMxsIXHgCD3w3CfA/hIwYFLRlTb7FaSqHcaOeujNxJtxSo3aI2iJN91RvRBTgWqEr8Nu3uvbuEDywYntOfivWyVxUP6V1kiQf5JV5TnE17wN0vaCIPg65ABPhV3fbcilIcM20z5cf6q3UgvCL6rbnAmN1lRbKs62pvgbBb5uJXUm7UTntQP65NsPOrSlif27D83/G5r4tltQM+IngUrrMBPKYA3COsRYYHWM3+y6gmsoJcwM4lW1VUJvtqAF0M40pJ41CQ9VrjFCN235L/zLDRbFATrs9uFQJNhjL2Kr8mlUHLYMErEQ90GTz93VDBKVWaJz+5m9yEZMnhN/U6MPzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GBAXvGok; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GBAXvGok;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com [IPv6:2607:f8b0:4864:20::b131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hyJQf5b3Hz30St
	for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 21:19:05 +1100 (AEDT)
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-677bf06de21so655789d50.3
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 03:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791109137; cv=none;
        d=google.com; s=arc-20260327;
        b=HBLcO7kWblAXtI35dc7sfdJr4U5BnfbsfRWHe5UzlD7NAz7MS1lQlAZUx8wqU8jLnu
         zNNHL/t6xbAVYykZjnXxE67oPH39TmDI/RpvTkHNnWIuPZovSKn1aWLbVzph9hjTavYD
         mc1W8gPrwFT/CrsOI/yzuNM/eudqnvYp1AujnOEnKv9MRKnSxF6aooApEFB69VGs3ccw
         lvSL1aLUO0EMr7dSd82m1mDwYJB3qh9KTbkEVZc7JW2mvD/4hkqWy9Pno9Wb2HE3LxzP
         cuN5XmzPTgVXei2XIjyZQ7eDc5OYblRZlnHyFW6ryjdEfEzU8jngZb7pzxkPovpTMFLd
         oc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
        fh=BrMyzOy8KjnQwhBPJMHo4Ouku/OONIj1tcGEGj/6R2U=;
        b=Ok40J1S2vvmsquHeiJR/24Qk4pXJw2Si4Yfh9OLmsUkqRNdgHM/m1owAA75FiaQtNv
         9cpFTEtvwSzxMsqcdMed+eK1607opYctxMbhJgMOIjxR8YEZsdzdHcPOxwsQtgPlNR+l
         Y3gQNbEeotuE5nl9TKU6UFtqu/nJnfIcaqs9iBeuucg7fm7thOrf69wOxY9tnipnmeg8
         OHfURPSnhtYsf43AABR0qZe76JwhvRQXqj3SUK2LReYoSjBLu5ofPawmCziGdeDQi1x1
         +7jb2BxkidvFHnaAdCcV/72f1mUrgiR/CbvFCg48K/uNrW14EDW368dj8L4nztMvAqK8
         Sbbg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109137; x=1791713937; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
        b=GBAXvGok3T6AQHxzvN0GGq+4sj388E5uWrCOs3cJJWYaa1NMgkRgZizCOJSUm0vKcQ
         O3c38AQsz26gYf3/8Iz5jOaqMmpoOLLHRgSjp64R9tvpng2hSUbKr2/NTpYEXzKeHK7p
         lX2eZdSrmzUYZ9wp9wFP/IWaZU+N/C9oMqcmZATTw/czbY2NFBZ7RAbqhhhftYxe81eW
         yg4VoU/2pl9FdOWPMeyo8ECQKfv1Muu7JQpuepK9I5lLeUvRWyhJJTzh/i40KtruAfiK
         t5PYrVjNa13YeVBoh3zt8HfnTHaNBFcI9kyXI0bn7a5cTd67cq1gyAUehqjW4UOpeDiI
         GZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109137; x=1791713937;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
        b=CGd+7keSMM2NE3iqy6nnbmRvxe+Q5LHzd63ygtcc/hEiE+nlo5rlpDFg9zhZpYx60j
         WRxuN7ktMdrYGvtfLWrtIPbu+tlX0B2FYzGHVzXOj+QGxNhcyfHZjECl5hg0gpYQO8k6
         l8RP9mq9ipJ8XiAb9nS+T62q7MFzC29f8srQNKmwR8cUhv/OGnz6ONGvVs6gx9+tUhqz
         9+NiOJHXmj8NIZY2SNUUkeNisMxmAQK1IwiKgoKi/fawvsjSY1q5hm//q8eQEPfQ7iDB
         hwUV8tZnZNVuh7Qbe4oW/R1uK+j4S49D25tDjLC/Q1qDApJAfktQxLv2bNMKEgl9RsYS
         igKw==
X-Forwarded-Encrypted: i=1; AKwUvByN1LSl8X5m/jbO3CiEUGyhUqENfD4QYOEfArbiXGSxl6zH0GjspyhCVBYGQyLKnenZjsp0x2Zx@lists.ozlabs.org
X-Gm-Message-State: AFq9FYLPkmCYw74aGzRPDRzPbQDIY+2qALCpYPoL6dUJEURgjQvzofOV
	dZd8m+tQ+JcMTqARQ/qPoUXf5nM2/Xj4TK1ikqJ3reAe22Fr9IvAzZBTNkPf1TKOEqYLEM7Ze0U
	2TVOtB83KplCKAGyNAm9NpRaxgBVCeVA=
X-Gm-Gg: AYBFou1uwc9gku4wS9yYLgV4ap2FxAYbGeDwxhg7fl6KH7pwcEXGyGFSlUMToNydaup
	vvLT2vip9A6PT0Kf5YmkUsIrl2/14KGBDKL46dbeEh4urhLHiQDha2XC4B0sJOcr81ZZrOczq6C
	5OHUqPPaJLnc1jmuumKoeOqSQVP3bp87JBQMdYYgPIgj2LXjiw/MjLI2hnm4vrLhEgpJtaYxPEv
	9E9opqcroV7Edv8ZgmVONbgCyC1P/P61B68xcNSzIHchvN1v5rngW7yraQH9VTVZi7Goknj7MHj
	qRC4nRB2zLbgLeApW6ZeeYE0+4QKg6D9ZnezLnWUx4wk7wrfP74ozMHkFjHjk8TzHzO/
X-Received: by 2002:a05:690c:e285:b0:8ac:805b:3a6e with SMTP id
 00721157ae682-8ae94ca3034mr9201637b3.25.1791109137685; Sun, 04 Oct 2026
 03:18:57 -0700 (PDT)
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
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sun, 4 Oct 2026 15:48:46 +0530
X-Gm-Features: AclHuK8uC53IfbueYoLt9cYxf1WxTPbz_S-0lUvFuzF6RUcIgmXBS_Cylz29aks
Message-ID: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
Subject: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I am investigating host power control on the ASRock Rack B650D4U,
which uses AST2600 GPIOP3 (GPIO123) as the host power output.

Vendor firmware enables SCU4BC bits 27:26 (the existing THRU1
function) around the host power pulse:

  SCU4BC: 0x02000000 -> 0x0e000000
  changed bits: 27:26
  GPIO123: high -> short low pulse -> high

The upstream THRU1 pinctrl group claims GPIOP2/P3, so selecting it
statically prevents x86-power-control from requesting GPIO122/123.
Without THRU1, x86-power-control can pulse GPIO123, but the host power
circuit does not respond.

What is the preferred upstream representation for an AST2600
GPIO pass-through pair that must remain controllable through gpiolib?
Would a generic Aspeed pinctrl/GPIO extension be appropriate, with a
documented DT property identifying the pass-through pair?

I am not proposing a board-specific sysfs interface or direct userspace
SCU register access. I would appreciate guidance on the correct kernel
ownership and pinctrl model before preparing an implementation.

Regards,
Prasanth Kumar Padarthi

