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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Yzmc64BnzF396
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 13:30:08 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9BABB6DC97;
 Mon, 15 Oct 2018 22:30:04 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Notion of Flakiness in Sensor Readings
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notzKG=sqpY06Akv2uznzcXtizvC2X7Y_=A4pwOqC_d8Azg@mail.gmail.com>
Date: Mon, 15 Oct 2018 22:30:04 -0400
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D506CB1-FCD4-4A5F-85FB-28D47533784D@fuzziesquirrel.com>
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
 <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
 <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
 <57667218-5BC4-4206-B548-C636426A4571@fuzziesquirrel.com>
 <CAO=notzKG=sqpY06Akv2uznzcXtizvC2X7Y_=A4pwOqC_d8Azg@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Oct 2018 02:30:09 -0000



> On Oct 15, 2018, at 10:15 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Mon, Oct 15, 2018 at 6:14 PM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>=20
>>=20
>>> On Oct 12, 2018, at 5:32 PM, Patrick Venture <venture@google.com> =
wrote:
>>>=20
>>> On Fri, Oct 12, 2018 at 2:28 PM Matt Spinler
>>> <mspinler@linux.vnet.ibm.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>> On 10/12/2018 4:23 PM, Patrick Venture wrote:
>>>>> On Fri, Oct 12, 2018 at 2:09 PM James Feist =
<james.feist@linux.intel.com> wrote:
>>>>>> On 10/12/2018 01:53 PM, Patrick Venture wrote:
>>>>>>> Currently, there are a few approaches in phosphor-hwmon on how =
to
>>>>>>> handle sensors being present sometimes, or flaky on reads.  =
We've
>>>>>>> talked in the past about how to handle a read failure that =
should be
>>>>>>> ignored.  A real failure that is flaky or temporary.
>>>>>>>=20
>>>>>>> I was thinking of just adding a property to the Sensor.Value =
interface
>>>>>>> to report information.  Basically, someone reading the value =
needs to
>>>>>>> know if it's valid.  The idea of a range check for validity =
doesn't
>>>>>>> work as cleanly for this specific purpose, in my opinion.  The =
min/max
>>>>>>> can be used cleanly to determine the linearization though!
>>>>>>>=20
>>>>>>> I was thinking perhaps a boolean, that you can check to see if =
the
>>>>>>> value should be used or trusted.  Then, I thought, perhaps, a =
enum
>>>>>>> with a series of states, starting with the states of "Valid',
>>>>>>> "Invalid."  Not being able to think of a third state, I fell =
back onto
>>>>>>> a boolean.
>>>>=20
>>>> If the hwmon driver for your device provides a _fault attribute, =
and
>>>> that gets set, the code is already
>>>> set up to create an OperationalStatus interface on that sensor =
instance
>>>> and set the Functional
>>>> property to false.
>>>=20
>>> I'd like to drop this such that the failure behavior can be =
returning
>>> a NaN double.
>>=20
>> One benefit I see here is that everything is in the same DBus =
interface
>> (the same property even), but with OperationalStatus you have two and
>> thus more DBus calls, if you are polling?  Is that it or are there =
others?
>>=20
>>> =
https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127
>>>=20
>>> For the drivers that don't have the fault attribute,
>>=20
>> It seems like OperationalStatus could be extended to emulate easily =
here.
>>=20
>>> and in the case where phosphor-host-ipmid doesn't check for that =
kind of
>>> failure.
>>=20
>> So is there no value in consistency of interface?  A lot of things
>> can be =E2=80=98not working=E2=80=99 on a BMC besides sensors - do =
you want to model that
>> in the DBus API differently for each domain (which seems like the =
direction
>> you are headed)?
>>=20
>> Further this model falls apart if you ever want something besides =
_working_
>> and _not_working_ for possible states.  I realize YAGNI, but 1 - I =
have seen that
>> in the past, 2 - it seems trivial to implement, and 3 - the down-side =
of
>> OperationalStatus is not apparent to me.
>=20
> I have no issue with OperationalStatus for this -- I believe Matt's
> comment was that it's available gratis if the driver supports it.

Correct.  But I think it could be extended to emulate it for drivers =
that
don=E2=80=99t - similar to the thresholds.

> Since this driver may not (doesn't, but i haven't checked recently), I
> haven't dug back into that use case.
>=20
> The idea of a sensor falling off and being added to the dbus every
> other time the sensor needs to be read falls over for at least one key
> reason: 1) You can't read the sensor on demand anymore.

I agree - I don=E2=80=99t think we want to do this anymore, when we have
options like OperationalStatus or NaN.

>=20
> I brought all this up because I want to get away from -errno patches,
> and I want the error path to follow the natural state of things.
> Reading a dbus double and seeing NaN() may be enough of an error, and
> you can check OperationalStatus or other interfaces for more
> information if desired.

That SGTM.  I thought you wanted to drop OperationalStatus completely.

>=20
>>=20
>>>=20
>>>>=20
>>>>>> For Valid / Invalid we've produced nan on D-Bus to know that the =
sensor
>>>>>> is in an invalid state (like power off for tach values). Although =
I'm
>>>>>> not sure how this would be produced using the int64 interface, =
for the
>>>>>> double std::nan will go over d-bus correctly.
>>>>> So if i just wait until we're using double, the issue basically
>>>>> resolves itself? :D :D
>>>>>=20
>>>>>>> Thoughts?
>>>>>>>=20
>>>>>>> Patrick
