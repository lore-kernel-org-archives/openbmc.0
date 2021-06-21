Return-Path: <SRS0=c7Hd=LP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C3BC48BE5
	for <openbmc@archiver.kernel.org>; Mon, 21 Jun 2021 06:19:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD176100B
	for <openbmc@archiver.kernel.org>; Mon, 21 Jun 2021 06:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD176100B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7fW86wLDz301K
	for <openbmc@archiver.kernel.org>; Mon, 21 Jun 2021 16:19:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OZ8bhwkU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OZ8bhwkU; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7fVg6ycBz2yXH
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 16:18:51 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d9so3188595qtx.8
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jun 2021 23:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1V0M6KNLKNuRMx5y3q3UwkRgQPKuTOVPlgtgjv8nW4=;
 b=OZ8bhwkUlbbH/9cDAwC2CoRdO15gXQTIJyv4IP3fYF2Jccen8L8juRvzwEvsaD2g/y
 7Lhm78F2yRCXQqCvcy5+Pm0v9jXLAMJSG32GxecEq/B9IyAsRz2zoweoskrnyjaKx+Y8
 fVXnt6k8waI8ElOYmxnLgxO4M3Tj+ZqWo4/C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1V0M6KNLKNuRMx5y3q3UwkRgQPKuTOVPlgtgjv8nW4=;
 b=DZkK+MHKax6cxREiRWwJtI3AYjtQssdFt0URfEiN5ry99zMjIcJR82LTAUfrWmf85T
 T+beWY5Rba8xIR4Qjml3K4nb4teyuejLUFP709YdzhQ6vBlc6fBYLZbd90RM2KhuZVSz
 TnUEcLMafoUp0n8DGdUT9p2GtCTzPGDEGzw15/e4oj9OT34eYldyVHFPGGmlzbBlmHlE
 ya5CIs8xXuv4Uk4CVzoXQsjyNZw9PR9gioHiDr5rAxCBatSb9XXWHhgTwhsIIH4BZ8gU
 MLHVHwAC8xEZAygkYjOPomH2lAtHarNZTOEbPoCt5Lmk1T9ZQW0O47qyHCjEaBZkmeXm
 /GOQ==
X-Gm-Message-State: AOAM530taM17PNSc+zP6eQZW1Fjs2xTyVVi2f5s6Fgq0K9qx7GCMpvs1
 YmO3v6e/myD6tPTLn1VURdpa7Ls0PfyBrLH2Avk=
X-Google-Smtp-Source: ABdhPJzzU+wkhm2d30RIxnIH4MOXrXrOnBt9M0Ggpexg5mIgy5DpwpL4oykvrjRfY81W5zEDky83gQr194rIMf/lGXE=
X-Received: by 2002:ac8:4803:: with SMTP id g3mr22266707qtq.176.1624256327559; 
 Sun, 20 Jun 2021 23:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210618024758.892642-1-joel@jms.id.au>
 <20210618024758.892642-3-joel@jms.id.au>
 <BC54E54F-CE3D-4DF9-8ABE-FB222EFA1BF7@linux.ibm.com>
In-Reply-To: <BC54E54F-CE3D-4DF9-8ABE-FB222EFA1BF7@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Jun 2021 06:18:35 +0000
Message-ID: <CACPK8XeGn3D_XnikwFjO-6VicbHX3L4CDwaoL7xYRwo=VHYFzQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: Add
 environment for booting from mmc
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 18 Jun 2021 at 15:52, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> Thanks Joel! There are some improvements to the boot command proposed here: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41778
> Maybe we pick those changes up in this initial commit so the two environment files are in sync? Otherwise we can submit a follow-up patch latest to update this .txt file.

I didn't want to merge that change as it adds yet another command to
the environment. However, I don't have a suggestion on how to change
it, so I have merged it. I'll send a v2 of this patch set with the
latest commands.
