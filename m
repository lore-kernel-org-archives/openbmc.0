Return-Path: <SRS0=W0y3=EC=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AC7C4363A
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2020 02:17:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BA52072E
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2020 02:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="RcVYmZyH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BA52072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKwMZ724QzDqTs
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2020 13:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RcVYmZyH; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKwLC3F14zDqSd
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 13:16:19 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 188so10407312qkk.12
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 19:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NI2gPF81e+1G9PzdgJh4buyxLbXK9RGlFluAb4oAljs=;
 b=RcVYmZyHVS/n1B3goR06y+0IBTiovI8J2adIhaB4oCPTRf2sUOzcUZAaT5SsPUrqxz
 Q314Kknu8istA1p8qywn2bPWaq5UySuJ9YGflbmxBHCqFcaXEQ/G8oz2Pq5Vg3Qi9qvl
 oz+sIGSj0d/Zqatz0hY3zzvt02maVoQUN9DFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NI2gPF81e+1G9PzdgJh4buyxLbXK9RGlFluAb4oAljs=;
 b=tUBrYfbvXC2CQz7vaMyVzIy6dCGyNUMLwoD3MH2Fele3QaoQvjcEv3h6kxDDRXXNzW
 7j1fvPTflLDwiGjfwpaYZAPmrU2Co26jly6nAUPzv8c/lwD9n2T4XxwFbcKj/04zVvB0
 qF8O9GWfg2GYrL5XStOz41Bk1pha8SgXWwM9nRmj7uKyJSo5rcYe21GUsHGX7YIk9Qmy
 Cg7wVJmpId7KaoomcJskvTJhJJCPdiOZAeySPACreKahIZ/HXQnQZseQq2vuZmlmxjc7
 1EoAAIjiLuXAiPNbHWU+8rmXYO0BQAcYF06yfXCyzelhdFD1vxQWvIbwrAUpNBovHjh+
 laKQ==
X-Gm-Message-State: AOAM531nlO9J8H3MTxXlQroKSHNNAMyiT5pcMJM7ghp+NsAqF/P1lK9q
 1+r+ZBJaAvQzuLkQzMqfixaffJbjCbBmC1LS1hc=
X-Google-Smtp-Source: ABdhPJwbocW+ldlAANgcbHUtiKQI8JtaXQJ/z/ZFCGWmZx3p7GfXZdjWYoGe8Q4LoUmx2I3j69IK5xn4vD5886EH9L4=
X-Received: by 2002:a37:a81:: with SMTP id 123mr30932qkk.487.1603764974873;
 Mon, 26 Oct 2020 19:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201022081002.2665132-1-liuxiwei@inspur.com>
 <63aac251-77da-468c-911c-5e24b2a9e5fe@www.fastmail.com>
In-Reply-To: <63aac251-77da-468c-911c-5e24b2a9e5fe@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Oct 2020 02:16:02 +0000
Message-ID: <CACPK8XemeY32aejR=bq9YagRmYZQaC37t8ssXejgSZ+bATGOdg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Fix label address for 64MiB OpenBMC flash layout
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 26 Oct 2020 at 00:59, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 22 Oct 2020, at 18:40, George Liu wrote:
> > Signed-off-by: George Liu <liuxiwei@inspur.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>
> Joel: Is there a reason the 64M layout isn't upstream? I don't see it in
> aspeed/for-next.

Because it was sent after I sent the pull request for 5.10.
