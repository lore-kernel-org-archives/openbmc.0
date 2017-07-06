Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3N985bfHzDr3x
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 02:14:20 +1000 (AEST)
Received: from localhost (32.97.110.50 [32.97.110.50]) by mx.zohomail.com
 with SMTPS id 1499357656234957.1049205476018;
 Thu, 6 Jul 2017 09:14:16 -0700 (PDT)
Date: Thu, 6 Jul 2017 11:14:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Venture <venture@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Swampd PID-driven Fan Controller
Message-ID: <20170706161409.GC22100@asimov.austin.ibm.com>
References: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
 <FB3659C0-EF79-40D3-8001-17D9116FA522@fuzziesquirrel.com>
 <CAO=notzHV07bANYK=f+QsqBpx_t83rYAJxvYzSAZb9qeYUPwLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <CAO=notzHV07bANYK=f+QsqBpx_t83rYAJxvYzSAZb9qeYUPwLw@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Thu, 06 Jul 2017 16:14:21 -0000


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2017 at 06:13:27PM -0700, Patrick Venture wrote:
> I would have liked to develop this in the open, but as you touched on
> it, schedules.  My platform is under a compressed schedule.  Under any
> situation, I'll be responsible for maintaining this code base.  And
> expanding it to support other platforms.  As implementing it wasn't
> done in a vacuum, I feel fairly confident that outside contributions
> at least in furthering the design to make it simpler or more modular
> would be warranted.
>=20
> Obviously, it was designed around very specific execution
> requirements, which drove my adding an interval to phosphor-hwmon and
> quite a few downstream hacks.  That said, those specific execution
> requirements do have an impact on the ability to change the design
> from input.  If the design suggestions or ideas violate the terms of
> service that we're providing the data centers -- it can be forked,
> effectively.

Patrick,

It was hard to tell from your initial email if your intentions were to
just give away some code you wrote (hence Brad's fears of a "code dump"
approach) or if you were trying to get this integrated as a repo we
would maintain long-term.  After discussions off-list it sounds like you
are wanting to do the work to integrate this into OpenBMC proper, which
is great.

One way of reading your original email was that you were wanting to host
this and maintain it in your own space and then add a recipe for the
package to openbmc/openbmc.  Since this hasn't come up before, I should
probably say formally I am really opposed to this.  I see it as a
difficulty long-term for us to have a repository that links against
phopshor-dbus-interfaces and recipe in openbmc, but the code itself is
not able to be updated by us.  It is not uncommon that we need to change
the dbus schema and the developer doing that is also generally responsible
for the changes across the repositories using the schema.  Having this
other code outside the project but that the project also relies on to
build an officially supported machine would make a dbus schema change
pretty painful.

My suggestion would be that we tackle this code in a few phases:

1. Place code on Github in your personal account for a high-level review
   by interested parties.

   1a.  We can take a look and get a feel for what lines up with
        existing architecture and where one of us needs to make changes.

2. We create a Gerrit repo for this code to live in long-term and you
   submit any changes from phase 1 there.

   2a.  We will then do a review and revisions per our normal process.

3. After merge, the code is now an officially supported repo that we
   will expect others to help maintain as, for example, APIs change.

At any point here, if you decide it is not going to be worth the effort,
we can stop or someone else can pick up where you leave off.  Does this
sound workable?

--=20
Patrick Williams

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlleYc8ACgkQqwNHzC0A
wRlZzw/8D4WHRn1Ji06CSSxijjPSZj+A8jVfralwO6pYKB+F6iyJYoqis33Ti/Tu
I097FFA+BqG5y8XP+sr5Qw6WNTMdvW4XUFnccg5UG9grl5yfcvtk/FFd7pMYCYUC
RlaiX7W9Tgjz+effZoMgbVGyQedm2PLmZKNR5klUWsKGQ1BydHKVqJ4mHuOR95Hx
QccuKGIpcz3dHvBA9w/4t7wKWA5xzFl7MOnS8WqhSmTBA+EBKELkpWjslToaBeoD
xEjWy7jGS8EAHNa5QaffdR3IMC3kL4sT2td8qrpYh+XR2QNHbFzlxOaVkhumMLV3
PTcQ5POcZflv1zqiUVmKEXpeHHktv6A/dqZEbO9QdOKCA9E2CUpYKaWUQiVu0Uqy
Y0ud9txClA2t+BwXALUhLzxQaw3iVoibD1iW9wFgFVOdTh+JBkbyplSHC8uXD6GQ
k7zWTLxozabusYb7gy10tdlYZaDY4rYGPzoNU15YrpM3WEx/GXfuTHGWBda3rco/
60X9FCJJKpzA61/lJt/hrDlm6r1v0eRr1JGc0h6aOlsIgoc/P+yXpL9sFz8QFh6z
yxT9ZhzNlwWuCX3UG129YlN3B/eD7PUmCBaf6fJg4Q37BpJGfeAwi8LCX9LdlZcu
IeWdq+rWK4ZNvnQaS20bWIoIqH2Y+LJMxJavsISmCHq7GOTSETo=
=uA5c
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
