Return-Path: <openbmc+bounces-2023-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6CCD6E57
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:44:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVS985TtJz2ySl;
	Wed, 03 Jun 2026 09:44:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::833" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441148;
	cv=pass; b=F2LapHWfcOqd8k7qg2mCHxCzxAPgdkjrBIV9KkyGHTAxLsd9DpcDOSDsTcp+M/BEfnpgnernhwLnJ5e+idv3Avet5BzlhoN8meUlgwdzvndhDtzbiuygPIkA0oHguExril2mn+Z+HlX6Zam7169Bl0nsogoG6gDdT1w26+vVOsydwWPwSMjuK0ASsFz4avG0R93hoTzcHUI3B2KYzG2OoZ+m7aLb7fLXqq9FKoHJEy+Yi6QLNDJE3iBROBGtyZis+EqqzLYedlIkuGtWMdfwr+40XSfZTNJIXDOmBJhORxc8Ex4pKyLsCLC4xetFeBaOaqAY9t+a0mqSQNNlyQp9KA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441148; c=relaxed/relaxed;
	bh=9slTBVqZvIEnPgeuH1I4EjHx1pNVKEcD4pIbI1Xhw9Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GdSxiyavJ+sHI3OIY6jBG6BQffAsIh4EQMzqFkd3p+vjsC6+yDx5ugbbg5zlcXzFHT0/SmmnQoW3zeqgf1bJdSTpHeKIVZnrzWrBAEpQ5DdQB0ye8p+7jwUmrbCz9GmXw7cKFPShMH1FBWIZYOcbamBePFAvS00vVyLEsSMbjm1VzjyIEau7tk2nZcCwkysMqpw8X/z4QMWp535ANe4tLIm8iMbRMQPghWkwUbzjkFgJqKSWoR+dLH2DQ41GHZI3+MCSL2+BGbFjeI5xj4C9cPVYfxl1jqzUSN6OdgCHSTDUvFtGUWAOPGcg7Wpq7VRHYws1YBZL+JsXouOhfPp4Cg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ThWi3+Sw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ThWi3+Sw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVR8p56R5z2xLm
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 08:59:06 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50e61648f10so128501cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 15:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441144; cv=none;
        d=google.com; s=arc-20240605;
        b=UQ6tRwMstek0kfHJ+swNIp7EFpDIsV4izevVbNdH7c+A68WRFKdlSC/uESyhD2/u6V
         g51Ma16755YtzPT5xHpiON09Mq1vTeP0LpSUoiE59Be/dp3KL4ENMTSEu/mY1WwcS283
         wmYhelN5vbHq+Z5Zpx2tDnEscgUVgiBqGh1mSo+spNXNKFP7kYXfNYTIJEsSxMQeNobx
         Dy1vamasWjEwhNChe7rCYmL4FTmE2bkxpm03ad0cLI124322ERSZ9WFt1XZK9a/appqm
         PPf4Z0rPdem5Uxj76ojHLvDQgO+k9UoE3UnXYToxlNxphN027gwccfFIv3oGN59IQcf2
         Wv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9slTBVqZvIEnPgeuH1I4EjHx1pNVKEcD4pIbI1Xhw9Q=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=a3vztjstz2LNpyTFft9reFd/ePSf7+oGyyjU+lI572UyirBUSKYbZL3a8HIPpelXO6
         jKGCGDJHbCLKnC2Ar33kZnqX/Y0WSbuAUsmVq5D2D2+XYXqSjvMFfd/Kz9FWEfDffh1D
         C/jglMs/JjQ0zX8h8Ay4V0eIT4nliQ+VHYbeS/MeNFtMubobWQPbEmqc5SRVV1dv4qY7
         Sg/AwB9fK/CoRx5A/TNC+VCWagvqEs+9jR/aqs6d1L/KP42tEwbzDe8qqAara+JL5v1Q
         FQzBI33nQdDOltIQqrb6YZRniq+EUHddZ7Iu0yPIk/KBZRqdNX5gwU8jipIGsQOWKnzq
         jeNQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441144; x=1781045944; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9slTBVqZvIEnPgeuH1I4EjHx1pNVKEcD4pIbI1Xhw9Q=;
        b=ThWi3+Sw6eSm5Y/GebQ18hFg8hzP3ePnWqrijyQu6FVFE3++MvrG110AcFfgTnJFab
         3KOJ3oFG1x2/m5+wxVfxZq60Sr8/RYPWsk9zbfXt5KRt16Ot8EyBLMNqeFI3tRI8OvOZ
         latScnWVxFD/ZtP3WVKU8Tqfm/SXKTOwfJZm7pfssH/jZ4l6I5P7oPB6OD/CrK0RWRpN
         DwUGcON1slSS6xX7JKPKH7QiHzG/vP/2nThQNHWSrwCEaglRVk/HMDDjjBrzidqKGiE6
         ccxPZWkUNs6bVeyaaUQwikYnTgdGFPrLDaaEh4/steV4Q8rgoEdcyuIIuYjQRu/G/OKQ
         wh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441144; x=1781045944;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9slTBVqZvIEnPgeuH1I4EjHx1pNVKEcD4pIbI1Xhw9Q=;
        b=sFoUcYCu67FNL11cRI4AisCfpGVPq7hqFU/jGP5cPeddtGYaLJj1g6Ctv8ws7Glduo
         UX2lkBO4usiOd8+qL9ZHz+veHaSCQVg5rNaaYZZOyiCGpV4Fk04qXXxJ28fKT3AHMcIs
         N8EzGtPC7cEp0iGio+vNk/3J6TmX8bNtSNHkzZM+2EE27/+Vl5cI2PYXU+SgmqqvCTfV
         jC8rieyHPwMMeHiPdFrtQmGQkrriIZdK7/mcS3+1SBokIXu9uhkJksj1EApQ74TU6/FZ
         GTTLekZypaspB/M7Ey0/RxY/K9P4xqFMhmJ97FMHGJ0pCLGYF0fI/48bDwJJ9nLwPnil
         6b0w==
