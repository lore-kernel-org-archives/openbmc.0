Return-Path: <SRS0=S/TR=ML=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2C3C636CA
	for <openbmc@archiver.kernel.org>; Mon, 19 Jul 2021 00:22:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F38861009
	for <openbmc@archiver.kernel.org>; Mon, 19 Jul 2021 00:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F38861009
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSjG10JTzz304R
	for <openbmc@archiver.kernel.org>; Mon, 19 Jul 2021 10:22:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XjSJFoqH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XjSJFoqH; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSjFW2tz2z2xZ3;
 Mon, 19 Jul 2021 10:21:35 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d1so11865673qto.4;
 Sun, 18 Jul 2021 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQlb32Xcquwq5O+moyXyr2cv7lcEnQc7zGUkRIGd6qw=;
 b=XjSJFoqHF0w+1N19d1VBtut4ASDUGdWnCcgVzyOcOyCyAanXzijpNIjLnjhGUlgNQw
 OgrEC/BETKGVv+TtHupXHvabK276D3kPZN1ycV8WW0Ulj4IfXYsPtPjV4btws7bgUBQF
 j2/RygvPCJ5lhFpqdtvwO5eb/a3pnfCZOp+tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQlb32Xcquwq5O+moyXyr2cv7lcEnQc7zGUkRIGd6qw=;
 b=ix4rRsyvPfJHhZvgRq1eXMTaE1IzzVxg/Jjcew11ittIqIGSbhLiwX6C1C0VtD859Q
 u3sP4D//Y9p8BtCQFHkkShaETM8s6uMDH+steVmx6/VaL3HH4k808AZEdOgyGdkg5SV5
 dAfeAPGp7ghz/EDlb4Uu1u4leht93/Y2MJ9CK1nDEcEoswJIqip70rFCH9gpHrgGc5o6
 7ROhuwu6d20H1wRGettqRiEbnxHrhQHt4vhhsUyFQNXBDMC7CM4ch2r+GDpTP6X6JNuW
 pXlqAVO4BSC21vH5Bx3ugZp5m4gFu0eG9U73XQiQtaxmq/RSu6tJuv4OzM0k4CFCml5b
 xNGQ==
X-Gm-Message-State: AOAM533sL22UPfezN7+WY77bESvrOsiARqXnsLLH/uN84MJHuzDivsmP
 UTi25jK0wlwN2cS/wJ8FFdALpq7yD6Uuv2d5aD8=
X-Google-Smtp-Source: ABdhPJy5BjlQeNvPbsdNVhod51JfFEBvP1NOYo9hOCh8Hus/j5w8WhmKY/FRufZ1Eem2lbZkDxk71TMaz/9zC6gebsE=
X-Received: by 2002:ac8:514d:: with SMTP id h13mr19795975qtn.176.1626654091899; 
 Sun, 18 Jul 2021 17:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210719001724.6410-1-rentao.bupt@gmail.com>
In-Reply-To: <20210719001724.6410-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Jul 2021 00:21:20 +0000
Message-ID: <CACPK8Xdgp50KbVvhSbhrwUiTB6MJ5PoBzV9n18ubZAAOprOGiw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Enable ADC for wedge100 BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 19 Jul 2021 at 00:17, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> The patch series enables ADC for Facebook Wedge100 BMC platform.
>
> Patch #1 enables ADC in Facebook AST2400 common dtsi because ADC is used
> on all the Facebook AST2400 Network BMC platforms.
>
> Patch #2 removes the redundant ADC entry from Wedge40 dts.
>
> Patch #3 removes the redundant ADC entry from Galaxy100 dts.
>
> Patch #4 enables the ADC voltage sensoring channels in Wedge100 dts.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Tao, I will apply these for v5.15.
