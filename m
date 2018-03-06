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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwJWn2jd0zF0w2
 for <openbmc@lists.ozlabs.org>; Tue,  6 Mar 2018 12:06:44 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 74BFFEA09C;
 Mon,  5 Mar 2018 20:06:41 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Exposing POST codes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
Date: Mon, 5 Mar 2018 20:06:41 -0500
Cc: Patrick Venture <venture@google.com>,
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B3DF986-2C8A-4437-BC5D-D59EE7B0997D@fuzziesquirrel.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
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
X-List-Received-Date: Tue, 06 Mar 2018 01:06:46 -0000


> On Mar 5, 2018, at 4:34 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
> I'm not Patrick, but the input on my use cases for this is below.
>=20
>=20
>> So we already have this xyz.openbmc_project.State.Boot.Progress DBus
>> interface (and others).  This is what we implemented on POWER.  Can =
we talk
>> about how that API falls short for your use case(s)?  Can I fix it to =
enable your
>> use case(s)?
>>=20
> The enum definition is very limiting, and seems to assume that POST =
code definitions are the same across all platforms.  New POST codes are =
added all the time, to the point where even internal teams struggle to =
keep up with their definitions.  Having an API that would need to be =
changed for every POST code type seems error prone and very likely to be =
out of date.
> If we adjusted the boot progress interface to be a string rather than =
an enum, that _could_ meet the use case, but that doesn't seem to be the =
purpose of that API.

Thanks Ed.  With the background its apparent to me now that the
existing API doesn=E2=80=99t line up.

I just want to be careful about the content in our data model.  I=E2=80=99=
m
trying to make sure we don=E2=80=99t inadvertently establish a norm and =
send
the project down the path of something like:

platform A implements API a, b and c
platform B implements API d, e and f
platform C implements API g, h and i

Obviously a setup like that doesn=E2=80=99t lead to meaningful =
collaboration
or code reuse.

>=20
>> My concern is I have to at some point implement this API on POWER so =
that
>> POWER can take advantage of applications targeting your new API.
>> If doing that would be non-sensical then this probably shouldn=E2=80=99=
t be an API, or
>> at least not in the common xyz namespace.
> Isn't this the reason for it being in an API all its own, so it can be =
optionally included?

I=E2=80=99m not sure.  We should probably define what exactly it means
to have something in the DBus data model.  When I hear optional
my thoughts jump to missing function on the platforms that don=E2=80=99t
implement it and/or lack of compatibility with the rest of the
projects code.  As an IBM guy, I know I want all the APIs that
the community comes up with to have implementations for POWER.

As I type this, I realize if I really wanted to I could emit the
istep number using this API.

>  I suspect any applications consuming it would likely be logging type =
applications, and any application using it to take action would be =
platform specific, even if it were a string.
> Does POWER have any way of reporting detailed boot progress?  If, for =
example, the USB link training starts processor init flows, is that =
logged in a POWER system?  On x86, it would be logged as a POST code.

We do!  It is the istep thing I mentioned above.  Before OpenBMC that
kind of data flowed from the BIOS with proprietary protocols over
proprietary transports to proprietary BMC chips.  First pass at
that on an OpenBMC was to just map a subset of those to IPMI boot
progress sensor updates.

>=20
>>=20
>> On POWER, this kind of information comes down through the IPMI boot
>> progress indicator.  Could someone briefly educate me on what the
>> difference between the IPMI boot progress indicator and POST codes =
are on
>> x86?  Is there overlap or are they used for different things?
> The POST code indicator is used for very fine grained feedback of boot =
progress, and is generally not looked at by a user unless there is a =
problem with boot.  At that point, it is generally (on my systems) used =
for debug of the system, as it gives some information about what steps =
the host system took before it failed.=20
>=20
>>=20
>> It just seems like the first thing anyone is going to do with these =
numbers is
>> look them up and map them to something.  Wouldn=E2=80=99t it make =
sense to have
>> done that mapping already at the API level so that every user and =
piece of
>> code using this API doesn=E2=80=99t have to do it themselves?
> That seems like a reasonable assumption, but practically isn't always =
an option;  In general the POST code mappings are difficult to come by, =
especially in initial system bringup, and that is when they are most =
valuable.  If attempted, the ability to provide a mapping should be made =
optional, which means the proposed interface still needs to exist.
>=20
>> I think what I=E2=80=99m hinting at here is that you could add a =
per-platform config file
>> to your app that maps the codes to some enumerations in the DBus
>> interface, and apply that mapping before you emit the signal. If you =
wanted
>> to go back to numbers later you could just reverse the mapping using =
the
>> same config file.  Please poke holes.
>=20
> I would argue that this functionality is outside the scope of Patricks =
patch.  We could very clearly do as you're suggesting, but it would be =
error prone, and make per-platform configuration more difficult to port, =
and would likely take a number of months to get correct for all =
platforms.  As is, Patricks patch adds value outside of his direct =
platform, as other teams would have an immediate use of it, and is very =
clear and clean to implement.  Building the platform configurable API =
you suggest would take a lot more time and effort, for only a little =
incremental value.  This seems like a case of "Perfect is the enemy of =
good".  As is, both the API and the daemon are things that I would use =
today on my platforms.

This was really just a straw man to move the conversation along, but =
yeah
I tend to agree now that I have the background.  Thanks for explaining =
it
to me.
