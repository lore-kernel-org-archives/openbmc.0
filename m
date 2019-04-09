Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iM8+SAdi"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dt2d4x3SzDqKS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 02:26:16 +1000 (AEST)
Received: by mail-it1-x12f.google.com with SMTP id w15so5964937itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QeujZTnYc6Odc4K0p08p1rCOeRdhklsix3nG9SqvDQs=;
 b=iM8+SAdiVkFjuua0cb7tevcO0rYF3Sguyya3He4FanWTBk+u36XdSPHl6D+cLLRTdx
 C/ywjqxLeXDvPW7TO5tt0syqIfhNf15jrki1yMyReOLLoNhgl0kW8VHj7BXypi5DvuQ+
 n1TO5PnUzEsy+NNEBGIk5StfR2AC2G27Fs13mu6Onq0C09yaSEGO9wRUDWIXV9ggrppA
 4/840XRLlJpxg+Zdo2DSjea4aZcpTxNoxK6ONZLY9Y+jZakhjqu9yw3joLsF7kCJ5S9i
 A+pSfZ7urJWNAW1tE1BOPzSVAH/bQhlbwlvXlKJNMoGwu98xv2s94QLo2Y3vRYjykUnd
 dp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QeujZTnYc6Odc4K0p08p1rCOeRdhklsix3nG9SqvDQs=;
 b=lI4oJqEf/y/YaTgt5pABNOUHsADHOTzuhRaEnQL91zd5AJr2h1kpAcX1rGS3rQl3WY
 fRVFnQfq/wWrb0OVO55BecMxa73N9da1PBPby65tgfdaDpRx2tm+6jsJWVFovJCgjnIY
 uynyVG5KyZapyhGH1u/0E/1jNlJ/nQ/u5q3XwsAPkmDmkAsBW5Hd5cacNgpYGDsVVWvV
 X6IVgEc0TBc5SmGZLkLKrkrEjzUZrCiZalm7yGoQUz5Htz7pjOopLJDGaGyabQoi7sx0
 IKY8budy33hIQEJ68IgTPqP5e0opRZPJnj6tQcTGGvwv0d3VoEpWsJsJpcso7uo0vWgF
 OfTg==
X-Gm-Message-State: APjAAAXZlzu6vTuo0iSSVSEaenIuWq+Eux4vGD4zdPnu8G10+j19qtQX
 ce7vuKH21HPGI3KarqkjhpU9rk2sMr9U2QmGQ3Nl6OQaBsUb3Q==
X-Google-Smtp-Source: APXvYqxJNNYVfSerUeQXle4jfFO3I2oejFd5+Tr6+9KFpYs8gYTTpiRrPHsMoe4+Ssd3+y/xX/INrc2/SmxL2uoVyDA=
X-Received: by 2002:a24:7688:: with SMTP id z130mr22314009itb.57.1554827172999; 
 Tue, 09 Apr 2019 09:26:12 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Tue, 9 Apr 2019 09:25:46 -0700
Message-ID: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
Subject: BMC health metrics (again!)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000055eefc05861b6954"
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
X-List-Received-Date: Tue, 09 Apr 2019 16:26:18 -0000

--00000000000055eefc05861b6954
Content-Type: text/plain; charset="UTF-8"

Hello there,

This topic has been brought up several times on the mailing list and
offline, but in general seems we as a community didn't reach a consensus on
what things would be the most valuable to monitor, and how to monitor them.
While it seems a general purposed monitoring infrastructure for OpenBMC is
a hard problem, I have some simple ideas that I hope can provide immediate
and direct benefits.

1. Monitoring host IPMI link reliability (host side)

The essentials I want are "IPMI commands sent" and "IPMI commands
succeeded" counts over time. More metrics like response time would
be helpful as well. The issue to address here: when some IPMI sensor
readings are flaky, it would be really helpful to tell from IPMI command
stats to determine whether it is a hardware issue, or IPMI issue. Moreover,
it would be a very useful regression test metric for rolling out new BMC
software.

