Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdGMy5JLRzDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 14:35:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=hKZvBQet; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Eg4pJwwC; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id A412729B;
 Mon, 27 Jun 2016 00:35:56 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 27 Jun 2016 00:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=5ENsE
 uP2F7IE/gLUyfmajtsWCXU=; b=hKZvBQetFrOGBu5doCNRRZWEZrfjNtxgg+oWX
 tUUXWP3ruHcQV3BzYow3PcEOAKdppuCwFqidFEEEKiN+rev9tDQN/E4G984oOxtN
 wNEgxnCVx4e0RBvRrE+EwAWXCToH2Ock7svmTT0VcM/GcrevRpWW7rnEKcHsoaF5
 ljmpiI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=5ENsEuP2F7IE/gLUyfmajtsWCXU=; b=Eg4pJ
 wwCtP7TpoQEXj1o1OAmL8GjdUrOr4O6kHhk9A3v6wBqc75AyC1GnLQbbp8NDGXfn
 /e6XZ1bjTyoV+8uzSBYd9jEdbpm+kW4oUh/6QAk1d9KLpZwlzM6bnt5M2xhe8nf3
 Wq1Cx9WnPNaLO21D+d8AJ4N48976tfxP2dSdro=
X-Sasl-enc: WgbQMq67IKKhfEY2bp3bI4o8a3kZTKdF2ClpM86l5xlR 1467002154
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFC68CCD26;
 Mon, 27 Jun 2016 00:35:53 -0400 (EDT)
Message-ID: <1467002149.23740.172.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 17/18] initfs: update: Sanitze whitelist
 directory entries
From: Andrew Jeffery <andrew@aj.id.au>
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 27 Jun 2016 14:05:49 +0930
In-Reply-To: <OF8047CD3F.A7CFD5BB-ON00257FDD.00802FDC-00257FDE.000121F4@notes.na.collabserv.com>
References: <1466663149.23740.88.camel@aj.id.au>
 ,<20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-18-openbmc-patches@stwcx.xyz>
 <OF8047CD3F.A7CFD5BB-ON00257FDD.00802FDC-00257FDE.000121F4@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+PiEaq8h6EpiFzHVc32w"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 27 Jun 2016 04:35:59 -0000


--=-+PiEaq8h6EpiFzHVc32w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-06-26 at 00:12 +0000, Milton Miller II wrote:
>=20
> On 06/23/2016 about 01:26AM in some time zone, Andrew Jeffery wrote:
> >On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> >> From: Milton Miller <miltonm@us.ibm.com>
> >>=C2=A0
> >> Repeatedly strip trailing / and /. from whitelist entries and
> >> fail if an entry includes /../ or ends with /.. or doesn't start
> >> with a /.=C2=A0=C2=A0Also use the entries quoted to avoid any glob.
> >
> >Right. Ending this particular sentence with a '/' is a bit subtle. I
> >think you should quote your path bits: "/", "/.", "/../", "/.."; this
> >way the sentence would end '... or doesn't start with a "/".'.
>=20
> Ok done.
>=20
> >>=C2=A0
> >> It was noticed the save code was saving directories that ended in /
> >> into a subdirectory of the last component name.=C2=A0=C2=A0This was tr=
aced
> >> the the code creating the directory just stripping the last /
> >> and then copying to the directory.
> >>=C2=A0
> >> Choose to sanitize the entry where possible for ease of use verses
> >> a small performance penality.
> >>=C2=A0
> >> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> >> ---
> >> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 15
> >+++++++++++++--
> >> =C2=A01 file changed, 13 insertions(+), 2 deletions(-)
> >>=C2=A0
> >> diff --git
> >a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> index 7120a18..bfacd00 100755
> >> ---
> >a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> +++
> >b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> @@ -170,13 +170,24 @@ then
> >> =C2=A0
> >> =C2=A0 while read f
> >> =C2=A0 do
> >> - if ! test -e $upper/$f
> >> + # Entries shall start with /, no trailing /.. or embedded /../
> >> + if test "/${f#/}" !=3D "$f" -o "${f%/..}" !=3D "${f#*/../}"
> >
> >Can we do this with `readlink -f` or `realpath` instead? Do we have
> >them available in this environment? As in, test that the result
> >before
> >and after realpath are the same. You can tell realpath to not expand
> >symlinks.
> >
>=20
> ENODOC
>=20
> There does not appear to be a man page available for realpath(1)
> in either Debian wheezy or RHEL 6.4.

Okay, as suggested in your link[1] it looks like debian ship their own
realpath and RHEL 6.4 is probably too old for GNU realpath. GNU
realpath has:

=C2=A0 =C2=A0 =C2=A0 =C2=A0-s, --strip, --no-symlinks
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0don't expand symlinks

So:

    $ realpath -s /etc/../etc/alternatives/cc
    /etc/alternatives/cc
    $ ls -l !$
    ls -l /etc/../etc/alternatives/cc
    lrwxrwxrwx 1 root root 12 Dec=C2=A0=C2=A07=C2=A0=C2=A02015 /etc/../etc/=
alternatives/cc -> /usr/bin/gcc

