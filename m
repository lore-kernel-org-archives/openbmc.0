Return-Path: <SRS0=MPKj=HZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603EDC433E0
	for <openbmc@archiver.kernel.org>; Tue, 23 Feb 2021 22:31:57 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0766A61493
	for <openbmc@archiver.kernel.org>; Tue, 23 Feb 2021 22:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0766A61493
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlYgv3x2Pz3cGW
	for <openbmc@archiver.kernel.org>; Wed, 24 Feb 2021 09:31:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=t4xgPhOx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=t4xgPhOx; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlYgS2MY8z30HW
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2021 09:31:31 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id t9so2797377pjl.5
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 14:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1RzooZPZP1J4eGG1QIqaiAicm+Bu37ef5lc5yWEgH4=;
 b=t4xgPhOx/fSPdt9GfCu0R0De6/bDyWxmpEoRAnUJr3nOJHDifQWPwxokNt7mbELdv/
 bhXSf11bwUOi27tQcVlvVJPHO1IlOMaYoZugaRUA1LaNr3mDwYkdIZqTisVGAitkICPB
 SksJBCEwx31Zlzzx9qOeouKee4op1oBaHz6DunH3WeM4GcOaLffIiaxJ27Ae9+YfKPry
 MCb8qfSwnexxFOFNvhL1BV9lm+5yUsCqGRDaVHYeSjHKah5yInwLAxwbglzR9X7T/AN+
 uDOEaT977YBIAKlTyM5bpzHZabZwgUGEiJ5ZI/XtQJMq9u9AE+TZe7ellMGmv9G/Ixxn
 Fbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1RzooZPZP1J4eGG1QIqaiAicm+Bu37ef5lc5yWEgH4=;
 b=Nv41vRHd1mGhks6syVPzoVdoZQqQOFmJlSq6P2fSOBsb3V3gbPHM7DR8lJBUPBpFo+
 CrpJrXY2LZQVxzcX+krU0kbJISp6gM3/XfndgpNghJH9W4WbCejIeI1e3z6/RtpMGElH
 Uar/YNNtwMEeFFZQbJnEyy6nGgdT77KevBbufc85gTSKk4dcry2gUSOGIFetjM+5WqbY
 eDG0VI7SR9jmGFjeb3v9Pa3o/hodskqEaqgmJvD0t0pEdpj/VgFZUYem+Hu1MQ5GnwyZ
 mxS+ZUl8mdgQAEeUTFb1oyg9VLZv/EcUVZXe4hzLFvsOS1jaO4kzCHPVFkSdSrhsFojY
 d4fg==
X-Gm-Message-State: AOAM531iMe059tKQIrM5ftVzVAoQR76USCH2ITrqOkVV0f3QgVQ0IZGW
 0UfrQZXt6ZK+384YI8TbVRAzXZomUybLgU2p1FjZtw==
X-Google-Smtp-Source: ABdhPJz6AeMs16zm2xQVDtus3cuIEyeB5wTXLC2MGx6pelc1e0zKNRbFQm3TdaKPHwXT9D9EujJ0ZjjXUTabbAv7Wqg=
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr1079603pjb.20.1614119487708; 
 Tue, 23 Feb 2021 14:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
 <20210216182735.11639-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210216182735.11639-2-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 23 Feb 2021 14:31:16 -0800
Message-ID: <CAFd5g44agiB+d5_RuMmL7=exhzUt=aSMEWMEgEkbAZCgH0JbJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: aspeed: add transfer mode support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> Append bindings to support transfer mode.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
