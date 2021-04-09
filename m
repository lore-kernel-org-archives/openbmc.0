Return-Path: <SRS0=MJyq=JG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70C7C433ED
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 04:08:25 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F71D610C8
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 04:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F71D610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGl3q5n6mz2yjS
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 14:08:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=etu1TFPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=etu1TFPp; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGl3L5Fg1z2yZ3;
 Fri,  9 Apr 2021 14:07:57 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id s2so3259940qtx.10;
 Thu, 08 Apr 2021 21:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6yyDCVy3mgN7UIfoc4Ica7qnzkHDt6TIUyqqtfM/zDo=;
 b=etu1TFPpik1av1/qSzQkkOdpkLUwlHQfWIufkgDSas80OORkeuUMA2SfOv6IMJsDBj
 D11FbakI/UtmiZUE3c2n6Y9I015razUdcPx+m/1QyUkoowcm1GLD4lgIiROIbQ+HVsbZ
 gIoYRGTc22RZDxmJ9TBzF22uLhbjo15pMflAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6yyDCVy3mgN7UIfoc4Ica7qnzkHDt6TIUyqqtfM/zDo=;
 b=I2fuqbcIUI5CoIYaGuoRLKB26cujNG5i6qcerHJE0N5aDy7hiBLSqhtu3K0FFt4RS6
 uuIoTzTQAsxirmUG7X43QLcW6H41JJkQFCidTD0vUqFbBWN0xBvseDkyaZ+aL6lR6rux
 XTxHet5b+z9HHeCYMfz6Cb0X03qLNXjWnhk3cnJAa1oqE1d7K8o/lxzismq91WCm9D1V
 8MLsygiMq63A/MS0UfTqmNB5PQucfuZg627ZzxJx8bLjyRKCs+E13yJEzEwBKQ/YkWO5
 P1mKaDM0t/haYRW3GlpsOKAY/42QQPkzRNKBH3Wa5YZh2xqKQbS0GsspBfSSmjymDD/7
 JSSg==
X-Gm-Message-State: AOAM533W3yzr6i4ijHU0YZ1HV5kZbvtn+Xj6RBWTN7EVaiKAmVZQZLYY
 9cZcSC10Bt+rFPN5aOSTBu5Uqgs1z+fESEirCL4=
X-Google-Smtp-Source: ABdhPJxL9rRQjeysZInGfbAHqF/7yTWuj4Sgw3/i2T+opVmkZocP5jOEO3AeeBapuqiz1ZJDZdAR+BRPln4hRFaqmtw=
X-Received: by 2002:ac8:4d1b:: with SMTP id w27mr5588742qtv.363.1617941274284; 
 Thu, 08 Apr 2021 21:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210319061952.145040-1-andrew@aj.id.au>
 <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
 <20210408121441.GG7166@minyard.net>
 <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
In-Reply-To: <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 04:07:41 +0000
Message-ID: <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>
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
Cc: devicetree <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 8 Apr 2021 at 23:47, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 8 Apr 2021, at 21:44, Corey Minyard wrote:
> > On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:

> > > > 1. It begins with patches 1-5 put together by Chia-Wei, which I've
> > > > rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
> > > > non-KCS LPC-related ASPEED device drivers in a way that enables the
> > > > SerIRQ patches at the end of the series. With Joel's review I'm hoping
> > > > these 5 can go through the aspeed tree, and that the rest can go through
> > > > the IPMI tree.

> > > >
> > > > Please review!
> > >
> > > Unfortunately the cover letter got detached from the rest of the series.
> > >
> > > Any chance you can take a look at the patches?
> >
> > There were some minor concerns that were unanswered, and there really
> > was no review by others for many of the patches.
>
> Right; I was planning to clean up the minor concerns once I'd received
> some more feedback. I could have done a better job of communicating
> that :)

I'll merge the first five through the aspeed tree this coming merge
window. We have acks from the relevant maintainers.

Arnd: would you prefer that this come as it's own pull request, or as
part of the device tree branch?

Andrew, Corey: once I've got my pull requests out I'll look at
reviewing the rest of the series. Perhaps it would pay to re-send that
hunk of patches Andrew with the nits fixed?

Cheers,

Joel
