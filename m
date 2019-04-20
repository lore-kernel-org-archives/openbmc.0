Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SVs+tRND"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44mF4R6W3XzDqT6
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 11:04:54 +1000 (AEST)
Received: by mail-it1-x12f.google.com with SMTP id f22so10607734ita.3
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 18:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K9EhwSBEbDAT52mlrk0w8JDNBUWf+6BPWj11nAGlZV8=;
 b=SVs+tRNDD/QYB7cbbcG5WLPZgfw3jBfaUdhfbhmHTS/QusD4dtuHu1ERmL/+qz1xEz
 QSmfAu1D+7U0iXUuHrEEoFPLlci1j8e52xQEacTKmYnEe++AKFNTuXxE7Ew8oV4/1E0l
 z/aqO/5UpJYyEoDl9YD0avYUhpK8cuMjmK8N5fUu2Cq5pG05plw3Rzr0AvRghYdqd2S2
 PPtg6Wfa8v0uopkjP8xvvT8Rqfzk62nJ5h/hJAXkNimFujyMJ5YMV1JSoacUwzhr654E
 KoOPRFbksoF5ymG1TpEcEcHcBDaquDj5ytF6uBzCuAj71pZB+ex4K7tYEiUiu4IP7puT
 vn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K9EhwSBEbDAT52mlrk0w8JDNBUWf+6BPWj11nAGlZV8=;
 b=NeVViLxV4G2OkJ2XXUES8AO+836kAcSIUJ40ZZYKhelIjv/Ef5cgzSjg1dCC69G3I8
 Hx5rHA7vzrAc5y3fDhmrhk4ZNONas4FOWCTWioJr0g2Yi1upssJSWJgCR5WSSMaBM8lO
 EqhRd8mVPFaHkSUmFK/B9IxKT4yXilCEVd8Tf6OufisHKdu5BniXY0uyLcmdmN1bm0pa
 7GhL2a4H5B7qR0yFWTDKRM7i7RyYEDWtg/RhgKYeO85mQJQupAGcVCv/sha1DVuouuAD
 xeeyPdvp/jsb8GP+SGCkC5RZagWg0l/MMWF31YIdl3fFWYMJet5I9TBRKMJ6n1pDTas+
 lfKQ==
X-Gm-Message-State: APjAAAUDpAcscFIGfqLbJE3UwKCINdDSrQrW3bfFQ+6FxYG1XZcLKJR+
 rlwS34DwT+MbUrJCbLdidnIuTMOD+8GWlZ0EXR6Ixw==
X-Google-Smtp-Source: APXvYqyiK9YVKSyh5YQXZaxQYe/WNSMVCVcrLBn5j5+AGR9kuLv17TTCkPYLbEpcyqMnL9FBjbtLFny06VibyW5U8o8=
X-Received: by 2002:a24:4a4a:: with SMTP id k71mr5059675itb.124.1555722291468; 
 Fri, 19 Apr 2019 18:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
 <OF97C597AB.3CC72488-ON002583D9.002BEC19-002583D9.00472178@notes.na.collabserv.com>
In-Reply-To: <OF97C597AB.3CC72488-ON002583D9.002BEC19-002583D9.00472178@notes.na.collabserv.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 19 Apr 2019 18:04:24 -0700
Message-ID: <CAGMNF6W7iLDYwKs=kj7QgRDdY7r=cTjVntT420-0QyUhtLfFqA@mail.gmail.com>
Subject: Re: BMC health metrics (again!)
To: Sivas Srr <sivas.srr@in.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 20 Apr 2019 01:04:56 -0000

Thanks Sivas. Response inline.

