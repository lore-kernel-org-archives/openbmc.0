Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FIiHLYU9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rD99q5C2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGswV0k1tzDrFp
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 11:13:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C022F20DA8;
 Tue, 17 Oct 2017 20:13:26 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 17 Oct 2017 20:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=K7rz8xUPS0TiUkTnihTvHNBAAYZmP3iOHdFIqBubiO8=; b=FIiHLYU9
 as984PvpxHdaq3i/ielY9iCjtKtnh2b10EyOKobJcvoTbkpFAZSoti1XgRyi2tYP
 cjg4aU/FeCmHF7aVTrmRYFk6bH2kAJirRXkyVqPX/8d8T9oAUltETp8UlpgAq0Ln
 wzww8tOS2kkRxRxdAf+4rZwDi860p+hWOuHruy/ZHJQ/z4qrg9gly1E7L4HA06Ed
 nq40O9gkuuPQcN+l+DffNtvlLxqyQpW5MoOgO3x9MmQq6LZuV7fiK7wnsIN8yDRX
 PYY/DEDVl53ow74pt0dF6knohqMYGdZT2XxPhW0vCFGSQWgmhAu6KyOLBztnDT3m
 +IbfdWn6TH8K3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=K7rz8xUPS0TiUkTnihTvHNBAAYZmP
 3iOHdFIqBubiO8=; b=rD99q5C2+ubLZ84yp8TuYMiug2Nz1e546pw3URnsS4yFU
 RtMpUpFjVHKej5FR1xd0lpdVMVdrf6H7zsBPI/EHMzItIlXbU4j6DKkFfmq5GHat
 9i3nzlwdr4vWOKP+jIr0zM/RTOhhEEE19l+S+CWWk0MsblvZRaBlt/CDA0Q3W5rK
 NxkmOQXgKkc4q/ZLV9H8Q7TkykG4q2GtE6XcxxE/tlyQu5ThuzxZqVbxBiUwMfE2
 8VC5B7A9EUbAFr1mON7+Yrm6sp0oDGmeQEs/ppLim9SKAg07YNkRbQYjJy7idriA
 0W1vCrfrJ3eG3k0fLBeUXrXfE6echGDPNuIX3qsOw==
X-ME-Sender: <xms:ppzmWfDw94CYAUsvJRBuFlqUyXW2BAGp7RnNpxrq9XgOe02FQVDXqA>
Received: from keelia26 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C15667F3AB;
 Tue, 17 Oct 2017 20:13:24 -0400 (EDT)
Message-ID: <1508285598.24322.19.camel@aj.id.au>
Subject: Re: Machine-scope maintainers for OpenBMC
From: Andrew Jeffery <andrew@aj.id.au>
To: brendanhiggins@google.com
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Date: Wed, 18 Oct 2017 10:43:18 +1030
In-Reply-To: <201710171825.v9HIP79Q021352@mactruck.svl.corp.google.com>
References: <201710171825.v9HIP79Q021352@mactruck.svl.corp.google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-t6Fy+6ysF2aKsBEbpLwO"
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
X-List-Received-Date: Wed, 18 Oct 2017 00:13:32 -0000


--=-t6Fy+6ysF2aKsBEbpLwO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-17 at 11:25 -0700, brendanhiggins@google.com wrote:
> > Hello!
> >=C2=A0
> > I'm wondering whether we should jot down the maintainers of machines
> > supported by OpenBMC, and if so, where? With respect to the latter, one
> > candidate might be the MAINTAINERS file in openbmc/docs.
>=C2=A0
> I agree with that idea; this is what the MAINTAINERS file was supposed to=
 be
> for. The reason I chose the syntax @repo-name://*, was that the '*' at th=
e end
> is supposed to be a file matcher path (this is mentioned in the header of=
 the
> document); however, at the time there were no sub-repo owners, hence all =
the
> entries were @repo-name://*.

