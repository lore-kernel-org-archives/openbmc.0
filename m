Return-Path: <openbmc+bounces-2028-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FCACD6E69
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:52:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL25fYvz3bps;
	Wed, 03 Jun 2026 09:52:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::835" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441197;
	cv=pass; b=U1sqmIMcvclmSPGqCulf9YAaJunuI+pxulvMjcK+BVorFjCtOWrBtW/PT+J7gSEaZWoP0dDnM4AvNcWmjDKmvcRP4wnxb+WZchh/YXAtS3Hyrc2OWQmyYmPWFxV3UUrBvTqBAagPO+jRz8PDgcG9MaLnDOzcvZ9/SUIVSgIkrXSWzLx9LVXHEgwrjw8kboPKp+mb8s2L4AfeIq+6AqPZg3U3M5mdO0jKgDPx6ZBSA5SWq+hocUSYS6ONuOMKQ9MyIyFrDpAwAB3HoFu/2KJ0sToFO4CceKuSazmAGp6x+pqA/j3+Hz0JlLzXi+8lDP1HHb9JlgBRSE03URqqHsP9LA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441197; c=relaxed/relaxed;
	bh=7CZ/EXka11Gd+/EHk2BytBazVNo95oiX/PDk2FMYM0Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=fPJsqkbvp2rDwPMv1KmbIRl2MOTCCVGh89U9oFtnvGSbt/yOJ1mvPIn9Aen1NFF0OnjsNiH6k8LU1AoRmf8r66GCEXCm+d5lxiTtOOB/pRj103dgV4MW8xzL6s5+QmoOqAlQx8hVr8GxytBJVcVqYyDLvy1Hdrwp3BAJKtiQ+OjeUX+ML+5VvhwsJNJXJrRetKqptg6JVys6yu7RbdgX+hgjXY6oUrGuRbkMdTeh1zrXI9i4RWO3k84Hpyh1xpBu2d0nPmH3PJOWhZyW/FsFlczP1o2ViZ9/4E6zqvEm3AECERkdxrItSUyVR7ux5PWkzZ2S3cNIrHrnGtyMyerujg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I+tIIIxK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=I+tIIIxK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVR9l6y3Bz2xLm
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 08:59:55 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51765331535so115091cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 15:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441194; cv=none;
        d=google.com; s=arc-20240605;
        b=USGQ5nmlr43TBNEJNuunWvl1rXTlc6lJtFuoIURElTlsts3KaLvukvmIh5DDD8aYvn
         6zP8sdCEL4PwMuBZCl8XNLDZsr4IWReE7EzwwFY4YO54b9A4Wo1K75KWt+ZLCQE6aUsJ
         wK8/ss0edGmeq00hm/mQkgSd1nGo2sIstOvmVsZLnAi3qOX0PRJ06kpT4HCDr1Vp/rvN
         YOcIpGceKMzF6myPo6CLyWexSe01RPm1xxSvU89sd3MIG51D4d7kChRrXtGLffBf4F44
         Vbhcl+7Ly0ErORGeONExxmVSdZyJyg0gU/Sls0Mt/A/hlIGfPqnynX2JstUkavnl7LpX
         tZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7CZ/EXka11Gd+/EHk2BytBazVNo95oiX/PDk2FMYM0Y=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=A0aI+cuyyNYHRcX5S6gRm9BUdqIqoh4dfI2WhNugOLQkwqs4fI3jHhr5VrpDbDYUrr
         rIkr0WpsypkjO9rwBaMz0S5oaxw3o2me4L/RFC8jsSiPgZg1IznYl6bOU5GswEvxyX2/
         CL2bE1ZtWI54NkGeg4UnMPpFBEKibT2Uw78Uda5QiSpqBGPRGTYhnyzGWyE+bTP8xcCl
         1230BqUvmM/n8O0E0ImGcM5tl/ghCJAO4U34ItjDUO4vWSyHfx8ms4bkn0GAr/HoqexZ
         OmJ7kTNxZbYTZgjxNO/Emry7VqAqVHbY1kbgQrSwvy+sUo3Jx1qH7t89NLR84TB8pTLd
         Mc4Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441194; x=1781045994; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7CZ/EXka11Gd+/EHk2BytBazVNo95oiX/PDk2FMYM0Y=;
        b=I+tIIIxKgfMYgqudVnlYr9LFD9XwmD92roO73Z3hrmktOW2T/InvF+MNr9PCr494Ok
         iWIXxgb5pdy3KkLLdhet93/O6J7j4orVUEDloaAY5INx7nVmmZJZLru09qQCBQojenSd
         PVqvjl6uzMwC/BqBrpSM9FLutHT0jfmgtU5109nu/G1SMWCpV3HUHd5WoNLO26ulGbsd
         0AxfaOhfxBdy1+m4p2TVCzhafRuDgiIUqO+ouoD+R7XBhhZ4FI3fYirNmO/DZj46mLkY
         rt2WruzatjCZSfPRAJl2BROXnU2U5mnp27x8wUi6JOqdjHkBBGDxXKmOis+gO8EeHglG
         A8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441194; x=1781045994;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CZ/EXka11Gd+/EHk2BytBazVNo95oiX/PDk2FMYM0Y=;
        b=fToXq6JX5GE5zeY4J4fuYl1ao5SEN3CccNx1R29KsGhWmxiu0MMkGmh1o2MwjjAM9a
         NYp0m9igJUaHuT1dN3ElOJZDJD0F129xtOgolU16x91Ig6MRDXx4dW0EMoacjY9diyy6
         MY+rWi4tBciyn6mMWi/tGXhAmZcRNFjlI+hHXCjvZlnqTYzDbVpdhgNfdZPPateVef5f
         Icy7X+O7fv0MkBkVXINnhl346F8mZd64e9FRQFh9Flfj7eZX3yedgzGfQUYK4od15Sbl
         GqgAiu13O2LPOTD2lgHx3MyrIxj+VrsQQVGMELPMBzSiTu7zSMDpY27KnKS1vXzvJLEb
         5kcw==
