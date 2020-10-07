Return-Path: <SRS0=jtpY=DO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4891CC4363C
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2020 05:49:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D006208C7
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2020 05:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="ACkkPlVe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D006208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5k1714TGzDqNj
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2020 16:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ACkkPlVe; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5jzj4GMBzDqMd
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 16:47:59 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id s17so425753qvr.11
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+AlB6T8PsOKQoiqsrG91br2C/iBhFxl5vjkMg5jDbGc=;
 b=ACkkPlVedvA0yFO8gOas8D/T7gAa589JKSFclQjOillFQVXKGE9u5jw2UZTweFe/Fy
 7xaHUUTG3IDK6m8uAvOYsCyhVMIjh8JNcu/k7kloW5dTfLXi93tHtjz8FIilVOREiEXd
 qkwMnGDUDGlOTixABcMEjmEXo6VHdzxO3kqis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+AlB6T8PsOKQoiqsrG91br2C/iBhFxl5vjkMg5jDbGc=;
 b=UgDzU2qDDQwJujMy2k44Bo2vQHb/Mu49aDlEU8YD4KwHi+WNAlgsOtBFiV/3JCWKLX
 z7+lUPUSxbteDDIHhklZNqgtnIlT+gMPDYQvRuX7WHXdt3XWuDDLpAnNjNZlZtA1515b
 ecOtT6mJXUyyf2Y3wUE4S4jeY6WaBqKBFYvz0O478H/wqIEB6H238cFKXmGz+hhx1nbG
 5pkeKYiWiLvgUhNARZLbtiNvU71maXuWzWew1C5xvNN86jTijVlVunpvCkJtFpAXBOlF
 slz9JcTsllgmfExY8pr/1rbaBx4RJvpYpee35mmxHnS1fTBCgFZG/go2mXdTOOanEkET
 zOJA==
X-Gm-Message-State: AOAM531zhmDPo3vDDgK6B3Ct2hVl+L3oZWDC+7n23lCEUzXEIw9k67dl
 vYGGVKuSpdEI6HeFL2mJRSDUdH84U1ukR6r7jK0=
X-Google-Smtp-Source: ABdhPJzWAabbCsS1siHGPKwc60oFsGwDgeILJmw8TeetjhUVn01ugAI2EmewQh8avG2OGYqzr6Umfkrqt/EI1yGV3gk=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr1521832qvu.61.1602049675419; 
 Tue, 06 Oct 2020 22:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200929184916.33247-1-eajames@linux.ibm.com>
 <OF73F51A22.F28011F5-ON002585F3.007BD2F6-002585F3.007C06F7@notes.na.collabserv.com>
In-Reply-To: <OF73F51A22.F28011F5-ON002585F3.007BD2F6-002585F3.007C06F7@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 05:47:43 +0000
Message-ID: <CACPK8Xd1z_KOk9OOsHcV=Nc53R==PR0QhQ0Mg-MDEQU8yUkbBg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] fsi: Aspeed: Add mutex to protect HW access
To: Milton Miller II <miltonm@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 30 Sep 2020 at 22:34, Milton Miller II <miltonm@us.ibm.com> wrote:
>
> On September 29, 2020 around 1:50PM in some timezone, Eddie James wrote:
> >
> >There is nothing to prevent multiple commands being executed
> >simultaneously. Add a mutex to prevent this.
> >
> >Signed-off-by: Eddie James <eajames@linux.ibm.com>

> >@@ -597,6 +608,7 @@ static int fsi_master_aspeed_probe(struct
> >platform_device *pdev)
> >
> >       dev_set_drvdata(&pdev->dev, aspeed);
> >
> >+      mutex_init(&aspeed->lock);
> >       aspeed_master_init(aspeed);
>
> So you initialize the lock here in the probe function before its
> used, good.  I notice its not taken in aspeed_master_init nor over
> the opb_read for the version register.  Both are called from the
> probe function and presumably are therefore the sole context
> available, but having it taken could be considered a good for
> consistency.
>
> Are there any concerns that this is part of the fsi master
> context if we wanted to use both fsi buses in the future?

If we use the other FSI master, then it would have a second instance
of the driver so we would be fine.

If/when we add support for the second OPB bus the driver will need a
overhaul, so reworking the locking will form part of that work.

> Reviewed-by: Milton Miller <miltonm@us.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")

I have merged this to the openbmc tree.

Eddie, I know this was written to fix the sbe fifo usage. Did you have
a (simplified) test workload that showed the bug that you could share?

Please send this to the upstream lists with the r-b and fixes tags.

Cheers,

Joel
