Return-Path: <openbmc+bounces-2022-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A56BCD6E5D
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:44:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVS8n5jPwz2yS4;
	Wed, 03 Jun 2026 09:44:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::831" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441531;
	cv=pass; b=Bjm3EXawwuhRiEBsATi5ylQ8LUax0xz74vb3y/S54hO7gElQsnfHLE+otqfvza1N2td/G28fiWVQE756+Eni8aZGAXrOP1sYGdaR4SSh6nhO/jkTSL+7fBzzThW89VHA1pYB3rjNpbBkwh+pWFcuQhDaxonzr+tmJNWBoGK2b7TR0WNfv3qL0YuAQHbkCyN1nk5lbn1cRcKjyYUeqGud/0ZDbiOmOQnWFAiriFjsXm7hSp6KQ/Co68D9rxUW+fsyhcFX987DzzBqc55PiwDIUI9x54N6YBqU+xaANFejJWTXN2u5pG6C5agg/BJys7nC2US115y+rETAbryyjoFsKA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441531; c=relaxed/relaxed;
	bh=Q0D/wejgLM8ZZoao/jCWy3yyRxSxYcxcp3NQZo8zoU8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PeuBRHjoxYBv/PViWMrW0Tmk846uJXZrbe5U7ingwT3IZXt0gECj82cfWYTmr3bUc7Hl7EKI67nQynFfWMqIJ+KSrznIPMFETC+5Br4k4c/eX6OUX9EybO5IIfKOf4FLp0gVWbuey6ho5NSils7sNeOhDMcEBSqtD5Pza9FeWOLXnEYR0LKVc2VuXtTQmAVpt26fNBqPcOTm/fjqfOZ+/y1y8MYfe0FYJJRQDWnOdiF3L2yAhgSpZf7s+QLw67A0rw5rr43bVnmFEho5RYjer4/9ZdPRuAN8olaNks5OvmHftZHC2BU0zCglSz2ASD7iAnwSHBtpEDwTL5xp1ekphg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZeqlqW6K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZeqlqW6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVRJB1zl3z2yMn
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 09:05:30 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5175d339e8bso121261cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 16:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441528; cv=none;
        d=google.com; s=arc-20240605;
        b=NNPglb4dsuI5w6TSY+V78LEPRhln3sqNfxKIHwQ60V0S2jQfQPxWVYrfGUkNgACiig
         05QwUov2B6Gb+oNMT/iAi6pOGFbGTyjazjhXJqdO6PbEz56ideEwoHwbQbMKNpNVVyN9
         yojw3g5q3I/Uu9hEtOYrQOSoISY3r5QHzXj4jV2ULEk3Wkji6NbdS9lwgPNXGy6Nl7Pa
         bTtMgJcfSVB6vVvCN5OYKL/+C5me02VItu9oxiknDaDtyTlNCP18WFUIiuSu2I0HlcAy
         CXbOKWOLzlvIfO0UG9ILnH6VQNBCx66ANXZ39Kau1knJMY2MUBY5XMeGrE5cllZDKT5H
         weew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Q0D/wejgLM8ZZoao/jCWy3yyRxSxYcxcp3NQZo8zoU8=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=WsjDw43nlXvYD7UOaDINN5LAVH2LQGTminW3Ei6tVHa/UquJQUwhyOOGoOsj0Xbhwb
         pSGXK7vB11rn3lzfYSJFNVePPIqddskEMLucXdDnlXmolkbnbr7a5qJBUCQFX57rM2V8
         kH0uMSvsBzVfV1qbjwVBCXfp4FCSyAkKT/x5KKo7tEjTriJJZlNghO3pLynR9BYQRqfC
         gKF2Hko0kX3jVs1h5WNaNDM+lwegP4ccM5q1T3dXdwAv3P0TsD+ZDWtcRVADphPuWYJm
         Tl2YBYW+ofcqAxD6FDuxnduEIlbFu8bbsT/ojpsjxbC64b73R9xdRU0yMER1zJg3UWMd
         oeEg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441528; x=1781046328; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q0D/wejgLM8ZZoao/jCWy3yyRxSxYcxcp3NQZo8zoU8=;
        b=ZeqlqW6KT/m3xl3YuKeoZHr/OPYGfAkbZcJ8DILrZzv/y1PwkW3CSwtDFj+K/SA1yT
         zyoFvvX4on9DS9oJF8p3Mee35xbp4OLwY63g+r6kiCksfifeYB7kuRbX0TKKzBgNB7Ty
         6Kcsk+E88otAhMKhnM8s1rS7Vkfkh7+uK7wgnSCjQa8BnWpj7qU3a5pOhYLGrnLW6pA3
         9WLxv8zRd22LjbHH8nVvdYSNrMTiPjF2TPKgx4ZYUzlaL0VK/OL25Xm3Ghm412gZtaw5
         bdDJH5QyyBUSXO40K8IP5BabhweQDvpMcPLeD0GuJIQUtvqsTs2X6hVK5iUXf1VOgEwS
         0+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441528; x=1781046328;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0D/wejgLM8ZZoao/jCWy3yyRxSxYcxcp3NQZo8zoU8=;
        b=j2sk8G09rm0R+lLcT9meaU7j3RlKKWinoJErfdpVoaeIcFLrTaHhU9pALmAKyAJNiz
         NOsIKrOhxTuwMVqeYmzYVNFK1dYif/tXT+fFVjI5eJ78M5VbU6/23PyKqPX4eEfZH9nl
         CCKFl4kaiG1C+XU/q8LYPd3+ttE9zLxSpw2aMLJlumExB+WaVbSxEwmu0BbzQQOllWbv
         G+csyWk6JlbXaXV8Ekf0f9zus3K+rFlIYAmTls09iCbqWi3LTD5WchgCH7vUk5bJyG/y
         YMcBNQfm6IPmh7kG/Qvg11oSjb1gW9w9NAoAVfS8CqS3ADWimr01lkRrGCwCih4y48GD
         0Rtg==
