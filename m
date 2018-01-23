Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQW0L1b2GzDqw7
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 12:28:33 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.31])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8ABA06E229;
 Mon, 22 Jan 2018 20:28:28 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Technical Debt vs. Precedence vs. Velocity
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180119163028.GX113334@mauery>
Date: Mon, 22 Jan 2018 20:28:28 -0500
Cc: openBMC <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <25ABDBB6-AFCC-4CC8-AB58-2C3FF5EF7832@fuzziesquirrel.com>
References: <20180119163028.GX113334@mauery>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 01:28:34 -0000


> On Jan 19, 2018, at 11:30 AM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> Overall, the openbmc project has done a great job of keeping common =
things in common repositories and machine or OEM specific things in =
separate repositories. But there are a few (because it happens) places =
where technical debt has accrued. I want to support getting this sort of =
stuff fixed so we can have a shiny project, but at what expense? =
Velocity. Reality calls and I was not scoped to fix old code, only to =
write a new feature. I am not the only one running into this issue, so I =
thought it best to start a discussion.
>=20
> Things like:
> 1) Incorrect coding style (whitespace, braces, =
upper/lower/snake/camel)
> 2) Use of sdbus instead of sdbusplus
> 3) OEM code in common libraries
> 4) Lack of proper error handling
> 5) Use of insecure functions without proper range checking (memcpy, =
strcpy, etc.)
> 6) Use of printf/fprintf instead of log<>
>=20

Use (your maintainer) discretion, but I think precedence would _rarely_ =
be
a valid justification for new technical debt.

Our coding style, frameworks, guidelines, etc are all going to change =
over
time.  The codebase will never be up to date in terms of the current =
mode
of thinking.  So I would advocate for mixing code that does meet the =
current
guidelines with code that does not, otherwise it will just get =
progressively
worse.

> I am sure there are many other classes of technical debt that I did =
not list here. But the point is that the code base does have places =
where this sort of stuff exists and has not yet been fixed. What should =
the official stance be? To me, mixing coding styles in a single file is =
worse than having the same wrong coding style in a file. But the best is =
if the whole project matches.
>=20
> If someone contributes and claims that their newly added technical =
debt is okay

Maybe just write down the rules you want, and put them in a README in =
the
project repos you maintain.  Then you can simply point at this when =
these
come up in review.  Just make sure your README files get a good review
as well.

I suspect some will want things like this documented at an OpenBMC wide =
level
and not a per repository basis.  I=E2=80=99m not sure if I like that or =
not.  Maintaining
is hard, and we all have our different things that make it less hard for =
us to
maintain.

> because of precedence, we don't really have a way to hold them to =
coming back and fixing the problem.
>=20
> One way to fix this is to have contributors that want to claim =
precedence go and clean up the file FIRST and then come back with a new =
clean commit. But that does make for a higher bar for entry in some =
cases and possibly slows down velocity.

I think this is OK as long as the patch submitter has another option - =
adding
code that meets the current guidelines without requiring the fix-up.  If =
they
have a personal issue with mixed styles, they can make the fix-up prior =
to
their edits.

>=20
> What say the community members on this?
>=20
> --Vernon
