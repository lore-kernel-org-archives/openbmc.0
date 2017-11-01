Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRvHG0xxDzDr4H
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 03:46:01 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2017 09:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="1032185447"
Received: from yoojae-mobl.amr.corp.intel.com (HELO yoojaeMOBL)
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 01 Nov 2017 09:45:55 -0700
From: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
To: "'Rick Altherr'" <raltherr@google.com>
Cc: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>,
 <ed.tanous@linux.intel.com>, <james.feist@linux.intel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
 <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
 <000001d35265$080b01f0$182105d0$@linux.intel.com>
 <CAPLgG=kQwmnfc-HmWC-7zkN8L8o-xip6p3Kvmm4OWBozH37ppQ@mail.gmail.com>
 <000301d35292$42d1b9a0$c8752ce0$@linux.intel.com>
 <CAPLgG==RZi1hV_m-+aw5fo4Wq_3OQLbddtY=ySJj-a50WNgTwA@mail.gmail.com>
In-Reply-To: <CAPLgG==RZi1hV_m-+aw5fo4Wq_3OQLbddtY=ySJj-a50WNgTwA@mail.gmail.com>
Subject: RE: PECI API?
Date: Wed, 1 Nov 2017 09:45:55 -0700
Message-ID: <000201d35330$e30fde80$a92f9b80$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKfNOke1vHnp6BvrppFVrx7wwrsnQIaBWYOArE97MwBWSx7MAJIWftdAT6Jk9ihGpxmkA==
Content-Language: en-us
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTRkY2MwNTgtODBhNS00NmIyLWEyMjQtYzE4M2Q4NTE3MmNkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImtnVisyTkxsa1Nhb0xCQnRZVDE4dWNJZGhjUG82YTZLMm45b2FPV1lsTlE9In0=
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
X-List-Received-Date: Wed, 01 Nov 2017 16:46:03 -0000

>>>> On Tue, Oct 31, 2017 at 9:26 AM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>>>>>> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>>>>>>
>>>>>> Hi Dave,
>>>>>>
>>>>>> I'm currently working on PECI kernel driver
>>>>>
>>>>> I'm curious about the high level structure.  I'm sure others are =
as well.
>>>>> Anything you can share would be informative and appreciated!
>>>>>
>>>>> A couple questions that popped into my head:
>>>>>
>>>>>  - Would there be a new Linux bus type or core framework for this?
>>>>>  - How many drivers would there be for a full stack.  Something =
like this?
>>>>>      - client? (hwmon, for example)
>>>>>      - core? (common code)
>>>>>      - bmc specific implementation? (aspeed, nuvoton, emulated
>>>>> differences)
>>>>>  - Have you considered using DT bindings and/or how they would =
look?
>>>>>
>>>>> These questions are motivated by the recent upstreaming experience =

>>>>> with FSI (flexible support interface) where a similar structure =
was used.
>>>>> FSI on POWER feels similar to PECI in terms of usage and features=20
>>>>> so I thought I'd just throw this out there as a possible reference =
point to consider.
>>>>
>>>> PECI is using single-wired interface which is different from other=20
>>>> popular interfaces such as I2C and MTD, and therefore it doesn't=20
>>>> have any common core framework in kernel so I'm adding the PECI=20
>>>> main contorl driver as an misc type and the other one into hwmon =
subsystem.
>>>> The reason why I seperate the implementation into two drivers is,=20
>>>> PECI can be used not only for temperature monitoring but also for=20
>>>> platform manageability, processor diagnostics and failure analysis, =

>>>> so the misc control driver will be used as a common PECI driver for =

>>>> all those purposes flexibly and the hwmon subsystem driver will use =

>>>> the common PECI driver just for temperature monitoring. These=20
>>>> drivers will be BMC specific implementation which support Aspeed=20
>>>> shipset only. Support for Nuvoton chipset was not considered in my=20
>>>> implementation because Nuvoton has different HW and register=20
>>>> scheme, also Nuvoton already has its dedicated driver=20
>>>> implementation in hwmon subsystem for their each chipset variant =
(nct6683.c  nct6775.c  nct7802.c).
>>>>
>>>
>>> Nuvoton is starting to submit support for their Poleg BMC to=20
>>> upstream =
(http://lists.infradead.org/pipermail/linux-arm-kernel/2017-October/53822=
6.html).
>>> This BMC includes a PECI controller similar to the Aspeed design but =

>>> with a different register layout.  At a minimum, the misc driver=20
>>> needs to support multiple backend drivers to allow Nuvoton to=20
>>> implement the same interface.  The chips you listed that are already =