X-Gm-Message-State: AOJu0YxrXPMzUpUK+mmPvorTjfjQxkIZjy8BaDxMHz48zkc1UyfsnyGl
	vcRoMnY3cdL7LpFq0JXqDOFiiiVrfZF9AQ/jevUnPi+dF0r39jC8Kv2eqG+GI062r2xDHE3bJVJ
	zpQ9yTQYI4d5LP6miHJ6PmkdrfyEE6UnjV1uXMjIA+sXWMsnn8XZav6ANe2Fxgg==
X-Gm-Gg: Acq92OH7tAOQ5yzjIvC8kKms9AFAuR/afrmWeBVKlUkaEUbETzfih20O0Eg8fBML66E
	8S+SCtbLDdYi4lvkYEnraJEJVRz8Af3Btts+KEadlE0CTbUGC72CyipUF2JdqNaIIM/JuMRVwtp
	3Fwl3BkGP3aHaG8t9xeq4VAjIoBamKyICn60ookvh3CMOfm8/+IvKeTL5RmQ0WI+SHVy+tvkH3t
	loYChIWwK66c77XgqbV1We/sECbRg0i/pSKW9g2q9Fs5MZfOnpIg3QOZcHQCzFSwoDA85JHv3hx
	8mBFK74kl6KAnHMZ1HMhbgF8GyBD09DQo/5JDcWI4QiP1EJZdFuw
X-Received: by 2002:ac8:548c:0:b0:516:4f62:85e7 with SMTP id
 d75a77b69052e-5177bad0edcmr193241cf.18.1780441144039; Tue, 02 Jun 2026
 15:59:04 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 15:58:52 -0700
X-Gm-Features: AVHnY4IrbI3VoPojpNvLpDHo-6qt-xHrePtoOnIeQPDy0YJfraRBhplBIwfpIg8
Message-ID: <CAEPZvmPzVXeoPexbjtrLFeWaAbJ5hPuT2txSW1UZ-tkeSD0L5g@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / peltool: Local Privilege
 Escalation via Untrusted Python Search Path
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f0f2d106534d412c"

--000000000000f0f2d106534d412c
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a high-severity local privilege escalation
vulnerability inside the peltool diagnostic CLI utility.

Overview of the Vulnerability:
An unprivileged local attacker can execute arbitrary code under the context
of a privileged administrator running the `peltool` utility. When executed
by root from an insecure or world-writable directory (like `/tmp`), this
leads to a full Local Privilege Escalation (LPE) and system compromise.

Affected File and Location:
File: extensions/openpower-pels/tools/peltool.cpp
Line: 226

Root Cause:
The `getPlugins` function in `peltool.cpp` explicitly appends `"."` (the
current working directory) to Python's `sys.path` search list when
initializing the embedded Python interpreter for plugin loading:
  PyObject* pResult = PyDict_GetItemString(pDict, "path");
  PyObject* pValue = PyUnicode_FromString(".");
  PyList_Append(pResult, pValue);

