Return-Path: <openbmc+bounces-2030-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4DCD6E5D
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:53:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL46tJLz3brM;
	Wed, 03 Jun 2026 09:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441479;
	cv=pass; b=eaHKTctMjrvXtElz3oDeeX/42RiMBW0+bZ9qR9LpZC0YEtAFtHQR/hA7r/rmjULYggOuFHIdO+r+WHRlFtAdAwgfS2vwtN+/OwmyJczT9wWQc5TlSlXlwoLTN8gNciXlFCI/aP/ti30MuD+5wrL3DR6eIzVxZijbV32zB9GuHG8Q5cVEOgVs9679qcZJfQ2pZI+i9i/tIDkHQfIFY+gS3acSBrUg6FrrLR22wTmxE5FzkThaVryV2aGA2+QMK2ZkPS88EEzm6QAu+7/8OpyASokS7taajvDiihRJ8cbUT2EK5J1SkFbpa+Lmy3KerQqBUgOx/2Q4ed1kpWTughXgFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441479; c=relaxed/relaxed;
	bh=voZO6gLE04xoVnPUIMggez1Lk+bqJsqfaD9VB4wnfJw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Gdbnw7ipKrmQ1hV+TMYGuauXSMgCiB3zwWitmfNMnzbkQC/xUyLZOstcr+QTbgLSagpV+B5Rc5S6vxrZgFEYUWfD599aoKj+OXMEY7n/0V0FZsrQ6aXaWao5vpyyM2O9cX0N/8yN98/ed8HcCbv+jNKzi4VvHvKBGWT3t7cSjhPTve6b0uoWXlDIeEYGtbL5mMfSGESN3N4JRRFpCkij7ubEqhFtX5qaP9uX3MMLcV4doR5POvJPF4m5AoHy4qX8c1ugrdq1vcwU39sv60c9pgBaHHU1CHJ2Nm9maQ5+7To6dnvy0DbzJCY6VEMK31H/9JBKR4OPCCKTdT08EGpGrQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sMHpadBJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sMHpadBJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVRHB3b3Lz2yMn
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 09:04:38 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5175d339e8bso121041cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 16:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441476; cv=none;
        d=google.com; s=arc-20240605;
        b=VX9D5o9apnMMhw+5DstazzaeP4/XgRkulAMFSYFEu+lFOIqOJSzOldYdUMN2s8qt51
         2625sGPJw6wjeKglOFFuG3BXdUA37ixGbDtRJFV+o8GTPXs4r7GOqja50cTSIiXLIauC
         6O9n/mjf18EkiwYAylWM/2RnrgG1JiCvMOMtl0zorUJg2DghagYDFxHMbUh8Hs1s1u6R
         qgyet1zhVcerQAibs8cMGdagabYrg7mxMLAZXxPiiLcdQDkVOSGAvBZ/h0EDj/Z/UZzy
         mPux3T0WvpZX4+HRJb6691S9mRCLfu1vpYuLFN8bDvJ8LNamc0z4y3D/Z7KDAfW6YQHj
         5hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=voZO6gLE04xoVnPUIMggez1Lk+bqJsqfaD9VB4wnfJw=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=F9J16wnJNLOCC0PLUuQaPUFImXuvMub4jmOeDYHK3vlB/6cL0/ksaz42IZiCXsKDVX
         cS8eMykF4hb6CFsFO9nAK3vvpNQ2ng3bMHXisJHpTPUgZiij586BWqEkY5ebuBwu0eye
         /JvAHcDJo2inXSIzaV4ast/eKqCuxzAL1v6ArYIDdtRSpB1tFvTl1buYQ2Rx+k/3z4P9
         FxKoN8sVhAEguXSl9fqxqK+ve2hqiDoGEwCfFLvWQxNxo/PLjCG1mGW98W2Uw/zq0Rtd
         25sEOPvbjuNHizJJQrDvjqNxGo7woM9zhvEkfInM3wI4WlXD+iJvrfHc6hJ8s4US4k7t
         OqAA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441476; x=1781046276; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=voZO6gLE04xoVnPUIMggez1Lk+bqJsqfaD9VB4wnfJw=;
        b=sMHpadBJDfj5V9Hyzlcyj5LohpRqpdz1ecGS1HSzXghl3EfL5t6JuXouoT/baBXjyz
         v3abYAQ8IMrokXycyjmPdtmlaoixTuS8+25630n9uUGy6O/IvWfIcSQBKobrGEdFaVYE
         GbKRyRCVL+9g/XBCQtwdMttei0Awscwyahx0N9BPDEW81KcoCGJfY1DELVjIZbgeiuAD
         cKLKynsXvEv0Wu+1C0UXPnTAb93zJKkpChwA+o9kjdMLGoKxRSn+9Tu0PigTx7kEn3mO
         6WfPWuRvr349MRKdq09TSCvc6M/eaiSi49E3zDlmQBh1oXpe6INLc3wLs+dPky1X1F+r
         3ZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441476; x=1781046276;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voZO6gLE04xoVnPUIMggez1Lk+bqJsqfaD9VB4wnfJw=;
        b=swxaGmHENhJbk1kpiW/QE/b1bnuWvoZxoQxwhgdiCqMTEDZlkruHJ1FMMox5sMt5Rd
         qRxZiwbdncNpeccxXNt3MNsojgbBOTZXJNyWlu8VMrQeq2P4AdwMnPYfhkunTe8AGPI+
         1uwt6ndVFmIW3RhKRtfKkylwDZ2ay5JRO/Qvh1cS9rJ0xoTtVZO0KHsgVeY/Ubmr3OEL
         pYGlprSwJHCLTJKB5x1WeM91Kg/eT581OODuihpdVa+00tMJ2oPCpuarUyruo1b9BTPJ
         bOAJD307l4XrtDPSh/OznxIP8t1WV6UE9ML5aHEVvYaxMKXIp+vbojbIEFLjuBubWIz0
         PH9g==