X-Gm-Message-State: AOJu0YxIcwjpzbKpM6/+Fq1Jv8UwhlZKgD6roQL4vU9f6JENvx+Fdztv
	bZC7Yr7z8iCSWKp18NjIR08icDt86MMMYTnBwo2jiTC4032WHkrrCxs7DDvpMFREoa6iaiNbupz
	XjDSYZ8xXYEnbpnFFI4KP3fb2eqECzu5oB+g1IuQs7XNRArelC7mY4LHUv7k=
X-Gm-Gg: Acq92OELFIJySA9yQy1lu0RSeLUzbCLaoW2plNQWNynhFXdIOpW9iVZFlGw2ghRNTR/
	FYFL3yDCVyneN9HaNQm1enuMy3L9XfFaI0EloYuHC+WU2Te3qrK64Jp9AxXjJ7BLv/c752KM2mW
	U849DSJHiWzrKF9/W0fekuy6z5yYbZs00L98IOblzL+UKOUUB7d1xgEBdFa7RARckwCWwVaa8w5
	zeqeHq42NCwf5Sh8m4FwpkBHMzISgaOUQYwJlLxeWK3glaC6ZnwHQ2Q4LEkj9m4JXdJqwx9HpXJ
	qCwq1AOuhUdoj0LeeyP/icdeCKcPMzkyGI7eZdcARz3kkHejkqqj
X-Received: by 2002:a05:622a:791b:20b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-5177b9a2985mr258561cf.8.1780441527403; Tue, 02 Jun 2026
 16:05:27 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 16:05:15 -0700
X-Gm-Features: AVHnY4LAEDv3MIBYeZvbjMMhSElX9453DpWZlrSueY4CERxluZJfoPGEJ0MRVNg
Message-ID: <CAEPZvmN7zz9D-tE=Zd=nsy4dKzN4hUY_snp2ntS0GtpkfGJYvQ@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Integer
 Underflow and Heap OOB Read in SbeFFDC::parse
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c985a606534d5803"

--000000000000c985a606534d5803
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report an integer underflow and out-of-bounds heap read
vulnerability inside the Self-Boot Engine (SBE) First Failure Data Capture
(FFDC) packet parsing logic of the openpower-pels extension.

Overview of the Vulnerability:
A malformed SBE FFDC file payload can trigger an integer underflow in
memory allocation and copy boundary calculations. This causes the logging
daemon to immediately crash due to an out-of-memory allocation failure
(Denial of Service) or triggers a massive out-of-bounds heap memory copy
via memcpy.

Affected File and Location:
File: extensions/openpower-pels/sbe_ffdc_handler.cpp
Line: 158

Root Cause:
In `SbeFFDC::parse`, the `lenWords` parameter is parsed directly from
unverified packet headers and used to determine memory allocations and
copies:
  uint32_t pktLenWords = lenWords - p10FfdcSkipWords;
  std::unique_ptr<uint32_t[]> ffdcData{new uint32_t[pktLenWords]()};
  ...
  std::memcpy(ffdcData.get(), ..., pktLenWords * sizeof(uint32_t));

