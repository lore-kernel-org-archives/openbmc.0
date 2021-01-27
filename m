Return-Path: <SRS0=cMHj=G6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E08C433E0
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 22:54:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A15D464DD9
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 22:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A15D464DD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQzRp1p2QzDr3M
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 09:53:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cSCXWSrd; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQzQN2ScTzDqLt
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 09:52:42 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id 19so3539158qkh.3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4ZhNBUD0u5DJBG4ly7ufwubO9sCoxAyk8o+khDECHU=;
 b=cSCXWSrdy+xZzv0U6OHEGFb95Lb1/1VDK4BB5+7abiEeXxInCldxB6gOGWIiYIdRpY
 ycZNXP+8qL6s4G0eVkHqLKDPhF6WM1sUYZrS6Abaph+eXSkKfv9HC0QwyoIKDsGbkH4x
 ez84LqvWpr0qQUy58vmalEfGka1fmdDD6A0LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4ZhNBUD0u5DJBG4ly7ufwubO9sCoxAyk8o+khDECHU=;
 b=Ay4aazvzQWomGCTe1iczveBgUSKIQCBdyuTdWVqnF/m1LzB/goTPXs1Hi6aYTRqfXq
 xEADnRAML4Irs91+6TTLzEpu20aPFTcKVkxyb+HOQIc2p+sBKHF0MFPILacq60GHn/IP
 5em0cmFfT0csb8nkWqrVxOoPShsznf7hUS/Bn2jm+fgO+rMD7a0CINWqu3GPtZ8juuaQ
 v8HSIJ/0CeicBqF/4XnuzNvclkv9bzn7rlIig5N3ACuC6oAA0W5q9TIiXBJ2B95BYJ/Z
 Z7TT5Odvcem0d9gJE7lDvoTi4ER8hybojjwE7sCs4VRi/DHr9Jh/5B8nH1+2d3il49Hs
 nMaA==
X-Gm-Message-State: AOAM531Kd8WWOBAvvrMYb9QmOKOqI4zTa93492S7cKxHNU5apT1UKR+k
 5mvhq9bTT5gxaWXRPlKq9V/abb1Pl2ZpSDuSk4c=
X-Google-Smtp-Source: ABdhPJzJhNPWIqnmYES6roMbMkAOMbxm0PqpLjDcHmTE0sY6n8yLSJ9qA4TTSqITeN9PSwZ7x7OFE0L6rgiblzJCjpI=
X-Received: by 2002:a37:57c7:: with SMTP id
 l190mr12916224qkb.487.1611787958966; 
 Wed, 27 Jan 2021 14:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20210127070054.81719-1-joel@jms.id.au>
 <20210127070054.81719-7-joel@jms.id.au>
 <bcd01e55-03ee-a642-bf39-a633e23f647e@linux.vnet.ibm.com>
In-Reply-To: <bcd01e55-03ee-a642-bf39-a633e23f647e@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Jan 2021 22:52:26 +0000
Message-ID: <CACPK8Xd7XpnjtgTC9vvOYKP2hh-KUxpje5cPEOsrk+N74wR+VQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 6/6] config: ast2600:
 Reduce SPL image size
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 27 Jan 2021 at 19:46, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
> Hi Joel,
>
> On 1/27/2021 4:00 AM, Joel Stanley wrote:
> > This modifies some features of the SPL to ensure it fits in the 64KB
> > payload size.
> >
> > This set of options reduceds the binary size by 4760 bytes with GCC 10.
> typo here..
>
>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   configs/ast2600_openbmc_spl_emmc_defconfig | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> > index c55a70c5c1c9..345225131075 100644
> > --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> > +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> > @@ -2,8 +2,9 @@ CONFIG_ARM=y
> >   CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
> >   CONFIG_SYS_DCACHE_OFF=y
> >   CONFIG_POSITION_INDEPENDENT=y
> > -CONFIG_SPL_SYS_THUMB_BUILD=y
> Are we sure this is reducing the size? From the Kconfig file..
> "Thumb instruction set provides better code density"

This is a defconfing change only. We are still building with thumb;
check the output .config.

>
> >   CONFIG_SYS_THUMB_BUILD=y
> > +# CONFIG_SPL_USE_ARCH_MEMCPY is not set
> > +# CONFIG_SPL_USE_ARCH_MEMSET is not set
> Ack, sounds good.
>
> >   CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
> >   CONFIG_ARCH_ASPEED=y
> >   CONFIG_SYS_TEXT_BASE=0x10000
> > @@ -51,6 +52,8 @@ CONFIG_BOARD_EARLY_INIT_F=y
> >   CONFIG_SPL_SYS_MALLOC_SIMPLE=y
> >   CONFIG_SPL_STACK_R=y
> >   CONFIG_SPL_SEPARATE_BSS=y
> > +# CONFIG_TPL_BANNER_PRINT is not set
> Is this unrelated?

Yes, this can be dropped.

>
> > +CONFIG_SPL_FIT_IMAGE_TINY=y
> I am unsure about this one. I know that we *may* need that to
> secureboot, but we may loose good tracking of the image that
> was actually loaded in the fdt, which sounds like a desirable
> feature in secureboot scenarios, specially where we don't have
> a TPM for measurements.

I don't see any need in our design for updating the u-boot device tree
with any information from the SPL. If we have that requirement in the
future we can consider turning this code on.

>
> I'd put that low on the priority list (i.e., below the ymodem support)?
>
> >   CONFIG_SPL_DM_RESET=y
> >   CONFIG_SPL_RAM_SUPPORT=y
> >   CONFIG_SPL_RAM_DEVICE=y
> > @@ -130,6 +133,7 @@ CONFIG_SYSRESET=y
> >   CONFIG_WDT=y
> >   CONFIG_USE_TINY_PRINTF=y
> >   # CONFIG_REGEX is not set
> bikeshedding, but I'd recommend combining the necessary changes to make
> SPL fit the 64KB size in one patch, and enable the SPL signing in another
> patch in the same set, while leaving out unrelated / optional changes
> to another set.

ok.

>
> > +CONFIG_SPL_TINY_MEMSET=y
> ack
>
> >   CONFIG_TPM=y
> >   CONFIG_SPL_TPM=y
> >   # CONFIG_EFI_LOADER is not set
>
> Thanks,
>
>   -Klaus
>
> --
> Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
