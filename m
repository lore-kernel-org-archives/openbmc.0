Return-Path: <SRS0=6BXm=KH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC71C433B4
	for <openbmc@archiver.kernel.org>; Wed, 12 May 2021 13:37:12 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B6461396
	for <openbmc@archiver.kernel.org>; Wed, 12 May 2021 13:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B6461396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgG6t1z4Hz2xvV
	for <openbmc@archiver.kernel.org>; Wed, 12 May 2021 23:37:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jf/JT4nR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=saiallforums@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jf/JT4nR; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgG6Q4Cmdz2xv7
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 23:36:43 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id p12so29640222ljg.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mei7NBNx5m/MdaV8nstBgB4+w5lbldX/8c8foj6vdI4=;
 b=jf/JT4nRfpR7Xnv4n8V/H8bvuDJfSbK896Nc/43Jkg09+ZoPPRJm34PDGaar31IeBk
 LudOKk7XcrNSgtoxBPExqMS3ZHTI3FGw3XtboxFaGE4t5rsVpcZ+1H8iIjtpft/fDlJO
 C9H2aLV9wX9IHiGcBotmWBwr+S4E0usdb00hUdqLVT+TZS9UFi5GB+UVPppUX997JCKT
 HD5Gf55wIk7PPIuQ4i3dKM/AafQuZ0MmzLRJDlntwVvUcljKIJl37iicg3RIn6S9UnD0
 wMZPwEnVNBxp9uA+JVnVWqUClGBJrgDmZcLtp+yL8I9ZZsxUbix06N31B5XfbXCkUUh3
 izwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mei7NBNx5m/MdaV8nstBgB4+w5lbldX/8c8foj6vdI4=;
 b=YYtk1QHUagG0M4MYRu2JvvrEuv5JlJLWLt23aDWUlO4E1pCfghtWnaZAArNcPy++OL
 67lv0ZY1Z+YAQXucSzKNvEAO/o+fdR+ZgdXDmDyILCCpscZE3wqe4qjNXjplnDY/IGWG
 koo+BUhJwrqGe3T8kPC+KW1xBOAGGB9M3ngN4rJaASCOHn/DO7JcWd/XmcQieAelYr9q
 h/lgIQquxVpgEmIj5QZQujMGidZ8JpdW9jJt8bE1LbmJK/NyS9IQnueFeT4NcmWLdebX
 aYVlyw/7EbTAF94Y1AlvLeZr80KxyB3FnZ72WcJ6NmiUEFhEahN13q9DYVaapiR20aM+
 c1Iw==
X-Gm-Message-State: AOAM5318x+StmTUPg6oQ/qNFS9TKsigYAScbzkr09FPdyf9DAmxwfqd5
 E832WbiNRoYM3g/D3xclsE/+MPsa+KLZmDIcxQWagKYM
X-Google-Smtp-Source: ABdhPJziRC/OR/hUF5QZVnTw/TRu/qm64hoOBZ+2OESrLH7fAEBmQS9BUYjHJ0zlalp2KdAOoBI3GSXeCW7thHr/1WM=
X-Received: by 2002:a2e:a492:: with SMTP id h18mr29878319lji.161.1620826600141; 
 Wed, 12 May 2021 06:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABqzqi4XL3B6Nv1XqgqvzkXhe25HkUN53+8MEfMY9Acn0Oy43w@mail.gmail.com>
 <YJr7SJrJ0wm/h+nR@heinlein>
In-Reply-To: <YJr7SJrJ0wm/h+nR@heinlein>
From: sainath grandhi <saiallforums@gmail.com>
Date: Wed, 12 May 2021 06:36:28 -0700
Message-ID: <CABqzqi775bJs9qvzQ8QM85Z10Nqc0XOy_W10Ek3UxaT9bHfqbg@mail.gmail.com>
Subject: Re: Advice on delaying de-asserting PCIe reset
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, May 11, 2021 at 2:46 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, May 11, 2021 at 12:50:34PM -0700, sainath grandhi wrote:
> > We are potentially facing a scenario where de-asserting the PCIe
> > PERST# should wait until an endpoint in the PCI hierarchy is ready.
> > Since the endpoint of interest is an FPGA, it takes "some" time to
> > come out of reset, boot etc. to be ready and participate in Link
> > training followed by config space requests from Linux.
>
> I've worked on devices like this but they are a violation of the PCIe
> spec.  You have something like 10ms or 100ms by PCIe standards for your
> device to come out of reset.
>
> The cases where I've dealt with this we hacked the BIOS to just delay
> after the PERST# but before probing.
Got it.
When you say BIOS, do you refer to u-boot?
>
> > So we are checking for options on how we can delay de-asserting PERST#
> > in the Linux PCIe controller driver, if possible in a standard way.
> >
> > A simple approach would be to add some time delay or wait for a signal
> > (via some pin) from the endpoint in the PCIe controller driver before
> > de-asserting PERST#.
> > But that would make the change specific to our use-case in an
> > otherwise generic board controller driver. And maintaining that logic
> > can become cumbersome.
> >
> > How does Linux in general support such PCI endpoints to work fine?
> > Any advice on how to approach this scenario is appreciated.
>
> Are you asking about Linux on the BMC or Linux on the managed host?
> I'm trying to figure out how your questions are related to OpenBMC.
>
I am asking about Linux on BMC.

> One possibility, if you're talking about a PCIe device attached to
> the managed host, would be to separate the power sequencing of the PCIe
> card from the host processors.  You can bring up power to the PCIe card
> independent from the host processors to give it time to come up and
> be ready to listen to PERST#.  That is another option if you can't
> modify the BIOS.
>
> --
> Patrick Williams
