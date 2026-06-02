Return-Path: <openbmc+bounces-2025-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F6DCD6E5D
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:52:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL05N35z2yfD;
	Wed, 03 Jun 2026 09:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::834" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441362;
	cv=pass; b=Exg5GSlobrnddq3ar/oe+OKwVeULpwFAV2urpZQsYeMjLYXOELSZQr7Se1ChEkwM38POInWkGtBDpa+O2FGtkWbSaPW2AuCKoLuda52Ili3no79oG1kN/5it0GbnxQG1mw6XqnoM5hovdTBuHFgfOuh1CcvNpxIggswtxtQmWL2741wN/3OkHZFbqY8I3JPrfK7bP+MXURSKV/eIOK6NIx/KUyOzGK1F7Wkmh7XZ0ZpgocmjzqrZQbiOwvhqmY7GaZvw7/liXkZpHGHfdnck/wOolJNtt9JHF9ATQb3AW5dbSqrS3sywz3Qz4cVkCy5jFWxP8Uz+Ofu45Jo3P+AGQA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441362; c=relaxed/relaxed;
	bh=KDQSF4S1817kEr+VksISogN6tyUZ+m41ha2fjxdEKoY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GR2fxa/Mlbrx5PWNwn34pL1mKwROG3QIewk1trXB82JOv+sxCaiCEiosoH0J2im5IPuiWAqpy3ntM0N9y6D248GpCwn9z39fFph8uYOS7/G+mBzeXRCtiL1ftNdkTp9MbSu0d0iP2L0GP1cobTWgGhoJGK5H9Cpq1b1sfHw6KJ4QTzl3tja2Hqg9zfOcve+FgFlmEK27asQDElesBqMjn0ml9y7v7Bl/hX6hHLN4D4cX1/mKd7zLhabNSCYfcAgNpgdy0ODIEGbc5eDnqrrSZPJ71IH+eIbsRf4fHw2yrPVeUdWJGxYlFhRU3Y+7GLADOUE/TGqPavHbkt2ijyOIGw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Pg7yF4Jv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Pg7yF4Jv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVRDx4QB8z2yMn
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 09:02:41 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51765531803so112031cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 16:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441359; cv=none;
        d=google.com; s=arc-20240605;
        b=Vdg8KOV8OV5AZ41J1XNoP21m8t/FCM/F+Bs2sfOkzsSKYQVsyDftHLq54QjQkScks4
         AfCI5mJxNDU/gDYEOLl0JPoOMeXWrX6wabQyX7s+TySadoRfsEGfYLIF+vhhrse6s4xO
         X5Wl1CkHitlDujxKDL9Y4jNHFyvnNFk5X6lvCluBZRZACcvC2msL/0CiIY5Jh3L/ytGy
         mhXF4UBOMnJiZEHmz3pkbGvga+ty1eL6a8mZ1K7pD1EntPA4ugI9K/P28oc83aqVs6lF
         t4GPaHJP3G253x0YZTCYcIKzLfooZhVw4TnSBTfn9PYffrHWdVrPZIN1LTlbbR/SKK2u
         kN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KDQSF4S1817kEr+VksISogN6tyUZ+m41ha2fjxdEKoY=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=Kp302K8ae5T65iHvfJ0nl9r+w6ZHQ0Q9yUyggtYvDZoK7AOOPvxJ/z8N9Ke5zqiaMX
         VD+WDWSxcEU3lSzWvKgl2M5w569Gjgc3HuhtCkXsZ0lv0BDnpuga7m0Sn7lPxGEE3SfN
         tDYyMjHIIwGbHyArC1PyUjcardJ/aTXIqP+MpgT0Uwe2A6EAzBImbak0OFKx93tmIV57
         KNyVQFf7bhIu3HDwBb07ifq70sRuLlrhSZ1y1f4PXMzmsNlYHqq60yS/yIFcZVhz3REd
         aR8S24nOyQ8XifdUEHcggbOkXW4ii8jUwsDX4bW2voOxqatd5rwzNIFNe0H58VuKXkPG
         qyjQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441358; x=1781046158; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KDQSF4S1817kEr+VksISogN6tyUZ+m41ha2fjxdEKoY=;
        b=Pg7yF4JvHMBUB4bcqoB328ZqoZDdQ1JmNN/rTzM1ZaOHF8kQYtnik6oQ3nQo/zi1eH
         SZfebbnP3W5Yjga47nHHZofWaGPPaSOyAojzg6Dw9qnEvYqHLYQuqFdF2JPtk0e1Hlxk
         DRknCLokk8WVAGLXccQTrC0riuZ/tExUqZs2m+GcJ54ATT32YmYCvnwNMDHF0rVgQhh2
         UCLZDQkB4gQGfvQvrB7WN2435d0hZUAqEXcdktwb4yosmzwLxRUBz5/eAgi0WcNzqpam
         ABUz4wpCsgk2mkbmzbI1jVW/iCH/DUGuQQaOsmK17EkHnNhH5rgMgm6gmrv7SMouwtIp
         uQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441358; x=1781046158;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDQSF4S1817kEr+VksISogN6tyUZ+m41ha2fjxdEKoY=;
        b=rAtYBHKj/ITdlVK0Vtniwi5V2cdRrazrTvvtKEqF40ILZfskjsIYWFoCbnIbcsnNOn
         2QiuT5MBMgQuWzXIpkG264w4MikRivSOh1m6BY3bbPIWNyVJUgFco6K8C5tg/sJJkWaJ
         7AvcYeqQLfz7dLiVN2DYgwaZ6m1sKEsNMAmNMlnE4talKJ+UiSJJBbJqzalQyH7NTt+8
         5zsnljquZjY3WX3SkkkQraIXQjV0IgXdtPzT0UR74HCWZzhhI+/0+MGvlPsZamXHjo8y
         rYZr1A9GkPjaHFPQ3QNwzpuhKwpydfemY9WpC843pDaKd++QbbarmpndUKWuwvMI0L60
         Rb5w==
