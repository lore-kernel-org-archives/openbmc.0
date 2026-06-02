Return-Path: <openbmc+bounces-2029-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107D6CD6E57
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:53:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL45wY9z3brL;
	Wed, 03 Jun 2026 09:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441249;
	cv=pass; b=V7g23XnFli5k/g2uxoAINlxbDqaNXeYW+AF3TpWvxWh8cIl8XNfXnDBDpAQa0RD4f1xNh9G2KQwscr8CncrZPghUnrhvWhKmHXOU7NwWcN5l0tkf93Bd8XNgcUmFmYk0Yat0T0m9XRpnlZFGnQIrpsAsWjGeAF9kQ9ecYo2z6pjMC7OTgVcIVPrEdHMj9z7vtQjoNeWdx0DhhtRylDzc+Bi60gxKNVDYpRUdUh6l/ggnPKCcffa3P3Slb0St3Vvy0feiEoVn8nXVDciEoM6GQY2ANN/TJPfYhNqbw8ukbSnGx6ZglrXnj09ce32vzOXOIJnTgua+q9n5TiMfYkEz8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441249; c=relaxed/relaxed;
	bh=gTK+XCoWPPK1j2d4QjH2gu3IKdbRhj4TWuux/jmi45s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ZNhxMXaVxrX1wFJbnymdRnxA34kAknVwLFs48MOgHCgLhZuuxdJVLAoRSwSIqcqWVgSPxqlA0Tl93GJBclV4tWqPSGGLnxlg3I5quZgFiDtsdvei6ESJKCjbBwbunf6RigO/9D/D0shKyG8cjiyRO3fiDGIOjQNZswuqqvoq24hrFJkAL0w48D1IYhh4FXG8W4gBwRgzWTTWRyKslP+W76YeDecPGiF71/bqqQMxrzDWfsA3fcFKHXquv/ZX2s625oeguh6+7Oi/Z8zRr3Ajq1OEMS34ERnh6/D79MbXoqM9xuwDNnJSJx1BidGVNdcvTap9aAWxZjKYvzTi5JJ57Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iADJJrGZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iADJJrGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVRBm47LBz2yMn
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 09:00:48 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765531803so111221cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 16:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441246; cv=none;
        d=google.com; s=arc-20240605;
        b=Rok5fdCKht8SwuY+zI58voxnY9mT2csMAthkoeZwC7Jm13YBFWiyRFY/LdTT2CFhK2
         WAzfqpWmWHZHy1jP/6g5HG1bE1n2rOdDvE3NHcTJu0ws9UczXs1554p+LmaXHAQxu9bH
         Hj9djnJwixNoqn8cPFz69nQVhBvW7Ci5POz0OC9VLOYoER65tKMRh5kRAF8ldPhv5izH
         jzx9w0xTMDK7q3a43wfKZOBOz5rp6+RdKqOUcn/rdfflkgQZNA1+QSTaNXB0X2gJijPH
         H89L1LYok9aBUZqYQ7vyjkLnovG4+V/IB5pF17TzmuOxYKMn6lmkjgFD+3WlQ7IrBH8p
         8ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gTK+XCoWPPK1j2d4QjH2gu3IKdbRhj4TWuux/jmi45s=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=XTwYpFjofvYWdHw/v/i/dv3Acsvzdpgflr2OgQUdcpkSCh2LHY74Gj5gyuShsc+Ge1
         Td0IOblhVXWcACiWjPdX806HFD8yo+2K9sEsQO83HysBZO/9aAPAn7L6L+ysFeEb14nA
         /Fy/Alh2yrZCKNKntL4ihjTUml/YKIf+ylaDo+vAaLXzfwdVcOvhoFZr4VXdgBsVy8fs
         CYZtbneJSN8NPs52yH/M34KaS2Z+c63hSX5lvrB28c+D/MF95b/lBk2BWhRIIMT8tEGq
         YoiSHmGY+ZcMpjDE2tsYhzJk4zo2xMhra7LB5S9RkZ1CcRo4qGE0P5sN5sqAw+WlVuf+
         bQxg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441246; x=1781046046; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gTK+XCoWPPK1j2d4QjH2gu3IKdbRhj4TWuux/jmi45s=;
        b=iADJJrGZIG4EnAmTz43T0nY6i40FAlOZXgyea2KtSnv3xYZv3Ey6hg4G9u56PJ97oi
         K35ejXOBk4S1oqNkTGmM3KueKPvO/e+UEK0eyo0pGJszyg3bHnb8vci0eL1J6G4OY+RB
         kwWYIbz98qjELVRv1scEGL/HwMrlNdI/W69lavsTvfVt88NOrTD+Mwl02UbyoHCgd1y9
         BGsIyFsFmONOdpvokgb7wqSrs5ZdemlwzuOqqwbsxaR7sdZkwIeyjsnOKkKFAH9C5FbS
         +B0GjLQYcFo+yspf6/G3RPsM+WdzXogegLTBdsp/NHWPWNdZt2gXAgF16L6mQ7y07b7X
         zHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441246; x=1781046046;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTK+XCoWPPK1j2d4QjH2gu3IKdbRhj4TWuux/jmi45s=;
        b=UfLcYrJ7XXDFuMPTGtSGd3FkW0iAFq0dqy6UgsAbwCOr/EhYhV3W4oUusHIfJ7DSFJ
         EtGBZDJVJtWuWeO8X9XaF8EBE0dYhjyw5LRUA71808qguSqEst2NfiEcmab9nWmAjjgu
         uaMw1L8ufxZ/V915eg5nv5yq3ZLR5IZXjRBMMzQ3fHdJPiTswAzbNVp1EwiPtxTVVwvx
         xNvnTuwxNSiVcPsh/EKbBu2J7ZlhH32UkljgJJMegr1hW5wEK1VyZJTaNF2ExInTzJ+d
         GCt/6JRxeJjjr8/fFkk6WHxavwJ/Z4uE6xoSEebG/vBq2FgvudchN38GLc2n53NGrtrw
         2IxQ==
