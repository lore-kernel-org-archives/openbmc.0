Return-Path: <SRS0=Anrt=NX=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E87BC432BE
	for <openbmc@archiver.kernel.org>; Wed,  1 Sep 2021 07:05:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B989A6101A
	for <openbmc@archiver.kernel.org>; Wed,  1 Sep 2021 07:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B989A6101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzw6g1YxYz2yHV
	for <openbmc@archiver.kernel.org>; Wed,  1 Sep 2021 17:04:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SPJxPpuo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SPJxPpuo; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzw5m74c6z2xsK;
 Wed,  1 Sep 2021 17:04:10 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id w78so885743qkb.4;
 Wed, 01 Sep 2021 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwspnAUn7LZfXZcrhkHTYVy+rXA4pIPXL34zOpZGxK4=;
 b=SPJxPpuo/j9tEgD6ltzaqOx/sV+mchjODDAQBBJVbWHtCPMnHVru5zR64daWMyGhjE
 2RfVMPV+AUwK2AlphScysxTEgGXA2iBjO3OK1l/vard0PeJZKASUECGoW7fw3VkxTojy
 XuBZWU3nVo1ATczUZINa3oz+84TiBSLnJIloc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwspnAUn7LZfXZcrhkHTYVy+rXA4pIPXL34zOpZGxK4=;
 b=snFK+Q4+H/8QtTkgKyafQEwR2vPVn2NckpGh/tgYRL6v9gjJBPzpHxQKFt/I8gUV+e
 lophwK68ecyCNu746mkYyQbg99aViScLJXxud0JKDDBib1U4mvMcM2XFd9KPVjoMzVYw
 B+FmRn8eHOhIoMJgBul37rCHHczVXZvqeMujRSIA/fM7XJMOEdTOqMZ0vTFgurIwYdC1
 AuW1ey3puilBdNxtiUDfOJheO0XClYElsFIo+X/5M/I0PpZlfjjW+83pf3U9aVdQd0tG
 Q3D9j/leWy3u/JSbozA44njaERvU0KMJHMAXyJw1riChxj+yCsEjtJeZfyWxw7i7xqI+
 dqOw==
X-Gm-Message-State: AOAM53326ueZIVRzBx5C27M1LU682kaYI6Yd+1HBM6ubKgzOevIJxdX9
 buuU+g5iBx2iIIZxLUzQCI3Rdz1ADbgFMEwfa4A=
X-Google-Smtp-Source: ABdhPJwOjrH7Db3eOfeVdU/0wU7BzglfHksR1phlXCYSZeg1N7U+I8ZNr83Bo0XubUpL87Ew1JIdLl0xC2Tds7DPCVA=
X-Received: by 2002:a37:40d3:: with SMTP id n202mr7026774qka.357.1630479845711; 
 Wed, 01 Sep 2021 00:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Sep 2021 07:03:52 +0000
Message-ID: <CACPK8XfeU0+w03fgYxXVMVYOW-2woXQtUZ4FEDri3MSe+80_Wg@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm: aspeed: Add LPC uart routing support
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 John Wang <wangzhiqiang.bj@bytedance.com>, Lei YU <yulei.sh@bytedance.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 1 Sept 2021 at 06:22, Chia-Wei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Add LPC uart routing driver and the device tree nodes.

Thanks for submitting this driver. There are many parties who are
interested in this, so hopefully they can step forward and review.

Is this LPC UART routing, or UART routing in general? I know the
register to control the routing is hidden in the LPC space, but I
thought it was just general routing. I would drop the LPC part of the
name.

You also need to update the bindings document with the new compatible
string. Send a patch for
Documentation/devicetree/bindings/mfd/aspeed-lpc.txt.

Cheers,

Joel



>
> Chia-Wei Wang (2):
>   soc: aspeed: Add LPC UART routing support
>   ARM: dts: aspeed: Add uart routing to device tree
>
>  arch/arm/boot/dts/aspeed-g5.dtsi             |   6 +
>  arch/arm/boot/dts/aspeed-g6.dtsi             |   6 +
>  drivers/soc/aspeed/Kconfig                   |  11 +
>  drivers/soc/aspeed/Makefile                  |   9 +-
>  drivers/soc/aspeed/aspeed-lpc-uart-routing.c | 621 +++++++++++++++++++
>  5 files changed, 649 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/soc/aspeed/aspeed-lpc-uart-routing.c
>
> --
> 2.17.1
>
