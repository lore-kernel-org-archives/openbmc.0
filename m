Return-Path: <SRS0=bmDf=OM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A275C433EF
	for <openbmc@archiver.kernel.org>; Wed, 22 Sep 2021 06:49:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2A42611B0
	for <openbmc@archiver.kernel.org>; Wed, 22 Sep 2021 06:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2A42611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDpmX0mq4z2ymb
	for <openbmc@archiver.kernel.org>; Wed, 22 Sep 2021 16:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o4hUAC8H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o4hUAC8H; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDplk0zk6z2yPK
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 16:48:16 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id h3so1665256pgb.7
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AoR/VWNIjl5SYUg8ZoTqkYR+Q3F0iMTdDgZ1kN610KE=;
 b=o4hUAC8HVpTXfcTZefcLH4cxepQlyYr7dpu7bXwV0ARythEayF6pINwV5A+REYiLiP
 qfD8dNBXXedL0nVvXzKX6AFnpmORRnAoiRqOB/tKf5lTB9PB09TyAcWu51dlnjfLCu9Z
 5P/SF1dDRnV5PFoJ9JFbegYRtSQKprXvIMDvsmiwD4iLC39GhbpmAcqx9S8h5Tua9qGt
 x6HnGLf4BN1xbkHmeyK6k6aNrIIIMKX4aFTdt3Vo30MjP9H+f9O9l44ZjkTOlLwGEaTK
 r6vLol99LlASwFzmPwojyF88HqjA+q1PVsSD29/NXy10mOMQNamVMj/2zszTMxIH6mdb
 ulUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AoR/VWNIjl5SYUg8ZoTqkYR+Q3F0iMTdDgZ1kN610KE=;
 b=0tWOOju6gyFJP/0kRrrvDgH73QmY32kJqHTTHdr069FnCjQvH+ev9bNGBfiPf/oYx6
 HSk/RkR9J1Hjv0c5AZIgFqk/UAp1MjgY6aAjK+lf6oVnDSswfrezxkMvN/qknTqnNlAc
 hT2tigImG08yJwQ3mLTmb1OXeetm5XhNLBFXZU/HioA5PO583ej+wov9rObd1NaWVwEV
 T2cQ4roZx92rOyCGQdbfWOnhK+ELhecMalaEYj9IAcX29lBy9CTX4x7xRnNwtjYmXWz2
 /3vFdnXRzLBcHb5R6E2mQEvrL87K+J5K057va9kbQV0VlmQzhLVOTrC8vta2sw76f+Ih
 W0qA==
X-Gm-Message-State: AOAM533uFRPaTnLDG+sG5M01EfK+DWS7ACTDH15f+hsmZC+BJpMi+WcV
 BRbCHiPRIV8hGflM7b6FvTmi1c9SfyM=
X-Google-Smtp-Source: ABdhPJxkXPF5xehDkTV6+1oNcOkhwejuOnSc9f0RuiOJx7FIsScXO+xMGEFMaAGqx+86xuwNWH/SPw==
X-Received: by 2002:a63:9315:: with SMTP id b21mr2386197pge.306.1632293293613; 
 Tue, 21 Sep 2021 23:48:13 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id n205sm1198457pfd.38.2021.09.21.23.48.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Sep 2021 23:48:13 -0700 (PDT)
Date: Tue, 21 Sep 2021 23:48:07 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Kernel moving to Linux v5.14
Message-ID: <20210922064806.GA31719@taoren-ubuntu-R90MNF91>
References: <CACPK8XdMu_xc+3dp7T57azkMp==1W5xpt6t=bSZWiNaA7vDJ2A@mail.gmail.com>
 <CACPK8Xeu_3y4Mnsk-_rzWRQsx0nY=0cuqkM4FGoz_sbhOZ3BCQ@mail.gmail.com>
 <20210922060848.GA31321@taoren-ubuntu-R90MNF91>
 <CACPK8Xe_fqxMqzRUW1CMa1iJQaOCmVE7fyK7Q2G5zUFHtDGZgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xe_fqxMqzRUW1CMa1iJQaOCmVE7fyK7Q2G5zUFHtDGZgA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Sep 22, 2021 at 06:11:18AM +0000, Joel Stanley wrote:
> On Wed, 22 Sept 2021 at 06:08, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > On Wed, Sep 22, 2021 at 12:24:46AM +0000, Joel Stanley wrote:
> > > On Tue, 14 Sept 2021 at 02:11, Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > The openbmc kernel will move to a 5.14 based tree for Aspeed and
> > > > Nuvoton machines.
> > > >
> > > >     linux-openbmc: Move to Linux v5.14
> > > >
> > > >     This moves the OpeNBMC kernel to a v5.14 base. There are 78 patches in
> > > >     the tree, plus a the MCTP core and device tree changes that were merged
> > > >     in v5.15 which have been backported.
> > > >
> > > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46847
> > >
> > > This has now been merged. Thank you to those who reviewed the change.
> > >
> > > Please address future kernel changes to the dev-5.14 tree.
> > >
> > > Cheers,
> > >
> > > Joel
> >
> > Thanks Joel for carrying and backporting the patches. I'm also porting
> > Linux v5.14 to Facebook OpenBMC tree and these patches are very helpful.
> 
> Thanks, I appreciate you saying so.
> 
> Even more helpful would be to have your patches in the openbmc tree, I
> would think.
> 
> Would you consider doing that, instead of us both having to spend time
> maintaining separate trees?
> 
> Cheers,
> 
> Joel

Hi Joel,

I'd love to share the same kernel tree, but I'm afraid it will introduce
a lot of overhead for you at this stage, because we still have a set of
local patches which may take a while to upstream (mainly due to resource
constraints).

In other word, sharing the same kernel tree is my goal, but we are not
fully ready yet (couldn't meet three iterations policy) :)


Cheers,

Tao
