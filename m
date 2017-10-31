Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::229; helo=mail-ua0-x229.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tUgLuDYd"; 
 dkim-atps=neutral
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRKdp0MYkzDr4B
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 05:29:59 +1100 (AEDT)
Received: by mail-ua0-x229.google.com with SMTP id v27so12737654uav.7
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=frd8gE4rL4Jy/Ln2kJdbGcmwiWlH4m4VgJslxaaMzKs=;
 b=tUgLuDYdCNXdrkc1hroRMqC3ACNaLtbhfAqM/DZXNCwoeBccFRFesMjXrwoqSSIhkg
 BSgRcgqBdJXDQHWw5Z4PCGpqDBO5fx0bp92QY/AKKnylISx18ugDX10zGr9yJWpXth1p
 AZ1nN78zx9LmCJunbwKeaEg0nPoCGnljcHsedUgfp3FdZ7EzkuEHn/XmzrvwiX/tb05E
 xlQJuQwWlNK6iTzI/S+Zc8LbBXKnKr84aHRV8XnjoQYSZTd20XB1JrsJmI8vLjZsjOWe
 mo+Ht8ZagIdhJ4MUCtekSBvfWy9yLr/n7zDbspGIwLgfd7uUBXq9vPgOyLsOrHPjDD/3
 9p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=frd8gE4rL4Jy/Ln2kJdbGcmwiWlH4m4VgJslxaaMzKs=;
 b=qQCRMrXyB+WvEsMbn6T4ttB+oAWzNVrCG5V7lJigQ3SwFsbH3nimvBxnrtMd/AKu0P
 HUoQr2kwqcf/0BwClbGCowseQ8KKn2QxkOHQW3mNvapN1j7slJ7Ah/Il6ISI5NmBwp27
 wDX4P2I5LF1+CwCHlUaHXC18BCw/hydkUwG+zBY+/wglg6l8SQYgL6ldp9Jho0kY58FS
 sppxVzx8b/oHLCYnsZGqFmBmix2YyUEJ3OFEbgcPpF9bMJ3ldOIl4u/yg3bAuJ5u9SRQ
 REiipT3k1jqIA5hZbIor+EaC+wKY9dKpYCAz5vOnMdVvsIMTqvNxfjI809vxBNynBizC
 IwjA==
X-Gm-Message-State: AMCzsaXCw83THAv5otrYt+eVqdUlaTPMRaZK4exmsEWIpTZLRFjEs/2H
 Go+MvbYGR8t3IeLK/JmdkxiFHv79tBpm9RF0+MOfGQ==
X-Google-Smtp-Source: ABhQp+R+bCXCzvNQN8MEZSxgePNGMC17ldWEJ41LNfdm9lsIkdQc33oG/owCol/Xd+6p9lXP+3yYehc1oCBCb5sj2kw=
X-Received: by 10.176.72.226 with SMTP id y31mr2386946uac.23.1509474595643;
 Tue, 31 Oct 2017 11:29:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.70.4 with HTTP; Tue, 31 Oct 2017 11:29:55 -0700 (PDT)
In-Reply-To: <000001d35265$080b01f0$182105d0$@linux.intel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
 <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
 <000001d35265$080b01f0$182105d0$@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 31 Oct 2017 11:29:55 -0700
Message-ID: <CAPLgG=kQwmnfc-HmWC-7zkN8L8o-xip6p3Kvmm4OWBozH37ppQ@mail.gmail.com>
Subject: Re: PECI API?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@linux.intel.com, 
 james.feist@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 18:30:33 -0000

On Tue, Oct 31, 2017 at 9:26 AM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>>> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com=
> wrote:
>>>
>>> Hi Dave,
>>>
>>> I'm currently working on PECI kernel driver
>>
>> I'm curious about the high level structure.  I'm sure others are as well=
.
>> Anything you can share would be informative and appreciated!
>>
>> A couple questions that popped into my head:
>>
>>  - Would there be a new Linux bus type or core framework for this?
>>  - How many drivers would there be for a full stack.  Something like thi=
s?
>>      - client? (hwmon, for example)
>>      - core? (common code)
>>      - bmc specific implementation? (aspeed, nuvoton, emulated differenc=
es)
>>  - Have you considered using DT bindings and/or how they would look?
>>
>> These questions are motivated by the recent upstreaming experience with
>> FSI (flexible support interface) where a similar structure was used.
>> FSI on POWER feels similar to PECI in terms of usage and features so I t=
hought
>> I'd just throw this out there as a possible reference point to consider.
>
> PECI is using single-wired interface which is different from other popula=
r
> interfaces such as I2C and MTD, and therefore it doesn't have any common =
core framework
> in kernel so I'm adding the PECI main contorl driver as an misc type and =
the other
> one into hwmon subsystem. The reason why I seperate the implementation in=
to two
> drivers is, PECI can be used not only for temperature monitoring but also=
 for
