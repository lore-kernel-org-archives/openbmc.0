Return-Path: <SRS0=MJyq=JG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110B3C433B4
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 03:37:37 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B4461177
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 03:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B4461177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkNH1bFLz3brL
	for <openbmc@archiver.kernel.org>; Fri,  9 Apr 2021 13:37:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Heia25Tg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Heia25Tg; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkMr26xFz2yhf;
 Fri,  9 Apr 2021 13:37:11 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id f12so3250533qtf.2;
 Thu, 08 Apr 2021 20:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8BgGBrR3Xwqw+MMg1YnlfMAUK+I10lyWE+xZkXB1ujs=;
 b=Heia25TgE2vtvJwk4Mye9wUNtKT4LCXFpu3RTd7Litn4l6XDwm58yNf5Xo72WKG1Cb
 Pnh29PYykNQ0Leb0AVytW69/DSGu2rRRdSyPucL7QrMDZjkSbhFQ0sXFxG9k3cGgza9V
 mXSNHoDmBuqB2Dq6N7NZp/gT1iFd9YrggQtWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8BgGBrR3Xwqw+MMg1YnlfMAUK+I10lyWE+xZkXB1ujs=;
 b=F3i13EYfNbyUTlqFNPxcP4CBTLUuJHcGtwGCtfrmSnm+ufnoRef4d6Jgh4ANJ51BkQ
 hR2FUKzUnpZJscSF6ZbhTzqhp2xJl7rlB0oSnkyoAc6ntPv4Ttfl7JucjkzXEY+ISDjt
 1jtejveEwJgrqFuwO9C/WXBcdJ5anSFHiwqQeY4p6Y0ExSpzUFz70MnZFejbAukeWifd
 hadNXnz9l5slxFfo9tGTBrTDJFXTRb2pXj8UzoyuJs+Qhdca3C+98YuJ1CyQ0eDAUzZG
 67aIOEor5xefO7solfSTosoN+NqFDdmN/1yoKjVRCWDNlplnXN+qIVPQvXLJZTtVFFVv
 +ZTA==
X-Gm-Message-State: AOAM533ree4UdZh8jxg2jPSb1EZA4bbgItDhxA4Ausm6mY6v8l3rI4oY
 ZkS6rjukFXUAksAoYzCJbdgy6A7JegLj1tKXNv9V42UMIas=
X-Google-Smtp-Source: ABdhPJxpEB1iiCw0U43cwWPFxVnBP2huZ7QxGaGC6NeOvjxLXRAa+ssU2jFErOgTTQKad2+gM3ZDkIo4Ri3biTi/Bas=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr10494309qta.135.1617939429154; 
 Thu, 08 Apr 2021 20:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-4-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 03:36:57 +0000
Message-ID: <CACPK8Xfre_HriZXa10GVRvzxM51_6jkxCrXi-Ofto6cCKcLw4g@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] pinctrl: aspeed-g5: Adapt to new LPC device tree
 layout
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
