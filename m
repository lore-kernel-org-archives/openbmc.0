Return-Path: <SRS0=mhbt=K5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D27AC47082
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 04:13:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF1761396
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF1761396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwXZ43JCZz303Q
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 14:13:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ALSkX+TZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ALSkX+TZ; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwXYZ60W3z2xv2;
 Thu,  3 Jun 2021 14:12:49 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id c124so4747627qkd.8;
 Wed, 02 Jun 2021 21:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSBVtEwjNJceUSW+ED54by5q0ntVhKU4EZfInF4XBmQ=;
 b=ALSkX+TZCWadbcLs53Y6oEcOcUob861l+3sMaf3bsrc7RQda1oexFXL8fGmiav0Xpi
 /ChK3KS/oFMr3CjNybg5mytdl91qRxUGZgvSeLuBQeM6IBSJhAUWrEGRlzNH5SnYxw1r
 0LdsgZUDyGu6tfUQcjHf8Su5QHoDTMOdCLx/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSBVtEwjNJceUSW+ED54by5q0ntVhKU4EZfInF4XBmQ=;
 b=QsIT8jdM5hTpLamDsT3awvsLHqLph5mNRTaFiyM9+7koLuURydQ6iozZeJLytQ/Jz1
 KNpGe8R2Ab9xrhRvEikJguyK2Vs3vRvTXNvRCloIPpS+HmArxqP9Sxdi4o/ZlC6VZ/Fz
 kiLI452582m0sdSQxIE2rviLoj2EQV7/k/tCX5GILZaXLOfn6ADzJG6Irrf+VlfoDgHb
 UL9vosAaOtLZH/jT72jFPUxZe3NyWSzgD1XpJ4kNokrtMBxgWTrTQ7tNMAraTzCd3DD5
 w6wN0zR7dy5ar9y5Tbd5IBNi8fW1/kSzecBSWmVelhepZqd0z2tpFV+r70v/fZeyTWPx
 IsSQ==
X-Gm-Message-State: AOAM532lSD11k11p5JdZlQ/e2HDm06WnRKiZ3PebHcuwM2O1m7yDva1V
 j3y0pphtLt0zQG2Uo87X0kPYf6U8wzz2J03oWmY=
X-Google-Smtp-Source: ABdhPJwTjlMS+8+L8BrVHX4Xf5NgGJL3RRe8WHEXPcfnogTmYIgrBQEd9Bnnz7jEgKwCaeeqz/0xBZ7xr0UxwDga/Og=
X-Received: by 2002:a37:e0f:: with SMTP id 15mr10333070qko.273.1622693565759; 
 Wed, 02 Jun 2021 21:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-3-steven_lee@aspeedtech.com>
 <CACRpkdZy0UwaJcYTiM9asVwNh4wuEYdMSrmqAPAiikbrvjtKpw@mail.gmail.com>
In-Reply-To: <CACRpkdZy0UwaJcYTiM9asVwNh4wuEYdMSrmqAPAiikbrvjtKpw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Jun 2021 04:12:33 +0000
Message-ID: <CACPK8XfbpCWx_ZOPuUy0QCT2N9kj9_+WGZv4wEPXgUUoVDf+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 27 May 2021 at 23:47, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> > AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> > Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> > SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
> >
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this patch through the Aspeed/ARM SoC tree.

Applied, thanks.