> =C2=A0 The man page for readlink
> is talking about expanding symlinks with -f saying it follows symlinks
> recursively, no where does it talk about cleaning up the path, nor
> returning the path of something not a symlink.

Yes, readlink -f was probably a poor suggestion if we don't want to
resolve symlinks.

>=20
> A qucik search turned up [1] which shows some of the history.=C2=A0=C2=A0
> Also note it says busybox (which is the version we are using)=C2=A0
> does not take options in its realpath command.

Right, this is the killer bit, that busybox realpath can't do -s.

>=20
> Also this is already peaking under the covers at the read-write=C2=A0
> COW directory which is a sparse copy and not looking though=C2=A0
> the combined file system.=C2=A0 And this file subtree is not mounted=C2=
=A0
> at / meaning any attempt to follow an absolute symlink will likely=C2=A0
> find the wrong content and not necessarily fail.
>=20
> So I am rejecting this suggestion.

Given the above, I'm okay with that.

>=20
> [1] http://unix.stackexchange.com/questions/136494/whats-the-difference-b=
etween-realpath-and-readlink-f
>=20
> >> + then
> >> + echo 1>&2 "WARNING: Skipping bad whitelist entry $f."
> >> + continue
> >> + fi
> >> + if ! test -e "$upper/$f"
> >> =C2=A0 then
> >> =C2=A0 continue
> >> =C2=A0 fi
> >> =C2=A0 d=3D"$save/$f"
> >> + while test "${d%/}" !=3D "${d%/.}"
> >> + do
> >> + d=3D"${d%/.}"
> >> + d=3D"${d%/}"
> >> + done
> >> =C2=A0 mkdir -p "${d%/*}"
> >> - cp -rp $upper/$f "${d%/*}/"
> >> + cp -rp "$upper/$f" "${d%/*}/"
> >
> >Again the while loop and other bits can hopefully be replaced by
> >`readlink -f` or `realpath`. The whole trailing-slash thing with `cp`
> >always throws me.
>=20
> While the test here for $d is absolute I'd rather not do it.=C2=A0 And=C2=
=A0
> right now this has at least two / (one in the string and one leading=C2=
=A0
> the $f) meaning a simple equality check of $d and $(realpath $d)=C2=A0
> will always fail.

If we know everything in the whitelist is absolute could we take a
different approach to the path construction?

> =C2=A0 I could remove the slash but that implies the=C2=A0
> first check,

Isn't it instead that because of the first check we now know that the
whitelist path is absolute, so we can validly removing the leading '/'
to construct the necessary path?

>  and again we are copying from a sparse directory and=C2=A0
> want to copy a symlink not resolve it.=C2=A0

Sure; as above, realpath -s would have avoided the resolution but as
you point out we can't use it (busybox).

> =C2=A0 I'd love to use rsync here=C2=A0
> but that is not currently available.

right.

>=20
> If you object to the while loop I can reject the path if the conditions=
=C2=A0
> on $f with similar substitutions are not equal (reordering the fix
> commit). I don't anticipate the loop executing more than once
> unless someone is testing corner cases and thought the convenience=C2=A0
> of making the entry sane was better than the debug why the entry
> didn't work.
>=20

What you've got sounds preferable. The path string hackery is
unfortunate but sounds unavoidable.

Andrew
--=-+PiEaq8h6EpiFzHVc32w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcK0lAAoJEJ0dnzgO5LT58SAP/iMsTtTI1Muzb4fSQWYktXwX
MJ/g9czKXXFLgvrdet8KdEbqvEmnPjGKYnsL/LTTpCmrWRo0OxzcQBrf+QtEZLmJ
nDXUG8D064vc4SX2mQTC9R5TDujreT66yHgwgi3s8Gwuwcd+5knnsbCS5HCJdBWZ
z+Eoc+BHNaqKOl3id3coYdtokfPFdD8WMB6QlY0rURivXLpVssIzY0U520rtUez/
LqIHtmaCZ8lbr0lk4QYcrKVbSBnJnewUUOgirOjDANLOBugXVMWRlqc51sh7Toi5
wvXma63wXggvstL7plyQhmr76KnZAzAlWCevMw4oDaPBX5R6vBic4Tx1yX6ZS2qe
uTv4FctTIfcxsbtCVuq4n6qcZP+oJ64MS3JOFsi3mPoSeLGh2Xuj4LziJ74jiK/K
De4kj1KQ61nzmZRdrbszkHev+vm/f5imU97KV3NkjhCTPiCFPHmXjwE0crCm0GEt
lewPaldRriTV/auEIRzgTSFwFqlwa6/ZQegzKuPwqckcX7sT1HK/EWhgLQxRPu79
PbIUffNh/PwETrz/cEjaAazVWNusN9buhWTrYcxW3puN8jG0ZNb0dElE1TedupL5
c4FgVAzCmX+JkDEuoyfkt16KKVLIAz+Z9U2IZ8uv8v80J4wIQ+2+6woSBz5qp/39
5mQAs/3C2aCTiDg4yLPX
=YcYL
-----END PGP SIGNATURE-----

--=-+PiEaq8h6EpiFzHVc32w--
