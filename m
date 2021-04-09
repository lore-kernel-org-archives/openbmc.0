Return-Path: <SRS0=MJyq=JG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9ABC43461
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 04:38:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B941061106
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 04:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B941061106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGlkJ0QRLz3c1R
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 14:38:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YjyyoqLa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=YjyyoqLa; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGljq2yqNz2yS0
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 14:37:51 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id c4so4699415qkg.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Apr 2021 21:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HGWn++Wqm+IbcEB8+bOET7BZgu8FprdT5nb/lQPUSxE=;
 b=YjyyoqLaTXyj1y6oqpotLYvBmx2AxeJYhiskbd0RBUgzZwuFLGVvmYZim48ovbIoFy
 JTJDSrrIcBfdcXnC5sjo4s8HmwxNvkwtdmiWgnPmsnvTGDqeMRBsv5faVl7GMM1PeyYA
 lcKFlvxaiBiCphrnZwlxsPFH0pahFa0MkKjzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HGWn++Wqm+IbcEB8+bOET7BZgu8FprdT5nb/lQPUSxE=;
 b=ZiHkqjAGbbvUm9kvPpHyJo6M8hrlR/Kg2rDeawGw7HskHFsfXOa3EeMLLMlrjrmZgz
 J6/gpoeKokO9NUOc5J41V4JQVdH4m0KUkNRDYmZnKWuB84ui1ZGO5PL8OeHrlFz3jamK
 nSxXda+0lMomT+YAYx5isLunkUhLOQp4LCgOOOaL6nQNEQyp0ufNUzKyKDyCS2rSZdhx
 fn8J+PofaB82fU6wwtlY2LvqjUKFqMrJoLblw0tp81Tbjc/L72J+m5SmOUYmM5geLiny
 awt6VDNw90Vaobe6eQRlI22aEPg8WsEUf2VFNPwDAWZO2XNtpPlaMh4HFz4xEzoGfOof
 hpPA==
X-Gm-Message-State: AOAM533FBUgdFoSvz/52EUtOYVXFxfXrIA/UOKI8tSYMWXxhtE1WqWyu
 OsyuuYP8EuMBXoM/vJCjit44z+xxUcQAHz14BhY=
X-Google-Smtp-Source: ABdhPJwH0HNJo1gVVxx5R8dLODfUf7/t7vsJbCGCK7+GhFbFudJi/yprSO2/SZQI2lgV5ITrwiHORHI3seB00X76ZBw=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12159214qki.487.1617943067553; 
 Thu, 08 Apr 2021 21:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
 <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
 <YGzZofPvT80b5gS5@latitude>
In-Reply-To: <YGzZofPvT80b5gS5@latitude>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 04:37:34 +0000
Message-ID: <CACPK8XdbwbsbJuZmvsFqJ+x5viu652vpfR1kwB4Gu+khRHNt_g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Initial support for Nuvoton WPCM450 BMC SoC
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: DTML <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 6 Apr 2021 at 21:59, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t> wrote:
>
> On Tue, Apr 06, 2021 at 05:15:01PM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 6, 2021 at 2:09 PM Jonathan Neusch=C3=A4fer
> > <j.neuschaefer@gmx.net> wrote:
> > >
> > > This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's =
an older
> > > SoC but still commonly found on eBay, mostly in Supermicro X9 server =
boards.
> > >
> > > Third-party documentation is available at: https://github.com/neuscha=
efer/wpcm450/wiki
> > >
> > > Patches 1-4 add devicetree bindings for the WPCM450 SoC and its vario=
us parts.
> > > Patches 5-7 add arch and driver support. Patches 8 and 9 add a device=
tree for
> > > the SoC and a board based on it. Patch 10 finally updates the MAINTAI=
NERS file.
> > >
> > > Patch 2 requires "dt-bindings: arm: Convert nuvoton,npcm750 binding t=
o YAML"
> > > (https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@g=
mx.net/)
> >
> > Hi Jonathan,
> >
> > It appears these patches are doing roughly the right thing, and we may =
still
> > be able to get them into v5.13, but I'm not sure what your plan for mai=
ntaining
> > them is. The two options are that you either send your patches to be pi=
cked up
> > by Joel, or you send everything directly to soc@kernel.org once it's fu=
lly
> > reviewed.
>
> The route via Joel sounds alright with me. I've Cc'd him on this version
> of the series.

I've had a look at the series and it looks good to me:

Reviewed-by: Joel Stanley <joel@jms.id.au>

Nice work Jonathan.

I'll put this in it's own branch along with the bindings change it
depends on and send a pull request to Arnd for v5.13.

Cheers,

Joel