Indeed! Given it's a per-repo description it may get a bit unwieldy but we'=
ll
see how it turns out. Primarily, my concern is that we will have to at leas=
t
describe paths in the kernel repo, paths in the openbmc/openbmc repo, and
possibly a bunch of others. I'm curious if there isn't a more effective way=
 to
resolve this, but there's probably not as that's how the code is structured
(and if we want to have something like get_maintainers.pl, then it needs to
know about these paths).

>=C2=A0
> Nancy and I talked to Brad yesterday and he mentioned that he would like =
to have
> a way to enforce sub-repo permissions, since Gerrit only enforces permiss=
ions on
> a repo level. We, Google, have recently started doing automated reviews t=
o
> verify that Google internal changes had owners that we could go back to d=
urring
> a merge/rebase.

Can you expand on what you are talking about here? You've piqued my interes=
t.

> It should be pretty straightforward to do something similar for
> enforcing sub-repo reviewers/maintainers: we could have a bot that would =
listen
> for all new changes (similar to the Jenkins bot) and then add the appropr=
iate
> reviewers based on the MAINTAINER file entries; it could also then vote +=
1/+2
> once one or more of the appropriate reviewers have signed off.

Right. There are gerrit plugins that can auto-assign reviewers based on
git-blame and such, maybe we could also massage one of those. Is there much
benefit in the bot assigning a score?

>=C2=A0
> Gerrit documentation for doing this type of thing can be found here:
> https://gerrit-review.googlesource.com/Documentation/rest-api-changes.htm=
l
>=C2=A0
> >=C2=A0
> > A related question is: Who are the machine maintainers? Off the top of
> > my head I feel the following machines machines match with people:
> >=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-evb/meta-evb-raspberrypi=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Yi TZ Li <shliyi at cn.ibm.com>
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-evb/meta-evb-aspeed/meta-evb-ast2500=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Joel Stanley <joel at jms.id.au>
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-x86/meta-mellanox/meta-msn=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0Mykola Kostenok <c_mykolak at mellanox.com>
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-x86/meta-quanta/meta-q71l=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Patrick Venture <venture at google.com>=C2=A0=C2=A0=C2=A0=C2=A0=
, Rick Altherr <raltherr at google.com>
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ingrasys/meta-zaius=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Xo Wang <xow at google.com>
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-firestone=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Lei YU <mine260309 at gmail.co=
m>
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-romulus=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Lei YU <mine260=
309 at gmail.com>
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-witherspoon=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Brad Bishop <bradleyb at fuzziesq=
uirrel.com>, Andrew Geissler <geissonator at gmail.com>
>=C2=A0
> I proposed a change that adds the above entries in the syntax that I sugg=
ested
> above: https://gerrit.openbmc-project.xyz/#/c/7409/

Thanks, I'll take a look.

>=C2=A0
> >=C2=A0
> > Less obvious are the following machines:
> >=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-palmetto
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-ibm/meta-garrison
> > =C2=A0=C2=A0=C2=A0=C2=A0meta-openpower/meta-rackspace/meta-barreleye
> >=C2=A0
> > Yet another related question is what do we want to do with machines
> > that don't have an obvious maintainer?
> >=C2=A0
> > In the case of Palmetto I imagine we could find someone willing to step
> > up (/me ducks). Garrison I'm unsure about, and for Barreleye I've had
> > kernel patches on the list for several months with not a lot of
> > interest in them, which indicates to me that we could probably drop it.
> >=C2=A0
> > As some background, Joel and I were recently discussing machine
> > maintainers with respect to the dev-4.13 kernel effort. The approach
> > Joel kicked off for dev-4.13 was to start from scratch against upstream
> > and distribute the forward-porting amongst owners of patches in dev-
> > 4.10. That is, if you have patches in dev-4.10 and that are not in
> > upstream v4.13, you should rework and send them for us to apply to dev-
> > 4.13.
>=C2=A0
> So this is something we have been trying to deal with internally as well,=
 I came