>>> in hwmon are for Nuvoton's SuperIOs, not their BMCs.
>>>
>>
>> Thanks for your pointing out of the current Poleg BMC upstreaming. I =
didn't know about that before.
>> Ideally, it would be great if we support all BMC PECI controllers in =
a=20
>> single device driver but we should consider some dependencies such as =

>> SCU register setting in bootloader, clock setting for the PECI =
controller HW block and etc that would vary on each BMC controller =
chipset.
>> Usually, these dependencies should be covered by kernel config and =
device tree settings.
>> My thought is, each BMC controller should have its own PECI misc=20
>> driver then we could selectively enable one by kernel configuration.
>>
>
> Are you expecting each BMC controller's PECI misc driver to =
re-implement the device ioctls?
> If I assume the misc device and ioctl implementation are shared, I =
can't see how adding a subsystem would be significantly more work.
> Doing so would clarify what the boundaries are between controller =
implementation and protocol behavior.
>

Okay, I agreed. That is reasonable concern. At least, if possible, we =
should provide compatible
ioctl set. I'll check its feasibility after getting Nuvoton's datasheet =
and their SDK.

>>>>>> and hwmon driver implementation. The kernel driver would provide =
these PECI commands as ioctls:
>>>>>>
>>>>>> - low-level PECI xfer command
>>>>>
>>>>> Would a separate 'dev' driver similar to i2c-dev make sense here?  =
Just thinking out loud.
>>>>>
>>>>
>>>> Yes, drivers will be seperated into two but it's hard to say that =
this way is similar to i2c-dev.
>>>> It would have a bit different shape.
>>>>
>>>
>>> I'm not terribly familiar with the PECI protocol.  I'll see about =
getting a copy of the spec.
>>> From what I can find via searches, it looks like individual nodes on =
the bus are addressed similar to I2C.
>>> I'd expect that to be similar to how i2c-dev is structured: a=20
>>> kobject per master and a kobject per address on the bus.  That way,=20
>>> drivers can be bound to individual addresses. The misc driver would =
focus on exposing interacting with a specific address on the bus in a =
generic fashion.
>>>
>>
>> As you said, it would be very useful if kernel has core bus framework =

>> like I2C, but current kernel doesn't have the core bus framework for=20
>> PECI, and it would be a hugh project itself if we are going to =
implement one.
>
> Really?  IBM did so for FSI and it really helped with understanding =
the design.
>

Yes, IBM did really great work on FSI, Kudos to them.

>> Generally, PECI bus topology is very simple unlike I2C. Usually in a=20
>> single system, there is only one BMC controller and it has =
connections=20
>> with CPUs, that's all. I don't see an advantage of using core bus =
framework on this simple interface.
>>
>
> Ideally, an hwmon driver for PECI on an Intel CPU only needs to know =
how to issue PECI commands to that device.
> What address it is at and how the bus delivers the command to the node =
are irrelevant details.
> How do you plan to describe the PECI bus in a dts?
> Can I use the same dt bindings for the Intel CPU's PECI interface for =
both Aspeed and Nuvoton?
>

HW dependent parameters will be added into dts. All SoCs has its own dt =
binding set so it couldn't
be shared between Aspeed and Nuvoton.=20

>>>>>> - Ping()
>>>>>> - GetDIB()
>>>>>> - GetTemp()
>>>>>> - RdPkgConfig()
>>>>>> - WrPkgConfig()
>>>>>> - RdIAMSR()
>>>>>> - RdPCIConfigLocal()
>>>>>> - WrPCIConfigLocal()
>>>>>> - RdPCIConfig()
>>>>>>
>>>>>> Also, through the hwmon driver, these temperature monitoring =
features would be provided:
>>>>>>
>>>>>> - Core temperature
>>>>>> - DTS thermal margin (hysteresis)
>>>>>> - DDR DIMM temperature
>>>>>> - etc.
>>>>>
>>>>> Sweet!
>>>>>
>>>>>>
>>>>>> Patches will come in to upstream when it is ready.
>>>>>>
>>>>>> Cheers,
>>>>>> Jae
>>>>>
>>>>> For completeness, a port of the Aspeed SDK PECI driver was =
proposed in 2016 but it didn't go anywhere:
>>>>>
>>>>> https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html
>>>>>
>>>>> thx - brad
>>>>>
>>>>
>>>> My implementation is also heavily based on the Aspeed SDK driver=20
>>>> but modified a lot to provide more suitable functionality for =
openbmc project. Hopefully, it could be introduced soon.
>>>>
>>>> thx,
>>>> Jae
>>
