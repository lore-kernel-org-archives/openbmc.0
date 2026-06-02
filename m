Return-Path: <openbmc+bounces-2027-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE5BCD6E5D
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:52:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL16zX5z3bpP;
	Wed, 03 Jun 2026 09:52:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::833" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441054;
	cv=pass; b=ix1XBZ3z2rL29USwIk8mTQ7fKLLmIVFNaP95rMTO0//YCZfgIqf/VM/C76FZZdNo+L6mqH6ouc8YU9sLHPO2FFZ4hxzVN+fqp6PJwvObn38DKMjcE/f/wawquS1Q1adchg1e3LV0rcAwAsZzJdfQ36WLaHOeYbaD0YueiJMcEwRSokJuiwcrp2u0wKgJrgFQFl/wHLZtjXhVNOQoJpz53BeVyt5vZUSFCSXbwVZQAwYutPFxCN/IMlQv1bCLwj7HmoEqZzz8ifbqu5vxzh1nmoIYMm/LDxAwiWrj1WIAbdbqH7KzDhO43owmmmtUrIqWQWcWIr6JfwyhpT+UqWP8xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441054; c=relaxed/relaxed;
	bh=awcEhRENXvnuCJdsTd8OMiMD/YXCxNVFd43085jhYq4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NIeQba0gCF+W21fEgcJZRLcJ9+MD/xCaHNjRtS/iD7zV7P2GI5WJvmD4kbI9vDGOYWc9Rr2lg44AG6IXAkP0eWpCNIprCKWR3BLFZOP4imlfOfQmSN/7FZ7Ts6nB70pLyFgqFMai1feqXXJInB0qlMwfwzcg+lo83HY0ViskSvChB8oM02802JI3oKIKHW8wF+YeQcApix/LEi62pPmScY75/rs30sIrI47y5I0Sh6tQFzrpipb1DPidHOxB39Lp2JJtaI/PYmw+GcWE4fB4a5bej5uxPkoWDcRFWQtwL+Dr5AbDU7xh+rVAx9I5701OiZOHDpS0UZlC7YEJObBdYQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hae35NME; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hae35NME;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVR705p02z2xLm
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 08:57:32 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50e61648f10so127131cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 15:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441050; cv=none;
        d=google.com; s=arc-20240605;
        b=c9AOVbKfXkPtsyTj+fSmYTSssAcXCoFCS0aST8AXX/zRj9XezBWKoH1RS/VK7v4BK0
         ShodL3qoFQrXe8KCjXUTHAtxmpXJRxStqOssPQsCtRj9mUBMQoX47NlIhuMFEm6zxRnH
         O0nXYIMCCMDZYSl/VKVjmRgew6YzbnsfmaI/xAqo8816yhSkAkQWlRJKkKtZzWIOrAmC
         KtbzYz5Umgy8TU9bYCjySqTGVeQHoXOHAMTmpCgrhbGgNr6N60SFS62txCEpCNCk9P8a
         l1iLRREAioU7003UBNuqag1pzaqqtC8niers3e+b8pmGOkcYFMb8Wmh+2iCuOjd5AOvu
         riMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=awcEhRENXvnuCJdsTd8OMiMD/YXCxNVFd43085jhYq4=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=BE+R926oupLS8lpelGvkHiyjgaNDzWk3ykcaqDjxvc3rVEQG3CBtAdfC3UHwluyC7D
         kolFGOe1B4IhHOL2N8cUEjlJPbTVXF7dke9vNd+rDv7oRspR9lkoNd3iV30cyJCiuiJ6
         gdJEyzfqIEh0odpFodzBXRXMNRzcLq5dag17Ujy9TMKY19xOBW2N2Is20S/oO9A87KcA
         0nMSPE97Rl+MjA9hNzHiuCGjYJke0Tk8EAHuUer8Wm68BCVd8LYrhaX/84UtmCZAB9je
         9rzkJszqIkqR4W7Nhp7zH6Zm35IowZqGkLuQ8sY0BI8HUAkj0YtVhKfl7wPZMJL8g0f7
         EbLg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441050; x=1781045850; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=awcEhRENXvnuCJdsTd8OMiMD/YXCxNVFd43085jhYq4=;
        b=hae35NMEv3vsnRCGNdtb0SumZJ8AppQg1DUcArDkcAhd+aYA8hK6r9E5ylyLKh2ybR
         Y/wp1ZxlwZYxEBrfWFA54eQ3QH8WTbf8ozVk8YqC42JM06QKA1c57pV+IF7hU3ZOBUJV
         DgR8LZo1bgi5QaZNnPhkiJP7ARWQ5HUG9PvhWGtqFVfHYP54m7VsnlgvZWk+B4zGJF6z
         Fa21BjJdHdFlNo1ul25HqW2g8bHDkL67c8LtYdEunvMwQtAobMVjjPaADUZD+X+Ojgyy
         ClG35UMsVeAljk0UGtKdPn1yYbUYrDXrMa567WN/0IOfg4b+f3ZI26k8v++OnV6fkYlQ
         wQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441050; x=1781045850;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awcEhRENXvnuCJdsTd8OMiMD/YXCxNVFd43085jhYq4=;
        b=jUvuXjuPVWPpI3WayC73S9ZqW8/6jn75h8dsDhLWyYwFMOoMPEG/jaAHbGfSxpeycc
         NJl7ZdZNXc4qXZ/DDJhPvzfT0n5rn0CSORWNnYzcBqnlqFdPxPPxtLOCojT0ZnRXH44o
         5E45N96/EUh/omC+QLyZZRQ9APuNi17NtvZkd91xxVW/oOR03TJGb7Vdv2Cp07al7ZIi
         vgZmH0avwcQwk+imx5yMCUFlH/wVdqkG4/9Yzx/em0dtm/zNvQG24c9QZqKDT1lr5GWd
         azt/w+YZ7OAuTaLv6EN3QTfmVjBCsKT1x5vaUJBqfqxp63giYKrPyO17aBCMv8zitM0s
         HSRw==
