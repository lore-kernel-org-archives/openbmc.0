Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tmFwaig5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="n8bNvq9E"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNNBm2x9tzDrn7
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 10:14:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD8BE20BB7;
 Thu, 26 Oct 2017 19:14:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 26 Oct 2017 19:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GK3J3lKjy/gu4Yj9fH7v4rGXbyuzerLUHcAjIiL1i5k=; b=tmFwaig5
 eRk3tMTTjwyINq60QBA598pv9pzuzCNrAUYvSoN3zHLLHUurFxsFPSF5bVzWHUAF
 T12c2uxjlF565f9lkhEq2GdufPoVUCQHoSAUWR1hq4OIGKO80CvS7/ndBwXWw7nI
 1Mjb/ct37x8RpK8dezyjE6PIoEtE494OXihoeDUkiBunHE9ApSUyMROe1ORns1Bz
 GqLKz1HL3YjlMsYvBI7fl+ZY9B7i0Il3XhTrjeqE2K8fAorNN6X2JwfU71ILEfJR
 /3AZ6/yiX4GwGhoCxWPnu/h+B1RS6ZnqVO0d28DIB8sZ5Vj5mvpJlBajT0+vOimn
 JaEAru4LvMZvOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=GK3J3lKjy/gu4Yj9fH7v4rGXbyuze
 rLUHcAjIiL1i5k=; b=n8bNvq9EztsApst9UPbFuC06B1JSnTKBL3CPRzkhlRPJn
 x73dbJnReF8+YCy2vjIcYlMhUfRNCYUoLNGQnXRapHarn6MlaXXUHYtSv3wuY+si
 tKbruEuwarhMpEdAh2R4ANaRWQ6p8AISmUE7YuILPUG8m1nW/Gpz18p+srryqaqC
 DwQsM/lAyafDh++vTC8ytL7+LLChEZwehQy35sACKCHVLE7nt3EsmDmANTq2jmf1
 eP2yShkBJ/1W8ltX5z9n4Jz6t1n620jF/Og8mJqdZnfKdnHg3RuI8kf+A46Dtpv8
 WQqaIGkmaF/QoTlIGeS13EpldRh+U6ihxDQN/c0AQ==
X-ME-Sender: <xms:bWzyWVEpmXFxhrcqEBiZXElJURav4Bj-ikvxLLTck5LeKQsZW34fzQ>
Received: from keelia40 (220-253-52-107.dyn.iinet.net.au [220.253.52.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8BA07F92C;
 Thu, 26 Oct 2017 19:14:51 -0400 (EDT)
Message-ID: <1509059688.13477.11.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/2] drivers: sbefifo and occ-hwmon: Fix
 memory corruption
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 27 Oct 2017 09:44:48 +1030
In-Reply-To: <1509048913-30936-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509048913-30936-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+siCqFQVn39YMi52Zix8"
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
X-List-Received-Date: Thu, 26 Oct 2017 23:14:57 -0000


--=-+siCqFQVn39YMi52Zix8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-26 at 15:15 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> There was some potential for bad memory access in the sbefifo driver. Lis=
t
> iteration will access the current position iterator, which in some cases =
in the
> sbefifo driver was freed. Use a safe loop and delete the member from the =
list
> first.
>=20
> The second, more severe, problem was an incorrect amount of memory alloca=
ted
> for the extended sensor attributes in the occ-hwmon driver. That was my m=
istake
> in initially adding the extended attributes. I suppose we haven't hit muc=
h
> memory corruption because the occ doesn't normally return extended sensor=
s.
>=20
> Edward A. James (2):
> =C2=A0 drivers (fsi): sbefifo: Fix xfr deletion in lists
> =C2=A0 drivers (hwmon): occ: Fix memory allocation for extended sensors

Thanks, applied to dev-4.10.

Andrew

>=20
> =C2=A0drivers/fsi/fsi-sbefifo.c=C2=A0=C2=A0| 19 ++++++++++++-------
> =C2=A0drivers/hwmon/occ/common.c |=C2=A0=C2=A02 +-
> =C2=A02 files changed, 13 insertions(+), 8 deletions(-)
>=20
--=-+siCqFQVn39YMi52Zix8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8mxoAAoJEJ0dnzgO5LT5D8IP/00aSsbEcJ6x//gpc9Z6tV0t
mGHeHMGYRT50E+obgXl+LNYQkD/xjzO8j77dqnVA1CladC0DPZF0qLVvJpV7hnk2
WxbLXg0X1KTSVyOAlNd0blB41ZITFb3W2PDGbRk7hYXuWzXm1r5qWInsSEpQeUte
b1umcREsvi2oRGV5bQ8lj2M4qNs+LybJASA0u4PeXHgTBSWJ+fW31iLXN7fT54MB
ogrbzAzl9C3Fd6IKUwHn0NB1rl4QvZXOMphGW52PoqGeYqQhEn2MLtTfpOTTK7CJ
IGlqpBfyTtGz8Jyw63QEJnGAYRvtIJaCaOftdgWLk9fwZglZqqD+MaymB3X2wkE7
NvpkQe2hzsNMoRb2b/kVnaQXYiDdCMQFkORe186ZpEeAQU3bqB65ypxFJJkHHLG/
nhIsyt45Ek0Ro1S6GqU2kZ446f8KQV6kDONtk2aILLaFhMH58dPbtCvFBrNVRku4
Rcjaqe4ZRNpenb86vzkj/FVkkm3Rs2lz7NTT+V+u7jllwUedR9m8ffGVLtcr/WGd
U9vDVoPltMZ0RI31wssjlddUAzFLD060eSh7hTgjWPOGD7RnDYJ5HcMDF8eWi4gS
BovleTw7fk27pSjKFl7BnOBkn2QW0aIVUgwQcKvt3w8qBdYOlOxfCKKcWLxlZwqv
S+eTn91EtzEby4LSVaU6
=KbFZ
-----END PGP SIGNATURE-----

--=-+siCqFQVn39YMi52Zix8--
