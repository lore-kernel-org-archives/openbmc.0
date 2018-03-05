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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zvp9g2863zF0bd
 for <openbmc@lists.ozlabs.org>; Mon,  5 Mar 2018 16:19:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 142256E463;
 Mon,  5 Mar 2018 00:19:13 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Exposing POST codes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
Date: Mon, 5 Mar 2018 00:19:12 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>, 
 "Mohit Gupta (QDT)" <guptam@qti.qualcomm.com>
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
X-List-Received-Date: Mon, 05 Mar 2018 05:19:20 -0000

Hi Patrick

Thanks for bringing this up again.

> On Feb 28, 2018, at 1:56 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> I talked to Nancy and I think it's time to revisit previous =
conversations
> about POST codes.  We have a simple daemon that exposes the =
information
> over Dbus associated with https://gerrit.openbmc-project.xyz/#/c/5006

So we already have this xyz.openbmc_project.State.Boot.Progress DBus
interface (and others).  This is what we implemented on POWER.  Can
we talk about how that API falls short for your use case(s)?  Can I fix
it to enable your use case(s)?

My concern is I have to at some point implement this API on POWER
so that POWER can take advantage of applications targeting your new API.
If doing that would be non-sensical then this probably shouldn=E2=80=99t =
be an
API, or at least not in the common xyz namespace.

On POWER, this kind of information comes down through the IPMI boot
progress indicator.  Could someone briefly educate me on what the
difference between the IPMI boot progress indicator and POST codes
are on x86?  Is there overlap or are they used for different things?

If we went this route I=E2=80=99d be inclined to scrap the existing
xyz.openbmc_project.State.Boot.Progress API and implement
your proposed API on POWER, again, so that POWER can make use of the
applications targeting this API, if the community is unable to write
applications targeting the existing one.  That would mean changing
code that today takes actions on meaningful enumerations to instead
take actions on platform specific numbers.  Does that seem like
the right thing for me to do?  Or does it make sense for the project to
have both of these APIs?  If that is the case can you speculate on what
situations an application would target one API over the other?

It just seems like the first thing anyone is going to do with these
numbers is look them up and map them to something.  Wouldn=E2=80=99t it =
make
sense to have done that mapping already at the API level so that
every user and piece of code using this API doesn=E2=80=99t have to do =
it
themselves?

Mohit - do ARM chips have POST code-like functionality?  Can you
conceive of a way to write an application that could implement
the proposed API on an ARM server?

>=20
> If there's interest, I can stage it against skeleton for review and =
comment.

I think what I=E2=80=99m hinting at here is that you could add a =
per-platform config
file to your app that maps the codes to some enumerations in the DBus
interface, and apply that mapping before you emit the signal. If you
wanted to go back to numbers later you could just reverse the mapping
using the same config file.  Please poke holes.

-brad

>=20
> We have a patch to the kernel character device for the =
aspeed-lpc-snoop
> that is required and enables reading the post codes.
>=20
> Patrick