X-Gm-Message-State: AOJu0Yz9iTogXNyvZfINAWthq2FPDSp+oHwteS0lam+Ut6YZVzhuedhW
	mL/xyJ/PKq17Bp2/owAphw/faWMdmye8q71j/K1X6NQdfCjUpGv67QL0wcwyfSeK1btXZL3gpRU
	z8/czfXEI5GHUoJlRqL8rD/+3uOdEFmkg5EFu5ECn7SrCIpc/qrrl3CAsT3P+2w==
X-Gm-Gg: Acq92OE8+7GvbD9Tewntb7kVOYOs6fojcXV/0YcRcBFeozxtarXeq0Xthlh4Q/AKV4v
	pNS0SNOPCibMStdufNAxpy28gCcLmrf5u9yJgLIzNS7yw1iCTaflZ3okVYucllreW8dzcZ3TueK
	FdCqTYX1+y7c0dCIjalG9aetM4kjcCBR0T6eOjrkbB5snQpGht8+c2lY62h/hLrZPxzxArOf/54
	Vxd4tKrRVMTkMUHJliW+b/+BHbSQtU67jEsyRWGFtFfDXjPpo0uN4BILEG/iSOAvXI3MrAY4TaV
	TE3IlhwF5mrKHuoBf52dsUaMbzKExhd/9eFg1L45xpvzIG9kgjJu
X-Received: by 2002:ac8:5885:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-5177b9c9ac1mr390601cf.10.1780441245027; Tue, 02 Jun 2026
 16:00:45 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 16:00:33 -0700
X-Gm-Features: AVHnY4JfZwRYBrTOuwdHtaCrd4tJcd38MiS1moDORF5fHWdHI0ebeTkBsiteD2k
Message-ID: <CAEPZvmNY6svndXqFsF9fPm9HTkofeaJqL0FkKhDpmUYcZtEERA@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Heap Buffer
 Overflow in dumpHex due to Signed Integer Overflow
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f7a49c06534d47f3"

--000000000000f7a49c06534d47f3
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a heap buffer overflow vulnerability inside the
Platform Event Log (PEL) formatting utilities of the openpower-pels
extension.

