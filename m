Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcd8J0dynzDsS0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 16:39:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ia1FcmF1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eLLhUl+g"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BC56420DCF;
 Wed, 23 Aug 2017 02:39:57 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 23 Aug 2017 02:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=NwyFJrC3xQMWWoci+Z/+t+NQVem7p2JapDLygdRb2
 wY=; b=ia1FcmF1b69FGHTAVPPPfrHcj5nbx0Gvvzt7GWc40EsCjmiOg1ofN8aHJ
 nF6IPkeTVGULVN24rZJCa+Qau1DOJnOuf8Z5s18KQATnL9aNYKPOHy78226FNHT2
 8+2hV3K6ab0h33VVRCIfgfDWfcDxX5uogMANBfzwS0pcZb3twb16byP1BXaUKM/H
 v8FOo/fONzt8MJmDigRmsQ/sryPesgVSXa01IxBGBzTgVfX1CUa7rjS9iyxaag+/
 rEpt5EQMRGz2xRnbXZPwvvb4bpNKP7rIVDz8AcJVEAk282+PzrTGEePmTI1Gm7sc
 NW/aw5yEhmwCJn+mspfAhnPJW6DPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NwyFJrC3xQMWWoci+Z
 /+t+NQVem7p2JapDLygdRb2wY=; b=eLLhUl+g7ysVEfDDCpDp/fbWlycs9OmRFF
 ZSi+YK1CMksVTBG8iu3toR4wKIyiNjGU/SW2Pb90f6L+QlnJtSZEwC37E+yNqoxY
 G/7wjulEIyr8eVeZyqAaL19v/pIn72XFsOr7v2KYb5Ytbs08tKycPTk5hbRHvnig
 6a7354CDf5+hw3O6B9mT0sOsFzdrVeRf1jr/LOnQmOR71MuTNfqlbV/XzCONPHOz
 cn5Ia8QLn5wgmZuWUVyVrQNmT1oI2pXvxwaO+81bWXenMS7VfJZASNrkqYfuQ+zj
 Hd10EEk3cOzhx+e7ZLikkfyFTzD270WZglUjphTMPkGbzZZLvX7w==
X-ME-Sender: <xms:PSOdWYUN5o0RtDZh-zzojS9XrRecX6dnl_gToz0cak2IE8PNO6JPPw>
X-Sasl-enc: 2fVWhDeuGG9YxvrOxj/pM40SauhklGr1O51pWFVkskkY 1503470396
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4266D7FA5C;
 Wed, 23 Aug 2017 02:39:55 -0400 (EDT)
Message-ID: <1503470389.7266.35.camel@aj.id.au>
Subject: Re: What does it take for OpenBMC to merge code
From: Andrew Jeffery <andrew@aj.id.au>
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 23 Aug 2017 16:09:49 +0930
In-Reply-To: <OFBCEEB1DF.062FDE5A-ON86258184.004F4953-86258184.0054E20B@notes.na.collabserv.com>
References: <OFBCEEB1DF.062FDE5A-ON86258184.004F4953-86258184.0054E20B@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-L/fsJf0Z8ZPX0Ztcf+8d"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 23 Aug 2017 06:40:01 -0000


--=-L/fsJf0Z8ZPX0Ztcf+8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Tue, 2017-08-22 at 10:27 -0500, Chris Austen wrote:
> For a some time now a question keeps popping up. I ask others for an
> answer and get I different responses. It's time I bring this to the
> mailing list for further discussion... what will the OpenBMC project
> merge?

I feel that the question is broader than that:

	What defines OpenBMC as an OS distribution?

The properties that we cook up in answer to that would provide guidance abo=
ut
what designs and code would be considered acceptable.

> If I add my own meta layer will it be accepted? What if I
> wrote a device driver that satisfies my own hardware needs?

Nit-picking at the kernel bit, I'd hope that the author sends the patches
upstream!

> What if I wrote a dbus telemetry monitor with the capability to download
> results in python? The https://github.com/openbmc/docs/blob/master/co
> ntributing.md file goes in to some detail but is pretty blank on the prac=
tice
> of what kind of code will go in.
>=C2=A0
> So, what should the policy be?
>=C2=A0
> Should the OpenBMC project be a collection of random software or a
> structured framework or somewhere in between?

"Collection of random software" is a bit loose, but I'd like to steer clear=
 of
requiring adherence to a structured framework; I feel like that might
inductively lock us into decisions we make (or have made) now.

