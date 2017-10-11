Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FA+W2xUc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rWjcj382"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBjzy6skHzDr6N
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 17:02:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 95B5120C6F;
 Wed, 11 Oct 2017 02:02:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 11 Oct 2017 02:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1Zcpf/r42be3PuvpSpfaHJOUAAPMVxaT1ZYJ8y841aQ=; b=FA+W2xUc
 BnqP1z+gjAbI6SHUDPY4ACcqhuX4YlrzFD9sL6h4zY2mL5c3yy5ZGFNSccS+KA3o
 UhnNyLDayCmfPy6d+KtUNuUWG0BEtj5MCVL4vWjzZNiSHxympCeA3YGds5ufPgqi
 3VbbD62bTP20e8g4rKtigBk2Iid4pbDuEOUoQ30rm4TP5VhlRRGWJKeahjXGvFf7
 pIrwnYSK9baAcxHo2ybDuM/YneUPb3S5qucochWRaGHUhWNNWlcwhYwxmMm4dMbX
 KCwDYdCuxCoov9rEc++mgzGCmyzk0L3p9hUu5xmlMvls1orElUErUq/PL3lImG4M
 x0+3a/RQyJHR7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=1Zcpf/r42be3PuvpSpfaHJOUAAPMV
 xaT1ZYJ8y841aQ=; b=rWjcj382xQuk5850yFWyAsLRBIE5QmkFobWJW8iI3OGG5
 c/CBQwnkmn2H6ipR58GN6Fwu08Rjiw0xYxsbGJwbYnZQpDzgTYf0d9+f2eMvto+g
 uS+o4LyMNxXYyNeSq+mbAEMBn/iEkApvh/X4MBpQDo4l+2mlh58EtPOVUqSxugAH
 hp3PQzyk2dkp+p/6YGcrfcRbUgJgJBjNmsjnH+1Ev9RG5DnR9mp+BDwcdoM5GmFk
 xLxIJKtIT14Rz4gYmEJlBTAvCzA09UoTWutylqKi+y1csQHpuggchW/B2ZCBLoY/
 bvxa3EhR2SvTHao6Sv5H2v7BHLNgGyLfr0mq0HyyA==
X-ME-Sender: <xms:3LPdWWJnMnrLxEDRzsnCMeDL6HmsHV2ECC0ItvKy-MpPO4cE7VZ-NA>
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA3D77E660;
 Wed, 11 Oct 2017 02:02:02 -0400 (EDT)
Message-ID: <1507701718.5452.179.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/2] drivers: hwmon: occ: sysfs_notify
 and presence detect
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Wed, 11 Oct 2017 16:31:58 +1030
In-Reply-To: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-saYMXqf3Du3aO0dseJ7V"
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
X-List-Received-Date: Wed, 11 Oct 2017 06:02:07 -0000


--=-saYMXqf3Du3aO0dseJ7V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-06 at 15:42 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This patch set removes the error checking for the number of OCCs present.

I'm interested in the back-story here. Why are we making this change in
behaviour?

Cheers,

Andrew

> Instead, export a new sysfs attribute to indicate the number of OCCs pres=
ent
> from the master poll response. In addition, add sysfs_notify both to the =
new
> occs_present attribute and the throttling attributes.
>=20
> Edward A. James (2):
> =C2=A0 drivers: hwmon: occ: Add occs_present attribute
> =C2=A0 drivers: hwmon: occ: Add sysfs_notify to throttling attributes
>=20
> =C2=A0drivers/hwmon/occ/common.c | 49 ++++++++++++++++++++++++++++++++++-=
-----------
> =C2=A0drivers/hwmon/occ/common.h |=C2=A0=C2=A03 ---
> =C2=A0drivers/hwmon/occ/p8_i2c.c |=C2=A0=C2=A04 ----
> =C2=A0drivers/hwmon/occ/p9_sbe.c |=C2=A0=C2=A04 ----
> =C2=A04 files changed, 37 insertions(+), 23 deletions(-)
>=20
--=-saYMXqf3Du3aO0dseJ7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3bPXAAoJEJ0dnzgO5LT53+AP/RtCnPi5z7Ox8SWP1TwVgvRr
J3lQhrR46Kk8AGL+5MsfR3DOHj3HPILGePpvzPfKBK+VHFHG36Rm4ImTW8gjskzB
K/Ic/pb4G22842gOZ1WoljGfU562o8VbqwyEXWBMWWYgQpLZWuNAVidgHoUsJDs8
BfJbgMWBUGsDbSNjfwjKiwaKVxrRIeJlZMBB+jqklfosC23y+0q8+c0NaM0hcIfY
HjrE3nsSYow0db0ywy+4uqChPyaKJ7HxuhTpFTundYStsiR6H3FpJhzKnH64skey
eKVyntFYq+ZFdy5ptAhmI095UIdi9UzP9oClUTcawRBjB7jYW2DfOVHVCNNfDi0k
3rGZYix4jXOK+VyduyrSWiNxEXApUz4DMdBUSyq8bitH/WIKngVI4pFDP6wjZk5v
FidhKppMBHzfuAf3dEqRKtqNW3jWvLamJ5LhUdIB287nDA9HElwOSyeFwNGuM5yf
O2EKu46EmTUl8dmQ4mgHI8tGLxaKYL7r2JzARki9JqJaFLRyLsuXPZzzpECrZbP4
vSFlgohblqh54KwNAd2pKQggev5XPsDic0XFen3hYmNBSBXYh6V2VGpE9DmTbkeB
/SciuuZsxiOK/q/8tL7wYSomFLQoyaWBaZXDw0AQOru5T4sz+Y2UWWFAsZ1zk86d
kfbAPRyHZDmGKiGpkM5n
=RoBZ
-----END PGP SIGNATURE-----

--=-saYMXqf3Du3aO0dseJ7V--
