Return-Path: <SRS0=XDmz=PY=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36C5C433F5
	for <openbmc@archiver.kernel.org>; Fri,  5 Nov 2021 03:53:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668E261139
	for <openbmc@archiver.kernel.org>; Fri,  5 Nov 2021 03:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 668E261139
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlmnY5Dmkz3bhv
	for <openbmc@archiver.kernel.org>; Fri,  5 Nov 2021 14:53:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g7bU5gH2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=g7bU5gH2; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlmmq0VSdz2x9M
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 14:52:42 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so16146849lfu.5
 for <openbmc@lists.ozlabs.org>; Thu, 04 Nov 2021 20:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iottYFAVjDHXs6yCo3nYtgilorGj6kAeojXcmOGKg2Y=;
 b=g7bU5gH2OiOXNzlpZ3yfoo8E8y3uxQqe6P5VwkIz1BjWcoVaKYxhHot2TZ7ELvum8b
 bnqwqV1SfjgPpPOqzctcsJv7TnoKUVB0+xEgzc0HBspAo5nHpmwPzJcQZWxA1SoNEt94
 M0/pBEwh82iENk038HkALbzdAN7uRYG8oMjwjXmKLdHuGoe32MGavF7GSuU0UgUqWFMw
 di9JbgHTFP5MR0B4DFa8HgNGiPhbfQ05+1Mnya4JTHU9jogJpPG/HHQ6ZSfjrjYXSDvR
 B2/f+Xf+4LDYwYKKTIrwNZIchjRlaR8Waga2teAIErGXEQs8o3Vcb2W41BZ/BqA8wRuV
 0OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iottYFAVjDHXs6yCo3nYtgilorGj6kAeojXcmOGKg2Y=;
 b=AxNqDRMUwqgfHMwhbFarP7jSCxsLmipM0A7F5H9rbFvxlVWqME9kMOzWFZpLRDVO5/
 VudwO20B42zFNq6R1NAg3OCFC+zZ1BW1+9qUniZlVhvz0NQvL0xGdvjgdcr3/n/Rju9A
 5ZkSPmKQqs/SRdpx1yqozINQXj0quHylMsEYMtKYWmxf4qI0SK/pdV92uvhboI8yxa2v
 tn05ZSuGoL+QF/or46ACFUywRg3HO7U60eQ0YBMZxf+90Yno3/3Vatrt74+meYWPTnOB
 zSJpW55CG1lijPsyQcqqOeSmFW4606opVXAxoDR++f/oImpsoCVPKao3ierZCk7DLzaX
 ScAA==
X-Gm-Message-State: AOAM532x+v7xhucboxZLrFjBMWkHsCunu3RsgnRB54NaHGR4U5mc5b5Q
 JBTkbCgRrUsmAdGAgdC0Qb1rvbZmVoJXwgodjX6SnBMRt6INNw==
X-Google-Smtp-Source: ABdhPJyIMb1oXTXpROC6d5/wCOlCHqhRqZ25AldD7zchQgSKaD0LKTxK4YYYFWJhapv4GyXzYzpmUGLe+AMHV8JuPIQ=
X-Received: by 2002:a05:6512:2520:: with SMTP id
 be32mr15236655lfb.21.1636084358679; 
 Thu, 04 Nov 2021 20:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
 <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
In-Reply-To: <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 4 Nov 2021 23:52:22 -0400
Message-ID: <CABoTLcRoC7aQ1e0V3FMbmRgvuMafib0qUHOuYZkORFOooGSYcQ@mail.gmail.com>
Subject: Re: Cherry-picking 5.16 commits into OpenBMC Linux?
To: Joel Stanley <joel@jms.id.au>
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

Hi Joel

> > Would it be possible to cherry-pick these commits into the OpenBMC
> > Linux tree to speed up this process? Or is this something you
> > generally prefer to not do?
>
> Yes, this is exactly what the tree is for.
Aha, cool! I'm starting to get the picture :-)

> > https://lore.kernel.org/linux-arm-kernel/20210909004920.1634322-1-osk@google.com/
>
> If you take a look at the dev-5.15 branch, you can see that this one
> is already applied.
Awesome, thank you! I didn't even think of looking there. I thought
I'd have to wait for 5.16 to manifest itself.

I sent https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48632 to
forward the commit for linux-aspeed. I hope that was right? Or does
someone (you?) do that periodically anyway? I did test (build and run)
and it works as expected.

Oskar.
