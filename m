Return-Path: <SRS0=H2FO=NE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,HTML_OBFUSCATE_05_10,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB75C4338F
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 12:26:57 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903BF60E78
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 12:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 903BF60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmN8t6mvMz3cLG
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 22:26:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H2f+dNOw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=sharad.openbmc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H2f+dNOw; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmN884YD6z30Gt
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 22:26:14 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id bi32so15730188oib.2
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Uc9FOdwN9p7Mz/N8J0bh07QRc5lcJUTHJbQK2k4kpXk=;
 b=H2f+dNOwD7WUqwnjTL+cZoO1ojG8mr0WxGW7xawuT8KOGl+0tZGAjn8lzYmgGJ8lEF
 86gO/qNzcltDoOctYuOQ8GH+AS/yJO6ag5eJksgR5eXZUkuFeVJYIS1nu0IhhfopaNce
 pVTJbDCqSdOqVyNle7SiW4h4A8/vCotiW9lOWZVg+lx4fLApqCXQK14aS0zaMBj3keBW
 m38t0e+VEUCTgaVxdPZpjw4KvWQqqD0Eg63w0kt1Z0cXwXEex9OHu1ztNBKDFu6gNSkh
 QJjHaofeEEWHk8AfUsfzThuQ6GNA8eH8gpwp4H7FchXr0hlTFAup8YezTk6WS7uPyMN/
 1i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Uc9FOdwN9p7Mz/N8J0bh07QRc5lcJUTHJbQK2k4kpXk=;
 b=MkQoiV/b0qJWxi5IL+X5rAJlBQvK5ZoJNXors1Pu5TJ0V0yWtfvZuNfLPjznXpH/K/
 5Gh0ULBycYTs/FNb8H0IhIdjoM2a98TCcNDrZmb1pYtA7gQi+tYNsvv4vQjG1zDfPuPM
 xDziv8ha9id9wY/aDVXCZ9BY8Nfd5h/C2j0v7Gnm4Vl2UTaB1fvLrPA9c4RMKPoylYUH
 7PS7iwo7FYs3gTzt6Hag1dyRTYfSYVrSw18+U/v/f5VtUlKSO0oqX8W12ksWHoxIUi39
 nkxc+C+hQSdtiDfy5MgISG4Ay+q2zWU3d9p7v6NX1C5efvrZKY70fWJPzr1H1r00x83F
 hiqQ==
X-Gm-Message-State: AOAM533JR8EiS2Nt2rLIPO9mkfibbx9d5s+iHqhp1XQpSTyZJHYE9Kav
 kB15BuRyrVg0wz+qrmRsxEoRUVh1NIiBvS1GHG2Hi9BzyEE=
X-Google-Smtp-Source: ABdhPJyBXdKEBG1xBhYSAT/vkyC+zDyRZunSarWgbD2nDkdXJHGdb4gKGQ2YNdBqCldAKPKu5UQ3nHeBPlDifr6ks/Y=
X-Received: by 2002:a05:6808:1798:: with SMTP id
 bg24mr1926984oib.6.1628857570650; 
 Fri, 13 Aug 2021 05:26:10 -0700 (PDT)
MIME-Version: 1.0
From: sharad yadav <sharad.openbmc@gmail.com>
Date: Fri, 13 Aug 2021 17:55:59 +0530
Message-ID: <CA+H48BQTCfxfZ4M-Ph5Zy-=RBfNgnXb8xDcT0HSaDbgjRe07tg@mail.gmail.com>
Subject: Looking for qemu tree for 'qemu-system-arm' jenkins build
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e36dbb05c96ff49d"
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

--000000000000e36dbb05c96ff49d
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am looking for the qemu tree from where
https://jenkins.openbmc.org/job/latest-qemu-x86/lastSuccessfulBuild/artifact/qemu/build/qemu-system-arm
is
being built.
It will be a great help if someone can point me to the qemu repo and branch
being used for jenkins build.

Thanks,
Sharad

--000000000000e36dbb05c96ff49d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am looking for the qemu tree =
from where=C2=A0<a target=3D"_blank" class=3D"gmail-c-link" href=3D"https:/=
/jenkins.openbmc.org/job/latest-qemu-x86/lastSuccessfulBuild/artifact/qemu/=
build/qemu-system-arm" rel=3D"noopener noreferrer" aria-describedby=3D"sk-t=
ooltip-4204" style=3D"box-sizing:inherit;color:inherit;font-family:Monaco,M=
enlo,Consolas,&quot;Courier New&quot;,monospace;font-size:12px;font-variant=
-ligatures:none;white-space:pre-wrap">https://jenkins.openbmc.org/job/lates=
t-qemu-x86/lastSuccessfulBuild/artifact/qemu/build/qemu-system-arm</a>=C2=
=A0is being built.</div><div>It will be a great help if someone can point m=
e to the qemu repo and branch being used for jenkins build.</div><div><br><=
/div><div>Thanks,</div><div>Sharad</div></div>

--000000000000e36dbb05c96ff49d--
