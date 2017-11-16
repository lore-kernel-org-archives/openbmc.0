Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="s9BdcqXk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mAmp65T2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycl6t5DrPzDqpp
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 13:09:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B2BC20C6E;
 Wed, 15 Nov 2017 21:09:23 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 15 Nov 2017 21:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=cog+LHlCovDbilr8gdLqDP6mScwsyj009Z/dGBk1jnE=; b=s9BdcqXk
 CToiO3nRgp+8V91X0cuPfD25BeaaRzbtPGctx5CFuGyFJ1ESWGsXEgbNbzpFYaP3
 StgmFTmwxALmXY5mZloSq5PE/rehCr82+lKAjvKAexHi//Nc7M8l83I/BEU9h9JV
 AmVKExEirB/byEfgHD2jSgTOCRx9cAxnPJaN1uya7IAa5s2ysoqBkkyW01+mWU0f
 PbBXnzSnLBkbk4oFTzTdK8WgEZhvcMH7LEbh6VDibY0LZxqNP1VC9Ve0iQ+0nrkz
 Of9l54JxAo/bVMYbKn0Iv8l4lnxGUwlqQnk8GFgkxRRsqdyt6sHr9CmoStb5JrrP
 bpSjCjJW3aTdfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=cog+LHlCovDbilr8gdLqDP6mScwsy
 j009Z/dGBk1jnE=; b=mAmp65T2bAgu+Iewa03gHqcNixrlDCuiylUGQXP7B2FA2
 fY30j5IOxUa8EDYia1ITU7vz8mnRtcIix35W4MHkpw66PeZ4eDpQPwKuShLfqaG2
 1onqb6ExbQSlRDtAvbxJFyOPRxR0nX2HD99X9UiNZWgf4mUtvVsKDt6OvmvmwdsF
 4FCgl77oqivgHjkQ7cKqLY7GdiPR0IQfr+UJClEBHILKwrfJ91dbpTyZQUf1B6sm
 FuS7Evo5apEgoC8O8LlbrDQDCN5D7QHwKD5u00r+14Fv1D72dDxIJ69u8sfZ6ilc
 fpp1/DmT00ylFM8Rnjqbgr3EsRnG1iuwj98Y0A98w==
X-ME-Sender: <xms:UvMMWpBZSk-eWytijFzlW5fF9MVQOyTOeYmDXHyjbF3XYJbkemGbgw>
Received: from dave (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67DBD24BCA;
 Wed, 15 Nov 2017 21:09:21 -0500 (EST)
Message-ID: <1510798154.4287.86.camel@aj.id.au>
Subject: Re: Gerrit code review velocity
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Tanous, Ed"
 <ed.tanous@intel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Thu, 16 Nov 2017 12:39:14 +1030
In-Reply-To: <1B00151F-6B6E-4060-8316-F955F9A8E20F@fuzziesquirrel.com>
References: <7E9441B1E5EFFD4681F54958E82169932EAF506B@ORSMSX105.amr.corp.intel.com>
 <1B00151F-6B6E-4060-8316-F955F9A8E20F@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-EYxDuupU90a5Rqrv6wRu"
X-Mailer: Evolution 3.26.1-1 
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
X-List-Received-Date: Thu, 16 Nov 2017 02:09:28 -0000


--=-EYxDuupU90a5Rqrv6wRu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-11-15 at 19:09 -0500, Brad Bishop wrote:
> > Do we have  a process for how long code review->test->merge should
> > take, and what process it should follow?
>=20
> We don=E2=80=99t.  My personal preference would be for this to be at the =
repo
> maintainers discretion.  I=E2=80=99m sure that sounds bad since I am the
> maintainer of nearly all of them, but I do want other people
> maintaining eventually and I=E2=80=99d still say the same thing even afte=
r it
> wasn=E2=80=99t me.
>=20
> That said, I=E2=80=99m more concerned in building a community here, so I=
=E2=80=99m
> willing to submit to group-think if others feel one way or the other.

Maybe patches should be left up for review for at least 2 business days
if they're not a hot security fix or something equally drastic.

We probably need a way to identify the list of people who would likely
be interested in reviewing them as well.

Andrew
--=-EYxDuupU90a5Rqrv6wRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaDPNLAAoJEJ0dnzgO5LT51OkQAI6iHXmTkRYV92MoSLtd5cFn
JOeD01WyRH0+JJWTWXpJu1EtEluY3+fTELnHet4+AGUyMB7VHTFyrlP30sS68RM9
CRJhw4aEenXp61fQTbiAAvmoBO/wrSO0aO+VK6BNTkLl5on8KTs3QisP9upR9dtq
0YWs5YTUicuoxsLush0VPN+mZE9HAGwdeqFgMh9SdxlWvy2mY4gveExzLw6j9QI9
AZeL+6Spb7xi3lLz4tqdZEV2uvuETYu2pxiW2kYjhiq5/ummh35Otr/WLVSHEGoa
9aMziK5TCyITPS1snmX/3E9c2t+y5Ld9QzOZsQ7p2+Wq0COpBumzOCupZ3vA2je7
MhnYxPsocsrr2O3BX4mOT2DZK6bCx9DrUYIEKkUw3FwQnMx81ID1EAv+cr5Jv9ZI
vCg2fluIZR3SxCsnNeSki1oqcpkrHeHpuVeb0SDcPSuOTXT9u39AlhZtDKtKytys
SjPsQStkHysmtD0BlMrhAg6DR5u2sdm0cf0/gglkBsZLVo4V62Xmj6c88u5uhmr8
v2jmpFiLrY8emNxWeM+WIL1VFJqZSYjqdIg9lcHocH6G/fwnam/mQ2DSwSHOAI5L
XMGmdDIRYbIQSCYhlapV55D5ag1ooqjYqAO4R0ZZQxlrmsvoQdKZxaa3uyx/X8nM
4s08gCsMQ6WHU8Q7kEiL
=L4Wn
-----END PGP SIGNATURE-----

--=-EYxDuupU90a5Rqrv6wRu--