X-Gm-Message-State: AOJu0Yz2SiwQQ8QCEIiZo19BFqdcOI+6bvHlkwz5Vf617L9NbZpktPos
	fiVfYPqQxS4O6tBmQf2Rnv9Vbo7rixO6TcVoYCWCu/CYZjnF5eYoGbFv9OQrF05VsGb9LC0Feuz
	00eSZ4z6SulNn5yOoSY1aYUIe/ExFtkaHCIFTf5gsl2XSJI+6ocUWkSclvIIN8Q==
X-Gm-Gg: Acq92OHpI/nEnBOy+gZWjemhI6rK2803PYIi9TBlCuw/wdKB20Hc9yGg/E6Pkfq40kv
	Dh+plFhBeeAc4qcYa2cYAnKGmcTzqu4ryXMU7VW9egOyEPVE129WF22Ccc8Hj8iN8+0yK2IBbRB
	0dD/RLYi73WjRpGo69FlBn7kLJWeEtV5Upa4jSxLpiLwS9oSP4fVOIXVirvUWwLISbzqn2sETGw
	up1Ao4e49Mol0yPSbXfY3/2Oc1WGtRbkGCNF86/qoL1kCnyA1dx5CyqjsMpWYLYzPLN00gqxPDH
	18DyUFfuebWHqTk4e/t56e+XbR8ZtAN2xpLHMoXbQkNxwL5PBZSh
X-Received: by 2002:ac8:66d1:0:b0:517:6488:904a with SMTP id
 d75a77b69052e-5177bad00c7mr191841cf.20.1780441358073; Tue, 02 Jun 2026
 16:02:38 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 16:02:27 -0700
X-Gm-Features: AVHnY4KOxDLYSpw-DLZJWg1k5hgyD4Kg1XGLLOBvF22sAC8UW3OdZflftGg72oM
Message-ID: <CAEPZvmNSjSgupfW4w3LC5Ud7vP25Fg5YLFZ+Q02ak_ovetJ-Fw@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels:
 Out-of-Bounds Heap Read in FRUIdentity String Extraction
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b26cd006534d4e49"

--000000000000b26cd006534d4e49
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report an out-of-bounds heap read vulnerability inside the
FRU Identity parsing logic of the openpower-pels extension.

Overview of the Vulnerability:
A malformed or maliciously crafted Platform Event Log (PEL) record can
exploit a lack of null-termination validation in the FRU Identity parser.
This enables an attacker to leak sensitive adjacent heap memory contents
(information disclosure) over D-Bus and logs, or cause a daemon
segmentation fault (Denial of Service).

