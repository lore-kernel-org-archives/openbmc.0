Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRGvR5RQvzDr26
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 03:26:43 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2017 09:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,324,1505804400"; d="scan'208";a="1031704569"
Received: from unknown (HELO yoojaeMOBL) ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 31 Oct 2017 09:26:40 -0700
From: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>
Cc: <openbmc@lists.ozlabs.org>, <ed.tanous@linux.intel.com>,
 <james.feist@linux.intel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
 <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
In-Reply-To: <29EB010F-5573-46E9-852B-60F084F50995@fuzziesquirrel.com>
Subject: RE: PECI API?
Date: Tue, 31 Oct 2017 09:26:40 -0700
Message-ID: <000001d35265$080b01f0$182105d0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKfNOke1vHnp6BvrppFVrx7wwrsnQIaBWYOoVWPgQA=
Content-Language: en-us
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjI5MjAzZTMtN2Y4Yi00YjY2LWFhODctMDQ5NzAzOTg5Y2UzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Imk3QlVNSDFaU0VIVTBzNk5VK3BoQis1d3pOY1lUMkhxckozdXZnZjEyem89In0=
x-ctpclassification: CTP_IC
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
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
X-List-Received-Date: Tue, 31 Oct 2017 16:26:44 -0000

>> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>>=20
>> Hi Dave,
>> =20
>> I'm currently working on PECI kernel driver
>
> I'm curious about the high level structure.  I'm sure others are as =
well.
> Anything you can share would be informative and appreciated!
>
> A couple questions that popped into my head:
>
>  - Would there be a new Linux bus type or core framework for this? =20
>  - How many drivers would there be for a full stack.  Something like =
this?
>      - client? (hwmon, for example)
>      - core? (common code)
>      - bmc specific implementation? (aspeed, nuvoton, emulated =
differences)
>  - Have you considered using DT bindings and/or how they would look?
>
> These questions are motivated by the recent upstreaming experience =
with
> FSI (flexible support interface) where a similar structure was used.
> FSI on POWER feels similar to PECI in terms of usage and features so I =
thought
> I'd just throw this out there as a possible reference point to =
consider.

PECI is using single-wired interface which is different from other =
popular
interfaces such as I2C and MTD, and therefore it doesn't have any common =
core framework
in kernel so I'm adding the PECI main contorl driver as an misc type and =
the other
one into hwmon subsystem. The reason why I seperate the implementation =
into two
drivers is, PECI can be used not only for temperature monitoring but =
also for
platform manageability, processor diagnostics and failure analysis, so =
the misc
control driver will be used as a common PECI driver for all those =
purposes flexibly
and the hwmon subsystem driver will use the common PECI driver just for
temperature monitoring. These drivers will be BMC specific =
implementation
which support Aspeed shipset only. Support for Nuvoton chipset was not =
considered
in my implementation because Nuvoton has different HW and register =
scheme, also
Nuvoton already has its dedicated driver implementation in hwmon =
subsystem
for their each chipset variant (nct6683.c  nct6775.c  nct7802.c).

>> and hwmon driver implementation. The kernel driver would provide =
these PECI commands as ioctls:
>> =20
>> - low-level PECI xfer command
>
> Would a separate 'dev' driver similar to i2c-dev make sense here?  =
Just thinking out loud.
>

Yes, drivers will be seperated into two but it's hard to say that this =
way is similar to i2c-dev.
It would have a bit different shape.

>> - Ping()
>> - GetDIB()
>> - GetTemp()
>> - RdPkgConfig()
>> - WrPkgConfig()
>> - RdIAMSR()
>> - RdPCIConfigLocal()
>> - WrPCIConfigLocal()
>> - RdPCIConfig()
>> =20
>> Also, through the hwmon driver, these temperature monitoring features =
would be provided:
>> =20
>> - Core temperature
>> - DTS thermal margin (hysteresis)
>> - DDR DIMM temperature
>> - etc.
>
> Sweet!
>
>> =20
>> Patches will come in to upstream when it is ready.
>> =20
>> Cheers,
>> Jae
>
> For completeness, a port of the Aspeed SDK PECI driver was proposed in =
2016 but it didn't go anywhere:
>
> https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html
>
> thx - brad
>

My implementation is also heavily based on the Aspeed SDK driver but =
modified a lot to provide
more suitable functionality for openbmc project. Hopefully, it could be =
introduced soon.

thx,
Jae

-----Original Message-----
From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]=20
Sent: Monday, October 30, 2017 12:22 PM
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: openbmc@lists.ozlabs.org; ed.tanous@linux.intel.com; =
james.feist@linux.intel.com
Subject: Re: PECI API?


> On Oct 23, 2017, at 1:03 PM, Jae Hyun Yoo =
<jae.hyun.yoo@linux.intel.com> wrote:
>=20
> Hi Dave,
> =20
> I=E2=80=99m currently working on PECI kernel driver

I=E2=80=99m curious about the high level structure.  I=E2=80=99m sure =
others are as well.  Anything you can share would be informative and =
appreciated!

A couple questions that popped into my head:

 - Would there be a new Linux bus type or core framework for this? =20
 - How many drivers would there be for a full stack.  Something like =
this?
     - client? (hwmon, for example)
     - core? (common code)
     - bmc specific implementation? (aspeed, nuvoton, emulated =
differences)
 - Have you considered using DT bindings and/or how they would look?

These questions are motivated by the recent upstreaming experience with =
FSI (flexible support interface) where a similar structure was used.  =
FSI on POWER feels similar to PECI in terms of usage and features so I =
thought I=E2=80=99d just throw this out there as a possible reference =
point to consider.

> and hwmon driver implementation. The kernel driver would provide these =
PECI commands as ioctls:
> =20
> - low-level PECI xfer command

Would a separate =E2=80=98dev=E2=80=99 driver similar to i2c-dev make =
sense here?  Just thinking out loud.

> - Ping()
> - GetDIB()
> - GetTemp()
> - RdPkgConfig()
> - WrPkgConfig()
> - RdIAMSR()
> - RdPCIConfigLocal()
> - WrPCIConfigLocal()
> - RdPCIConfig()
> =20
> Also, through the hwmon driver, these temperature monitoring features =
would be provided:
> =20
> - Core temperature
> - DTS thermal margin (hysteresis)
> - DDR DIMM temperature
> - etc.

Sweet!

> =20
> Patches will come in to upstream when it is ready.
> =20
> Cheers,
> Jae

For completeness, a port of the Aspeed SDK PECI driver was proposed in =
2016 but it didn=E2=80=99t go anywhere:

https://lists.ozlabs.org/pipermail/openbmc/2016-August/004381.html

thx - brad