X-Gm-Message-State: AOJu0YzNUDKgn4/SD8PZ/6aTIRb6esc325vo8HpC5Jst70Eke136z57k
	uppfDzVfGCd26OEvTD7Qci0JrMubeqb8GyMhyHCUGmS+5Qod4MyB+mnYC2oG21xJk93wkgzVtkR
	A25+VD95K3EYNYlju5QrUzzYa/fxuMN8COMFaC8a/hlS9j1D7/62biu638Tg=
X-Gm-Gg: Acq92OEFtxfFiQFdJ0LWS6oCAR3f0S1q1YPStdmTnZRLhKuvygwoTcSA9KVBNx/ugfF
	1WqFef+noNyHnXKc1smIxGGuovFwGPLF1msHhS1+8MYIABuQcTc0B3IZ92a+tFBqzjZaiAxFAF6
	gykMnrayGT3Y403j2KvlrD3DTHRLqWPwQMdjjuDQ/UBHGU/8wNRfy0oJTEcHxAqv7Hi/OVZOrW8
	z5SxPB04Fzqg1PSREvJ+3TxtbwAxmLvhmtBWYdwwmQj2R1BVmFGLPSAY1Bgw3u55jqj9TLIFGw+
	Dio4YgyiqIOJzIYbPaPCxOxm6LXPfA/KWR3TYMd1Xvyr/z+xpGQ5
X-Received: by 2002:ac8:614b:0:20b0:516:4f62:85ee with SMTP id
 d75a77b69052e-5177bbccf3fmr248931cf.19.1780441475796; Tue, 02 Jun 2026
 16:04:35 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Bhargava Naidu Gulla <bhargavagulla@google.com>
Date: Tue, 2 Jun 2026 16:04:24 -0700
X-Gm-Features: AVHnY4J05VkeLZT-EO3woru8kUbQeUcll7-sZWuKUWzVgpwYKOphrXK0KXtcom4
Message-ID: <CAEPZvmMqOEdbzo+xhZq+G7YSvmPoxxQ9mn1YLofVQ8JYakszTg@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Daemon
 Crash via Unhandled Exception in UserHeader parsing
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b5e7c206534d5591"

--000000000000b5e7c206534d5591
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a Denial of Service (DoS) vulnerability in the
UserHeader parsing logic of the openpower-pels extension.

Overview of the Vulnerability:
An unprivileged local caller with D-Bus event log creation access can crash
the `phosphor-log-manager` daemon by supplying a malformed or non-numeric
event log subsystem value. Since the daemon is a core system logging
service, crashing it halts general event log generation, tracking, and
notifications across the entire BMC platform.

Affected File and Location:
File: extensions/openpower-pels/user_header.cpp
Line: 51

Root Cause:
When constructing a `UserHeader` from the untrusted `AdditionalData`
dictionary (parsed from incoming D-Bus event arguments), the constructor
retrieves the `PEL_SUBSYSTEM` field and attempts to parse it:
  auto ss = additionalData.getValue("PEL_SUBSYSTEM");
  if (ss)
  {
      auto eventSubsystem = std::stoul(*ss, nullptr, 16);
  }

