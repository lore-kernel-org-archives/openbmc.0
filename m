Return-Path: <SRS0=CIyz=DG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D34C4727F
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 12:43:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B50A2083B
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 12:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z1MHUjfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B50A2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0zZq5lV1zDqTd
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 22:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=z1MHUjfG; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0zV832GrzDqNP
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 22:39:27 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id u8so5348675lff.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pO3zqsQYI2N/eYjowpxSiobXk5D5lO4UhUmAmNb1cfA=;
 b=z1MHUjfGRzU82Dtosh2a8opmMrq1Eg71HqIxEIq6S2Oeuu/nsS6zdTyTtExJ79csrj
 Hd5OjTMiUyFNiqAa6fiiQ7jrBG7t62SQ4kdaSZSh0Ahc8eJ08HqghIswg+N8FK7A3+LU
 NlAJQZ8H29Z6/LqvcgqimfZKahDzN2b9FvaiyKY/M5NKqL1cBCmuaYunJk4uqxKpFFUd
 QVYGkiFbTiXZle/0YxBFdH754wluYB3EDid1vcbqmTvWKh02vstPT9ydsSh6wyiGErXm
 dJ77L067lcfMDTKYcSEpYfoJjyVKxs9UE40ag7Clnf/Xrb/ApF7BLWRi0Gp9mdTHuMIe
 6Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pO3zqsQYI2N/eYjowpxSiobXk5D5lO4UhUmAmNb1cfA=;
 b=XMEjvqUIKHgiy2gSyMuNIAIJ1fiNhDVuPEkjUFFKbBOMqGByjhBIvVEifdPTTpx+Cd
 DkUA/VyDxC4Hiyh3JGB7mCQzbn6JMJBSb4JNnVzilPhJAJBUBtTake1YEk5TBVz8VOkG
 HXYiNUsCmT3/Rf+84avRFbZKyClRkygIlWOZpdrNgRWLntOpa6Ck3/z30YNF0Gl5o8NV
 m0eP8I0MCFDbAZ5aNHIPHjAS38qCrD10nqHUCiaXQRHGO/V4PStvdM4DeZUv0bmrXue0
 JUMtpMlHzWPcoYJId6w7dMTUS8p5roxxc6uAtWhHWghQ+GUYUHncu6q+cf9aDEKDHClj
 opEA==
X-Gm-Message-State: AOAM532boJxvyunUZP+ue6mQfcRwkJkD1m3XvHEGL0xAEc+TZrZI0SK7
 Io960q1+tXi10V63l44i46WsKry5OKDF87NH/vR8qA==
X-Google-Smtp-Source: ABdhPJzm7gNVSpq1WdNCNfqImJcd5pprrHt5u1gKhkFTU0RbDTB5uGa1psjLfZ+O81pjELct2ciXh3fSJYmXc0pB6gs=
X-Received: by 2002:a05:6512:20c3:: with SMTP id
 u3mr1054711lfr.572.1601383161918; 
 Tue, 29 Sep 2020 05:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200910025631.2996342-1-andrew@aj.id.au>
In-Reply-To: <20200910025631.2996342-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 14:39:10 +0200
Message-ID: <CACRpkdaqtcPsinURk88GFYyPcDr2SdoRXWUCHMMn2cQtbBYyog@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: aspeed: AST2600 pinconf fixes
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
Cc: Johnny Huang <johnny_huang@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 4:57 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The AST2600 pinctrl driver was missing support for bias control on the 1.8V
> GPIO pins, and in the process of resolving that I discovered a couple of other
> bugs that are fixed in the first two patches of the series.
>
> v2 Tweaks some of the debug output and adds Joel's Reviewed-by tags.

Applied this v2 instead of v1.

Thanks!
Linus Walleij
