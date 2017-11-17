Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydQbD51F4zDqDy
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 15:47:51 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id CA97C97599;
 Thu, 16 Nov 2017 23:47:43 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: On the state of documentation
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <87zi7lzjvu.fsf@linux.vnet.ibm.com>
Date: Thu, 16 Nov 2017 23:47:43 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C56F44F7-987C-47B2-8E8A-E50A2F6D2A53@fuzziesquirrel.com>
References: <87lgj8rrz6.fsf@linux.vnet.ibm.com>
 <B9643A4A-B3FF-4D99-880C-8617231513BA@stwcx.xyz>
 <7E9441B1E5EFFD4681F54958E82169932EAF586A@ORSMSX105.amr.corp.intel.com>
 <87zi7lzjvu.fsf@linux.vnet.ibm.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>, Ed Tanous <ed.tanous@intel.com>
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
X-List-Received-Date: Fri, 17 Nov 2017 04:47:53 -0000


> On Nov 16, 2017, at 10:03 PM, Stewart Smith =
<stewart@linux.vnet.ibm.com> wrote:
>=20
> "Tanous, Ed" <ed.tanous@intel.com> writes:
>> I believe that the lack of good documentation is a symptom of a =
larger
>> issue:  OpenBMC is not targeting a public specification with its REST
>> interface.  This has led to certain engineering flexibilities with =
the
>> interface that, while useful for short term to "get something that
>> works", make it very difficult to target openbmc an evolving =
platform.
>> In the current model, DBus specifications are pushed directly to the
>> end user, which means (nearly) every DBus spec change results in a
>> change to end user interfaces.  I don't believe this is sustainable =
in
>> the long run, given the number of platforms that this is targeting =
and
>> the need for reproducible APIs between systems.

No disagreement here.  The project could really could use a Redfish
and full IPMI implementation.

>=20
> I very much agree.
>=20
> As someone consuming it, for the purposes of automating testing host
> firmware (for the purpose of being a host firmware maintainer), it's
> been *extroadinarily* frustrating. Upgrading a BMC usually meant 0.5-1
> day of working out what API change broke and how to code something =
that
> was safe for more than one OpenBMC build.
>=20
> Additionally, much of the docs of the DBUS API are currently written
> targetting somebody working on OpenBMC internals.
>=20
>> I would argue

Argue implies disagreement?  I completely agree we need a Redfish
implementation.  Have you heard something that suggests there would
be push back on someone implementing Redfish?

>> that middle to long term we should transition away from
>> these interfaces for end-user facing functionality, and move toward

Words like 'transition away' and 'move toward' are kind of freaking me =
out
a little.  Are you suggesting that OpenBMC can _only_ have a Redfish
implementation?  Any other REST API implementation would be=E2=80=A6banned=
 from
the project?  Or am I reading into it too much?

>> something that has a standard behind it.  I think the obvious choice
>> in this problem space is redfish, but I'm open to other options.
>=20
> I am 100% with you on that.
>=20
> RedFish may not be ideal (neither is IPMI), but it's *standard*, so at
> least it's not just a OpenBMC problem.
>=20
> I see at least 2 other BMCs I have to deal with going the RedFish =
route,
> so I'd honestly like to see OpenBMC go there.
>=20
> I view all the code I've written against the OpenBMC REST API to be
> throw-away code... but that's what I've been told by the IBM team they
> support, so there hasn't really been a choice apart from rewriting =
half
> of it every month for no discernable good reason.
>=20
>> I'd like to pose the question:
>> Should we move toward deprecating the /xyz and /org style rest
>> interfaces, and agree that we should start transitioning to something
>> (redfish or not) with a fixed specification?
>=20
> My vote is YES, *PLEASE* YES.

Like I said, I too agree we need a Redfish and IPMI implementation
in OpenBMC.

That said, what reason is there to get rid of the existing DBus<->REST
translation server?  It=E2=80=99s not as if its a maintenance burden.  =
It isn=E2=80=99t
as if anyone is making people use it in their products.  Its there.
You can use it or not use it.  When we have an IPMI or Redfish
implementation, I=E2=80=99ll be the first in line (well maybe second =
after
Stewart) to tell my employer to turn it off in their products.
That isn=E2=80=99t the same thing as removing it from the project =
altogether.

>=20
>> Some important key points that I think should be driven by the new =
model:
>> 1. Rest interfaces should not be driven by the underlying DBus =
interfaces, nor the backend implementation language.

This reads like policy for someone using OpenBMC to build a BMC stack.

I would rephrase it to:

XYZ corp cannot use any REST implementations provided by OpenBMC that =
are
driven by the underlying DBus interfaces in XYZ corp products making use
of OpenBMC.

Do you see the difference?

>> 2. Interfaces should not contain any "backdoor" type APIs that allow =
white box style access to internal APIs.  Anything breaking the black =
box model should be done in a machine specific layer or configuration.
>> 3. APIs should give the minimum required amount of information to =
fulfill the end user use case.
>> 4. Interfaces should be backed by the system level security policy =
(PAM users in the current model).
>> 5. Where possible, the implementations should follow an existing =
specification.  In the cases where the requirements are not supported, =
the api should follow the style of the supporting interface  (Think =
redfish OEM command support)

I have the same reaction to 2-6 as I did for 1.  These are policies on =
_use_
of OpenBMC.  Right?  Not what the contributors to the project are =
allowed to do.

My worldview is that each one of these bullet points would cost the =
project a
potential contributor.  Somewhere, someone is going to want to do one of
those things.  Why not let them, when the only thing you have to do is =
not use
their code?

>> 6. Documentation changes should be pushed ahead of or along with
>> implementation support, with the goal of keeping the documentation
>> constantly up to date.

On point #6 I agree completely.

>=20
> Completely agree.
>> Shameless plug: As the person that pushed the aforementioned gerrit
>> review for a new thinking on the webserver and redfish, I would love
>> comments on architecture decisions and implementation details.
>=20
> I nearly commented MERGE NOW without even looking, but that's possibly =
a
> bit keen :)
>=20
> I reckon the Minimum Viable Product for something is enough to do what
> TripleO needs (which is probably the same set of things that I need =
for
> OPAL testing). Once it's there, I say go for it - internals can be
> cleaned up, but at least those of us consuming OpenBMC have a good way
> forward along with an upstream spec to point to and look at.
>=20
> --=20
> Stewart Smith
> OPAL Architect, IBM.


thx - brad
