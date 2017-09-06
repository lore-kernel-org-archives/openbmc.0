Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::241; helo=mail-it0-x241.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LFgbtqiN"; 
 dkim-atps=neutral
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnXzr5mrlzDrSd
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 05:03:35 +1000 (AEST)
Received: by mail-it0-x241.google.com with SMTP id d6so1569004itc.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MP7Mf65Yjbz1572UVHW86N43P+kZ5HjvBWOj78uN/O8=;
 b=LFgbtqiNT78Oo6rbQqmKXG2D8dMGbLNbg6XC2FVG7J+Aizs4/nWtZqH5LqwuA93v2K
 OKM8LwgXFfea61iMXbS41DOjGuoSHSuOfHU31eAP/xI2uxT4tWUrLUdBKL4J6cuQiIiC
 yxz66W4obfXWXedSkNPAmzeuisEhaqIc/t0l/QfMJqzmNd2o1DzXz+X801Me55yCYimG
 Mp3dofEgc0pkqGKgZ899I4Cgwtikt+KNSU30Ya7Y7dvyfFdaMhgAivs4quq6XuDkEp1u
 TKKzE7rtxwa8EGuAOjXo7M0u3NMAPT1vdCxDlEi9Uhf1V6zknQEMJectmRiqqnFt27yr
 DyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=MP7Mf65Yjbz1572UVHW86N43P+kZ5HjvBWOj78uN/O8=;
 b=dldai+w1nNqv2xEMcKoDIma0nhHsMJpcW5ioe/kFZgecQVDF0A9zBjzPCW1Iyc9ZdO
 XcmVC3f0L77Xarm3km9WZui1qsr5qv4qVdGSXDmROsxEbmOjkZsCrBi4adNGLyXyYZvH
 ziGAMfSDiQsLi2fRc9GykDyXI3UznMfH+CPFncxN6ttq/fOOtqlb4hKqCnp5mR+rC/rA
 xmwoAbDnU3uMvH4COvpg2CT5wY3zr4pu1kMGGuSNh858+il43bPIT6qh/EKj7xnpCA/z
 dNTA/DV1qgdW15A/hPm9irhKvdxOD22/iADddeKm69q8RiiBNp40cW58MUbjxX3pbifg
 kUpQ==
X-Gm-Message-State: AHPjjUjCiczAiGTfD7c+AFOHUOtT4rA5nhuLeCZatmUMmp5JgVUUcY6J
 eZf1ivr2Z3MU5pSf7ocv0vLJMtjUhQdt
X-Google-Smtp-Source: ADKCNb7EEjJ1RkTn1EslO8zb94jfNRFNqfB0EGEui+b3E8VBxlQIQINCrQadjfYBaAY/hFFa1zp7RV9EUx0EWVZkI/k=
X-Received: by 10.36.166.12 with SMTP id q12mr864960ite.1.1504724612644; Wed,
 06 Sep 2017 12:03:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.151.73 with HTTP; Wed, 6 Sep 2017 12:03:31 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 6 Sep 2017 14:03:31 -0500
Message-ID: <CALLMt=q55PXP7_D49z2NHh9eZDzm1Z6MRzbSe=j1uaoUjsuFiA@mail.gmail.com>
Subject: RFC Systemd Service Restart Policy
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 19:03:37 -0000

I=E2=80=99ve got an old but good one this sprint,
https://github.com/openbmc/openbmc/issues/272

The point of this issue is to define our restart and recovery policy
for openbmc services.

Currently we=E2=80=99re using the systemd defaults, which are the following=
:
RestartSec=3D100ms
StartLimitIntervalSec=3D10s
StartLimitBurst=3D5
StartLimitAction=3Dnone

So basically if a service fails, we will restart it up to 5 times,
every 10s, with a 100ms delay between each restart.
There is no action taken when we reach the 5 restarts, other then to
do nothing until the 10s window has expired.

I=E2=80=99d like to propose a few changes for openbmc:

1.  Change the StartLimitBurst to 3
Five just seems excessive for our services in openbmc.  In all fail
scenarios I=E2=80=99ve seen so far (other then with phosphor-hwmon), either
restarting once does the job or restarting all 5 times does not help
and we just end up hitting the 5 limit anyway.

2. Change the RestartSec from 100ms to 1s.
When a service hits a failure, our new debug collection service kicks
in.  When a core file is involved we=E2=80=99ve found that generating 5 cor=
e
files within ~500ms puts a huge strain on the BMC.  Also, if we are
going to get a fix on a restart of a service, the more time the better
(think retries on device driver scenarios).

3. Define a StartLimitAction for critical services to =E2=80=9Creboot=E2=80=
=9D the BMC
With 1 and 2 above, we could have services starting indefinitely with
no real recovery on the BMC.  Certain services are critical though,
and I believe should result in a BMC reset to try and recover.  Those
service are the following:
   o dbus.service
   o xyz.openbmc_project.ObjectMapper.service

Some services that are on the bubble for me (external interfaces):
   o phosphor-ipmi-host.service
   o phosphor-ipmi-net.service
   o dropbear@.service
   o phosphor-gevent.service

I have some maintainability concerns with trying to pick specific
services to cause a BMC reboot.  Maybe it would be better to define a
default  that all services cause a BMC reboot, then pick specific
one=E2=80=99s that would not result in a reboot?  Or maybe it=E2=80=99s bes=
t to never
reboot, and just let the system owners manage it?  Thoughts
appreciated.

References:
https://www.freedesktop.org/software/systemd/man/systemd.unit.html#
