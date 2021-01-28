Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D45C433E6
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 01:55:55 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B51460C40
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 01:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B51460C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3Th3dHSzDr0f
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 12:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=COSbH8Kk; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2JD1pSfzDq99
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:02:33 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id w20so783630qta.0
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 17:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=diMJ58KgsI4kodid8rkD24wJ61i9ikLZBdWOFpFM4tM=;
 b=COSbH8KkSCX8Tg4eR4A3VYWzVdn2JdtdDwcuu3iwOWNDzyPlaZKV9CoFv1r94ao1j0
 AHFGXYqL7H68LUi/xdZiyPTX6YbjL1nBdK2ZI0VZuXoLSqVEjoqxbvU5WHDt4/atO6Zd
 eM2pcGEBt2jTqPNuEtp7WuuuCM3hHG3CXxIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=diMJ58KgsI4kodid8rkD24wJ61i9ikLZBdWOFpFM4tM=;
 b=RTgKgqn6rGEincDRqNsB/0oKK9adfZf+dU2lFpe6/hRgItOJwAr2BNwpircCVHQeAV
 NZwdhQJCtSKVKtU/lfGQtVqOqxr9eJsa49aA6Mp9BAZi+Yj5Qu1SRH5dSuqLiT0xIJMI
 01GPMENZHmbp2sDEpgjfV4zKccoCknMu9UdjJWNHPWKNnrnLI6DQe7WezM2HwfxxgWO2
 hP9vxMlih4cH89QSBmj+l+r1WsiG+qoM9c/80FmxJ6c+l6f0BVsaaPDKEx8Tg0azCyGC
 lgZBS4SAGAOTVuT7adqpm5VvbJG82KzXU0nv8qgQnmA6Spg2sjum4Zikbe8k8Y8AS/kO
 kuoA==
X-Gm-Message-State: AOAM530Meepqj6QHzhwUoFmTWy7p9jfmFXS6xdkiFf14QNIIG2+/698O
 FiLmS3P9B9ac9L3erX2o683oj32yLgJFplMNgF8=
X-Google-Smtp-Source: ABdhPJyhxkwJPokGbcI8rJRAv00XlliytMpxIcLl2+P954gyGmxdLZZ8dskTBQPwYWtsp2WfskZGyYvVnn4D/unA1MQ=
X-Received: by 2002:ac8:5953:: with SMTP id 19mr12199316qtz.263.1611795747826; 
 Wed, 27 Jan 2021 17:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20210128001521.266883-1-joel@jms.id.au>
 <20210128001521.266883-2-joel@jms.id.au>
 <de16ec63-f233-451c-bc7d-89bbbfc46bb6@www.fastmail.com>
In-Reply-To: <de16ec63-f233-451c-bc7d-89bbbfc46bb6@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 01:02:16 +0000
Message-ID: <CACPK8Xex2O3XO_EnFz0KpT1mYQyP-bJ7gV+Mj3uFSXQqz=yMWA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/4] ast2600: Allow
 selection of SPL boot devices
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 28 Jan 2021 at 00:51, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 28 Jan 2021, at 10:45, Joel Stanley wrote:
> > The AST2600 SPL can boot from a number of sources, with or without the
> > AST2600 secure boot feature. It may be desirable to disable some of
> > these, so put them behind the defines for the drivers that are used.
> >
> > Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  arch/arm/mach-aspeed/ast2600/Kconfig    | 12 ++++++++++++
> >  arch/arm/mach-aspeed/ast2600/spl_boot.c |  9 +++++++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig
> > b/arch/arm/mach-aspeed/ast2600/Kconfig
> > index dd991e87c795..518f41b558d3 100644
> > --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> > +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> > @@ -53,6 +53,18 @@ config TARGET_SLT_AST2600
> >
> >  endchoice
> >
> > +config ASPEED_SECBOOT_BL2
> > +     bool "ASPEED secure boot BL2 support"
> > +     depends on ASPEED_AST2600
> > +     help
> > +       Enable ASPEED's "secboot" secure boot support for verifying
> > +       the SPL's playload ("BL2").
> > +
> > +       Enable this is if you're using secure boot support in the AST2600
> > (or similar)
> > +       to verify your u-boot proper.
> > +
> > +       Disable this is if you are using u-boot's vboot to verify u-boot.
> > +
> >  source "board/aspeed/evb_ast2600a0/Kconfig"
> >  source "board/aspeed/evb_ast2600a1/Kconfig"
> >  source "board/aspeed/ncsi_ast2600a0/Kconfig"
> > diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > index 58a22f646e08..98cf72bf440d 100644
> > --- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > +++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
> > @@ -42,6 +42,7 @@ static int aspeed_secboot_spl_ram_load_image(struct
> > spl_image_info *spl_image,
> >  }
> >  SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0,
> > ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);
>
> The orthogonal groups of MMC/RAM vs secure/not makes it hard to read :( But it
> looks like your IS_ENABLED(ASPEED_SECBOOT_BL2) #ifdef-ery has missed
> aspeed_secboot_spl_ram_load_image()?

Yeah, it could include that. I'll send a follow up once this series has gone in.

Cheers,

Joel