If the packet contains a `lenWords` value that is smaller than the skipped
header words (`p10FfdcSkipWords` / `pozFfdcSkipWords`), the subtraction
underflows. Since the variables are unsigned 32-bit integers, `pktLenWords`
becomes a massive number.

This causes `new uint32_t` to request roughly 17 GB of memory, throwing
`std::bad_alloc` and crashing the daemon. If the integer wraps around
differently or a large value is parsed, `memcpy` will read beyond the
source buffer bounds, leaking memory or causing a segmentation fault.

Proof of Concept:
1. Forge a raw SBE FFDC telemetry payload bearing a valid P10 or P0Z header
signature.
2. In the packet header, set the `lengthinWords` field to `0` (to trigger
the subtraction underflow).
3. Pass this telemetry file to the PEL parser process.
4. Observe the daemon terminating immediately with a `std::bad_alloc`
memory allocation failure.

Proposed Patch:
Verify that `lenWords` is greater than or equal to the header skip sizes,
and ensure that the copy bounds do not exceed the size of the input
telemetry data:

if (lenWords < p10FfdcSkipWords || ffdcBufOffset + lenWords *
sizeof(uint32_t) > ffdcData.size())
{
    lg2::error("Malformed SBE packet: length exceeds input buffer size
limits");
    return;
}
uint32_t pktLenWords = lenWords - p10FfdcSkipWords;

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000c985a606534d5803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report an=
 integer underflow and out-of-bounds heap read vulnerability inside the Sel=
f-Boot Engine (SBE) First Failure Data Capture (FFDC) packet parsing logic =
of the openpower-pels extension.<br><br>Overview of the Vulnerability:<br>A=
 malformed SBE FFDC file payload can trigger an integer underflow in memory=
 allocation and copy boundary calculations. This causes the logging daemon =
to immediately crash due to an out-of-memory allocation failure (Denial of =
Service) or triggers a massive out-of-bounds heap memory copy via memcpy.<b=
r><br>Affected File and Location:<br>File: extensions/openpower-pels/sbe_ff=
dc_handler.cpp<br>Line: 158<br><br>Root Cause:<br>In `SbeFFDC::parse`, the =
`lenWords` parameter is parsed directly from unverified packet headers and =
used to determine memory allocations and copies:<br>=C2=A0 uint32_t pktLenW=
ords =3D lenWords - p10FfdcSkipWords;<br>=C2=A0 std::unique_ptr&lt;uint32_t=
[]&gt; ffdcData{new uint32_t[pktLenWords]()};<br>=C2=A0 ...<br>=C2=A0 std::=
memcpy(ffdcData.get(), ..., pktLenWords * sizeof(uint32_t));<br><br>If the =
packet contains a `lenWords` value that is smaller than the skipped header =
words (`p10FfdcSkipWords` / `pozFfdcSkipWords`), the subtraction underflows=
. Since the variables are unsigned 32-bit integers, `pktLenWords` becomes a=
 massive number. <br><br>This causes `new uint32_t` to request roughly 17 G=
B of memory, throwing `std::bad_alloc` and crashing the daemon. If the inte=
ger wraps around differently or a large value is parsed, `memcpy` will read=
 beyond the source buffer bounds, leaking memory or causing a segmentation =
fault.<br><br>Proof of Concept:<br>1. Forge a raw SBE FFDC telemetry payloa=
d bearing a valid P10 or P0Z header signature.<br>2. In the packet header, =
set the `lengthinWords` field to `0` (to trigger the subtraction underflow)=
.<br>3. Pass this telemetry file to the PEL parser process.<br>4. Observe t=
he daemon terminating immediately with a `std::bad_alloc` memory allocation=
 failure.<br><br>Proposed Patch:<br>Verify that `lenWords` is greater than =
or equal to the header skip sizes, and ensure that the copy bounds do not e=
xceed the size of the input telemetry data:<br><br>if (lenWords &lt; p10Ffd=
cSkipWords || ffdcBufOffset + lenWords * sizeof(uint32_t) &gt; ffdcData.siz=
e())<br>{<br>=C2=A0 =C2=A0 lg2::error(&quot;Malformed SBE packet: length ex=
ceeds input buffer size limits&quot;);<br>=C2=A0 =C2=A0 return;<br>}<br>uin=
t32_t pktLenWords =3D lenWords - p10FfdcSkipWords;<br><br>Legal Name for At=
tribution: Bhargava Naidu Gulla<br></div>

--000000000000c985a606534d5803--