Overview of the Vulnerability:
A malformed or exceptionally large log payload can trigger an integer
overflow in the parser's heap buffer size calculation, leading to an
insufficiently small heap allocation. The subsequent string formatting loop
then writes outside the buffer boundaries, causing heap memory corruption.
This can be exploited to crash the logging daemon (Denial of Service) or
potentially achieve arbitrary code execution.

Affected File and Location:
File: extensions/openpower-pels/json_utils.cpp
Line: 73

Root Cause:
The `dumpHex` utility allocates a dynamic buffer to format binary data into
hexadecimal string outputs:
  std::unique_ptr<char[]> buffer{new char[std::max(70, 10 * (int)size)]()};

The function explicitly casts the unsigned `size_t size` parameter to a
signed 32-bit `int` before multiplying it by 10. If a large event payload
size is provided, the multiplication overflows the signed `int` limits and
wraps around into a negative or extremely small integer.

The `std::max` function evaluates this negative value and falls back to its
floor allocation of 70 bytes. However, the subsequent loop that
concatenates the hexadecimal symbols continues to run up to the *original*
un-truncated `size` using `strcat`, resulting in an out-of-bounds write
that corrupts adjacent heap memory.

Proof of Concept:
1. Submit an event log containing binary payload data whose size exceeds
`(INT_MAX / 10)` (approx 214 MB) to a utility that processes binary dumps
via `dumpHex`.
2. The signed integer casts wrap around during multiplication, allocating
only 70 bytes on the heap.
3. The formatting loop sequentially copies the hex output using `strcat` up
to the full 214 MB limit, corrupting the heap and crashing the process.

Proposed Patch:
Remove the explicit `(int)` cast and use safe unsigned `size_t` variables
for calculations:

std::unique_ptr<char[]> buffer{new char[std::max(static_cast<size_t>(70),
10 * size)]()};

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000f7a49c06534d47f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
heap buffer overflow vulnerability inside the Platform Event Log (PEL) form=
atting utilities of the openpower-pels extension.<br><br>Overview of the Vu=
lnerability:<br>A malformed or exceptionally large log payload can trigger =
an integer overflow in the parser&#39;s heap buffer size calculation, leadi=
ng to an insufficiently small heap allocation. The subsequent string format=
ting loop then writes outside the buffer boundaries, causing heap memory co=
rruption. This can be exploited to crash the logging daemon (Denial of Serv=
ice) or potentially achieve arbitrary code execution.<br><br>Affected File =
and Location:<br>File: extensions/openpower-pels/json_utils.cpp<br>Line: 73=
<br><br>Root Cause:<br>The `dumpHex` utility allocates a dynamic buffer to =
format binary data into hexadecimal string outputs:<br>=C2=A0 std::unique_p=
tr&lt;char[]&gt; buffer{new char[std::max(70, 10 * (int)size)]()};<br><br>T=
he function explicitly casts the unsigned `size_t size` parameter to a sign=
ed 32-bit `int` before multiplying it by 10. If a large event payload size =
is provided, the multiplication overflows the signed `int` limits and wraps=
 around into a negative or extremely small integer. <br><br>The `std::max` =
function evaluates this negative value and falls back to its floor allocati=
on of 70 bytes. However, the subsequent loop that concatenates the hexadeci=
mal symbols continues to run up to the *original* un-truncated `size` using=
 `strcat`, resulting in an out-of-bounds write that corrupts adjacent heap =
memory.<br><br>Proof of Concept:<br>1. Submit an event log containing binar=
y payload data whose size exceeds `(INT_MAX / 10)` (approx 214 MB) to a uti=
lity that processes binary dumps via `dumpHex`.<br>2. The signed integer ca=
sts wrap around during multiplication, allocating only 70 bytes on the heap=
.<br>3. The formatting loop sequentially copies the hex output using `strca=
t` up to the full 214 MB limit, corrupting the heap and crashing the proces=
s.<br><br>Proposed Patch:<br>Remove the explicit `(int)` cast and use safe =
unsigned `size_t` variables for calculations:<br><br>std::unique_ptr&lt;cha=
r[]&gt; buffer{new char[std::max(static_cast&lt;size_t&gt;(70), 10 * size)]=
()};<br><br>Legal Name for Attribution: Bhargava Naidu Gulla<br></div>

--000000000000f7a49c06534d47f3--

