Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lClWPqzt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WHiBL5T2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yKyCd1Ll2zDqT0
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 11:37:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 210F720CC9;
 Sun, 22 Oct 2017 20:37:15 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Sun, 22 Oct 2017 20:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=UyLZUamfVHQ+gjs9iqOuUEwWomVcAnA1ZlPSooDNOew=; b=lClWPqzt
 z7qNibSqf4MvehGtk3BRwVHfR2O9arIho81yuH2t7Mrpan6aEkRUZRDHcxoZNcaL
 xoAaclf/Mw7jZsFmzZq3rAkXsS96dogODbuNj+X4pNUF3WmFF1Byq10HRf+TxzLt
 w7wcztGAENk2c93fLIQIdxC8PDPT+hpqtD4l6YQFV8FTnhEpFbyVpG7sqaSvXrQG
 nBE0e5uO6B2xHqEleSnLqX9Re5ct6TI1bI6/A2/lP7Cz2PBxPMnQQ8ChC5+KbiQT
 ONN7NUcgThgmnBZuYXDaIjKIgq55Zy89BREVh3W5XReNWhEyvHFDghNOOFN1LMRh
 wLuma6fphEwORQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=UyLZUamfVHQ+gjs9iqOuUEwWomVcA
 nA1ZlPSooDNOew=; b=WHiBL5T2m8MbF1TSMI9871R3jGoiSP2X+hbiMVtD0SGJ4
 gsCKdwBCZXbicikBjnYPFScvTsgn1OI/dHljZxR7bfFOmrhW6cROhnspQ6KOr4yg
 h1TxfSgUuDjBefyJlM2VqxOfFNmj7CEoYrkZamrM5C16sv5uArb1p815R6pu+ufH
 xXXVs8s6Iua0VAvE9Je4M3C+K7hiNMFoghZAeIVUQV2es6MUirxnxiFowLMfJFWK
 V0UzqcZUNRIc/kzGWQDaQuT7KHEq15HnFS7vfwcctCeE0nhp6VheJ9dBXHebRXTu
 9qUHgzRyBXaF42F68SREosjgVEqRbnuNiUaYVWvzA==
X-ME-Sender: <xms:uzntWXhMKRlWNefVQP-wgclLLnMnnnff0lg68WBcOXu8OhzBhoQi8w>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF81E7F91C;
 Sun, 22 Oct 2017 20:37:12 -0400 (EDT)
Message-ID: <1508719029.6013.6.camel@aj.id.au>
Subject: Re: Machine-scope maintainers for OpenBMC
From: Andrew Jeffery <andrew@aj.id.au>
To: brendanhiggins@google.com, joel@jms.id.au, bradleyb@fuzziesquirrel.com, 
 yuenn@google.com
Cc: openbmc@lists.ozlabs.org
Date: Mon, 23 Oct 2017 11:07:09 +1030
In-Reply-To: <201710182357.v9INvuHg032656@mactruck.svl.corp.google.com>
References: <201710182357.v9INvuHg032656@mactruck.svl.corp.google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-KbHhGGiWi2KgblhK3aUR"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 23 Oct 2017 00:37:17 -0000


--=-KbHhGGiWi2KgblhK3aUR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-18 at 16:57 -0700, brendanhiggins@google.com wrote:
> > On Tue, 2017-10-17 at 11:25 -0700, brendanhiggins at google.com wrote:
> > > > Hello!
> > > >=20
> > > > I'm wondering whether we should jot down the maintainers of machine=
s
> > > > supported by OpenBMC, and if so, where? With respect to the latter,=
 one
> > > > candidate might be the MAINTAINERS file in openbmc/docs.
> > >=20
> > > I agree with that idea; this is what the MAINTAINERS file was suppose=
d to be
> > > for. The reason I chose the syntax @repo-name://*, was that the '*' a=
t the end
> > > is supposed to be a file matcher path (this is mentioned in the heade=
r of the
> > > document); however, at the time there were no sub-repo owners, hence =
all the
> > > entries were @repo-name://*.
> >=20
> > Indeed! Given it's a per-repo description it may get a bit unwieldy but=
 we'll
> > see how it turns out. Primarily, my concern is that we will have to at =
least
> > describe paths in the kernel repo, paths in the openbmc/openbmc repo, a=
nd
> > possibly a bunch of others. I'm curious if there isn't a more effective=
 way to
> > resolve this, but there's probably not as that's how the code is struct=
ured
> > (and if we want to have something like get_maintainers.pl, then it need=
s to
> > know about these paths).
>=20
> True, maybe there will be some way to shard the file in the future? If we=
 only