> up with a merge/rebase document that described a system for keeping track=
 of
> internal changes. At its core, it relies on a set of commit footers:
>=C2=A0
> * Effort - used to specify who the work is for. This makes the project
> =C2=A0 responsible for supplying people to address problems supporting th=
ese commits.
> * Origin - Specifies the original version of an internal commit; used whe=
n an
> =C2=A0 internal commit is rebased or cherry-picked.
> * Dropped - Specifies that a commit is to be dropped in any rebase.
> * Upstream - Specifies that a commit is to be dropped if the commit can b=
e found
> =C2=A0 in the branch being rebased to.
> * Git-repo - used in conjunction with Upstream, used to specify a non-mai=
nline
> =C2=A0 upstream repository, this should probably always be an upstream ma=
intainer's
> =C2=A0 for-next repository.
> * In-review - used to specify where the most recent version of a patch is=
 being=C2=A0
> =C2=A0 reviewed upstream.
> * Maintainer - used in exceptionally rare circumstances to identify who i=
s
> =C2=A0 responsible for maintaining an internal patch.
>=C2=A0
> We also have an internal GOOGLE_MAINTAINERS file for files that are not
> upstream, rather than using the Maintainer footer for everything.
>=C2=A0
> The idea is, that whenever we do a rebase, we can run a script that looks=
 at the
> above footers and should be able to resolve most of the issues; either by
> automatically dropping the commit, when it has been superceded, or contac=
ting
> the appropriate owner when the issue needs to be resolved manually.
>=C2=A0
> Let me know if this sounds useful, and I will get the document in a forma=
t that
> I can share via email.

I'd certainly like to explore this more, so if you can share please do! I'd
like to get feedback from people on the list (primarily those affected,
particularly Joel, and I expect Brad will be interested).

Thanks for the detailed reply, clearly it's something that's bothered peopl=
e
besides Joel and I. If it's bothered people beyond us and Google, I'd love =
to
hear your solutions if you've got so far as having any.

Andrew
--=-t6Fy+6ysF2aKsBEbpLwO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5pyeAAoJEJ0dnzgO5LT500EQAIgW/4jdPLj+0Kn81ZuWnkGn
rwqERr2MUk2i/DtA1Mry2yUDBIyAYpY0tIrHL6I/r1aHskLlewc7ooOo+Xa/H7LB
LRGJHbmbophvv/sYEPomFErFN/l7krnzPN85bYFz38j4WDFDvimEtrFB8ADDjsOJ
sKvrB9J8hzXOSZHw2jJlEtLiHeOrJsvtx8r3eHozP2Kb6xqce+qgeQpe6nH/fDBT
gV3SBojPo9qI8oE2AOdeFTywkhYCrI5+pgjGOR4+9TosAWkX5Ew83MBU0K5HeoTJ
kt7jsxZh+yyBLHMWA4uUFq8D+E6W2EDkt9WMgVkrf91diRQxsDuSaEqKRNBjrJu4
qt/mPeQE3WmQkz4psclzmcmox0ApcYCDDZRGfAoyz0X6aIZ3Ivq2rnTKinQGjLxQ
QcfqRnYz3SB1XL/JADukXHku/B3gR8EfScADTGjLIsy+FjIqcWLQvasOmDyKk4Mm
MDlI+Le5HFgkh5oITxCmCMsy/tYHHp9v3i55NueX/X0OZQ7deYtjaXGOdWaatyUf
q1eZmzVsgQzeINxNxzktWYg6aVknahN9p8/IKynjTgg9nMAYnRXWaKHL2SfLOTjc
KDke3Z4A5DCZmUq+twOYdInolMMXTyRDkx5rPTBiO3OwIiNuKxuhcBTJ7ZLsyGiu
AKOLHRKXvz6bDgnREXxe
=qYIz
-----END PGP SIGNATURE-----

--=-t6Fy+6ysF2aKsBEbpLwO--
