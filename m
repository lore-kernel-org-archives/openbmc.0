Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NCEwPFg6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Apho/40Q"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCy5g6gS4zDqlv
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 17:11:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EE6B20D1A;
 Fri, 13 Oct 2017 02:11:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 02:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jME4S/qf0jkp6LuOwZkOm3ON6Wq0drDEzEIe/HYejy8=; b=NCEwPFg6
 GssYupK4rPNVx8/03KMlJLSJNgnOWuHWpYeTy3QDke5+XlmMhYHNuUfOAvdMmTQK
 16GMTaxMyltMzQUzO7sHqEBYIYF4KZdOT9/CJKRLJDBpOtxg1v4T0C9lvdZvW4Wv
 ToULoadjutxUNa2nP/nmc0bkd5mS5f3a9HbvjHBj6sJh1FYul2mX+oQ7O6oXjVCU
 JlhUF6yTlMNrvyIiYWWhvbPDvPLRoJYZ1euWmvYJPK5UygxPMTRalBENyajN1aMf
 PXGLQB+x9SUt6r61I4tiRAn7BXgYWLusIvY4Crl6Plev7loRr3fA2EqV0lql61TH
 yui7Lkz6blSbuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=jME4S/qf0jkp6LuOwZkOm3ON6Wq0d
 rDEzEIe/HYejy8=; b=Apho/40Qt6SgYNvSJaC1O+d6O0+KwWwVHBG4IHsU6pNnI
 D7d9w39yCvkQjE94pB9hdLXOeD9RpUOuE9/OO4dbdBjVpnRmIsn/0usszO9iFzjU
 cUTiw99KKGf68QCDE/c8Ied7cVKybwpcqlR3ZM1tEm0ILIGyH+QOVVtfRYlQbpB+
 UcEmnvEweNPe/zA11PSjwYaBzOtMXkY9RD9YX/pfkYPJcG2vRhBogKJ2UF/bAbtb
 X0rwrNZ7BWfY6uiadPv+SVNSxCGteLl9mWlVekgN1Fg4xjSdLwx3+JTP6hchzHRu
 b7rvBywKd9fq1+9SpsylcR6GPkOJ+6Qd1V+LxDZmQ==
X-ME-Sender: <xms:BVngWdBbQUvuICQc7gSHZgJL0UtNyN_SMiSQmBuv71PiilWIwkDrug>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB96A24738;
 Fri, 13 Oct 2017 02:11:15 -0400 (EDT)
Message-ID: <1507875069.5452.203.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] drivers: hwmon: occ: Add
 sysfs_notify to throttling attributes
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 13 Oct 2017 16:41:09 +1030
In-Reply-To: <1507322581-13947-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507322581-13947-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-GwIZv9d+QgG870qKKLfp"
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
X-List-Received-Date: Fri, 13 Oct 2017 06:11:20 -0000


--=-GwIZv9d+QgG870qKKLfp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-06 at 15:43 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Need to alert user space when we change throttling state.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/hwmon/occ/common.c | 25 +++++++++++++++++++++----
> =C2=A01 file changed, 21 insertions(+), 4 deletions(-)
>=C2=A0
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index e8579b6..242ba40 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -182,6 +182,7 @@ int occ_poll(struct occ *occ)
> =C2=A0	u16 checksum =3D occ->poll_cmd_data + 1;
> =C2=A0	u8 cmd[8];
> =C2=A0	u8 occs_present =3D header->occs_present;
> +	u8 ext_status =3D header->ext_status;
> =C2=A0
> =C2=A0	cmd[0] =3D 0;
> =C2=A0	cmd[1] =3D 0;
> @@ -206,10 +207,26 @@ int occ_poll(struct occ *occ)
> =C2=A0	} else
> =C2=A0		occ->last_safe =3D 0;
> =C2=A0
> -	if (occs_present !=3D header->occs_present && occ->hwmon &&
> -	=C2=A0=C2=A0=C2=A0=C2=A0(header->status & OCC_STAT_MASTER)) {
> -		sysfs_notify(&occ->bus_dev->kobj, NULL,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ->status_attrs[7].dev_attr.attr.name=
);
> +	if (occ->hwmon) {
> +		if (occs_present !=3D header->occs_present &&
> +		=C2=A0=C2=A0=C2=A0=C2=A0(header->status & OCC_STAT_MASTER))
> +			sysfs_notify(&occ->bus_dev->kobj, NULL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0occ->status_attrs[7].dev_attr.attr.nam=
e);

Why are we now protecting this under the occ->hwmon condition? Shouldn't we
have done that in the previous patch which introduced the notify for
occs_present?

Andrew
--=-GwIZv9d+QgG870qKKLfp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4Fj9AAoJEJ0dnzgO5LT5hyMQAI5vQPLxaEbmNXDwRtyldk1v
23kkB0x1MAEYfQWAtT375K6jruQot70wowFlkMPNz1u+eEVVi1BCM4kwFM6fbacz
qCKGOsGIJes3OD2J1SUCCEd6DGvdkuVRA72rQ2pEz6hYjEO170g3XIPJ9Z/UH42I
VVdMTcmyWgIZUCyvGQpa7aU0+ij4L2hp9z1ktc+K182hQT8g3OkQCZ+coGOJ9oKX
/2uuNErDmhqmneihWTdVRi6P1TwMlrUSKQlhmdC4f4c7M6gMj8QUkMuTiAHWcMQj
aXJ7Sha5CuQTZeJWceAigKRXAAPdXjy74WlNizbL1ak2LQrXCb1jsp6T8zI045lm
qgaRg2eAJse1WrTDt5ERfJJez0UF+ET5ewPYQ0DBFNyMwJv/c1hbsbsTyJspYURc
v27g8a76kQzuou8jNf03hPFA62k604hRw5yfmqjFafI0Bf5JCDYt5LAwlB6nG6uJ
3maWyOt1AedO0GYlLQySDHQm3yKNoZy7/nYFPLa2bTh9pqjptaxqo6++DOgabIwP
rR4mtEz9fcYKw2Top+EEObUskKAuws5sCAZrCyTwmcYQ2vkr5wNjEBCoiVpmYu3K
uz3qgJuw3HMKs5+SLVvRoGI+LoT6WRACHt17N5/Bvfh0NTnhrPm1WdCTSpt/LBc2
1lKNsZAPQ90XM56JuMaL
=YQJv
-----END PGP SIGNATURE-----

--=-GwIZv9d+QgG870qKKLfp--