When `peltool` processes a Platform Event Log (PEL) record, the
`getPythonJSON` helper dynamically resolves and imports user-data parser
plugin modules based on Creator Subsystem and Component IDs. Because the
current working directory is added to the Python search path, the
interpreter will prioritize importing custom parser scripts dropped by an
attacker in the current directory over legitimate system plug-ins.

Proof of Concept:
1. An unprivileged local user creates a malicious python script in a shared
directory, such as `/tmp/udparsers/b2000/b2000.py`, defining:
   def parseUDToJson(subType, version, data):
       import os
       os.system("cp /bin/sh /tmp/sh && chmod +s /tmp/sh") # Local
Privilege Escalation Payload
2. The attacker waits for a system administrator to run `sudo peltool -a`
(or any command parsing raw PELs) while their active shell's working
directory is `/tmp`.
3. `peltool` imports the module, executes the malicious script, and creates
a SUID root shell for the attacker in `/tmp/sh`.

Proposed Patch:
Remove the current working directory `"."` from the Python path list and
strictly restrict python imports to a trusted system folder:

// Remove this block in getPlugins():
// PyObject* pValue = PyUnicode_FromString(".");
// PyList_Append(pResult, pValue);

// Enforce a trusted system-only folder instead:
PyObject* pTrustedPath =
PyUnicode_FromString("/usr/share/phosphor-logging/pels/plugins");
PyList_Append(pResult, pTrustedPath);

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000f0f2d106534d412c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
high-severity local privilege escalation vulnerability inside the peltool d=
iagnostic CLI utility.<br><br>Overview of the Vulnerability:<br>An unprivil=
eged local attacker can execute arbitrary code under the context of a privi=
leged administrator running the `peltool` utility. When executed by root fr=
om an insecure or world-writable directory (like `/tmp`), this leads to a f=
ull Local Privilege Escalation (LPE) and system compromise.<br><br>Affected=
 File and Location:<br>File: extensions/openpower-pels/tools/peltool.cpp<br=
>Line: 226<br><br>Root Cause:<br>The `getPlugins` function in `peltool.cpp`=
 explicitly appends `&quot;.&quot;` (the current working directory) to Pyth=
on&#39;s `sys.path` search list when initializing the embedded Python inter=
preter for plugin loading:<br>=C2=A0 PyObject* pResult =3D PyDict_GetItemSt=
ring(pDict, &quot;path&quot;);<br>=C2=A0 PyObject* pValue =3D PyUnicode_Fro=
mString(&quot;.&quot;);<br>=C2=A0 PyList_Append(pResult, pValue);<br><br>Wh=
en `peltool` processes a Platform Event Log (PEL) record, the `getPythonJSO=
N` helper dynamically resolves and imports user-data parser plugin modules =
based on Creator Subsystem and Component IDs. Because the current working d=
irectory is added to the Python search path, the interpreter will prioritiz=
e importing custom parser scripts dropped by an attacker in the current dir=
ectory over legitimate system plug-ins.<br><br>Proof of Concept:<br>1. An u=
nprivileged local user creates a malicious python script in a shared direct=
ory, such as `/tmp/udparsers/b2000/b2000.py`, defining:<br>=C2=A0 =C2=A0def=
 parseUDToJson(subType, version, data):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0impor=
t os<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0os.system(&quot;cp /bin/sh /tmp/sh &amp;=
&amp; chmod +s /tmp/sh&quot;) # Local Privilege Escalation Payload<br>2. Th=
e attacker waits for a system administrator to run `sudo peltool -a` (or an=
y command parsing raw PELs) while their active shell&#39;s working director=
y is `/tmp`.<br>3. `peltool` imports the module, executes the malicious scr=
ipt, and creates a SUID root shell for the attacker in `/tmp/sh`.<br><br>Pr=
oposed Patch:<br>Remove the current working directory `&quot;.&quot;` from =
the Python path list and strictly restrict python imports to a trusted syst=
em folder:<br><br>// Remove this block in getPlugins():<br>// PyObject* pVa=
lue =3D PyUnicode_FromString(&quot;.&quot;);<br>// PyList_Append(pResult, p=
Value);<br><br>// Enforce a trusted system-only folder instead:<br>PyObject=
* pTrustedPath =3D PyUnicode_FromString(&quot;/usr/share/phosphor-logging/p=
els/plugins&quot;);<br>PyList_Append(pResult, pTrustedPath);<br><br>Legal N=
ame for Attribution: Bhargava Naidu Gulla<br></div>

--000000000000f0f2d106534d412c--