X-Gm-Message-State: AOJu0Yzk3oW6yUXTLcOmvi2abLJTGoIlG+D0f5IecHHyNkKy28tFy2lv
	qkNJJRzEb5pZN3p+zLEPFq3IVRpvjqUsb79zT5fX2VFP/GkaeIJ8HJRt9BmHaQzkk6PLbwrMd+K
	RePuT1LyDPDXSZi3xkCcot/RFF8Y6wPqfvw3A5A1Zu6yOaxb3ryiKGBYdsE8=
X-Gm-Gg: Acq92OGQGdCoVEv9jprSbzmrZewSUDVzZU5A+WjV97SUthC3bkCLhFPq57KJFW9PkNI
	qLMu1olY/GjqRk740m9d5k1oBxhlSXuyyglHjxYQtlJM5VQtRHaRw8pwEdYaSHInWZYGIBIeEAx
	w1HushLH8iAp6Y1fOh62Pv5SEbU0rVm98dW7udsbxoBCIL8gOuE8Ry3JhUhazQnynhoU5g/rDJs
	Rr5vjl51NfCh9EOqCIug2mmrAvku6j0nyiemMdBmrgrZHyJwVZH+YoPK5JIUIBcsi7rAsQeFbST
	BAoUExqR+BNwwYs0rUPoonKciJsdZbxTceIS2963IMKhhE3mdm5pizlEvFHveoY=
X-Received: by 2002:a05:622a:9010:b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-5177bacff46mr249481cf.14.1780441048976; Tue, 02 Jun 2026
 15:57:28 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 15:57:17 -0700
X-Gm-Features: AVHnY4J1aidWDmGjLdgJhQAVJ10elHpSLbuEbGW6_ad-FH336IPjBN2WEphE89Y
Message-ID: <CAEPZvmNngpE6P2Mje7_Kj18wXVzuMX7SA4wPwDGbwsmh=PgVNQ@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Arbitrary
 File Read and Deletion via RAWPEL Path Injection
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000045669406534d3c41"

--00000000000045669406534d3c41
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a critical vulnerability inside the Platform Event
Log (PEL) Manager component of the openpower-pels extension.

Overview of the Vulnerability:
An unprivileged local user or D-Bus client can read and permanently delete
arbitrary files on the BMC filesystem. Because the phosphor-logging daemon
runs with elevated (root) privileges, an attacker can exploit this to
delete critical system configurations, resulting in a system-wide Denial of
Service (DoS) or privilege escalation. Furthermore, sensitive file contents
can be leaked to accessible diagnostic logs if the file is not a valid PEL
format.

Affected File and Location:
File: extensions/openpower-pels/manager.cpp
Lines: 82 & 127

Root Cause:
The `Manager::create` D-Bus interface parses a `RAWPEL` value from the
user-supplied `AdditionalData` dictionary. This value is directly treated
as an absolute file path `rawPelPath` and passed to `Manager::addRawPEL`
without any path sanitization, sandboxing, or directory traversal checks.

The daemon immediately:
1. Performs an `std::filesystem::exists` check.
2. Opens the file using `std::ifstream`.
3. Irrevocably deletes the targeted file using `std::filesystem::remove`.

If the read file content is not a formally valid PEL structure, the parser
dumps the read contents verbatim into the internal `badPEL` diagnostic file
(/var/lib/phosphor-logging/extensions/pels/badPEL) which is world-readable.

Proof of Concept:
1. Execute the `Create` method on the Logging interface via D-Bus:
   busctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging
