Return-Path: <SRS0=CIyz=DG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DB4C4727C
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 12:29:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9D42083B
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 12:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PBObQnKC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9D42083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0zGs1bCbzDqN7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 22:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PBObQnKC; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0zBr1NQTzDq72
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 22:26:10 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id i26so14692946ejb.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ilnc9lRErTLGwRUB4HFPyYF6CW3YVVZPYLQOJap/2CY=;
 b=PBObQnKCeYlQmX+ppCXiidvlj5kZaNyn66HJEGKsSItxAJbS3f4GRWcCAoD/fkRc/s
 TCyYZiJLpvbCFtAmAQp56BNedoYF5SviUf6TDZOtFmEB5iFyseDoU2k91pwdPNLBwMUM
 cNWTZk/4coV1MHacUBz4iCe7YdfwSqWJDqB+fYEaWqAga/IvbqUfKXSIujqp4UaN+WjT
 I0FqzAqAph41GOCzuGS1/iqee7tzcDYPZHtGhUqmRvBBjiiVkyYvkPg+nbetpkpe1IRu
 Q1ByFC6ny7RLlg8hPDxQYEMMKGUIoh1uuIxaL8s/bBaqUngdWWBwNripByFqy5ha0xSV
 kJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilnc9lRErTLGwRUB4HFPyYF6CW3YVVZPYLQOJap/2CY=;
 b=pi2oe7lKsNKPgJDgArNpFRv9jO8WtM/ciVmq3R/MvmPGG8fbGIYL1UEIiY+jf3zgVu
 DGoqmYMBSDf71b3vvdcvMIkkf05EgXtE2/wM4BXMP6vUqHlLeQ36erpL+Ou5YU8JsvIS
 RBeAkUhIMi2ELr9APHeXaH1Bz6KLeHoGEufH+BZZKbK26YmqbzFKb3jHqKHOsh/gSFkq
 Y6MQeIq5ptGpQVlfoRF5/pc0hQ6AyoEvuydkNH+5U8YqgkFMIm6zp3OwLGevB3gLx2dm
 H08Z9sr88O2NMotSjZmvt0QnwhJFBAPkM5vQad+Yt7htQWqvxnms4HQ1Cb6hzZkAbxgU
 uIwg==
X-Gm-Message-State: AOAM5338KdHCSli27SzD61IErhpFSB+CqWHKpq1iDP9oubv3a2tCqnkZ
 KQQa8keHZJLPITX+2VxY5KD8wquZE5TMY3qqtjDxcw==
X-Google-Smtp-Source: ABdhPJyLuBCaI/z76rq/ffz504IdUDE9QfTuJtstdyt9uN0hf5yxvpSQvQ54/CYy2BsZ9vpzh9BTavQ+/5oaPPvIETw=
X-Received: by 2002:a17:906:c007:: with SMTP id e7mr894474ejz.55.1601382365730; 
 Tue, 29 Sep 2020 05:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 14:25:54 +0200
Message-ID: <CACRpkdaF7LaU_+4FrKGFYnKwLLe-iYkEzh4u3anv+16m6XUi4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: aspeed: AST2600 pinconf fixes
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

On Wed, Sep 9, 2020 at 1:43 PM Andrew Jeffery <andrew@aj.id.au> wrote:

> The AST2600 pinctrl driver was missing support for bias control on the 1.8V
> GPIO pins, and in the process of resolving that I discovered a couple of other
> bugs that are fixed in the first two patches of the series.

All 3 patches applied.

Yours,
Linus Walleij
