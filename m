Return-Path: <openbmc+bounces-1828-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B04F433CD
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 00:01:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwyqB1nS0z302K;
	Thu, 16 Apr 2026 10:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::232" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776168687;
	cv=pass; b=Uy2aV8TBVmgnnQwtSrTKDLHG6cyDyDBcOc8p+0O2WOOKwEXF+3tWwlELHab3pa5OmR75wDSHrn90u1P+VaCw8vN3SCjen/xGVOK3CCoLFywikloMtpjyOR00MHE2F6aVgXPkmFKabtOy3juTiqGAUiteRo/BkMmIQAHIgKheYZvKCjxOixog3EWhiKBoxZPoz/86eUvcAV+MOHW/8p9ofF/bEsrmTVFK7a277hgzxN210VnDH45EtgYO2Vndt/16YwIbNyzXYWgjhRZP2aWSbCMAZCavjJHEeaORh5AjP1lAJn6IL+4DCbxI06izZSAUtM9i/j+D0LCfo7dk/cCvIA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776168687; c=relaxed/relaxed;
	bh=vMS4QV4cs3UTdyfk4y1tazZ2iZR/VzeUPa/I+j7yXak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLxfX/7N/1GC5Wop15e1J/g03mei1RNjptIeFOJne/xDEmUP6sIBbZiVaPrPir1Zc2xRa/5AI3xsOhaEtwBVN82d0pFbFMkSkPVbfIiKc674g/K1XRe27pEcuFazR3pAGRxjt1j5Jz3WX2hkiBzdXA57IUcCGESA7rNEE80Lvm4xaQR4+Ywpa3q7uOkj9wbFRSPp9IEsC3jrQW5ttTjcF4Z33XNPdgKpOfdwb5V8xeKOGDHlTlc6+MdTCQ3lO3SE3c+tVSx560Aa8iytOf6mNrxnOHfh8JPLgWJQfm/S1U1k++3H6ccIXXt/FloZNh86qU/NhmEDJU+Fef9+EwTn8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R9ZoHfJy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R9ZoHfJy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=devnexen@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fw3670Q7Rz2ySS
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 22:11:26 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4670676ba03so1793173b6e.1
        for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 05:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776168683; cv=none;
        d=google.com; s=arc-20240605;
        b=Jrk9RkQK1OnyoIs1yJ1nW675PQqGKVAL8dorwnYm4VLIt4oWjZJFsTOpDhJDL5fBbD
         pg+utEBRTTmoVXbccHG0GZX0wxn2x2j4czpuLu49u+5sq6nProPez8PiBGSlfjiYJCW4
         iNYnnFdCsz/AMqjP3+go4pptw9vNSw/TQzyZJ3cuj11/YFY8tGg+cpPOsyUFfI/REFD1
         VnOHxAY35TXTAnnWccr6T1i0E4BOC2d1h0zi8aX956ybCXnieaURXCh/G7Bi3sNFWdmm
         xyyXWbl69MPTcWejpTyD9Los8IF5YfSDs/oIW8HGOZrbCUDeM+1WI2qosPj3sjoZmjWm
         2y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vMS4QV4cs3UTdyfk4y1tazZ2iZR/VzeUPa/I+j7yXak=;
        fh=AYWoCJ8ZdZSVV9tP1W7/Q2dRd8fAlH75RQcWMQvSwiU=;
        b=OIqu08GEo3r209L/ecUE4aiVvKBgsMCqr1VnqpfU03++zPoYKHDDInWUrClr07BFmm
         Or/6YR/AU+QaTXr2uXHmCPCTGTU+56nrs5vXo77kP1T9g+k36mWgjl2XyZCmxQyxyvE8
         bII97U8n9X5rGIKYnaR6NtDn7xKmCe5SI4vFqBMxpghlC1JDH2q791NYSdKf+D+ufTCX
         ySK+G1Qy4uJRcmPQkGB5X4pN/JYnbeLRH1PrlcFK4Op1geppnjhjeQlQgNxDMQoNwxNh
         KFq4PSx1gHKI9TAkjUvnBVjJrDEZohZR/+qgG0To+GI8kEI3+M3r1WBgsniDzcLA/edx
         fRXg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776168683; x=1776773483; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMS4QV4cs3UTdyfk4y1tazZ2iZR/VzeUPa/I+j7yXak=;
        b=R9ZoHfJymZVaZ59GqlNy/75HxoTzc+gcQkHBTPABP7Oceqg+WXQcOjSvKjVDCB2nE0
         av+mSO7IaD7GDc1hQTkm68CMb320PokQ72nuQiuxIZ/m/P+goJUoEmUDDUTnjgAvGkKb
         ykFUSFfkVEFfjsnb1mcwa+Qzdi8OXVcgo5CYrzz8RxReJSzyjwHJ+SAcBFELcVkqDXRJ
         W1bVObPyYnRsLBZk+oYsF6RMyqzrl3iM7M+BQJ9FRSOzfkYjOBDXMyFV0qRV117WyXlH
         Jqq8lXcSlsolZV8MS1wNY9Bk4GqmX57uPUs/uqV1LEdrkoTyzdI3hKZLYAFuPV5DZcdN
         q8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776168683; x=1776773483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMS4QV4cs3UTdyfk4y1tazZ2iZR/VzeUPa/I+j7yXak=;
        b=KqfGGAyPTYZ0RuiXJXacYpShLKtX8oBFhIAncQarbXW+KV6rDd9t2YZdcQ3BfScbPo
         ikrZfLAdhvCdEjoi5DokeZqqem6ZLRbGwLm8WpD22mG+Pkcq9Avwum0+vU+l9byYZMPo
         LIAUI9Bv/iHfR6S0hjXGcULLj7WfxxUm6/CrcUDV8uGycvAic5Egzt/cXwruyYKKnt8+
         ZIyn9f3yK2e69GjmP3q9st4xT6Kwvy3pAhb2kZE6ZrAah4OEk9g42K6s/rVF0qZZ5xcG
         u+PmEOKL+16MEhczYj8rip2YRGcPM1G/xycBPFHqLAzZQqDKfLpeKJGIIwomlZOeSE4F
         QpVA==