xyz.openbmc_project.Logging.Create Create ssa{ss} 'message' 'severity' 1
'RAWPEL' '/etc/shadow'
2. The daemon immediately reads the contents of `/etc/shadow` and deletes
it from the filesystem.
3. Because `/etc/shadow` is not a valid PEL, the daemon copies its read
bytes directly to `/var/lib/phosphor-logging/extensions/pels/badPEL` for
diagnostics, leaking the shadow file contents to local users.

Proposed Patch:
Validate that the incoming path resides strictly inside an allowlisted
temporary staging directory, and sanitize it against directory traversal:

void Manager::addRawPEL(const std::string& rawPelPath, uint32_t obmcLogID)
{
    std::filesystem::path inputPath(rawPelPath);
    // Restrict the path resolution strictly inside a secure, designated
folder
    std::filesystem::path sandboxedPath =
std::filesystem::path("/tmp/pels") / inputPath.filename();

    if (std::filesystem::exists(sandboxedPath))
    {
        std::ifstream file(sandboxedPath, std::ios::in | std::ios::binary);
        // ...
        std::error_code ec;
        std::filesystem::remove(sandboxedPath, ec);
    }
}

Legal Name for Attribution: Bhargava Naidu Gulla

--00000000000045669406534d3c41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
critical vulnerability inside the Platform Event Log (PEL) Manager componen=
t of the openpower-pels extension.<br><br>Overview of the Vulnerability:<br=
>An unprivileged local user or D-Bus client can read and permanently delete=
 arbitrary files on the BMC filesystem. Because the phosphor-logging daemon=
 runs with elevated (root) privileges, an attacker can exploit this to dele=
te critical system configurations, resulting in a system-wide Denial of Ser=
vice (DoS) or privilege escalation. Furthermore, sensitive file contents ca=
n be leaked to accessible diagnostic logs if the file is not a valid PEL fo=
rmat.<br><br>Affected File and Location:<br>File: extensions/openpower-pels=
/manager.cpp<br>Lines: 82 &amp; 127<br><br>Root Cause:<br>The `Manager::cre=
ate` D-Bus interface parses a `RAWPEL` value from the user-supplied `Additi=
onalData` dictionary. This value is directly treated as an absolute file pa=
th `rawPelPath` and passed to `Manager::addRawPEL` without any path sanitiz=
ation, sandboxing, or directory traversal checks. <br><br>The daemon immedi=
ately:<br>1. Performs an `std::filesystem::exists` check.<br>2. Opens the f=
ile using `std::ifstream`.<br>3. Irrevocably deletes the targeted file usin=
g `std::filesystem::remove`.<br><br>If the read file content is not a forma=
lly valid PEL structure, the parser dumps the read contents verbatim into t=
he internal `badPEL` diagnostic file (/var/lib/phosphor-logging/extensions/=
pels/badPEL) which is world-readable.<br><br>Proof of Concept:<br>1. Execut=
e the `Create` method on the Logging interface via D-Bus:<br>=C2=A0 =C2=A0b=
usctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging xyz.ope=
nbmc_project.Logging.Create Create ssa{ss} &#39;message&#39; &#39;severity&=
#39; 1 &#39;RAWPEL&#39; &#39;/etc/shadow&#39;<br>2. The daemon immediately =
reads the contents of `/etc/shadow` and deletes it from the filesystem.<br>=
3. Because `/etc/shadow` is not a valid PEL, the daemon copies its read byt=
es directly to `/var/lib/phosphor-logging/extensions/pels/badPEL` for diagn=
ostics, leaking the shadow file contents to local users.<br><br>Proposed Pa=
tch:<br>Validate that the incoming path resides strictly inside an allowlis=
ted temporary staging directory, and sanitize it against directory traversa=
l:<br><br>void Manager::addRawPEL(const std::string&amp; rawPelPath, uint32=
_t obmcLogID)<br>{<br>=C2=A0 =C2=A0 std::filesystem::path inputPath(rawPelP=
ath);<br>=C2=A0 =C2=A0 // Restrict the path resolution strictly inside a se=
cure, designated folder<br>=C2=A0 =C2=A0 std::filesystem::path sandboxedPat=
h =3D std::filesystem::path(&quot;/tmp/pels&quot;) / inputPath.filename();<=
br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 if (std::filesystem::exists(sandboxedPat=
h))<br>=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::ifstream file(sa=
ndboxedPath, std::ios::in | std::ios::binary);<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // ...<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::error_code ec;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 std::filesystem::remove(sandboxedPath, ec);<br>=C2=A0 =C2=
=A0 }<br>}<br><br>Legal Name for Attribution: Bhargava Naidu Gulla<br></div=
>

--00000000000045669406534d3c41--

