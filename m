Return-Path: <SRS0=1wFR=KQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D82C433ED
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 00:11:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE516008E
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 00:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE516008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRqQ1MK0z3bsT
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 10:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XpCvTFvk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=dwaipayanray1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XpCvTFvk; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5Gg04sgz2xtk
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 20:15:37 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id m11so23693597lfg.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7aih/d9855v20nIT+U7ZGnplm0nKULD9g48GJ8t3Fc4=;
 b=XpCvTFvkUZMZKmbL0+fpxbM24MMpjQGwQ07dN2rzc30AXj0c5XvZ1pBV9QSbA8JqcI
 gwkWFlIv1LIZPKaMNrRqARFzk1OmiqW5eepN9euCwKdEE7qxc+pI7Vigf6EHLp4zmQEq
 WX4rYZZrZF3hM0Oze7xDsFHR0eXL/E1XJmzgJh0JCLS5I+cVheSdk7xTuXs4gQt5/jc3
 JH7W895ElWhxzggpWUs7DavKkRoY0s2X7F1kQzwCoYgTQnW9n2231qsmOH+2H9Zj4ntR
 865bwangq/WyEnQmb3UM4S2bgAIZmZymg9vfin94XCNryEASAnWtMGrWvFOuw/nsjHLr
 Ihmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7aih/d9855v20nIT+U7ZGnplm0nKULD9g48GJ8t3Fc4=;
 b=adLe9KB3Vt/AcgJqHqfXcw+79vSRd5Tzo+hutYVDhTNDR5UdUcQwCPJy/QT5JIMUnH
 Pyc2jhGuc9BFz+x4F75hLExnpFVpHpQItXYQfVAQdVkAnL+BPaEJ4E7hG8EZanLtU61E
 oEiWaXQMoWRCUSooaALqvhK3e0wABcyvQ0Fs3jxvKLGG9GplGmg38xwi/FBee8zYSlcG
 cuP37q+aMUe/93qMeIbOQ5SDfGDq0FKgqDb0yJzoD+DGJW3al+ElvroSFSLjcrCF79Vp
 ZV2A/suSCKjdC1HnXQDz9Fb9O9nhlyi9blae0h0j3li5txfQwe1orEi65CyQ7kjTdkAB
 um2g==
X-Gm-Message-State: AOAM5330e0iZoEld4QlAFO4sA3nNdxM6Yf0Ks4BgQ5sPirDGNfOd+O7I
 kuN2ILc0kH3x8X15pGxqkafXYhEYXNenee2ESnI=
X-Google-Smtp-Source: ABdhPJw1AXKmS8ULiIJu5WsnA6PZ5Cp6w5T/JRJQQHu8DK50jRaoxHpKcGlftGbj8SyvryF8zRNtnr7NI6fXZEuYJpQ=
X-Received: by 2002:ac2:4ed9:: with SMTP id p25mr2856096lfr.576.1621505733022; 
 Thu, 20 May 2021 03:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210520093949.511471-1-andrew@aj.id.au>
In-Reply-To: <20210520093949.511471-1-andrew@aj.id.au>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 20 May 2021 15:45:20 +0530
Message-ID: <CABJPP5DHgq2gA7K-PiWK6UTx7t8zLaFuz1LCt9eNZPBs3u+hKQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: Tweak BIT() macro include
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 May 2021 10:10:39 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, May 20, 2021 at 3:10 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").
>
> Since that commit BIT() has moved again into include/vdso/bits.h via
> commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
>
> I think the move to the vDSO header can be considered an implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Acked-by: Jiri Slaby <jirislaby@kernel.org>

Looks good to me. Thanks.

Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/dev-tools/checkpatch.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 51fed1bd72ec..59fcc9f627ea 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -472,7 +472,7 @@ Macros, Attributes and Symbols
>
>    **BIT_MACRO**
>      Defines like: 1 << <digit> could be BIT(digit).
> -    The BIT() macro is defined in include/linux/bitops.h::
> +    The BIT() macro is defined via include/linux/bits.h::
>
>        #define BIT(nr)         (1UL << (nr))
>
> --
> 2.30.2
>