My preference is that the project provides a bag of tools and a build syste=
m
that someone can take to construct a BMC distribution, mixing and matching =
bits
as they go.=C2=A0=C2=A0This may require little or lots of effort on their p=
art, but how
much effort someone spends isn't our decision. Composability over monolithi=
c
frameworks.

> Some pieces may need to be hosted independently... hosting non-comformant
> parts implies a level of support and maintenance which is something we sh=
ould
> not be doing.=C2=A0

I find it hard to address this point without getting distracted by how we
define conformant, but you're probably right. Whatever is out-of-tree is
unsupported from the perspective of the project.

However I think that we need to be flexible in what the project accepts
(conformance). Particularly, if someone has a relevant contribution that th=
ey
are willing to maintain then we enable them to do so. What we need to enabl=
e
*that* is to develop a model where code ownership can be sensibly distribut=
ed
through the community.

>=C2=A0
> What about code with existing modeled concepts. IPC is done via dbus,
> LEDs and Sensors too have established meta-phosphor implementations.
> Changing those idea would break down the fundamentals of what OpenBMC
> is.

Would it in general/the future? It does for what we have currently - D-Bus =
is
fundamental to the reference phosphor userspace. However this suggests to m=
e
that you've written the post with pre-conceived notions of what should defi=
ne
OpenBMC going forward, but haven't explicitly called out what they are.
Outlining them will help everyone to understand your position.

> For models that have not been established yet perhaps the
> developer should be active on the mailing list describing the issue
> so that we can provide guidance?

I'd say even for established models. Just because something's established
doesn't mean it can't be improved. It's less likely, but that shouldn't sto=
p
people making suggestions.

Regardless, I think communication of ideas, desires, designs and implementa=
tion
strategies on the mailing list is essential.

>=C2=A0
> Is there a place for staging? The Linux kernel uses them for less
> stable code. Using a staging area does at least two things...
> 1) Recognizes anyone coming to the table brings their own companies
> history and business requirements
> 2) Allows developers to share ideas that could build in to an
> approved model=C2=A0

I think discussing a staging area would be more useful when we have a bette=
r
understanding of what we're building as a community. We should probably iro=
n
that out before splitting hairs about quality issues that might relegate
contributions to a staging area.

>=C2=A0
>=C2=A0
> There are groups that want to get involved and are at various stages
> of OpenBMC understanding. We owe it to them to be very upfront about
> what the community will and will not accept.

Absolutely agree on clear messaging: Managing expectations is important, an=
d
I feel minimising disappointment in a community that is still early in its
growth phase is essential.

Cheers,

Andrew
--=-L/fsJf0Z8ZPX0Ztcf+8d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZnSM1AAoJEJ0dnzgO5LT5O3YQALPry5UhBynmfJjLvWxQzC6P
32mUgp6TkfJAU+56Gi6mqpYgOyDLZ01t+iI94n+oyJ5uUKvijUxI9ebBcT+0lAlW
mJ+yPQrMQLGECvGsAayQDyXOBbfniZo7iaZCFgSP46HLskqgwL24fKMy+XgVyD65
/a5xPlVVpzsOhvj8qI/rC32r/MeJHJKdU7Ivxhs0V+BNrovVmWVf6B5Z5eTiYo9v
sqQQmwjeHu9x2DkiN9TMLil/nC8j669Vn8fHyZtVzq52b4LSreFpPhcItX2XAXIk
4bhIssYim3PlArx2Zk6W/hMYZFD6/93bq9KfcqDq+wYtzLl/ZXoN8LKM6YFOIIeo
8Hkzm90wIKLxtyCz7yUtYdFtb4NMyMLkB2H6PGOEvK374Ffe/aV/bZ2izHWMNIjr
XTOGoV8M+I0OFmYXWF5OW2pZgp+0lLvhO7FUvcgxz+E6bSeqMGGco5vQE2497vBz
cl1gnTD/zCrqySWeGKo/H8JPg0TQ+gCAzh2COSJ8ycdj6PrHlxos+uw4dkc0R4qo
zaHHUay4UFIw+9DCmWLZCSm8/5D9OKpnEGK4p4xqVm2uRMB34IM2wk/2MMauDH7F
grN0P8aIiU6f68ABgHQqZBmKQEkj7tjmmlj/Gv95p5JzDu+0jcoNH1mBH31WxR+q
E+/PfSXN7luC+cj/PPmu
=jBmW
-----END PGP SIGNATURE-----

--=-L/fsJf0Z8ZPX0Ztcf+8d--