X-Forwarded-Encrypted: i=1; AFNElJ9Lda8t5qBQVQdyIPJ/ERWVOJ5lnpV4PGk4tEaHLWfkjqwLup0bwZMYxtpy815selpJ+tAblmRt@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMbpb70yE87f7YVhz6AeH1Jm+tWAToq2CuERDPl3HpKzOXyqeG
	PrnMMtojc5kenjqKx70UOfD1r0RJk0YhFKpv7f96Jd/UasC/yTF6iYf7j1azwCfiYm/hIvJlR2V
	qh1z7kx56gx0gQQNve0VKKiYQZfmGAWQ=
X-Gm-Gg: AeBDiese27nqsv8Kh2C6hhYkuhPAtioigFwVAGoEeYcFt3ASh5hOPlgHr2ssDPJ9U3s
	3G1glixYwliDIXM0xIzLkXywkqDv95HcTFp6fCUZvyf5oRfe371T9t7F049AhzzKevsikrdEDlS
	/qxFfC7EG7Xe8Vk7teGwKs5jFp5uZwMPcdupWizXpYYsWEkw6G1N+hVwQFWTpyknzQUcx9CE8Lp
	GLELzXqHFyVcwq7OEu4t1ePQZ63MHEjj1UlU+Dxr97vRyAPbbj8mL3fDk5KHuz5nMkWyL212AKt
	9drv6bEnTZsR73hyIASEupU6xQaJPrHIh8y0Dg==
X-Received: by 2002:a05:6808:2006:20b0:479:3f61:ef98 with SMTP id
 5614622812f47-4793f61f889mr3626813b6e.2.1776168678853; Tue, 14 Apr 2026
 05:11:18 -0700 (PDT)
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
References: <20260414095929.11257-1-devnexen@gmail.com> <ad4unjKuC6Ff_yse@ashevche-desk.local>
In-Reply-To: <ad4unjKuC6Ff_yse@ashevche-desk.local>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 14 Apr 2026 13:11:07 +0100
X-Gm-Features: AQROBzDfj0XwBqswteHJSS4t3C5iOmGO9MtqXStcn35i-bOXhczIpRLis_L3E5k
Message-ID: <CA+XhMqwuhte0j2iO-NYVrjV+qQKcuiDY5qAD9+oCLkRqEhwKSA@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: npcm: fix unbalanced clk_disable_unprepare()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 13:10, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Apr 14, 2026 at 10:59:29AM +0100, David Carlier wrote:
> > The driver acquired the ADC clock with devm_clk_get() and read its
> > rate, but never called clk_prepare_enable(). The probe error path and
> > npcm_adc_remove() both called clk_disable_unprepare() unconditionally,
> > causing the clk framework's enable/prepare counts to underflow on
> > probe failure or module unbind.
> >
> > The issue went unnoticed because NPCM BMC firmware leaves the ADC
> > clock enabled at boot, so the driver happened to work in practice.
> >
> > Switch to devm_clk_get_enabled() so the clock is properly enabled
> > during probe and automatically released by the device-managed
> > cleanup, and drop the now-redundant clk_disable_unprepare() from
> > both the probe error path and remove().
>
> Also need to mention the message drop here.
>
> "While at it, drop the duplicate error message on ..."
>
> > Fixes: 9bf85fbc9d8f ("iio: adc: add NPCM ADC driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> > v2: drop redundant dev_err() on devm_request_irq() failure since the
> >     IRQ core already logs it, and remove the now-single-statement
> >     braces (Andy Shevchenko).
>
> ...
>
> >               if (PTR_ERR(info->vref) != -ENODEV) {
> >                       ret = PTR_ERR(info->vref);
> > -                     goto err_disable_clk;
> > +                     return ret;
>
> Now it's simply
>


ah yes true true :)

>                         return PTR_ERR(info->vref);
>
> >               }
>
> ...
>
> With those two being addressed, feel free to add
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

