Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydmDV6CPDzDqm7
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 05:02:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6237E16D3B2;
 Fri, 17 Nov 2017 13:02:46 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: On the state of documentation
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAF5A8F@ORSMSX105.amr.corp.intel.com>
Date: Fri, 17 Nov 2017 13:02:46 -0500
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4B3DC87-9C4F-43FC-B6FD-8902D999C5C8@fuzziesquirrel.com>
References: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
 <B9643A4A-B3FF-4D99-880C-8617231513BA@stwcx.xyz>
 <7E9441B1E5EFFD4681F54958E82169932EAF586A@ORSMSX105.amr.corp.intel.com>
 <87zi7lzjvu.fsf@linux.vnet.ibm.com>
 <C56F44F7-987C-47B2-8E8A-E50A2F6D2A53@fuzziesquirrel.com>
 <87vai9zdze.fsf@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E82169932EAF5A8F@ORSMSX105.amr.corp.intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Fri, 17 Nov 2017 18:02:51 -0000


> On Nov 17, 2017, at 12:01 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
>=20
>=20
>> -----Original Message-----
>> From: Stewart Smith [mailto:stewart@linux.vnet.ibm.com]
>> Sent: Thursday, November 16, 2017 9:11 PM
>> To: Brad Bishop <bradleyb@fuzziesquirrel.com>; Tanous, Ed
>> <ed.tanous@intel.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Re: On the state of documentation
>>=20
>> Brad Bishop <bradleyb@fuzziesquirrel.com> writes:
>>>> On Nov 16, 2017, at 10:03 PM, Stewart Smith
>> <stewart@linux.vnet.ibm.com> wrote:
>>>>=20
>>>> "Tanous, Ed" <ed.tanous@intel.com> writes:
>>>>> I believe that the lack of good documentation is a symptom of a
>>>>> larger
>>>>> issue:  OpenBMC is not targeting a public specification with its
>>>>> REST interface.  This has led to certain engineering flexibilities
>>>>> with the interface that, while useful for short term to "get
>>>>> something that works", make it very difficult to target openbmc an
>> evolving platform.
>>>>> In the current model, DBus specifications are pushed directly to =
the
>>>>> end user, which means (nearly) every DBus spec change results in a
>>>>> change to end user interfaces.  I don't believe this is =
sustainable
>>>>> in the long run, given the number of platforms that this is
>>>>> targeting and the need for reproducible APIs between systems.
>>>=20
>>> No disagreement here.  The project could really could use a Redfish
>>> and full IPMI implementation.
>>=20
>>>>> that middle to long term we should transition away from these
>>>>> interfaces for end-user facing functionality, and move toward
>>>=20
>>> Words like 'transition away' and 'move toward' are kind of freaking =
me
>>> out a little.  Are you suggesting that OpenBMC can _only_ have a
>>> Redfish implementation?  Any other REST API implementation would
>>> be=E2=80=A6banned from the project?  Or am I reading into it too =
much?
>=20
> No, I'm in no way arguing that we need to only have one external API.  =
Banning certain APIs or components is something that I don't think fit =
the needs of the project either.

That's good news.  Thanks for clearing that up.

> Overall, I would like new and existing code to be able to treat dbus =
as an openbmc private API, not an end user facing public API.  Said =
another way, DBus api changes should be possible without changing =
external system interfaces. =20

Agreed.

> Given the fact that the existing REST API is simply a direct =
connection to dbus, it seems to stand in the way of this goal. =20

Maybe.  But this comes down to how the user of OpenBMC is using the
direct-connect API.

What if I state it like this?  Breaking the external API provided by the
direct-connect REST API can never be the rationale for rejecting =
internal
DBus API changes.

> Long term, I would like to see the existing dbus REST API moved to =
machine specific layers for the machines that want to use them, and =
remove it as a reference implementation. =20

But it is the reference implementation of the direct-connect API.

I want to poke at what it means exactly to move something to a machine
specific layer.

- Does it mean the code repository is not in the GitHub openbmc
organization namespace?

- Does it mean the recipe for the application is not in meta-phosphor?

- Does it mean the recipe is in meta-phosphor, its just not included
in an image by default (explicitly turned on in other layers) ?

- Something else?

> Maybe I'm stepping over the line?  Maybe it's too early to start =
talking transition plane, when the replacement components are in their =
infancy?
> I'm not asking for a commitment here, just would like to see what =
other people's thoughts are.

I=E2=80=99m sorry if I=E2=80=99m putting you on the defensive.  It's not =
my intent.  The intent
is to ask probing questions to help me understand where you are coming =
from.

>=20
>>=20
>> I'd support multiple interfaces (after all, IPMI and RedFish are =
multiple ones
>> anyway, and IPMI is probably going to take a few more years to =
disappear)
>>=20
>>> Like I said, I too agree we need a Redfish and IPMI implementation =
in
>>> OpenBMC.
>>>=20
>>> That said, what reason is there to get rid of the existing =
DBus<->REST
>>> translation server?  It=E2=80=99s not as if its a maintenance =
burden.  It
>>> isn=E2=80=99t as if anyone is making people use it in their =
products.  Its there.
>>> You can use it or not use it.  When we have an IPMI or Redfish
>>> implementation, I=E2=80=99ll be the first in line (well maybe second =
after
>>> Stewart) to tell my employer to turn it off in their products.
>>> That isn=E2=80=99t the same thing as removing it from the project =
altogether.
>>=20
>> It might be useful for debug to keep around "forever"?
> For debug, yes, I completely agree that server is useful and we can =
leave it in the repo, I'm less worried about debug, or giving developers =
and maintainers the option, more worried about the direct linkage from =
Dbus to end-user facing APIs, especially in a component that's labeled =
reference, and added to openbmc builds by default.

