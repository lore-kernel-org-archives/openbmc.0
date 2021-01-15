Return-Path: <SRS0=3dQF=GS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3172BC433DB
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 06:24:42 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46A5522B2E
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 06:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46A5522B2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHB3q2zCHzDsc0
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hHxHvCA7; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHB2G47K7zDsWr
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 17:23:14 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id z20so5369349qtq.3
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 22:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hHjffUAZr2u9qnMuzyl4UYxg7UGKSum9qwX8DhJlfP8=;
 b=hHxHvCA7c8opUboI8pIalNgZm6fxPIOZPnG3p8zRPvJCwboZuCIgc/TLRTpbcyeojF
 doyTxhyrXnbNjAeRxsPV7ML+YuloxsT4IxeLkalupieo5YsDhM49SI5WvS4MQYgBLdpE
 sVTFftn9IB3qwib/9xRqXfUscoEB0e6rdx3Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hHjffUAZr2u9qnMuzyl4UYxg7UGKSum9qwX8DhJlfP8=;
 b=UvmMF9aqm6MYJK6NuxB9QBT3D40kUAOwMLdXkD9DH4+B5YnrF9GNiRvIQxHcg1QALO
 86621gvM7PSm7xgfCTaMP+PfmnqIw7+mUYtXT6PxWE2+k9/iThcrEYFhXXoUcAIl5hV9
 pciswwT/SwzkDuRh0MCiKWI9yvMsusqM8Ret7gzUgNQHxcxVSlsYvc7qe9r7SELPcJBA
 9rsHy1fR/X9O7nBvyVuQc2ivHE8Y1RXoKbhzIdoLBHVXVVoYINedY5QnC/3Y4LdGoxi2
 I6jL+VfQSPcjC4wFDZ8eZzOzIsUE47RiTC6s0UOUHnjVs4wzvoF2yvAc9IfIgM9hitnV
 3q6g==
X-Gm-Message-State: AOAM533xDJrRxwFJnzIIqFVFZsQ4FO7nSPwvi+V1siivZ29IYefvEiRn
 enZVc9N4CA6qTAw8WCllf+1Ouv9RKX6qLA80TlI=
X-Google-Smtp-Source: ABdhPJwnk3c4xeQ7fEUG4IPkwpyGXiVcM9DZpoSavG11oPK8H2ejs2E1VW89I6INPyjBuVvr9P6iqbDK0IC5EUVnBYg=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr10573810qtd.263.1610691790747; 
 Thu, 14 Jan 2021 22:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20210113200010.71845-1-tmaimon77@gmail.com>
 <20210113200010.71845-2-tmaimon77@gmail.com>
In-Reply-To: <20210113200010.71845-2-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jan 2021 06:22:57 +0000
Message-ID: <CACPK8Xf12=tNFWNF+Q3g0H79RGFGFCPk+qywKKBKa4O1zKmwJA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 01/12] clk: npcm7xx: add read only flag
 to divider clocks
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 13 Jan 2021 at 20:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add read only flag to all divider clocks except
> SPI3 clock.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