The `std::stoul` call is executed without any surrounding try-catch block.
If a client supplies an invalid, non-hexadecimal, or non-numeric string
(such as arbitrary text or a JSON block), `std::stoul` will throw a
`std::invalid_argument` exception. As no bounding component catches this
exception, the process aborts and crashes the daemon.

Proof of Concept:
1. Use D-Bus to trigger an event log creation request, injecting a
malformed non-hex payload inside the `PEL_SUBSYSTEM` property:
   busctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging
xyz.openbmc_project.Logging.Create Create ssa{ss} 'message' 'severity' 1
'PEL_SUBSYSTEM' 'not-a-number'
2. Inspect the system logs:
   journalctl -u phosphor-log-manager
3. Observe that the daemon has immediately terminated due to an unhandled
`std::invalid_argument` exception.

Proposed Patch:
Wrap the `std::stoul` call in a standard try-catch block, catch any parsing
errors, log a warning, and fallback to a generic subsystem code (0x70 for
others):

try
{
    auto eventSubsystem = std::stoul(*ss, nullptr, 16);
}
catch (const std::exception& e)
{
    lg2::error("Invalid PEL_SUBSYSTEM format: {ERROR}", "ERROR", e.what());
    eventSubsystem = 0x70; // Fallback to safe generic subsystem 'others'
}

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000b5e7c206534d5591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
Denial of Service (DoS) vulnerability in the UserHeader parsing logic of th=
e openpower-pels extension.<br><br>Overview of the Vulnerability:<br>An unp=
rivileged local caller with D-Bus event log creation access can crash the `=
phosphor-log-manager` daemon by supplying a malformed or non-numeric event =
log subsystem value. Since the daemon is a core system logging service, cra=
shing it halts general event log generation, tracking, and notifications ac=
ross the entire BMC platform.<br><br>Affected File and Location:<br>File: e=
xtensions/openpower-pels/user_header.cpp<br>Line: 51<br><br>Root Cause:<br>=
When constructing a `UserHeader` from the untrusted `AdditionalData` dictio=
nary (parsed from incoming D-Bus event arguments), the constructor retrieve=
s the `PEL_SUBSYSTEM` field and attempts to parse it:<br>=C2=A0 auto ss =3D=
 additionalData.getValue(&quot;PEL_SUBSYSTEM&quot;);<br>=C2=A0 if (ss)<br>=
=C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 auto eventSubsystem =3D std::stoul(*ss, nu=
llptr, 16);<br>=C2=A0 }<br><br>The `std::stoul` call is executed without an=
y surrounding try-catch block. If a client supplies an invalid, non-hexadec=
imal, or non-numeric string (such as arbitrary text or a JSON block), `std:=
:stoul` will throw a `std::invalid_argument` exception. As no bounding comp=
onent catches this exception, the process aborts and crashes the daemon.<br=
><br>Proof of Concept:<br>1. Use D-Bus to trigger an event log creation req=
uest, injecting a malformed non-hex payload inside the `PEL_SUBSYSTEM` prop=
erty:<br>=C2=A0 =C2=A0busctl call xyz.openbmc_project.Logging /xyz/openbmc_=
project/logging xyz.openbmc_project.Logging.Create Create ssa{ss} &#39;mess=
age&#39; &#39;severity&#39; 1 &#39;PEL_SUBSYSTEM&#39; &#39;not-a-number&#39=
;<br>2. Inspect the system logs:<br>=C2=A0 =C2=A0journalctl -u phosphor-log=
-manager<br>3. Observe that the daemon has immediately terminated due to an=
 unhandled `std::invalid_argument` exception.<br><br>Proposed Patch:<br>Wra=
p the `std::stoul` call in a standard try-catch block, catch any parsing er=
rors, log a warning, and fallback to a generic subsystem code (0x70 for oth=
ers):<br><br>try<br>{<br>=C2=A0 =C2=A0 auto eventSubsystem =3D std::stoul(*=
ss, nullptr, 16);<br>}<br>catch (const std::exception&amp; e)<br>{<br>=C2=
=A0 =C2=A0 lg2::error(&quot;Invalid PEL_SUBSYSTEM format: {ERROR}&quot;, &q=
uot;ERROR&quot;, e.what());<br>=C2=A0 =C2=A0 eventSubsystem =3D 0x70; // Fa=
llback to safe generic subsystem &#39;others&#39;<br>}<br><br>Legal Name fo=
r Attribution: Bhargava Naidu Gulla<br></div>

--000000000000b5e7c206534d5591--

