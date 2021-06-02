Return-Path: <SRS0=uxIs=K4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A96C4708F
	for <openbmc@archiver.kernel.org>; Wed,  2 Jun 2021 15:19:33 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927A9613B4
	for <openbmc@archiver.kernel.org>; Wed,  2 Jun 2021 15:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 927A9613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwCPH3H3Cz303n
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 01:19:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=T6iC9ZLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=T6iC9ZLd; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwCNp0VNbz2xZL
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 01:19:03 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so4018692wmk.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CnhCRWrQtEtdgKGFw1x5yI01TxCghr4evGyHLQOKn2c=;
 b=T6iC9ZLdHJBa5s/1BIuf4VcXrFqaJCCewzceoHPIygXZhphSf7WZKB6pfYeSKFkfH/
 W5K7maCgt34wwS/2ZKKZkfqz7VMmhPasU5Ms2KCGpAiPCOGeKw6hCJ+pZ2Pm1o8MMp6z
 sDaKZSmMBjcwjOlod0bob8gu8dZxXLCbgAeeTOaSqhZMCCVAWAvRoUzDr05i3Jz+TAK7
 2at4Gq9BZ48TtH2sveULF2+PxTBQ3S3fh1n0V1knuIsIz8hG8oDs9yBtd2NhLSg4U4Jb
 IfHa4OvoHKfd1jQ78VH0OLZh4trKCYrmTsGOnfA72It7K4TkgNVTbYP3h9yvrOPqjAev
 igOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CnhCRWrQtEtdgKGFw1x5yI01TxCghr4evGyHLQOKn2c=;
 b=eZQvgmcRCNwH+9g/ZRJcudUE1+9FBmgMXtF7zPaotiYDODVa3CfRjV2wTkMGCs6axS
 LKgIEedy/Nc32gvw0c0jpnaz0XZ9ENp9bfvN/zi2m04BTbZ57R+MiR5HzE6WTNXdRws1
 ZSoUztvwIAYguk6WgPs3+p4537/0Ds87sxLgtba5sSFtld4kDxzAAisMUMBPnlGz+swX
 pJCejdL7jOU41zla0WJ39K5ua8Fy1Ywosm6fQewsOtHBuv9YOdLD84OffXzQZ+IxaCl8
 v9yZdJB/UWx1Rqg1Eq08ydLDgmCoxeuP/LH+BErGaFYwcksNW1g1EMrjTbysPKZ5+x67
 zDjg==
X-Gm-Message-State: AOAM533HzfZbMWrHN0aD2zaxRS9/MS3MlfSPuAjpqb5QarhQdcF7qWQC
 Uyy3k+2f/UFIkVkZn+Oe/VF98Ahq9xuJQBZRadxU1g==
X-Google-Smtp-Source: ABdhPJznp3iSNPqHe+64xeTRRMo2MxP29lK0aW2Qr7mUVpEof8oVLlrgewfehAL/QrCfr4JosUt1H8YttdvjxsHnffU=
X-Received: by 2002:a1c:7313:: with SMTP id d19mr32500914wmb.14.1622647139073; 
 Wed, 02 Jun 2021 08:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <fd2a0d0e-988c-8bab-aedd-1253ba7042ef@gmail.com>
 <YK+SUUXRcek2KzBv@heinlein> <DE99272B-68FA-4E37-9804-05EACE890184@hxcore.ol>
In-Reply-To: <DE99272B-68FA-4E37-9804-05EACE890184@hxcore.ol>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Jun 2021 08:18:52 -0700
Message-ID: <CAH2-KxD+-qc1EBOU5yXJb9ijjcpmLym-g5Kjqp5gkc1Eq9vPeg@mail.gmail.com>
Subject: Re: How to submit meta subfolder
To: "outlook_60A7133428934D5F@outlook.com" <ckimchan17@gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jeff9_chan@asrockrack.com" <jeff9_chan@asrockrack.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, May 27, 2021 at 5:49 PM outlook_60A7133428934D5F@outlook.com
<ckimchan17@gmail.com> wrote:
>
> Hi Patrick,
>
>         Thanks for helping, I checked below document and it said:
>
>
>
> From your OpenBMC git repository, add a remote to the Gerrit server, wher=
e 'openbmc_repo' is the current git repository you're working on, such as p=
hosphor-state-manager, and 'openbmc.gerrit' is the name of the Host previou=
sly added:
>
> git remote add gerrit ssh://openbmc.gerrit/openbmc/openbmc_repo
>
>
>
>
>
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-ch=
anges-via-gerrit-server-to-openbmc
>
>
>
> should I use below command to create meta layer?
>
> git remote add gerrit ssh://openbmc.gerrit/openbmc/openbmc/meta-asrockrac=
k

There is no git repo called meta-asrockrack.  To do this you need to
submit this as a new folder to
ssh://gerrit.openbmc-project.xyz:29418/openbmc/openbmc

>
>
>
> Jeff
>
>
>
> =E5=AF=84=E4=BB=B6=E8=80=85: Patrick Williams
> =E5=82=B3=E9=80=81=E6=99=82=E9=96=93: 2021=E5=B9=B45=E6=9C=8827=E6=97=A5 =
=E4=B8=8B=E5=8D=88 08:36
> =E6=94=B6=E4=BB=B6=E8=80=85: Jeff
> =E5=89=AF=E6=9C=AC: openbmc@lists.ozlabs.org; jeff9_chan@asrockrack.com
> =E4=B8=BB=E6=97=A8: Re: How to submit meta subfolder
>
>
>
> On Thu, May 27, 2021 at 01:04:37PM +0800, Jeff wrote:
>
> > Hi,
>
> >
>
> > We would like to submit meta-asrockrack as a sub folder of openbmc.
>
> >
>
> > I followed the steps describe in the document to add remote server:
>
> >       git remote add gerrit ssh://openbmc.gerrit/openbmc/meta-asrockrac=
k
>
>
>
> Which document is this?
>
>
>
> Previously you had to request a meta-layer repository be created but
>
> about 4-6 months ago we moved to a model where all layer code is in the
>
> single openbmc/openbmc repository.  We may have missed a documentation
>
> update somewhere.
>
>
>
> > when I tried to push it I got below error:
>
> >      fatal: project openbmc/mata-asrockrack not found
>
> >      fatal: Could not read from remote repository.
>
> >
>
> >      Please make sure you have the correct access rights
>
> >      and the repository exists.
>
>
>
> You'll want to set your remote to ssh://openbmc.gerrit/openbmc/openbmc
>
> and push there.  Ideally you would have originally cloned from there and
>
> done your work on that repository.
>
>
>
> --
>
> Patrick Williams
>
>
