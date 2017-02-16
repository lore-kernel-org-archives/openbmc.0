Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPVC14D8PzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 08:48:13 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Users of SBE FIFO kernel driver
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9eac83a7-bf3b-961f-2777-39dd33862c90@linux.vnet.ibm.com>
Date: Thu, 16 Feb 2017 16:48:08 -0500
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7041DA70-983A-47AE-BFC5-B2584BEDCF73@fuzziesquirrel.com>
References: <edb6e9b2-a7a1-d706-5eb6-5966c06b1113@linux.vnet.ibm.com>
 <CACPK8XdQ2LezJKXzT1Z9=09=XGv=G2ncVxY-LKj7LZ7BFQWaKA@mail.gmail.com>
 <0a7745db-75d8-43b5-acf6-6f789964bdc0@linux.vnet.ibm.com>
 <526fd16f-3edb-ba7e-9694-9e832c426499@linux.vnet.ibm.com>
 <e73eeb5f-2bae-2c37-1a73-8890cbfb29c9@linux.vnet.ibm.com>
 <20170209211659.flmbka7zmtopandl@asimov>
 <9eac83a7-bf3b-961f-2777-39dd33862c90@linux.vnet.ibm.com>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 16 Feb 2017 21:48:14 -0000

Trying to keep this discussion going.

> On Feb 10, 2017, at 1:58 AM, Venkatesh Sainath =
<vsainath@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
> On 10/02/17 2:46 AM, Patrick Williams wrote:
>> On Sat, Feb 04, 2017 at 04:35:30PM +0530, Venkatesh Sainath wrote:
>>>> Where do we stand with the sbei protocol device driver?  Who owns =
this
>>>> and is it complete?
>>>>=20
>>> The plan was to port the sbei protocol driver developed on FSP based
>>> systems. Chris: I believe Dhruvaraj discussed with you about this =
driver
>>> when he was in Austin. I can share the latest version of this =
driver.
>> Is this "driver" really a driver in the Linux sense or is it a shared
>> library that is used in FSP userspace?  Whatever code we end up using =
we
>> eventually need it to be upstream-able into the real Linux kernel.
> This is not really a driver in the Linux sense. It is a shared lib in =
FSP user space. As the OCC driver has to use this SBEI protocol, we  =
have to implement this as a Linux driver in OpenBMC
>> Is this something that Dhruv can take on or is this going to be left =
to
>> Chris?  How do we handle divergence between the open-source code and =
the
>> IBM proprietary version (the one direction is an IBM-internal =
problem,
>> but I have concern that future development will only be happening on
>> the proprietary one and we'll have to keep playing catch up).
>>=20
> The SBE interfaces are open-sourced and there may not be any =
proprietary implementation here. However, the code architecture between =
FSP and OpenBMC is different ( FSP - user space and OpenBMC - Linux =
driver ) and hence we will have to maintain two streams. The HWSV team =
can implement  it as a Linux driver in OpenBMC and deliver it in stages. =
Any defect fixes in future can be done by the same team on both streams. =
I will ask Sachin Gupta to sync up with Chris. As of now, we need only =
Get/Put Memory, Get/Put Scom and Get/Put SRAM for enabling OCC and HW =
access.

Are these things what were referred to previously in the thread as =
=E2=80=98chip-ops=E2=80=99 ?

If they are, then an SBEI protocol device driver sounds to me like =
chip-ops in the kernel but previously there were a number of statements =
from multiple people along these lines:

> However we certainly don't want to put chip-ops directly in the =
kernel.
> Agreed. This driver is to control access to the FIFO. We don't want to =
have to modify the kernel every time a new operation is required.
> The programs sending the messages will know how to encode their own =
operations, such as pdbg, the occ hwmon driver, etc.

Venkatesh - What role do you see the SBEI protocol driver serving?

Joel/Alistair/Ben - So far for in-kernel users we have scom and OCC.  =
I=E2=80=99m assuming that list will grow somewhat.  Obviously the =
sbescom driver will need to encode scom operations=E2=80=A6but so does =
the occ driver.  If both drivers encode their own operations, won=E2=80=99=
t they be writing the same code twice?  Isn=E2=80=99t that going to =
happen over and over?

Everyone - please poke holes.

thx

-brad




> We can add the remaining interfaces subsequently. As a user of this =
SBEI protocol driver, we need OCC driver changes, Rest API to call OCC =
driver, SCOM drivers and user space app (Rest API / ??) to call the SCOM =
driver.
