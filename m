Return-Path: <SRS0=CX8f=LR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C4CC4743C
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 18:09:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B45561075
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 18:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B45561075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9BB15NN3z308m
	for <openbmc@archiver.kernel.org>; Thu, 24 Jun 2021 04:09:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rzcGa+Tj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rzcGa+Tj; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9B9X256qz305s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 04:09:18 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id j2so5578849lfg.9
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/JYnR/alvPvaGUNzVnHuCBFlcJoUje8QC/PAqQDYEp4=;
 b=rzcGa+Tj3sgipt1yzfHpf8JunYFvNdo9WSjHtnLyC/Xui5AKu7OntbLb6a9hPcrBX0
 ARkNCXs24amTPtgi0Datf6AHkowV4scPEQXZisSumY7VlMaONZARWZ41qIItvzcrkAQ5
 fOQs68Q8kbokrQLAEd5KlNVgiCqc+snLYDlxx1P2n2Y4b/9SkkKPHpbUY6gl6GlHgcRk
 cyxKy2Tkgcj0MA6mehgrPCdYExwV9TgByuKf0lSafGEbdMSd8dH+ERIYdxTJsAhX3ZAM
 WkAkmxbF8Vr62dxv8jocvKtNE/stlANetZAiku+rvB4Wk2LU5TLwSsMIqaqkCtsmnX7x
 Oidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/JYnR/alvPvaGUNzVnHuCBFlcJoUje8QC/PAqQDYEp4=;
 b=F7S2eDEj6iOenHbVIiN1LAT/5UJRed1F2LKtv9cbWfG6WBjsToOax4XAarcXetVdyb
 YCzTLk1bITus87LK4ZoltL/GgCHtpvnd8syUDygq//gIoiLCrF/bZzyeMV0pbCAid9Nj
 LHsMeaEqaUHeambexF7BWKUkk5RsnIPOmRD09ZPf+SovpUrXf9Hu3H+qdvFJ63rfunc5
 TgV6/i4NZ0/+FuyJ8AHDAdNaprdaOXdaQFCiS0m57xdwOx020HATEKm2qS2VFNx4HgH9
 rMUmVRqZ8rghbeCizgwU7eJo2TDi/WdtXhVVix/+RUrJ8T0aDTGDA0i+SFGlVzADrGRk
 51Tw==
X-Gm-Message-State: AOAM5335hDHaHCIJMCNt04bMcJZZ/yAj9wxxMhY9MxJYJHnFuSM5O49C
 TdOWqmaizIM0f9cFV3zuMi9GfeLnEQ6tzKn3DCsSFbj8yRIRdw==
X-Google-Smtp-Source: ABdhPJwRs5nYPrkW/XFv5xWoko2h/0GuFOKH/HNTONecrVGW84T2VkDTjWxCjs0BAhHtau803dFn6bY0pQXd7w/wVx4=
X-Received: by 2002:a19:5d53:: with SMTP id p19mr641255lfj.581.1624471750489; 
 Wed, 23 Jun 2021 11:09:10 -0700 (PDT)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 23 Jun 2021 21:08:58 +0300
Message-ID: <CACSj6VXYXiDhZo_=SkXZxMszMeN+fcAdPk_vuW4mqzdJKuWMFQ@mail.gmail.com>
Subject: Re: Boot Source Override feature problems
To: openbmc@lists.ozlabs.org, a.kartashev@yadro.com, 
 Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Jun 23, 2021 at 8:09 PM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
> On Wed, 2021-06-23 at 19:36 +0300, Konstantin Aladyshev wrote:
> > We need to have two `xyz.openbmc_project.Object.Enable` interfaces:
> > 1) one that stores information whether the BootSourceOverride feature
> > is enabled or not,
> > 2) another one that stores information whether the BootSourceOverride
> > feature is permanent or one_time.
> >
> > The current implementation has only 1), proposed design has both 1)
> > and 2):
> > ```
> >  /xyz/openbmc_project/control/host0/boot:
> >       - Interface: xyz.openbmc_project.Control.Boot.Source
> >       - Interface: xyz.openbmc_project.Control.Boot.Mode
> >       - Interface: xyz.openbmc_project.Control.Boot.Type
> >       - Interface: xyz.openbmc_project.Object.Enable              <--
> > -------  1)
> >  /xyz/openbmc_project/control/host0/boot/one_time:
> >       - Interface: xyz.openbmc_project.Object.Enable              <--
> > -------  2)
> > ```
> >
>
> Right, but your initial proposal was to use "Permanent" flag instead of
> second one:
>     - Interface: xyz.openbmc_project.Control.Boot.Permanent #
> true/false

To use something like  `xyz.openbmc_project.Control.Boot.Permanent` we
need to create another interface in the `phosphor-dbus-interfaces`
repository, which is something the OpenBMC community want to avoid
without necessities.
As the same functionality can be achieved with the
`xyz.openbmc_project.Object.Enable` interface under
`/xyz/openbmc_project/control/host0/boot` I've decided to take this
approach instead.

>
> BTW, can anyone explain me, why do we have all this as separate
> interfaces with only one properties?
> As for me, it should be one interface
> "xyz.openbmc_project.Control.Boot" with several properties.
>

I don't know.

> > Also earlier there were two sets of Boot.Source/Boot.Mode/Boot.Type
> > settings. But the second one isn't really necessary as the
> > BootSourceOverride feature doesn't fallback to permanent override
> > after one-time override. So we need to keep only one set of
> > Boot.Source/Boot.Mode/Boot.Type settings.
> >
>
> The fact that it was broken doesn't automatically mean that this need
> to be removed. May be it worth to fix this...
>

I didn't mean that something was broken here. I just meant that the
typical BootSourceOverride functionality in a BMC is not intended to
work this way.

> But here I tend to agree that
> "/xyz/openbmc_project/control/host0/boot/one_time" can be wasted. I
> just think it can be wasted completely. Then you can use GetAll on
> /xyz/openbmc_project/control/host0/boot to get all required data.
>

Currently "/xyz/openbmc_project/control/host0/boot/one_time" is used
to keep two separate `xyz.openbmc_project.Object.Enable` objects, so
we can't waste it.


> > Best regards,
> > Konstantin Aladyshev
>
> --
> Best regards,
> Andrei Kartashev
>
>
