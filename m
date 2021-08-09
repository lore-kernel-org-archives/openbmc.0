Return-Path: <SRS0=UIXK=NA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44855C4338F
	for <openbmc@archiver.kernel.org>; Mon,  9 Aug 2021 20:39:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7516101E
	for <openbmc@archiver.kernel.org>; Mon,  9 Aug 2021 20:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD7516101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gk7HW6Dmhz3bNh
	for <openbmc@archiver.kernel.org>; Tue, 10 Aug 2021 06:39:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=WY5iFV5b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=WY5iFV5b; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gk7Gm3x3Tz2yxT
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 06:39:10 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id e19so4382754pla.10
 for <openbmc@lists.ozlabs.org>; Mon, 09 Aug 2021 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=uvcB4pAszWsga+HyyuB3Nz29DAYgaSLgdzHd89qsKqI=;
 b=WY5iFV5bh0N4L79TPRY8dScfidnYW36KoBNNO//gqGB/e+nYtLvhO06K11Qe6qjF3f
 t05WsY7a2e70cDejwU4ngDZFtI9L7uAyBrn9heECo8Fua+nyg4Trm3EfUwVDFz1GVXSs
 xT6FSqN8na7PN+XfvMBlIcjxP6yA7D0Z8FVRPkBmcoDMFo/KkdjMyJI0D/O7Ip+RTD/U
 3rI9c2zdu3m9XCKmndNx/uYVv4f7dLUsqR5o8sRykGigH7oUIYfGSWSrkEQp0UJE9Twa
 Q1scDx7iXTOERW6zfJvewQZd0nO89nB888brWIdsVN2ycYuGv762xDYvTbIc+V+vXFuq
 GrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=uvcB4pAszWsga+HyyuB3Nz29DAYgaSLgdzHd89qsKqI=;
 b=TiD1MfjxODLYi3U0/RZGT5O81XomkdT9OjYsPDwo708PKqqhnMTuK5vHB2YwYKMTC0
 SjNKz8hy1uthhh3+QpFoIrDaH2BUPYLfnFsdgqxo/S4pOSUPduUlyDWxMdhWzR1bDfVN
 blX0m3++IrPaOTb4InfHuOMRrM5Ppv1gzoIswZwLwK60iDHYzYJdXcyq9yDrqwpOHgOr
 s71v3btzKCS7FxI2EOSclq1MniVBGrqjAvONTy0kBD0KJTICLmROnI6TV3BfmCn0kV/4
 99bgeG/eIDANYd1rOtAPMCmXlvpQ8tNozXPahzwzXTEaEm8LuCHOj4WvuBCLvNcCexbv
 +jXg==
X-Gm-Message-State: AOAM532gXGRevqfaARviVIIT/KFllZbFpREB4GZENxd7NeecWq1vBLdC
 3OoZLbXCaeZN13WNMV6JqZzC+128ngnSIWjEHRZWDGotZtvDsQ==
X-Google-Smtp-Source: ABdhPJwGEwutwa0eMAnkjVaRkTfE3Prsxb7JKbAUDX8KyYH3GJCmxfdGwG1qFdJ6pZNMeRdzBaDfVIwMhAKyB33wd/8=
X-Received: by 2002:a17:90b:2282:: with SMTP id
 kx2mr16079195pjb.15.1628541543495; 
 Mon, 09 Aug 2021 13:39:03 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Mon, 9 Aug 2021 13:38:52 -0700
Message-ID: <CAHwn2X=uDqvQiH05+zSpZiuF-t6iHYpucXXSLDJjn4TfZ0iOUA@mail.gmail.com>
Subject: [phosphor-sel-logger] Watchdog Event Monitor Usage
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000341b1105c926605b"
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--000000000000341b1105c926605b
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am writing this to see if anyone is using the Watchdog Event Monitor
option in phosphor-sel-logger.

Option: `log-watchdog`

I have made a few changes to `phosphor-watchdog` that sends out Timeout
signals during timeout events.

See https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-watchdog/+/44749

I am thinking of replacing the existing watchdog event to check that signal
instead or checking for the `Enabled` property change.

See https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/45622

I think the existing change is wrong, since changing the `Enabled` property
does not necessary mean the watchdog event got triggered.

So I am wondering if anyone needs the watchdog event monitor? or if I can
replace it.

Best,

Willy Tu

--000000000000341b1105c926605b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><div><br></div><div>I am writing this to see if=
 anyone is using the Watchdog Event Monitor option in phosphor-sel-logger.<=
/div><div><br></div><div>Option: `log-watchdog`</div><div><br></div><div>I =
have made a few changes to `phosphor-watchdog` that sends out Timeout signa=
ls during timeout events.</div><div><br></div><div>See=C2=A0<a href=3D"http=
s://gerrit.openbmc-project.xyz/c/openbmc/phosphor-watchdog/+/44749">https:/=
/gerrit.openbmc-project.xyz/c/openbmc/phosphor-watchdog/+/44749</a><br></di=
v><div><br></div><div>I am thinking of replacing the existing watchdog even=
t to check that signal instead or checking for the `Enabled` property chang=
e.</div><div><br></div><div>See=C2=A0<a href=3D"https://gerrit.openbmc-proj=
ect.xyz/c/openbmc/phosphor-sel-logger/+/45622">https://gerrit.openbmc-proje=
ct.xyz/c/openbmc/phosphor-sel-logger/+/45622</a></div><div><br></div><div>I=
 think the existing change is wrong, since changing the `Enabled` property =
does not=C2=A0necessary mean the watchdog event got triggered.</div><div><b=
r></div><div>So I am wondering if anyone needs the watchdog event monitor? =
or if I can replace it.</div><div><br></div><div>Best,</div><div><br></div>=
<div>Willy Tu</div></div>

--000000000000341b1105c926605b--