Looking at the host IPMI side, there is some metrics exposed
through /proc/ipmi/0/si_stats if ipmi_si driver is used, but I haven't dug
into whether it contains information mapping to the interrupts. Time to
read the source code I guess.

Another idea would be to instrument caller libraries like the interfaces in
ipmitool, though I feel that approach is harder due to fragmentation of
IPMI libraries.

2. Read and expose core BMC performance metrics from procfs

This is straightforward: have a smallish daemon (or bmc-state-manager)
read,parse, and process procfs and put values on D-Bus. Core metrics I'm
interested in getting through this way: load average, memory, disk
used/available, net stats... The values can then simply be exported as IPMI
sensors or Redfish resource properties.

A nice byproduct of this effort would be a procfs parsing library. Since
different platforms would probably have different monitoring requirements
and procfs output format has no standard, I'm thinking the user would just
provide a configuration file containing list of (procfs path, property
regex, D-Bus property name), and the compile-time generated code to provide
an object for each property.

All of this is merely thoughts and nothing concrete. With that said, it
would be really great if you could provide some feedback such as "I want
this, but I really need that feature", or let me know it's all implemented
already :)

If this seems valuable, after gathering more feedback of feature
requirements, I'm going to turn them into design docs and upload for review.

-- 
Regards,
Kun

--00000000000055eefc05861b6954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div>Hello there,</div><div><br></di=
v><div>This topic has been brought up several times on the mailing list and=
 offline, but in general seems we as a community didn&#39;t reach a consens=
us on what things would be the most valuable to monitor, and how to monitor=
 them. While it seems a general purposed monitoring infrastructure for Open=
BMC is a hard problem, I have some simple ideas that I hope can provide imm=
ediate and direct benefits.</div><div><br></div><div>1. Monitoring host IPM=
I link reliability (host side)</div><div><br></div><div>The essentials I wa=
nt are &quot;IPMI commands sent&quot; and &quot;IPMI commands succeeded&quo=
t; counts over time. More metrics like response time would be=C2=A0helpful =
as well. The issue to address here: when some IPMI sensor readings are flak=
y, it would be really helpful to tell from IPMI command stats to determine =
whether it is a hardware issue, or IPMI issue. Moreover, it would be a very=
 useful regression test metric for rolling out new BMC software.</div><div>=
<br></div><div>Looking at the host IPMI side, there is some metrics exposed=
 through=C2=A0/proc/ipmi/0/si_stats if ipmi_si driver is used, but I haven&=
#39;t dug into whether it contains information mapping to the interrupts. T=
ime to read the source code I guess.</div><div><br></div><div>Another idea =
would be to instrument caller libraries like the interfaces in ipmitool, th=
ough I feel that approach is harder due to fragmentation of IPMI libraries.=
</div><div><br></div><div>2. Read and expose core BMC performance metrics f=
rom procfs</div><div><br></div><div>This is straightforward: have a smallis=
h daemon (or bmc-state-manager) read,parse, and process procfs and put valu=
es on D-Bus. Core metrics I&#39;m interested in getting through this way: l=
oad average, memory, disk used/available, net stats... The values can then =
simply be exported as IPMI sensors or Redfish resource properties.</div><di=
v><br></div><div>A nice byproduct of this effort would be a procfs parsing =
library. Since different platforms would probably have different monitoring=
 requirements and procfs output format has no standard, I&#39;m thinking th=
e user would just provide a configuration file containing list of (procfs p=
ath, property regex, D-Bus property name), and the compile-time=C2=A0genera=
ted code to provide an object for each property.=C2=A0</div><div><br></div>=
<div>All of this is merely thoughts and nothing concrete. With that said, i=
t would be really great if you could provide some feedback such as &quot;I =
want this, but I really need that feature&quot;, or let me know it&#39;s al=
l implemented already :)</div><div><br></div><div>If this seems valuable, a=
fter gathering more feedback of feature requirements, I&#39;m going to turn=
 them into design docs and upload for review.</div><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"m_894391115062551385m_1187092449188926744gmail_sign=
ature"><div dir=3D"ltr">Regards,<div>Kun</div></div></div></div></div></div=
>

--00000000000055eefc05861b6954--
