Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nAmBhkay"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QB+H384e"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6QK06YprzDqks
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 17:01:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DBB26209F3;
 Wed,  4 Oct 2017 02:01:54 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 04 Oct 2017 02:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Jf44ULksIh3CBQUnHF5TjGgZGsVYxCxJN8FMlGg4V
 BQ=; b=nAmBhkayha8JRuLpCS1B1xryJ6BcxRS/PSV5SQnlYoD5/NB0HLOmRf8xs
 ZUyaCDWDghVQMoIuZpTLNhbWdNsIDD5f4jBDZzr7jfEqmoeqdQ/ed2XH7ugdJH6Z
 PZH0Fzu8JX2FFiDrFYJ0Mg64cbIYhJkjSZOtT3b/GF/Vsyf+cdOCGrlTBjAumXiu
 ly+06RhYOuSXdl6Qj9Sizlbu7P+gIfUHMUZuXmLDT24urmASnQl6Xs5aTYtK850L
 NEEqOckPybsoJfmjhj/4hJmbD9TNtyVUGh2ym7+2SEXTFNT4s0pggGkVo5/vyzcF
 PXJLWsTe8BjOfMkB2SZuI7R5xjMdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Jf44ULksIh3CBQUnHF
 5TjGgZGsVYxCxJN8FMlGg4VBQ=; b=QB+H384eOW8dAbqeG25JwTYqf+RLyZfg17
 lfpBHVn7Urj1Oz3raYOC1bI3jaiMSyZBpeJYMCU8vLRCsCjmdusRrUSfypSbd9UO
 x9kLr1Y9GEhY9C+CxTOmLBTFkl/DT9ovHOyPHHRYt2P0RSOyvGwWBIrURPjsx33p
 DEETudsn0qIyetKGKYkS69Il6w17J9ruQTzi96aurizDUZ6EHRN/KE4Ar/5NkDMr
 yFruC2pKCrgWLVnUIdxoK6lHsq6CnUcrS/qsK31rJGmNvbFB/ozwWdPmE5hsyDH7
 BSZky08M+ushbGrE2+E2o0oZ083Jlp5yKcocx1xbpI4ZWAG5xb7g==
X-ME-Sender: <xms:UnnUWUE2OCTrsrBTsEObI6ecM7C_eNl3-NVSjtAGaTklNJRz4njljw>
X-Sasl-enc: pEoj4I4uPm/xMyoyHuDUY5gRQ8rc9zryJYEetFv8p7Wo 1507096914
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD2E47E8E6;
 Wed,  4 Oct 2017 02:01:52 -0400 (EDT)
Message-ID: <1507096909.5452.25.camel@aj.id.au>
Subject: Re: Call for maintainers
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Chris Austen <austenc@us.ibm.com>, Jeremy
 Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 04 Oct 2017 16:31:49 +1030
In-Reply-To: <CACPK8XfTqXHH53aN3+crxfEktrg_ipN8c23zT1gjcUmzBEmhtQ@mail.gmail.com>
References: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@notes.na.collabserv.com>
 <CACPK8XfTqXHH53aN3+crxfEktrg_ipN8c23zT1gjcUmzBEmhtQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-st9l9MMcmiE/lSRXYW6s"
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
X-List-Received-Date: Wed, 04 Oct 2017 06:01:57 -0000


--=-st9l9MMcmiE/lSRXYW6s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 14:24 +0930, Joel Stanley wrote:
> > On Tue, Oct 3, 2017 at 11:22 AM, Chris Austen <austenc@us.ibm.com> wrot=
e:
> > The OpenBMC Project is looking for future maintainers. The amount of co=
de
> > now and expected in the near future will be more then any one person ca=
n
> > continually handle. If you are a subject matter expert in a repo under
> > https://github.com/openbmc or cross functional areas then taking on a r=
ole
> > of maintainer might be appealing. This isn't a paid thing, this is
> > completely voluntary opportunity (think Scouts without the camping or S=
chool
> > volunteer without glue).
> >=20
> > So how might you go about getting this type of role on your resume? Sta=
rt by
> > signing up for code reviews
> > https://gerrit.openbmc-project.xyz/#/q/status:open. Over the next few w=
eeks
> > we will be looking over the reviews for 1) understanding of the compone=
nts
> > architecture 2) Comments focusing on architecture that satisfies the ne=
eds
> > of all 3) bugs 4) and more. Try to Focus on a single project.
>=20
> I'd like to put forward two names of significant contributors:
>=20
> For obmc-console, Jeremy Kerr. He's the author of a large amount of
> the code and has helped out with a number of reivews through the 20
> comments he's made.
>=20
> For phsophor-mboxd, Andrew Jeffery. He's spent a lot of time reviewing
> patches and helping guide the direction of the project. He's given 166
> reviews, and made 207 comments.

Thanks, I guess.

Andrew
--=-st9l9MMcmiE/lSRXYW6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1HlNAAoJEJ0dnzgO5LT5b+wP/j26E3AhOHOu33McetQjNLRs
aUhMd93ChWYgmvL4lQ2p1SZ/+g1BT9KarwTB7YBB6HjbfEQjFRw6GYNvigp1vS0d
CdctWilAgJCqaCrJdGZmpvn/qavRTzKX+gyEbU5jjLPO4SkoMbtSlYvxf/5UBXyL
+BXTHVSLtJeESirHy6qOHopC27+65WaKGYfQ3o6tlPcPeTigKnSmVi2oNchQcXuj
/Hbt+IjspIPd9kloXMw4rzEd+5QtWNYgbPy8+7/Y/zdeQZmMkIVkFsbnGVMyZg6b
qJvHx8KTx8tbLTWvJ/cPy4hwd7r6ziRfJLWX+uXMXZNRRDdYQzpvuHbAN5slaCsx
aGJQLK4szgije25omeiKYIv/6IOP/f3n2I9e8rnsH2rNyZIh+mMatN4EE5FGkXJj
JOjzdBxNCHft7yrPpkn8enOz/4mEOoTdwLIi9o7R58mNaXANre7rBuQ8YWUKD6Ac
bae0G185hbyf6+MLSr3XRjFz1TKzuo5Cz8LXbPLhKrZHFoa8iZnh9XLeH7XNJE2D
ZL51KpMJ2dzZ3j8/kF/qQoNQoZ0ZwpJiGraozSEXFMPQtSAqDs2chiqCSNrwT+oz
VufVoA6StkAwgF+6gbPvvlJyoHp2BR/4Zgf1lelNQYkCYLAK6v4bZBKSXEZjdtxT
nq85OMpN69AY74ysB6sE
=z6Vr
-----END PGP SIGNATURE-----

--=-st9l9MMcmiE/lSRXYW6s--
