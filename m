Return-Path: <SRS0=yABl=NH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF16FC4338F
	for <openbmc@archiver.kernel.org>; Mon, 16 Aug 2021 02:12:40 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E31D6142A
	for <openbmc@archiver.kernel.org>; Mon, 16 Aug 2021 02:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E31D6142A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GnyNk6tzHz30HN
	for <openbmc@archiver.kernel.org>; Mon, 16 Aug 2021 12:12:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=J6xikWU8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=J6xikWU8; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GnyMv3BVwz30G8;
 Mon, 16 Aug 2021 12:11:54 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id g6so8552021qvj.8;
 Sun, 15 Aug 2021 19:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RCriSD8EWtXhtQKktiE7TncAOMeRWKmTNW5hb/Sa0/g=;
 b=J6xikWU8wKm7Z9E0G7SsPulofLjO9FwDDKk21zs2cS4nuZgEE55Z4YadanEpsD2pRz
 o7ld0W5h6zoOP1Jok3c3wPlHF55eyD2TThWk1jEQRblyp3T56n4LUQ1B/qy3nRYv14g2
 pi6Ng+x6TPfgywj+NB2fiJAZVH1J84ALBpjN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RCriSD8EWtXhtQKktiE7TncAOMeRWKmTNW5hb/Sa0/g=;
 b=dJGjpbE1lPRZXW5/4Qe6Ez4oernFrJQ37xAHvcU/7ZPwJlTedIgAvaFOlQdRga+tNK
 Aw67MNfZBmzYBjpn7pzbTpc8JfhuT7j7veLFeXYZ7QoA6LqoRtAk++EWcRhV+O1qENWw
 g4StPc3YkU4VukXJA3/rg3poIZHRpSLhmJ/+3zMrghsVqzjyslT3b1qTGyT4ciBlf7k0
 kZU8wk47KZTmPtBQmoypb0++t0p8u4Z5qeOrN2x/eGa4HUxbUmWZWlKeFlUV99P70/uY
 Z+ZKp+bNeVsapCKXmbIS8vtphCoajUVizJS5yGvpWrpuignAxcfaeu5csUDiFLLYNp1w
 JRGQ==
X-Gm-Message-State: AOAM530HY5nunvINHbGAvnNojMwff68bLeQa+fuQhxopVa7wQp+EdzjJ
 TLWnmIxgScO8U7U41igpEQWK58xxawsO1ZbruhQ=
X-Google-Smtp-Source: ABdhPJwhXnrmqh156PtVzL9hcyEAfhvLDsdhzqB6+2cdZvwR1531PgQsyNtKhyvPLIGl5qxjxGsdHQDU14nxJs1lA8E=
X-Received: by 2002:a05:6214:8c2:: with SMTP id
 da2mr10826803qvb.10.1629079909644; 
 Sun, 15 Aug 2021 19:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210720002704.7390-1-rentao.bupt@gmail.com>
 <20210813062435.GA24497@taoren-ubuntu-R90MNF91>
In-Reply-To: <20210813062435.GA24497@taoren-ubuntu-R90MNF91>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Aug 2021 02:11:40 +0000
Message-ID: <CACPK8XcAqU3KASespqS3dPterpzyqD4wYH=qOS8Ok2yUrB_F+Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: minipack: Update flash partition table
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

On Fri, 13 Aug 2021 at 06:24, Tao Ren <rentao.bupt@gmail.com> wrote:
>
> Hi Joel,
>
> Looks like the patch is not included in "dt-for-v5.15". Any comments? Or
> should I send v2 if the email was not delivered?

I had missed it. It's now applied for 5.15.

Cheers,

Joel
