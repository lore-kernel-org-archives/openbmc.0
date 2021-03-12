Return-Path: <SRS0=SevI=IK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC93FC433E0
	for <openbmc@archiver.kernel.org>; Fri, 12 Mar 2021 00:27:25 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA6364F88
	for <openbmc@archiver.kernel.org>; Fri, 12 Mar 2021 00:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DA6364F88
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRTl5FRSz3cTq
	for <openbmc@archiver.kernel.org>; Fri, 12 Mar 2021 11:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Whz4MyDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Whz4MyDX; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRTH0dsKz2yjN;
 Fri, 12 Mar 2021 11:26:58 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id l4so22697173qkl.0;
 Thu, 11 Mar 2021 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FbmokgZymiS3iblK7SguwZRYnWpNx1j40+buPp7T5hI=;
 b=Whz4MyDX/Z4x61M2IOu46yFDNbrBy9hxI40mUilWmBGYlA6KNkDz/vz3svNyBHzQWQ
 gLeaU5E2C4JDURV0Ro3lWaIi7CZzig33rNWCj6r1XmNNZeowmF0drcd3o1ADJTATwwGH
 iP65fPEnz//mgxSwPRetyM1YEmdYAMC9np278=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FbmokgZymiS3iblK7SguwZRYnWpNx1j40+buPp7T5hI=;
 b=gcDXvr0n63iH4fvbFs+6R2ejLO3b2BQGP7bzi6tbnFluBS9Hp+ujRhrv0TnEW1Lylv
 gtgbK89QBBYranJQIyDDd5Cbqtz2ix688Y+WpA8nfUnDlViW4Cc22Rr579m/3RsPx1yY
 hJpyCBd9c7X0/lDol0AyEDsTptCOR0N5b1SpNB1QHnO4r7VvyHUe6/+kQQKLEWHOkFki
 5Wx0BpsGjm0aUOrUkQfaM2rLkbhop6NU5yZ7Pe7OCzIK/2weGFYGOK5XXlqZBylDWTcu
 nfAFHFBhYZbgZq2k0QiricSGg1F8r4xPO2ZCetYjFn2abrH4tfZ4iGHmzxxSU8QXlFx/
 GavQ==
X-Gm-Message-State: AOAM530ze/WqOYdb5ddnErmeaaeWWGX3N1EQY5CfOvhKq1EHoOHYltMJ
 aI442zQbhTsRmole0FrFtyDWf0GsNIlJCudxjvLG9Q2TBuY=
X-Google-Smtp-Source: ABdhPJzQy1fZxNI+jlTTtWmDGQKTLadDYa40QFao7q89di04GjVYULBfHmtP6r+/2GRiITO90WaY0pQIh8Gx0mHD8xQ=
X-Received: by 2002:a37:a147:: with SMTP id k68mr10400285qke.66.1615508815554; 
 Thu, 11 Mar 2021 16:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-5-dylan_hung@aspeedtech.com>
 <CACPK8Xc8NSBzN+LnZ=b5t7ODjLg9B6m2WDdR-C9SRWaDEXwOtQ@mail.gmail.com>
In-Reply-To: <CACPK8Xc8NSBzN+LnZ=b5t7ODjLg9B6m2WDdR-C9SRWaDEXwOtQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:26:43 +0000
Message-ID: <CACPK8XfMEy2o39v3CG4Zzj9H_kqSFBOddL3SC-_OryMqVXEjOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ftgmac100: Restart MAC HW once
To: Dylan Hung <dylan_hung@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Po-Yu Chuang <ratbert@faraday-tech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 20 Oct 2020 at 04:14, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 19 Oct 2020 at 08:57, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> >
> > The interrupt handler may set the flag to reset the mac in the future,
> > but that flag is not cleared once the reset has occured.
> >
> > Fixes: 10cbd6407609 ("ftgmac100: Rework NAPI & interrupts handling")
> > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

net maintainers, this one never made it into the tree. Do you need me
to re-send it?

Cheers,

Joel

>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> > index 0c67fc3e27df..57736b049de3 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -1326,6 +1326,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
> >          */
> >         if (unlikely(priv->need_mac_restart)) {
> >                 ftgmac100_start_hw(priv);
> > +               priv->need_mac_restart = false;
> >
> >                 /* Re-enable "bad" interrupts */
> >                 ftgmac100_write(FTGMAC100_INT_BAD, priv->base + FTGMAC100_OFFSET_IER);
> > --
> > 2.17.1
> >
