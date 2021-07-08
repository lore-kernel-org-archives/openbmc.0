Return-Path: <SRS0=XzZl=MA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B577C07E99
	for <openbmc@archiver.kernel.org>; Thu,  8 Jul 2021 20:55:28 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F5AE61461
	for <openbmc@archiver.kernel.org>; Thu,  8 Jul 2021 20:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F5AE61461
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLT8F6FPMz3bkj
	for <openbmc@archiver.kernel.org>; Fri,  9 Jul 2021 06:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=GXxC632n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GXxC632n; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLT7k3cJDz303F
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jul 2021 06:54:56 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id q184so4004743ljq.0
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jul 2021 13:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZJLDCjDhrLo8yslHRPKfTmX28rbkEWzYMaUnMb2vAB8=;
 b=GXxC632n7PKUsuLu7WuHt4i6REVfQpZVREASAKmc099LSzaTHjRIqCbqcLhfjEy3ef
 Mi4Jun0bdgSJWB8+6gat6wq+bxkC03TAIaYbCiMP60tUBtmVNgtYjXociw8LTpRbMCjr
 g1nRYfodvr63MBfYmQAxoznzIvydksSXl42f32vqep1GZBO5FQFPiyYAbMWKtRFFNs9p
 SwtkOe3JuRfp85GjvXdK7iYk/tKgR9iUSkrtZ95QSpI6Gtq4cgMVfYuISPGXNx7yM3fZ
 BZ2ujxE8v+O6hVxrbKwe0cmCMzjNp5onIADq7SW2aNvs2lARt17bCkUf2UV/PBy7zbrX
 E+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZJLDCjDhrLo8yslHRPKfTmX28rbkEWzYMaUnMb2vAB8=;
 b=sY528es5UvdxnOmuw4BpEziZCRYt1GhjFoLLNLHTYZhmoZThYpMrxv81ZSFxRNV7pL
 7s3mJfCRYtDAvO0zEyU4MoZMhICeGCjKPvS0/OPvQvJu6mjieQoI4ktAwB2Dk/mXEi6w
 N3vGZJ1dANKsewNDh2hCeu0gtY5cfhPWm+P8hiz5bqzxipgfLBWpS9dnUsGcjDQ1ecBQ
 Q1eu7hGyX7krbPFXKV9qpxTXMVwYNbQ3mcLNra+r8j/YB+H98rhIGZQo05YSDIiX+Oaq
 v1gOg6IHs+bU9ET49+sdYWBP0Nz5i/p2lY/vtFNRmW0wuTp/OOX1eakg8NokLn+ugBcu
 6qjg==
X-Gm-Message-State: AOAM530sMv5Z5p5bCGZZCJ+mwIR/F7alIjGIXEtfXQb6uTh5WysmLlAQ
 y6aPK0Sl6kZnC34MwXABLybp4MMHwmKFAbNi4lvqgw==
X-Google-Smtp-Source: ABdhPJxhK8KiK5r34YBp17Kzlrv3XrhjIkLGDmD0whTNJMSxnBo+1zqa7M0xNxtFdmFL2qEhMl9YMJrbnWEKj3V2hKA=
X-Received: by 2002:a2e:b746:: with SMTP id k6mr23833755ljo.6.1625777685325;
 Thu, 08 Jul 2021 13:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <dbe431da08674c61bcda091cec16b5fb@asrockrack.com>
 <5d74d92b8e2f47acab7da6a54f6c18ee@asrockrack.com>
 <fec2cbe8fd144a52915d971b4e7214bb@asrockrack.com>
 <58f7b059987f40b78ebdcdbd1db5d969@asrockrack.com>
 <8a3b99b118744df5a918b43e5520d35a@asrockrack.com>
 <CALVHhedqJhfKD+MNofiwnKBB7sGG1wRPV4gXTdW_h=8=6=4HKw@mail.gmail.com>
 <OF6DE94A96.B5787DB8-ON00258584.00525E62-00258584.0052E3DC@notes.na.collabserv.com>
 <OF796A58B2.9DA64EBD-ON00258585.003E519E-00258585.003F6F0E@notes.na.collabserv.com>
 <OF2B5AA3C5.40A65716-ON00258589.004350E5-00258589.00436A50@notes.na.collabserv.com>
 <OF5B0F1DD8.7358EE61-ON002586BE.004FB2E2-002586BE.0050DCF8@notes.na.collabserv.com>
 <7807e4794c844beda004d7059c74289c@asrockrack.com>
 <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
 <CACPK8Xfi9FBjPyLdy45C=hy-e4wktLrTp3UmFhH59oaaz0yTYQ@mail.gmail.com>
 <b3df546e778b456dac24cbb170e66bb1@asrockrack.com>
