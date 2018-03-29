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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BVwb47xdzDqh1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 14:43:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id F13436E229;
 Wed, 28 Mar 2018 23:43:54 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Sdbusplus-based Shared Library
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notz7gk5oF9BSpviz+1VrDRCeBCU7t8+zQxTGZOCDYy=VmQ@mail.gmail.com>
Date: Wed, 28 Mar 2018 23:43:54 -0400
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Tanous, Ed" <ed.tanous@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1598514C-EBA7-4CF8-A7F8-04BD39498B12@fuzziesquirrel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
 <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
 <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
 <CAO=notyvGn_nO1KgffBgukXy7hFt1VHnop26HpgJjJELeJMnow@mail.gmail.com>
 <ED94F738-2C50-416D-826B-82BE0D1B0E94@fuzziesquirrel.com>
 <CAO=notz7gk5oF9BSpviz+1VrDRCeBCU7t8+zQxTGZOCDYy=VmQ@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2018 03:44:00 -0000


> On Mar 28, 2018, at 11:25 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> On Wed, Mar 28, 2018 at 6:39 PM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>> On Mar 27, 2018, at 11:43 AM, Patrick Venture <venture@google.com> =
wrote:
>>>=20
>>> Brad,
>>>=20
>>> If you create a repository - phosphor-sdbus-utils or
>>> phosphor-sdbusplus-utils or something like that, I'll put together a
>>> starter pack on this and submit for review.
>>=20
>> May I suggest
>>=20
>> =
https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/sdevent
>>=20
>> as a possibility for drawing ideas?  :-)
>>=20
>>>=20
>>> Patrick
>>=20
>> Thanks Patrick! will do but I=E2=80=99d like to get a bit more =
clarity/discussion
>> on what the content of this new repo will be.
>>=20
>> So today we have sdbusplus built around the sd-bus folder in =
libsystemd.
>>=20
>> Do we envision something like separate repos for:
>>=20
>> sdeventplus - wrappers for the sd-event folder in libsystemd
>> sddeviceplus - wrappers for the sd-device folder in libsystemd
>> =E2=80=A6etc
>>=20
>> Or should we just try and have a single c++ wrapper repository for =
all of
>> libsystemd?  In that case should we simply rename sdbusplus to =
libsystemdpp
>> and start putting more code in it?
>=20
> I had envisioned all the sd-bus wrappers in one library, however, I'm
> quite flexible about any of that. =20

I think sdbusplus has been forked for non-openbmc use so it probably
doesn=E2=80=99t make sense to add OpenBMC-isms to it, like the mapper =
for instance.
Do you agree?

I thought you were talking about extending the concept that was applied
to sdbus (thin raii wrappers around sdbus) to sdevent.  I definitely =
think
we need that.

I think C++ bindings around sdevent could also have general utility to =
someone
outside of OpenBMC so I=E2=80=99d again vote for not including =
OpenBMC-isms in a
library for something like that.

> My primary goal with pushing this
> line of thought it to reduce code duplication in openbmc.  So many
> daemons have the same methods that just talk to sdbusplus, etc.  So it
> makes sense to me to have a utility library for interfacing with
> sdbusplus for common tasks.  phosphor::util::getService(),
> phosphor::util::get... etc, so they can be maintained in one place.

I feel like a number of these are mapper related.  Could we add some
client bindings for the mapper that help here and put them in the
mapper repository?  Here is a possible example of how that could
look:

=
https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/sdbusplus=
.hpp

I wrote this class so I could mock sdbusplus calls.

> Even phosphor::util::network::... because those are becoming
> duplicated.  It might make sense to have multiple libraries for the
> utilities, which is also fine.

I guess I=E2=80=99m advocating for distributed utilities, aligned =
functionally.  I worry
about a monolithic library=E2=80=A6it seems like it could easily become =
a free-for-all.

Thoughts?

>=20
>>=20
>> -brad
