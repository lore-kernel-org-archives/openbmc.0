Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22c; helo=mail-it0-x22c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QBVBr4zW"; 
 dkim-atps=neutral
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415w9T0zzPzDrph
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 17:24:28 +1000 (AEST)
Received: by mail-it0-x22c.google.com with SMTP id p185-v6so7348006itp.4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 00:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=carhoCNZZFocKfv886vyoDEwGC3RHAnLeAhTsQ0r7I8=;
 b=QBVBr4zWCHP6oiRn4+MUYdviKeCkeVGj+Ug3jFat3kTXvCgoOrSTJcQGnsGCohG9nJ
 0RNe8nRXdwalEtf0ZWebwkVtKtXqB+OUDTtKB9vaaq9aemHY4i1BmIXKpAQoGzYNTNut
 DPV71DEudhaSNge5lwduvk++5UZQLHEIEKSiXOKJL/92RP4j3oGc+zYKYPX6aAwTD5yR
 eg539uMavn53GD4OcmyqgISR07IjieBcnjRVVeFvuixB2R5EmbEco3wJbcYucQ4zhdR+
 1GFfXXHywFC0sj/GpePrvVwUE7/4bgp0oCCrYDEUm3zlTZ52VxD+5IkmnReAJ96qfqYH
 720A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=carhoCNZZFocKfv886vyoDEwGC3RHAnLeAhTsQ0r7I8=;
 b=P119nTECG3WBInNjV6ItZyUDNBg2C78VaiPeW2w7uEySFUVql5gYSAH6UB4DpjKIse
 fzUjelAKpRio+2/UioOLwBEZ2/sh0OZGpfY0iImln1f8wJwoMDNBqk4RxyMfaT2pvffq
 x/zoFTY+bPcgx6b7jaMNJRBYkZvdUduSOGfgUZZdUgaTbxFQf4UzC5pRXFO/AIxLrDi1
 YfkMhc/epKYffPsdNYAzFJoM8GQ4TNLv5Vt8u7pALpJtrDKNZCr1Ui2xk504ymt+mNAO
 6tYQyrleGdRfyuBYYffLDD/CE+SYumzlvAupTFOSUxx7judUxs+R0UB23JZ/G+fkFObE
 CAsA==
X-Gm-Message-State: APt69E2SM0VLKKSW5c+ACvkCauugN+DXacrOhMlEn32mxTnEgUt9kZKs
 g3YHCWNKsERQH9HNzvwh7H+VrDiMtM/eDebFYqGEHMbz
X-Google-Smtp-Source: ADUXVKJIIOwl4w8ZGrSuOQKXhjNjoRHo9hyAGH6xtTRvqpzyx9v0eEGt1dJya+W2ckNhwfrcyRYQVPrKZMXVwHQHt+o=
X-Received: by 2002:a24:ac4a:: with SMTP id
 m10-v6mr1210826iti.14.1528961066151; 
 Thu, 14 Jun 2018 00:24:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:5385:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 00:24:25
 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
Date: Thu, 14 Jun 2018 15:24:25 +0800
Message-ID: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
Subject: Feature request in phosphor-pid-control
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="000000000000393af3056e94fd52"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2018 07:24:30 -0000

--000000000000393af3056e94fd52
Content-Type: text/plain; charset="UTF-8"

This email is about a feature request in phosphor-pid-control, that to
support
optional sensors.
It is mentioned in comment of https://gerrit.openbmc-project.xyz/#/c/11003/

Background:
Current phosphor-pid-control checks the temperature sensors and calculate
the
expected fan speed.
It assumes the temperature sensors are always available. And if the sensor
is
not there, the service throws exceptions.

The feature request:
I would like phosphor-pid-control to support "optional" sensors, that it may
be unavailable when system is running.
Such sensor is counted when it is available, and is ignored when it is
missing.

An use case:
I want to adjust fan speed based on cpu core or dimm temperature.
For a typical OpenPOWER P9 system, there could be at most 48 cores, but they
can be missing depending on the CPU, e.g. if a system is plugged CPUs with
22
cores, 4 cores temperature will be missing. And in run time, a core may be
garded if it has problem it will be missing as well.
The same for dimms, for a system with at most 16 dimms, it depends on how
many
dimms are attached.
In such case, the config will specify all the temperatures for cpu cores and
dimms, and phosphor-pid-control shall ignore the missing temperatures.

Patrick, what do you think about such case?

Thanks!

--000000000000393af3056e94fd52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This email is about a feature request in phosphor-pid=
-control, that to support</div><div>optional sensors.</div><div>It is menti=
oned in comment of <a href=3D"https://gerrit.openbmc-project.xyz/#/c/11003/=
">https://gerrit.openbmc-project.xyz/#/c/11003/</a></div><div><br></div><di=
v>Background:</div><div>Current phosphor-pid-control checks the temperature=
 sensors and calculate the</div><div>expected fan speed.</div><div>It assum=
es the temperature sensors are always available. And if the sensor is</div>=
<div>not there, the service throws exceptions.</div><div><br></div><div>The=
 feature request:</div><div>I would like phosphor-pid-control to support &q=
uot;optional&quot; sensors, that it may</div><div>be unavailable when syste=
m is running.</div><div>Such sensor is counted when it is available, and is=
 ignored when it is</div><div>missing.</div><div><br></div><div>An use case=
:</div><div>I want to adjust fan speed based on cpu core or dimm temperatur=
e.</div><div>For a typical OpenPOWER P9 system, there could be at most 48 c=
ores, but they</div><div>can be missing depending on the CPU, e.g. if a sys=
tem is plugged CPUs with 22</div><div>cores, 4 cores temperature will be mi=
ssing. And in run time, a core may be</div><div>garded if it has problem it=
 will be missing as well.</div><div>The same for dimms, for a system with a=
t most 16 dimms, it depends on how many</div><div>dimms are attached.</div>=
<div>In such case, the config will specify all the temperatures for cpu cor=
es and</div><div>dimms, and phosphor-pid-control shall ignore the missing t=
emperatures.</div><div><br></div><div>Patrick, what do you think about such=
 case?</div><div><br></div><div>Thanks!</div></div>

--000000000000393af3056e94fd52--