On Thu, Apr 11, 2019 at 5:57 AM Sivas Srr <sivas.srr@in.ibm.com> wrote:
>
> Thank you Kun Yi for your proposal.
> My input starts with word "Response:".
>
>
>
> With regards,
> Sivas
>
>
> ----- Original message -----
> From: Kun Yi <kunyi@google.com>
> Sent by: "openbmc" <openbmc-bounces+sivas.srr=3Din.ibm.com@lists.ozlabs.o=
rg>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Cc:
> Subject: BMC health metrics (again!)
> Date: Tue, Apr 9, 2019 9:57 PM
>
> Hello there,
>
> This topic has been brought up several times on the mailing list and offl=
ine, but in general seems we as a community didn't reach a consensus on wha=
t things would be the most valuable to monitor, and how to monitor them. Wh=
ile it seems a general purposed monitoring infrastructure for OpenBMC is a =
hard problem, I have some simple ideas that I hope can provide immediate an=
d direct benefits.
>
> 1. Monitoring host IPMI link reliability (host side)
>
> The essentials I want are "IPMI commands sent" and "IPMI commands succeed=
ed" counts over time. More metrics like response time would be helpful as w=
ell. The issue to address here: when some IPMI sensor readings are flaky, i=
t would be really helpful to tell from IPMI command stats to determine whet=
her it is a hardware issue, or IPMI issue. Moreover, it would be a very use=
ful regression test metric for rolling out new BMC software.
>
> Looking at the host IPMI side, there is some metrics exposed through /pro=
c/ipmi/0/si_stats if ipmi_si driver is used, but I haven't dug into whether=
 it contains information mapping to the interrupts. Time to read the source=
 code I guess.
>
> Another idea would be to instrument caller libraries like the interfaces =
in ipmitool, though I feel that approach is harder due to fragmentation of =
IPMI libraries.
>
> Response: Can we have it as a part of debug / tarball image to get respon=
se time and this can be used only at that time.
> And more over IPMI interface is not fading away? Will let others to provi=
de input.

Debug tarball tool is an interesting idea, though it seems from my
preliminary probing that getting command response from kernel stat
alone is not feasible without modifying the driver.

> 2. Read and expose core BMC performance metrics from procfs
>
> This is straightforward: have a smallish daemon (or bmc-state-manager) re=
ad,parse, and process procfs and put values on D-Bus. Core metrics I'm inte=
rested in getting through this way: load average, memory, disk used/availab=
le, net stats... The values can then simply be exported as IPMI sensors or =
Redfish resource properties.
>
> A nice byproduct of this effort would be a procfs parsing library. Since =
different platforms would probably have different monitoring requirements a=
nd procfs output format has no standard, I'm thinking the user would just p=
rovide a configuration file containing list of (procfs path, property regex=
, D-Bus property name), and the compile-time generated code to provide an o=
bject for each property.
>
> All of this is merely thoughts and nothing concrete. With that said, it w=
ould be really great if you could provide some feedback such as "I want thi=
s, but I really need that feature", or let me know it's all implemented alr=
eady :)
>
> If this seems valuable, after gathering more feedback of feature requirem=
ents, I'm going to turn them into design docs and upload for review.
>
> Response: As BMC is small embedded system, Do we really need to put this =
and may need to decide based on memory / flash foot print.

Yes, obviously it depends on whether the daemon itself is lightweight.
I don't envision it to be larger than any standard phosphor daemon.
Again, it could be configured and included on a platform-by-platform
basis.

>
> Feature to get even when BMC usage goes > 90%:
>
> From end user perspective,  If BMC performance / usages reaches consisten=
tly > 90% of BMC CPU utilization / BMC Memory / BMC file system then we sho=
uld have way to get an event accordingly. This will help end user. I feel t=
his is higher priority.
>
> May be based on the event, involved application should try to correct its=
elf.

Agree with generating event logs for degraded BMC performances. There
is a standard software watchdog that can reset/recover the system
based on configuration, and we are using it on our platforms, we
should look into whether it can be hooked up to generate an event.
[1] https://linux.die.net/man/8/watchdog

>
> If After this, BMC have good foot print then nothing wrong in having smal=
l daemon like procfs and use d-bus to get  performance metrics.

As I have mentioned, I think there are still values from a QA
perspective to profile the performance even if BMC itself is running
fine.

>
> With regards,
> Sivas
> --
>
> Regards,
> Kun
>
>
>


--
Regards,
Kun