> have the MAINTAINERS file at the root of each repo, it still does not nee=
d to
> know much about the code structure, but we loose the ability to have one
> MAINTAINERS file that describes cross repository machine ownership, which=
 might
> be valuable. Time might provide the best insight on this.

Yeah, agreed.

>=20
> >=20
> > >=20
> > > Nancy and I talked to Brad yesterday and he mentioned that he would l=
ike to have
> > > a way to enforce sub-repo permissions, since Gerrit only enforces per=
missions on
> > > a repo level. We, Google, have recently started doing automated revie=
ws to
> > > verify that Google internal changes had owners that we could go back =
to durring
> > > a merge/rebase.
> >=20
> > Can you expand on what you are talking about here? You've piqued my int=
erest.
>=20
> Sure, I wrote a Gerrit bot that looks at the commit messages on changes
> submitted to Gerrit. This bot, which I named Gerrit Watcher, checks that =
the
> footers, discussed in my linux-change-tracking doc, are present and that =
the
> commit is appropriately maintained by someone.
>=20
> If the change is not "Upstream" or "In-review" (also discussed in the doc=
),
> Gerrit Watcher checks that all affected files are listed in Google's MAIN=
TAINERS
> file (with some exceptions). This is logically similar to what we would w=
ant to
> do here, since we would be scanning our @docs://MAINTAINERS file for matc=
hing
> entries and then adding those people to the review and then want to make =
sure
> that they actually had a chance to do the review.
>=20
> >=20
> > > It should be pretty straightforward to do something similar for
> > > enforcing sub-repo reviewers/maintainers: we could have a bot that wo=
uld listen
> > > for all new changes (similar to the Jenkins bot) and then add the app=
ropriate
> > > reviewers based on the MAINTAINER file entries; it could also then vo=
te +1/+2
> > > once one or more of the appropriate reviewers have signed off.
> >=20
> > Right. There are gerrit plugins that can auto-assign reviewers based on
> > git-blame and such, maybe we could also massage one of those. Is there =
much
> > benefit in the bot assigning a score?
>=20
> Having the bot assign a score is just provides a zero effort way to see t=
hat the
> change has gotten the appropriate reviews. We might not require that all
> reviewers sign-off on a change, but only the people listed in
> @docs://MAINTAINERS, or maybe even a subset of them; that might not be en=
tirely
> obvious to whoever is responsible for merging the change.

Ah, right. Makes sense.

>=20
> Just a thought. Maybe it is better to just make sure people are keeping u=
p with
> who is looking at the reviews. Or maybe we should be more liberal with wh=
o gets
> to +2.
>=20
> >=20
> > >=20
> > > Gerrit documentation for doing this type of thing can be found here:
> > > https://gerrit-review.googlesource.com/Documentation/rest-api-changes=
.html
> > >=20
> > > >=20
> > > > A related question is: Who are the machine maintainers? Off the top=
 of
> > > > my head I feel the following machines machines match with people:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-evb/meta-evb-raspberrypi=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Yi TZ Li <shliyi at cn.ibm.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-evb/meta-evb-aspeed/meta-evb-ast2500=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Joel Stanley <joel at jms.id.au>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-x86/meta-mellanox/meta-msn=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0Mykola Kostenok <c_mykolak at mellanox.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-x86/meta-quanta/meta-q71l=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Patrick Venture <venture at google.com>=C2=A0=C2=A0=C2=A0=C2=
=A0, Rick Altherr <raltherr at google.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ingrasys/meta-zaius=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Xo Wang <xow at google.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-firestone=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Lei YU <mine260309 at gm=
ail.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-romulus=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Lei YU <mine260=
309 at gmail.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-witherspoon=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Brad Bishop <bradleyb at fuzziesquir=
rel.com>, Andrew Geissler <geissonator at gmail.com>
> > >=20
> > > I proposed a change that adds the above entries in the syntax that I =
suggested
> > > above: https://gerrit.openbmc-project.xyz/#/c/7409/
> >=20
> > Thanks, I'll take a look.
> >=20
> > >=20
> > > >=20
> > > > Less obvious are the following machines:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-palmetto
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-garrison
> > > > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-rackspace/meta-barreley=
e
> > > >=20
> > > > Yet another related question is what do we want to do with machines
> > > > that don't have an obvious maintainer?
> > > >=20
> > > > In the case of Palmetto I imagine we could find someone willing to =
step
> > > > up (/me ducks). Garrison I'm unsure about, and for Barreleye I've h=
ad
> > > > kernel patches on the list for several months with not a lot of
> > > > interest in them, which indicates to me that we could probably drop=
 it.
