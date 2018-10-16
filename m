Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Yy5H3YztzDqD1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 12:14:27 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7ECAA6DC97;
 Mon, 15 Oct 2018 21:14:24 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Notion of Flakiness in Sensor Readings
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
Date: Mon, 15 Oct 2018 21:14:24 -0400
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <57667218-5BC4-4206-B548-C636426A4571@fuzziesquirrel.com>
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
 <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
 <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Tue, 16 Oct 2018 01:14:28 -0000



> On Oct 12, 2018, at 5:32 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Fri, Oct 12, 2018 at 2:28 PM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>> On 10/12/2018 4:23 PM, Patrick Venture wrote:
>>> On Fri, Oct 12, 2018 at 2:09 PM James Feist =
<james.feist@linux.intel.com> wrote:
>>>> On 10/12/2018 01:53 PM, Patrick Venture wrote:
>>>>> Currently, there are a few approaches in phosphor-hwmon on how to
>>>>> handle sensors being present sometimes, or flaky on reads.  We've
>>>>> talked in the past about how to handle a read failure that should =
be
>>>>> ignored.  A real failure that is flaky or temporary.
>>>>>=20
>>>>> I was thinking of just adding a property to the Sensor.Value =
interface
>>>>> to report information.  Basically, someone reading the value needs =
to
>>>>> know if it's valid.  The idea of a range check for validity =
doesn't
>>>>> work as cleanly for this specific purpose, in my opinion.  The =
min/max
>>>>> can be used cleanly to determine the linearization though!
>>>>>=20
>>>>> I was thinking perhaps a boolean, that you can check to see if the
>>>>> value should be used or trusted.  Then, I thought, perhaps, a enum
>>>>> with a series of states, starting with the states of "Valid',
>>>>> "Invalid."  Not being able to think of a third state, I fell back =
onto
>>>>> a boolean.
>>=20
>> If the hwmon driver for your device provides a _fault attribute, and
>> that gets set, the code is already
>> set up to create an OperationalStatus interface on that sensor =
instance
>> and set the Functional
>> property to false.
>=20
> I'd like to drop this such that the failure behavior can be returning
> a NaN double.

One benefit I see here is that everything is in the same DBus interface
(the same property even), but with OperationalStatus you have two and
thus more DBus calls, if you are polling?  Is that it or are there =
others?

> https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127
>=20
> For the drivers that don't have the fault attribute,

It seems like OperationalStatus could be extended to emulate easily =
here.

> and in the case where phosphor-host-ipmid doesn't check for that kind =
of
> failure.

So is there no value in consistency of interface?  A lot of things
can be =E2=80=98not working=E2=80=99 on a BMC besides sensors - do you =
want to model that
in the DBus API differently for each domain (which seems like the =
direction
you are headed)?

Further this model falls apart if you ever want something besides =
_working_
and _not_working_ for possible states.  I realize YAGNI, but 1 - I have =
seen that
in the past, 2 - it seems trivial to implement, and 3 - the down-side of
OperationalStatus is not apparent to me.

>=20
>>=20
>>>> For Valid / Invalid we've produced nan on D-Bus to know that the =
sensor
>>>> is in an invalid state (like power off for tach values). Although =
I'm
>>>> not sure how this would be produced using the int64 interface, for =
the
>>>> double std::nan will go over d-bus correctly.
>>> So if i just wait until we're using double, the issue basically
>>> resolves itself? :D :D
>>>=20
>>>>> Thoughts?
>>>>>=20
>>>>> Patrick