> platform manageability, processor diagnostics and failure analysis, so th=
e misc
> control driver will be used as a common PECI driver for all those purpose=
s flexibly
> and the hwmon subsystem driver will use the common PECI driver just for
> temperature monitoring. These drivers will be BMC specific implementation
> which support Aspeed shipset only. Support for Nuvoton chipset was not co=
nsidered
> in my implementation because Nuvoton has different HW and register scheme=
, also
> Nuvoton already has its dedicated driver implementation in hwmon subsyste=
m
> for their each chipset variant (nct6683.c  nct6775.c  nct7802.c).
>

Nuvoton is starting to submit support for their Poleg BMC to upstream
(http://lists.infradead.org/pipermail/linux-arm-kernel/2017-October/538226.=
html).
This BMC includes a PECI controller similar to the Aspeed design but
with a different register layout.  At a minimum, the misc driver needs
to support multiple backend drivers to allow Nuvoton to implement the
same interface.  The chips you listed that are already in hwmon are
for Nuvoton's SuperIOs, not their BMCs.

>>> and hwmon driver implementation. The kernel driver would provide these =
PECI commands as ioctls:
>>>
>>> - low-level PECI xfer command
>>
>> Would a separate 'dev' driver similar to i2c-dev make sense here?  Just =
thinking out loud.
>>
>
> Yes, drivers will be seperated into two but it's hard to say that this wa=
y is similar to i2c-dev.
> It would have a bit different shape.
>

I'm not terribly familiar with the PECI protocol.  I'll see about
getting a copy of the spec.  From what I can find via searches, it
looks like individual nodes on the bus are addressed similar to I2C.
I'd expect that to be similar to how i2c-dev is structured: a kobject
per master and a kobject per address on the bus.  That way, drivers
can be bound to individual addresses. The misc driver would focus on
exposing interacting with a specific address on the bus in a generic
fashion.

>>> - Ping()
>>> - GetDIB()
>>> - GetTemp()
>>> - RdPkgConfig()
>>> - WrPkgConfig()
>>> - RdIAMSR()
>>> - RdPCIConfigLocal()
>>> - WrPCIConfigLocal()
>>> - RdPCIConfig()
>>>
>>> Also, through the hwmon driver, these temperature monitoring features w=
ould be provided:
>>>
>>> - Core temperature
>>> - DTS thermal margin (hysteresis)
>>> - DDR DIMM temperature
>>> - etc.
>>
>> Sweet!
>>
>>>
>>> Patches will come in to upstream when it is ready.
>>>
>>> Cheers,
>>> Jae
>>
>> For completeness, a port of the Aspeed SDK PECI driver was proposed in 2=
016 but it didn't go anywhere:
>>
>> https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html
>>
>> thx - brad
>>
>
> My implementation is also heavily based on the Aspeed SDK driver but modi=
fied a lot to provide
> more suitable functionality for openbmc project. Hopefully, it could be i=
ntroduced soon.
>
> thx,
> Jae
>
> -----Original Message-----
> From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]
> Sent: Monday, October 30, 2017 12:22 PM
> To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: openbmc@lists.ozlabs.org; ed.tanous@linux.intel.com; james.feist@linu=
x.intel.com
> Subject: Re: PECI API?
>
>
>> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>=
 wrote:
>>
>> Hi Dave,
>>
>> I=E2=80=99m currently working on PECI kernel driver
>
> I=E2=80=99m curious about the high level structure.  I=E2=80=99m sure oth=
ers are as well.  Anything you can share would be informative and appreciat=
ed!
>
> A couple questions that popped into my head:
>
>  - Would there be a new Linux bus type or core framework for this?
>  - How many drivers would there be for a full stack.  Something like this=
?
>      - client? (hwmon, for example)
>      - core? (common code)
>      - bmc specific implementation? (aspeed, nuvoton, emulated difference=
s)
>  - Have you considered using DT bindings and/or how they would look?
>
> These questions are motivated by the recent upstreaming experience with F=
SI (flexible support interface) where a similar structure was used.  FSI on=
 POWER feels similar to PECI in terms of usage and features so I thought I=
=E2=80=99d just throw this out there as a possible reference point to consi=
der.
>
>> and hwmon driver implementation. The kernel driver would provide these P=
ECI commands as ioctls:
>>
>> - low-level PECI xfer command
>
> Would a separate =E2=80=98dev=E2=80=99 driver similar to i2c-dev make sen=
se here?  Just thinking out loud.
>
>> - Ping()
>> - GetDIB()
>> - GetTemp()
>> - RdPkgConfig()
>> - WrPkgConfig()
>> - RdIAMSR()
>> - RdPCIConfigLocal()
>> - WrPCIConfigLocal()
>> - RdPCIConfig()
>>
>> Also, through the hwmon driver, these temperature monitoring features wo=
uld be provided:
>>
>> - Core temperature
>> - DTS thermal margin (hysteresis)
>> - DDR DIMM temperature
>> - etc.
>
> Sweet!
>
>>
>> Patches will come in to upstream when it is ready.
>>
>> Cheers,
>> Jae
>
> For completeness, a port of the Aspeed SDK PECI driver was proposed in 20=
16 but it didn=E2=80=99t go anywhere:
>
> https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html
>
> thx - brad
>