> > > >=20
> > > > As some background, Joel and I were recently discussing machine
> > > > maintainers with respect to the dev-4.13 kernel effort. The approac=
h
> > > > Joel kicked off for dev-4.13 was to start from scratch against upst=
ream
> > > > and distribute the forward-porting amongst owners of patches in dev=
-
> > > > 4.10. That is, if you have patches in dev-4.10 and that are not in
> > > > upstream v4.13, you should rework and send them for us to apply to =
dev-
> > > > 4.13.
> > >=20
> > > So this is something we have been trying to deal with internally as w=
ell, I came
> > > up with a merge/rebase document that described a system for keeping t=
rack of
> > > internal changes. At its core, it relies on a set of commit footers:
> > >=20
> > > * Effort - used to specify who the work is for. This makes the projec=
t
> > > =C2=A0 responsible for supplying people to address problems supportin=
g these commits.
> > > * Origin - Specifies the original version of an internal commit; used=
 when an
> > > =C2=A0 internal commit is rebased or cherry-picked.
> > > * Dropped - Specifies that a commit is to be dropped in any rebase.
> > > * Upstream - Specifies that a commit is to be dropped if the commit c=
an be found
> > > =C2=A0 in the branch being rebased to.
> > > * Git-repo - used in conjunction with Upstream, used to specify a non=
-mainline
> > > =C2=A0 upstream repository, this should probably always be an upstrea=
m maintainer's
> > > =C2=A0 for-next repository.
> > > * In-review - used to specify where the most recent version of a patc=
h is being
> > > =C2=A0 reviewed upstream.
> > > * Maintainer - used in exceptionally rare circumstances to identify w=
ho is
> > > =C2=A0 responsible for maintaining an internal patch.
> > >=20
> > > We also have an internal GOOGLE_MAINTAINERS file for files that are n=
ot
> > > upstream, rather than using the Maintainer footer for everything.
> > >=20
> > > The idea is, that whenever we do a rebase, we can run a script that l=
ooks at the
> > > above footers and should be able to resolve most of the issues; eithe=
r by
> > > automatically dropping the commit, when it has been superceded, or co=
ntacting
> > > the appropriate owner when the issue needs to be resolved manually.
> > >=20
> > > Let me know if this sounds useful, and I will get the document in a f=
ormat that
> > > I can share via email.
> >=20
> > I'd certainly like to explore this more, so if you can share please do!=
 I'd
> > like to get feedback from people on the list (primarily those affected,
> > particularly Joel, and I expect Brad will be interested).
>=20
> Cool, originally I was going to scrub our internal change tracking doc an=
d
> attach it below as markdown, but then I decided that it would not take mu=
ch more
> work to make it OpenBMC specific, so I just went ahead and did it. I post=
ed it
> > as an RFC here: https://gerrit.openbmc-project.xyz/#/c/7435/. Let me kn=
ow what
> you think!
>=20

I intend to get to reviewing this shortly.

Cheers,

Andrew

--=-KbHhGGiWi2KgblhK3aUR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ7Tm1AAoJEJ0dnzgO5LT5VMwP/0h1pmUtXBlGBDSF1D7bMZr3
TcZ2kgjHeZ1aLgZqOrRn1PAksgVFAISsGu0j8tmJIQtByoosBpOhXceiN9psuJQA
o71fePm8lWd1cQozkJmUnxFeUyiKpS+yaRXD4Mty3b55OqsY2YhS52SXlD3qyhPq
SQNzaQwVN1jyrrSoIYxW1seEa4kgdMOGZ56TaY7b1LwlzvVd9PalRu2he+Vc8aUi
NoI1680I7lZHOX/3a8eAPqXgSdld+PukMmiMEW08mt1PPngH1OXkEzBQGy5rzJRF
e10SgeoMR8RFCljUDEoAmpSaRWV2q6CuPx+SZQZvEG9g2No/eT20Wy//9cpFCSsP
zyRX2bfKXVpH2p73jVyLsDMpYv2F9PBA6HWKffldKbBubx9xmQ37LBjO4sbFs039
5mCnycGeeZu4JerkV5ikGHsu1q/LoVxsW36VdTeNYQPA8bciCfgRz+DMoTHy9FFF
JLPNInj7BWeSUT4fKzK+Iv1rlk4bqWwbnKDCpTqK1ydBq4FOXcD5absdv5jVY25q
tle/dI9AhW1rTvERZCRTXrfALG/JSWkqIUzHEN29MFsG7cjhvpJg4GJ/1OdWgafK
JbGYidDMEQwFOHwcjRhT9TMKUKdfoVCyKoxDy7zPm/RKF8V5YSwFnABfJZt94Ca/
/bu2DYhZIRrqovixCaRi
=Wzlw
-----END PGP SIGNATURE-----

--=-KbHhGGiWi2KgblhK3aUR--
