Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRQ5500qKzDr4P
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 08:50:29 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2017 14:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,326,1505804400"; d="scan'208";a="1031824567"
Received: from yoojae-mobl.amr.corp.intel.com (HELO yoojaeMOBL)
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 31 Oct 2017 14:50:26 -0700
From: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
To: "'Rick Altherr'" <raltherr@google.com>
Cc: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>,
 <ed.tanous@linux.intel.com>, <james.feist@linux.intel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
 <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
 <000001d35265$080b01f0$182105d0$@linux.intel.com>
 <CAPLgG=kQwmnfc-HmWC-7zkN8L8o-xip6p3Kvmm4OWBozH37ppQ@mail.gmail.com>
In-Reply-To: <CAPLgG=kQwmnfc-HmWC-7zkN8L8o-xip6p3Kvmm4OWBozH37ppQ@mail.gmail.com>
Subject: RE: PECI API?
Date: Tue, 31 Oct 2017 14:50:26 -0700
Message-ID: <000301d35292$42d1b9a0$c8752ce0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKfNOke1vHnp6BvrppFVrx7wwrsnQIaBWYOArE97MwBWSx7MKE1ls9A
Content-Language: en-us
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzNlZWNkZWUtZTVjYi00MWJlLTgwNzgtNTVlYjg4ZDg0YTdmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Im45WE5YbnRIQzFzczl0RnVmV1Z6VlVvYTBXdldPazY1SktLUmZSd1pRR2M9In0=
x-ctpclassification: CTP_IC
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Tue, 31 Oct 2017 21:50:34 -0000

>> On Tue, Oct 31, 2017 at 9:26 AM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>>>> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> Hi Dave,
>>>>
>>>> I'm currently working on PECI kernel driver
>>>
>>> I'm curious about the high level structure.  I'm sure others are as =
well.
>>> Anything you can share would be informative and appreciated!
>>>
>>> A couple questions that popped into my head:
>>>
>>>  - Would there be a new Linux bus type or core framework for this?
>>>  - How many drivers would there be for a full stack.  Something like =
this?
>>>      - client? (hwmon, for example)
>>>      - core? (common code)
>>>      - bmc specific implementation? (aspeed, nuvoton, emulated=20
>>> differences)
>>>  - Have you considered using DT bindings and/or how they would look?
>>>
>>> These questions are motivated by the recent upstreaming experience=20
>>> with FSI (flexible support interface) where a similar structure was =
used.
>>> FSI on POWER feels similar to PECI in terms of usage and features so =

>>> I thought I'd just throw this out there as a possible reference =
point to consider.
>>
>> PECI is using single-wired interface which is different from other=20
>> popular interfaces such as I2C and MTD, and therefore it doesn't have =

>> any common core framework in kernel so I'm adding the PECI main=20
>> contorl driver as an misc type and the other one into hwmon =
subsystem.=20
>> The reason why I seperate the implementation into two drivers is, =
PECI=20
>> can be used not only for temperature monitoring but also for platform =

>> manageability, processor diagnostics and failure analysis, so the =
misc=20
>> control driver will be used as a common PECI driver for all those=20
>> purposes flexibly and the hwmon subsystem driver will use the common=20
>> PECI driver just for temperature monitoring. These drivers will be =
BMC=20
>> specific implementation which support Aspeed shipset only. Support =
for=20
>> Nuvoton chipset was not considered in my implementation because=20
>> Nuvoton has different HW and register scheme, also Nuvoton already =
has
>> its dedicated driver implementation in hwmon subsystem for their each
>> chipset variant (nct6683.c  nct6775.c  nct7802.c).
>>
>
> Nuvoton is starting to submit support for their Poleg BMC to upstream
> =
(http://lists.infradead.org/pipermail/linux-arm-kernel/2017-October/53822=
6.html).
> This BMC includes a PECI controller similar to the Aspeed design but
> with a different register layout.  At a minimum, the misc driver needs
> to support multiple backend drivers to allow Nuvoton to implement the =
same
> interface.  The chips you listed that are already in hwmon are for
> Nuvoton's SuperIOs, not their BMCs.
>

Thanks for your pointing out of the current Poleg BMC upstreaming. I =
didn't know about that before.
Ideally, it would be great if we support all BMC PECI controllers in a =
single device driver
but we should consider some dependencies such as SCU register setting in =
bootloader, clock setting
for the PECI controller HW block and etc that would vary on each BMC =
controller chipset.=20
Usually, these dependencies should be covered by kernel config and =
device tree settings.
My thought is, each BMC controller should have its own PECI misc driver =
then we could
selectively enable one by kernel configuration.

>>>> and hwmon driver implementation. The kernel driver would provide =
these PECI commands as ioctls:
>>>>
>>>> - low-level PECI xfer command
>>>
>>> Would a separate 'dev' driver similar to i2c-dev make sense here?  =
Just thinking out loud.
>>>
>>
>> Yes, drivers will be seperated into two but it's hard to say that =
this way is similar to i2c-dev.
>> It would have a bit different shape.
>>
>
> I'm not terribly familiar with the PECI protocol.  I'll see about =
getting a copy of the spec.
> From what I can find via searches, it looks like individual nodes on =
the bus are addressed similar to I2C.
> I'd expect that to be similar to how i2c-dev is structured: a kobject =
per master and a kobject
> per address on the bus.  That way, drivers can be bound to individual =
addresses. The misc driver
> would focus on exposing interacting with a specific address on the bus =
in a generic fashion.
>

As you said, it would be very useful if kernel has core bus framework =
like I2C, but current kernel
doesn't have the core bus framework for PECI, and it would be a hugh =
project itself if we are going to
implement one. Generally, PECI bus topology is very simple unlike I2C. =
Usually in a single system,
there is only one BMC controller and it has connections with CPUs, =
that's all. I don't see an advantage
of using core bus framework on this simple interface. =20

>>>> - Ping()
>>>> - GetDIB()
>>>> - GetTemp()
>>>> - RdPkgConfig()
>>>> - WrPkgConfig()
>>>> - RdIAMSR()
>>>> - RdPCIConfigLocal()
>>>> - WrPCIConfigLocal()
>>>> - RdPCIConfig()
>>>>
>>>> Also, through the hwmon driver, these temperature monitoring =
features would be provided:
>>>>
>>>> - Core temperature
>>>> - DTS thermal margin (hysteresis)
>>>> - DDR DIMM temperature
>>>> - etc.
>>>
>>> Sweet!
>>>
>>>>
>>>> Patches will come in to upstream when it is ready.
>>>>
>>>> Cheers,
>>>> Jae
>>>
>>> For completeness, a port of the Aspeed SDK PECI driver was proposed =
in 2016 but it didn't go anywhere:
>>>
>>> https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html
>>>
>>> thx - brad
>>>
>>
>> My implementation is also heavily based on the Aspeed SDK driver but=20
>> modified a lot to provide more suitable functionality for openbmc =
project. Hopefully, it could be introduced soon.
>>
>> thx,
>> Jae