If you submitted a patch that turns it off by default (and turns it back =
on
in all the machine layers, to maintain functional parity with what is =
there
today), I wouldn't expect any push-back.

>=20
>>=20
>>>>> Some important key points that I think should be driven by the new
>> model:
>>>>> 1. Rest interfaces should not be driven by the underlying DBus
>> interfaces, nor the backend implementation language.
>>>=20
>>> This reads like policy for someone using OpenBMC to build a BMC =
stack.
>>>=20
>>> I would rephrase it to:
>>>=20
>>> XYZ corp cannot use any REST implementations provided by OpenBMC =
that
>>> are driven by the underlying DBus interfaces in XYZ corp products
>>> making use of OpenBMC.
>>>=20
>>> Do you see the difference?
> Fair point.  Yes, all these goals are things that Intel needs today =
for production interfaces.  I was trying to see if others have similar =
requirements.
> My end goal here is not to prescribe what people are allowed to build, =
your rewording of the next point seems to render this one moot.=20
>=20
>>=20
>> I'd say "The OpenBMC REST API is not meant to be a stable API to be
>> consumed. It exists exclusively for debug and development efforts of
>> OpenBMC. It may, in future, completely change or disappear."
>>=20
>> =46rom someone consuming it, that's certainly been the experience at =
least :)
> That's a much more fair wording.  On the other hand, there is a lot of =
precedence for users relying on "debug" APIs for production =
functionality, then complaining when the function breaks or disappears.  =
I don't have a solution here, just a comment.

Agreed.  Is this solvable by turning it off by default and big red =
warning
text somewhere?

>=20
>>=20
>>>>> 2. Interfaces should not contain any "backdoor" type APIs that =
allow
>> white box style access to internal APIs.  Anything breaking the black =
box
>> model should be done in a machine specific layer or configuration.
>>>>> 3. APIs should give the minimum required amount of information to
>> fulfill the end user use case.
>>>>> 4. Interfaces should be backed by the system level security policy =
(PAM
>> users in the current model).
>>>>> 5. Where possible, the implementations should follow an existing
>>>>> specification.  In the cases where the requirements are not
>>>>> supported, the api should follow the style of the supporting
>>>>> interface  (Think redfish OEM command support)
>>>=20
>>> I have the same reaction to 2-6 as I did for 1.  These are policies =
on
>>> _use_ of OpenBMC.  Right?  Not what the contributors to the project =
are
>> allowed to do.
>=20
> Brainstorming for a second; What if each of these were prefixed with =
"Reference components shall: "?  Yes, some of these are a little more =
prescriptive than I'd like for an open project, but we need some way to =
convey that certain components are production ready, secure to modern =
standards, and are supportable long term.=20

One thing to keep in mind as we brainstorm is that there is a difference =
between
a component being production ready, secure and supportable, and usage of =
that
component in a larger stack.

For instance we could get to an impeccable implementation of the =
direct-connect API,
with no security bugs, production ready, and easily maintainable.  There =
isn=E2=80=99t
a problem until a user decides to include that application in their =
stack.

>  I'd much rather see reference components fall into that category than =
to create a new system for classification. =20

Another straw man - What if we split the phosphor layer in two or more?
 - meta-phosphor-core
 - meta-phosphor-extras

The layers could have different themes.  The core layer, in a vacuum, =
could
aspire to have a perfect security model.  Something like the =
direct-connect
API would go in a different layer, since its use has potential security
ramifications and other badness.


> With that said, if most of these needs aren't common amongst  a =
majority of the platforms, then I'm happy to do the "XYZ corp" style =
prescription.  Just to be clear, these are thoughts, and learnings =
pulled from previous production BMC systems I've worked on.  I'm certain =
my biases have bled into some of the points.
> I was not intending to pose these as new hard rules.  Guideline is =
even a strong word.  "What Ed wants to see" might be a better =
description at this point.
>=20
>>>=20
>>> My worldview is that each one of these bullet points would cost the
>>> project a potential contributor.  Somewhere, someone is going to =
want
>>> to do one of those things.  Why not let them, when the only thing =
you
>>> have to do is not use their code?
>>=20
>> Maybe guidelines more than rules?
> I should've made that much more clear.  Yes, these were intended to be =
ideas for how I'd like to see certain interfaces evolve.  I had no =
intention of prescribing what people are allowed to do.  I question if I =
even want to prescribe rules for reference components, but I'd at least =
have a discussion about it.
>=20
>>=20
>> I'm sure there's exceptions, but there's unlikely to be anything =
really exist
>> beyond RedFish and IPMI... If there is, I'd say it's up to you if you =
want to
>> include it in the base/reference distribution and if this will create =
value or just
>> more work :)
>>=20
>>=20
>> --
>> Stewart Smith
>> OPAL Architect, IBM.

thx - brad
