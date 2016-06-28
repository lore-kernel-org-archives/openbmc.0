Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfBNy4yvrzDqqZ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 02:40:00 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1467131995934973.2517196705717;
 Tue, 28 Jun 2016 09:39:55 -0700 (PDT)
Date: Tue, 28 Jun 2016 11:39:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit server migration
Message-ID: <20160628163954.GO20922@asimov.austin.ibm.com>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <CACPK8Xd45WjdpyCPCibXwZj3tn1ud+HjP1s--aMdrNkD=38wmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L5nTHegdhbHhzmSD"
Content-Disposition: inline
In-Reply-To: <CACPK8Xd45WjdpyCPCibXwZj3tn1ud+HjP1s--aMdrNkD=38wmw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2016 16:40:03 -0000


--L5nTHegdhbHhzmSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Joel,

Both of these questions make me realize we should add the "answers" to
the documentation.  I'll get it added after Adriana's initial Gerrit
documentation is in.

On Tue, Jun 28, 2016 at 01:22:57PM +0930, Joel Stanley wrote:
> How do we get notifications when a patch is proposed for review?

The overall documentation for it can be found here:
    https://gerrit-review.googlesource.com/Documentation/user-notify.html#u=
ser

Also, you can view the documentation directly on our Gerrit server:
    https://gerrit.openbmc-project.xyz/Documentation/user-notify.html#user

The net is that you probably want to go to "Settings > Watched Projects"
and add All-Projects to your subscription.  You can otherwise subscribe
to individual repositories.

Direct link:
    https://gerrit.openbmc-project.xyz/#/settings/projects

> Do we have owners of each component that must review before a patch
> can be merged?

Yes.  We should document the code-review process now that we can have
one.

Here are the current settings and what has worked well for us in the
past with Gerrit.  Open to suggestions.

    1. All users are able to +1 / -1 code.
    2. A set of "maintainers" are able to +2 / -2 and submit code.
    3. All commits should have (at least) two +1 reviews.
        3a. Ideally the maintainer is not one of the +1.
    4. Commits should not be merged with a -1 (or -2) unless there has
       been a discussion by the maintainer to justify the merge.
    5. The maintainer should ensure that all past -1 review comments
       have been addressed in a follow-up patch set.  This is usually
       handled by having the original -1 reviewer now give a +1.

What I did initially was divide the repositories up based on their
primary language and assign a maintainer group in Github.  Maybe I
should make these groups public?

    a. Bitbake recipes.
        * Brad Bishop, Patrick Williams
    b. Python repositories.
        * Brad Bishop, Patrick Williams
    c. C repositories.
        * Joel Stanley, Jeremy Kerr
    d. C++ repositories.
        * Patrick Williams

Over time I expect the repositories to be grouped more along functional
lines and subsystem-style maintainers to come about based on their
contributions.  (I know next to nothing about Python, so I'd be
especially willing to add someone else in my place there to work with
Brad.)

You can see the current "maintainer group" assigned to a repository by
going to "Projects > List > (select repo) > Access" and seeing the
"Rights Inherit From" line.  By direct link, you can see 'obmc-console'
is maintained by the 'openbmc-c-repos' group:
https://gerrit.openbmc-project.xyz/#/admin/projects/openbmc/obmc-console,ac=
cess

That 'openbmc-c-repos' group corresponds to the 'openbmc/c-maintainers' gro=
up
on Github as evidenced by this:
https://gerrit.openbmc-project.xyz/#/admin/projects/openbmc-c-repos,access

--=20
Patrick Williams

--L5nTHegdhbHhzmSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXcqhaAAoJEKsDR8wtAMEZfkgP/15dZ2jhOcRfQUqYIup9PE9m
lpI5mPJ+fagEH7RXxOa0Em/+FRwoMae4XWerG1/j4LyEEWjI/Z8YMO5XDxW6hYzV
f0/XeivRRAv+4Q3a7H73PIEhc+3Y31BHg2SuAM8phRH8AvJl3QznpQMabhR59Wgh
MbkCKyehO/4gco2Pfaph3CIsCiboQWgd3jr8ZnGiQD3mEqVXHRibajcCJ/SeWXpw
Eih5KBfSvqYxIKe4t7Pya2Eodd2VViEWRPq4O+Ffss5DibmJI/Ggqpt0FxblNQU7
rIGtogLnkXPuZbUuUfz8CZECRTF4SSYbjt7iODbki2otkq890JYXpyP5VhOO6WS+
s8XnEfTs33jlGgH1VKd0jVU815j0D2qjHPazlwwv81U81ZNR0uX4VTvCp4HOSFrB
d9s43etrELMNW7iY/IALUhyulwOVdT00CF1r4FZdYwj99iVXHvG5quTJCstLUzjz
rxnN+aFCoTvsXLasUAyFkbAw8DGZFLd8uJ4BtlyuUjUO5Lu8dyNZcxXqQLQuql0G
PqI9SGQF2UhuhgzycwFRRdk+vIiogCjm2rBCZtU5fEZVVA12ccwt8LulnZCVhgp7
IsTH7FXuEYaSn1DR7XlwWNLZQU3TXA18Rt9ESxc9/dBD6JJKmkQldgJlP48nAuCi
O1DZMiFQHKkhdJE8dBjB
=6XfV
-----END PGP SIGNATURE-----

--L5nTHegdhbHhzmSD--