X-Gm-Message-State: AOJu0YwCtB9yQhUpa2JmXz60LokPACw+JhU2eT2aioncptkM+NVsrhKW
	3PZWwGXWR+dNQcmF5ftPZDG6zszBWbSL//nItdc+T2S0TqEPv65m2wu/JgsLPN3Q1mQcZ4DNg3m
	Oxhgj+zpfi6QY9hOek5c0FZv1drFdtCxZYl9zfCVu1HBlV9ifgcUv/zgq8bAabw==
X-Gm-Gg: Acq92OE4TvaiPQa2ZvTBmWR+CmqAYNWBVivYGIP5iUJx0NmunJzOD04i5cJwaFnD9qN
	HrK3U3clCOrJHcI8Zj31Ub9fZG9ruLa95FtKXJuFiM8MO8uu2B1PYsNyTPFxhLuarGNxvXvYJ46
	X5Xls45JkLLp+BXQlGiRJNq5Sg2TW7YioH7oixa/KkxtwxfuHDHhiVTLMSttNIX4J949wnYXzVx
	B6EKHu3ynyHgI9uLzKLU1CrrBU932Hkf1wbg5foeqDEoKTtBibq/oSCiEX+fvnj1S7ieOGp+vHT
	zI+UgtEhREaJ6Df9Z5xZSV6dvMS9OGB1e5u/sTLAePfYKcdv6i2E
X-Received: by 2002:a05:622a:4ccb:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-5177b845b46mr620101cf.0.1780441193351; Tue, 02 Jun 2026
 15:59:53 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 15:59:41 -0700
X-Gm-Features: AVHnY4L0fPPMOsUWEhFnL_aH3jeJGELu_Bm9jNF3BBQuzsvt5nfdMCETJHtlglc
Message-ID: <CAEPZvmPApfS6ScUDFuA49Q+QQUNgkWtUWnLfaMUwJp+nFJtjNQ@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Stack
 Buffer Overflow in PHAL createDeconfigRecords via std::copy
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e14df806534d44ef"

--000000000000e14df806534d44ef
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a stack buffer overflow vulnerability inside the
PHAL service actions of the openpower-pels extension.

Overview of the Vulnerability:
An unprivileged local D-Bus user can trigger a stack-based buffer overflow
inside the core phosphor-logging daemon by submitting a malformed event log
featuring a long PHAL callout. This results in stack corruption and crashes
the event-logging manager daemon (Denial of Service).

Affected File and Location:
File: extensions/openpower-pels/phal_service_actions.cpp
Line: 188

Root Cause:
The `createDeconfigRecords` function parses callout metadata from
user-supplied JSON and extracts the dynamically-sized `EntityPath` byte
vector. It then attempts to copy the entire vector directly into a
fixed-size stack array `physBinPath` (of type `ATTR_PHYS_BIN_PATH_Type`)
using the `std::copy` algorithm:
  ATTR_PHYS_BIN_PATH_Type physBinPath;
  std::copy(entityPath.begin(), entityPath.end(), physBinPath);