Affected File and Location:
File: extensions/openpower-pels/fru_identity.cpp
Lines: 121 & 133

Root Cause:
The `FRUIdentity` stream constructor reads exactly 8 bytes from the
untrusted incoming PEL stream into the fixed-size `_pnOrProcedureID`
character array:
  pel.read(_pnOrProcedureID.data(), _pnOrProcedureID.size());
This binary read does not append or enforce a trailing null-terminator
byte.

However, the getter methods (such as `getPN()` and `getMaintProc()`)
construct a C++ `std::string` using the raw pointer:
  std::string pn{_pnOrProcedureID.data()};

Because `std::string` assumes a null-terminated C-style string, it invokes
`strlen` internally. If a PEL payload features an 8-byte `_pnOrProcedureID`
filled entirely with non-null bytes, `strlen` will read out-of-bounds past
the array limit into adjacent memory structures (such as `_ccin` and `_sn`)
until a null byte is encountered.

Proof of Concept:
1. Craft a binary PEL stream featuring a `FRUIdentity` component block with
flags set to specify a Part Number is present (`pnSupplied`).
2. Populate the 8-byte `_pnOrProcedureID` block entirely with non-null
bytes (such as `AAAAAAAA`).
3. Fill contiguous adjacent payload blocks (`_ccin` and `_sn`) with
non-null bytes.
4. Query the log details via D-Bus. The returned string will leak the CCIN
and Serial Number fields alongside Part Number details because of the
un-bounded read.

Proposed Patch:
Construct the string using a safe bounded array range and explicitly handle
null search positions:

std::string pn{_pnOrProcedureID.data(), strnlen(_pnOrProcedureID.data(),
_pnOrProcedureID.size())};

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000b26cd006534d4e49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report an=
 out-of-bounds heap read vulnerability inside the FRU Identity parsing logi=
c of the openpower-pels extension.<br><br>Overview of the Vulnerability:<br=
>A malformed or maliciously crafted Platform Event Log (PEL) record can exp=
loit a lack of null-termination validation in the FRU Identity parser. This=
 enables an attacker to leak sensitive adjacent heap memory contents (infor=
mation disclosure) over D-Bus and logs, or cause a daemon segmentation faul=
t (Denial of Service).<br><br>Affected File and Location:<br>File: extensio=
ns/openpower-pels/fru_identity.cpp<br>Lines: 121 &amp; 133<br><br>Root Caus=
e:<br>The `FRUIdentity` stream constructor reads exactly 8 bytes from the u=
ntrusted incoming PEL stream into the fixed-size `_pnOrProcedureID` charact=
er array:<br>=C2=A0 pel.read(_pnOrProcedureID.data(), _pnOrProcedureID.size=
());<br>This binary read does not append or enforce a trailing null-termina=
tor byte. <br><br>However, the getter methods (such as `getPN()` and `getMa=
intProc()`) construct a C++ `std::string` using the raw pointer:<br>=C2=A0 =
std::string pn{_pnOrProcedureID.data()};<br><br>Because `std::string` assum=
es a null-terminated C-style string, it invokes `strlen` internally. If a P=
EL payload features an 8-byte `_pnOrProcedureID` filled entirely with non-n=
ull bytes, `strlen` will read out-of-bounds past the array limit into adjac=
ent memory structures (such as `_ccin` and `_sn`) until a null byte is enco=
untered.<br><br>Proof of Concept:<br>1. Craft a binary PEL stream featuring=
 a `FRUIdentity` component block with flags set to specify a Part Number is=
 present (`pnSupplied`).<br>2. Populate the 8-byte `_pnOrProcedureID` block=
 entirely with non-null bytes (such as `AAAAAAAA`).<br>3. Fill contiguous a=
djacent payload blocks (`_ccin` and `_sn`) with non-null bytes.<br>4. Query=
 the log details via D-Bus. The returned string will leak the CCIN and Seri=
al Number fields alongside Part Number details because of the un-bounded re=
ad.<br><br>Proposed Patch:<br>Construct the string using a safe bounded arr=
ay range and explicitly handle null search positions:<br><br>std::string pn=
{_pnOrProcedureID.data(), strnlen(_pnOrProcedureID.data(), _pnOrProcedureID=
.size())};<br><br>Legal Name for Attribution: Bhargava Naidu Gulla<br></div=
>

--000000000000b26cd006534d4e49--

