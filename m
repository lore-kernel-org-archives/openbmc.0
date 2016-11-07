Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCNWc5qNLzDvM2
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 06:57:15 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478548628742838.1604374142315;
 Mon, 7 Nov 2016 11:57:08 -0800 (PST)
Date: Mon, 7 Nov 2016 13:57:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Nancy Yuen <yuenn@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: C++ Feature Whitelist/Blacklist
Message-ID: <20161107195706.xojpyngn7cmjntqb@asimov>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CAFd5g47QU1FZpv3zyfSTqojaOCaFbE5G-a-OK-2h6YZwoUgPcg@mail.gmail.com>
 <20161103120358.GC17105@heinlein.lan>
 <CADfYTpH5BeijShWafcctTukSUE7DdquNtatdqgVcanNmh+vayQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="amd67hxuk2iyfkcd"
Content-Disposition: inline
In-Reply-To: <CADfYTpH5BeijShWafcctTukSUE7DdquNtatdqgVcanNmh+vayQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 07 Nov 2016 19:57:17 -0000


--amd67hxuk2iyfkcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 02:25:30AM -0800, Nancy Yuen wrote:
> > Back to Big Picture
> > ----------------------------
> >
> > I do feel we are seriously missing a broader philosophical question.  In
> > what ways do you feel the CppCoreGuidelines do not address all of your
> > coding guidelines suggestions?  Rather than write an entirely new
> > document why would we not simply point to that and then extend it if we
> > feel it is insufficient in a few key areas.  As you saw in my previous
> > email, nearly everything we agree on comes from the CCG already and
> > nearly everything we disagree on is a contradiction from the CCG.
>=20
> Our intention isn't to come up with a new document.  In our summit
> meetings, you agreed we could propose a coding guide as you didn't
> have anything spelled out and you didn't want to tackle it.  So we put
> together an initial proposal and we're discussing it.  If your decision is
> to say that CCG is the final say for all coding practices in openBMC
> then we'll have to figure out what that means for us.
>=20
> > I do not want to hear that the CCG is "too long".  If you take out the
> > references it is in the same order of magnitude as the GSG.  It is also
> > organized in a way where each section is a straight-forward statement to
> > be followed, so anyone unfamiliar or uninterested can simply read the
> > TOC to understand all of the rules (ex. "I.2 Avoid global variables.",
> > E.6 Use RAII to prevent leaks").
>=20
> "You do not want to hear"...I don't understand why you state is in such
> a manner or assume we'd make this point.
>=20
> > --
> > Patrick Williams
>=20
> ----------
> Nancy

Nancy,

=46rom my perspective, I've pointed to the CCG as the primary document
=66rom the very beginning.  At the summit I recall hearing two arguments
against it (and it could very well be my misremembering):

    1.  It is insufficient.
    2.  It is too long.  (I remember specifically 'reams of paper' being
        thrown about).

It is really hard for me to refute your team's perspective of it being
insufficient without examples.  You did point out the 'iostreams'
direction in our discussions and I also freely admit both CCG and our
current 'guidelines' are lacking in what is classically called 'style'
(indentation, naming conventions, etc.).

I was also unable to on the spot refute the "it is too long".  It is
easy to assume that the Google Style Guide is shorter, but after this
discussion began I checked the two to compare and came to the conclusion
they are in the same ballpark.

I assumed, perhaps incorrectly, that your team in taking up the "style
guide" would focus on #1 (where you feel it is insufficient).  It is
very frustrating to see the proposal simply be a rephrasing of the most
contentious points of the GSG, because it contradicts the CCG in these
areas.

I would like to call a "reset" to this discussion.  It is much easier to
critique a formal proposal than a supposed proposal.  I have therefore
spent this morning writing my initial take at a style guide.  I have
attempted to incorporate all of the areas your team (and a few non-vocal
members of our team) have expressed where the current guidelines are
incomplete, without violating or changing any of the current guidelines.
I do still treat the CCG as the "gold standard" here and have very few
exceptions to it recorded.  I have kept this proposal exclusively to
items that are not covered by the CCG.

Please have your team review this proposal for any areas that you feel
it is lacking in specificity.

    https://gerrit.openbmc-project.xyz/1024

These guidelines are also not "set in stone" and I am willing to deviate
=66rom the CCG if we have good rationale and can come to a consensus as a
project.  I would like to see us first "approve roughly what is the
current mode of operations" and then subsequently "propose any
deviations".  I think each deviation should be approved on its own
merits and not as a hindrance on the document as a whole.

Is this acceptable?

--=20
Patrick Williams

--amd67hxuk2iyfkcd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYINySAAoJEKsDR8wtAMEZamsP/AkHtx9lmElwK6o5brvswyI3
4CXon80B8/+gWPhkTwb7cFVhB/i98aqub1ya4BSyHPKCydAuWtMgJxtIq07Uio+K
o/rbI/s9sowQklcUysSEFvyOA6xeWQVYh07B94rW3PZ4vtPGAA1r5zkVbttDkNaV
l/XMxfNsWcPUZQQ+0zRsY13UqyPOKAB1TzAcxTSvQ6NLLn6vViCapmhO8zscRQgs
tgpfu+5pXBmXB7m/WGvOOL1EoIHQlr8gN7VfBKNmE7mpurfJAqzwWhpDSOsDFi3z
towhlNRv6josE1qehdT1qvKGLkyXVImo42FB1UjUMlhFLUkSMLemtqujxqah5H+k
UBtM4NLvvJQZmkULzm/3ogtg6Y9m6oJHp3Tv+SOrV2AM8gEhGzwre9uHhL4lPH33
++Jt2X5Vv4RrGX9w6H7XAibh2pnVIJjtElZ5xlMCtQyNue0zcV+o2kc1ITlqBXgl
feu3HHyMl3Qikcb9g7z8chpUb9sjEPBCexptkxIeHZOZAMbb/CgFpfnNKFPiz5CU
BCZ+trl10QnpIEwGEP0Qi/JHu70Hp/cz5+Uly/N3yggZJwMIZGq6bUXNH57zozGU
iPqOCwcdCq1cyowYtv586+xWsX0eKLT1/n0i1pSTkRfrXu2Bn4Mk7E2TRkrsdohC
HZ7VLEFw7GwMp8y9xVmL
=/3fD
-----END PGP SIGNATURE-----

--amd67hxuk2iyfkcd--
