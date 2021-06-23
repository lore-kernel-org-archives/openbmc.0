Return-Path: <SRS0=CX8f=LR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC9BC2B9F4
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 01:05:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E01610F7
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 01:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E01610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8lSB1fk0z306m
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 11:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QMynEADG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QMynEADG; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8lRf2hW5z2yYG
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 11:05:00 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id f20so84427qtk.10
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2VTxEWnxtPyEnHfBF/n4ToA7Ij2nj9vYBlL80F37GpU=;
 b=QMynEADGanz9BVOaEEvtS1q1E1f7L6BQq7NWMUxiRRKFAIYxLlSWhW/tv2YKuVBAys
 he/fTwzmyTZQ0MEFmR0seKl++MrWyASQRQxQvqFLFgIyWsRF1vJtuden3GbQPHhrlX8B
 YdgVYmdMNwy+VDns4rSYBVm/RHYLj1OcRwvCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2VTxEWnxtPyEnHfBF/n4ToA7Ij2nj9vYBlL80F37GpU=;
 b=JANVZxBQCip7pLsHKCZRm98ZQpCeTkrTlyrjX08aejDji8CoLdNQYU6r/quxV5ppl0
 1anRBb18oW/044OPc6vVZFAoc2rqAkO1W40ksFNMRc+W4EtKLAekEo3T60FV/ueF30/g
 vPzUeMr/1/DgzerZOUCs8lS2deC4M4YkQyGwQzyjrRKmIxa/An07htIHbp8kwzBj/tWo
 kH5Rnm/s9OAcbea1ea8XmJoULKAoclZQ3BFb18u+0aF2BfKNX+VdrwM6VtKo14wuteg0
 Z6LFnFwwHHunH29s46w+GBs18FYJnaPbc9coIIjbumdKgt9jNyJ0jSZUQt3fyU9FUNst
 o+Zw==
X-Gm-Message-State: AOAM5304tFVN+ETlG7CINdkzlOrTqxW4gu9Re1pxaMY017m6ukXtSOHI
 K3y6ZrRHOLdVkZ9LHkM7n4Ta1kUxIFcBAcjfTbwXN6I1
X-Google-Smtp-Source: ABdhPJwl3hh5E7/C4sd0e25XBnliQxwRCJ8rewGuLqyzxM6Wvmwu/wNNecM6feBf8BczF8USP7Itd7WEZGOHXFnaEHQ=
X-Received: by 2002:a05:622a:1016:: with SMTP id
 d22mr1478206qte.363.1624410295767; 
 Tue, 22 Jun 2021 18:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210618035858.4024689-1-andrew@aj.id.au>
 <20210618035858.4024689-3-andrew@aj.id.au>
 <23fff90a-e291-4874-bb8e-685b69ec5c3f@www.fastmail.com>
In-Reply-To: <23fff90a-e291-4874-bb8e-685b69ec5c3f@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Jun 2021 01:04:43 +0000
Message-ID: <CACPK8Xei9yNygb3_AO+jyoJwoWJ_=SEuZONqwrzGZDX+KmaURg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 2/7] ipmi: kcs_bmc: Add a "raw" character
 device interface
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 23 Jun 2021 at 00:48, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 18 Jun 2021, at 13:28, Andrew Jeffery wrote:
> > +static int kcs_bmc_raw_add_device(struct kcs_bmc_device *kcs_bmc)
> > +{
> > +     struct kcs_bmc_raw *priv;
> > +     int rc;
> > +
> > +     priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->client.dev = kcs_bmc;
> > +     priv->client.ops = &kcs_bmc_raw_client_ops;
> > +
> > +     init_waitqueue_head(&priv->queue);
> > +     priv->writable = false;
> > +     priv->readable = false;
> > +
> > +     priv->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +     priv->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u",
> > DEVICE_NAME,
> > +                                        kcs_bmc->channel);
> > +     if (!priv->miscdev.name)
> > +             return -EINVAL;
> > +
> > +     priv->miscdev.fops = &kcs_bmc_raw_fops;
> > +
> > +     /* Initialise our expected events. Listen for IBF but ignore OBE
> > until necessary */
> > +     kcs_bmc_raw_update_event_mask(priv, (KCS_BMC_EVENT_TYPE_IBF |
> > KCS_BMC_EVENT_TYPE_OBE),
> > +                                   KCS_BMC_EVENT_TYPE_IBF);
>
> Ah, this is now wrong wrt to some other rework that went on, we should be disabling IBF and OBE until the chardev is opened.
>
> With the code as it is we can get a "nobody cared" WARN().
>
> I'll send a v2.

Best to put it on the upstream lists. We can pull it in if you need it sooner.

>
> Andrew