In-Reply-To: <b3df546e778b456dac24cbb170e66bb1@asrockrack.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 8 Jul 2021 13:54:34 -0700
Message-ID: <CACWQX82MMP=Y5O9UQEkODMiwUXg5sgZVzwyQ=OUhe_d+=duN3g@mail.gmail.com>
Subject: Re: OPENBMC ASRock Rack
To: =?UTF-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Jul 7, 2021 at 6:50 PM Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRoc=
kRack)
<Jeff9_Chan@asrockrack.com> wrote:
>
> Hi,
>         It has been a while after uploading asrockrack layer, looks like =
no one is reviewing it, what's the next step for me?

I responded to your gerrit review with next steps, primarily educating
yourself on what is allowed in a meta layer, how big patches should
be, and where patches need to be submitted (which are documented in
the docs folder).  Apologies for letting it sit for so long, I was
hoping that you would read the relevant docs and start
updating/submitting your patches, but it looks like you were just
waiting.

-Ed

>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43850
>
>
> best regards
>
> Jeff Chan
> ASRock Inc.
> Tel: +886-2-55599600 ext.38670
>
>
> -----Original Message-----
> From: Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRockRack)
> Sent: Tuesday, June 8, 2021 2:48 PM
> To: 'Joel Stanley'
> Cc: Bradley W Bishop; openbmc@lists.ozlabs.org; manager@lfprojects.org
> Subject: RE: OPENBMC ASRock Rack
>
> Thanks Joel, it works now.
>
> best regards
>
> Jeff Chan
> ASRock Inc.
> Tel: +886-2-55599600 ext.38670
>
>
> -----Original Message-----
> From: Joel Stanley [mailto:joel@jms.id.au]
> Sent: Tuesday, June 8, 2021 2:00 PM
> To: Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRockRack)
> Cc: Bradley W Bishop; openbmc@lists.ozlabs.org; manager@lfprojects.org
> Subject: Re: OPENBMC ASRock Rack
>
> On Tue, 8 Jun 2021 at 02:01, Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRoc=
kRack)
> <Jeff9_Chan@asrockrack.com> wrote:
> >
> > Re-send
>
> Please use plain text email when posting to the list. This is a good
> rule to follow for all open source mailing lists.
>
> >         I got below error when I try to push meta-asrockrack layer to g=
errit.
> >
> >         Is that means my email is not listed in the list?
> >
> >
> >
> > To ssh://openbmc.gerrit/openbmc/openbmc
> >
> > ! [remote rejected]     HEAD -> refs/for/master (commit 1d9951c: not Si=
gned-off-by author/committer/uploader in message footer)
>
> Here is the error:
>
>   (commit 1d9951c: not Signed-off-by author/committer/uploader in
> message footer)
>
> > commit 1d9951c5518a7bdf88a5de16a41ae2f337e1b2ed (HEAD -> master)
> >
> > Author: Jeff9Chan <jeff9_chan@asrockrack.com>
> >
> > Date:   Tue Jun 8 09:15:44 2021 +0800
> >
> >
> >
> >     add meta-asrockrack layer
> >
> >     Signed-off-by: Jeff Chan <Jeff9_Chan@asrockrack.com>
> >
> >
> >
> >     Change-Id: I1686133e0093e4e00adeadc068972396c8dc4fab
>
>  I suspect Gerrit's filtering diddn't notice the s-o-b in the middle
> of your commit message. Normal style is to place it at the bottom of
> the on the line immediately above or below the change id. Try git
> commit --amend and moving it so the message looks like this:
>
> Add meta-asrockrack layer
>
> Change-Id: I1686133e0093e4e00adeadc068972396c8dc4fab
> Signed-off-by: Jeff Chan <Jeff9_Chan@asrockrack.com>
>
> Cheers,
>
> Joel