Because the code performs no length verification or bounds checks before
executing the copy, a payload with an `EntityPath` vector larger than the
`physBinPath` array capacity will overflow the stack array boundary,
corrupting adjacent stack variables.

Proof of Concept:
1. Issue an event log creation request over D-Bus containing a PHAL callout
JSON structure.
2. Inside the callout payload, define the `EntityPath` array containing a
list of bytes whose total size exceeds the bounds of
`sizeof(ATTR_PHYS_BIN_PATH_Type)`.
3. The logging daemon parses the log, triggers `createDeconfigRecords()`,
and immediately crashes with a stack overflow segmentation fault.

Proposed Patch:
Add a boundary check before copying to ensure the source vector length does
not exceed the target buffer capacity:

  auto entityPath = _callout.at("EntityPath").get<EntityPath>();
  if (entityPath.size() > sizeof(ATTR_PHYS_BIN_PATH_Type))
  {
      lg2::error("Deconfig: EntityPath size ({SIZE}) exceeds target buffer
capacity ({CAP}",
                 "SIZE", entityPath.size(), "CAP",
sizeof(ATTR_PHYS_BIN_PATH_Type));
      continue;
  }
  ATTR_PHYS_BIN_PATH_Type physBinPath;
  std::copy(entityPath.begin(), entityPath.end(), physBinPath);

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000e14df806534d44ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
stack buffer overflow vulnerability inside the PHAL service actions of the =
openpower-pels extension.<br><br>Overview of the Vulnerability:<br>An unpri=
vileged local D-Bus user can trigger a stack-based buffer overflow inside t=
he core phosphor-logging daemon by submitting a malformed event log featuri=
ng a long PHAL callout. This results in stack corruption and crashes the ev=
ent-logging manager daemon (Denial of Service).<br><br>Affected File and Lo=
cation:<br>File: extensions/openpower-pels/phal_service_actions.cpp<br>Line=
: 188<br><br>Root Cause:<br>The `createDeconfigRecords` function parses cal=
lout metadata from user-supplied JSON and extracts the dynamically-sized `E=
ntityPath` byte vector. It then attempts to copy the entire vector directly=
 into a fixed-size stack array `physBinPath` (of type `ATTR_PHYS_BIN_PATH_T=
ype`) using the `std::copy` algorithm:<br>=C2=A0 ATTR_PHYS_BIN_PATH_Type ph=
ysBinPath;<br>=C2=A0 std::copy(entityPath.begin(), entityPath.end(), physBi=
nPath);<br><br>Because the code performs no length verification or bounds c=
hecks before executing the copy, a payload with an `EntityPath` vector larg=
er than the `physBinPath` array capacity will overflow the stack array boun=
dary, corrupting adjacent stack variables.<br><br>Proof of Concept:<br>1. I=
ssue an event log creation request over D-Bus containing a PHAL callout JSO=
N structure.<br>2. Inside the callout payload, define the `EntityPath` arra=
y containing a list of bytes whose total size exceeds the bounds of `sizeof=
(ATTR_PHYS_BIN_PATH_Type)`.<br>3. The logging daemon parses the log, trigge=
rs `createDeconfigRecords()`, and immediately crashes with a stack overflow=
 segmentation fault.<br><br>Proposed Patch:<br>Add a boundary check before =
copying to ensure the source vector length does not exceed the target buffe=
r capacity:<br><br>=C2=A0 auto entityPath =3D _<a href=3D"http://callout.at=
">callout.at</a>(&quot;EntityPath&quot;).get&lt;EntityPath&gt;();<br>=C2=A0=
 if (entityPath.size() &gt; sizeof(ATTR_PHYS_BIN_PATH_Type))<br>=C2=A0 {<br=
>=C2=A0 =C2=A0 =C2=A0 lg2::error(&quot;Deconfig: EntityPath size ({SIZE}) e=
xceeds target buffer capacity ({CAP}&quot;, <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;SIZE&quot;, entityPath.size(), &qu=
ot;CAP&quot;, sizeof(ATTR_PHYS_BIN_PATH_Type));<br>=C2=A0 =C2=A0 =C2=A0 con=
tinue;<br>=C2=A0 }<br>=C2=A0 ATTR_PHYS_BIN_PATH_Type physBinPath;<br>=C2=A0=
 std::copy(entityPath.begin(), entityPath.end(), physBinPath);<br><br>Legal=
 Name for Attribution: Bhargava Naidu Gulla<br></div>

--000000000000e14df806534d44ef--

