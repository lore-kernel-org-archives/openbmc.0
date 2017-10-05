Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="djQxguna"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iryC6e3/"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Srx4cHnzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 09:59:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 97AB220D65;
 Thu,  5 Oct 2017 18:59:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 18:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=kgHdBHmh9/Qxc3kDtISbMwQfuygr6ewRHIjlmBqPF
 V8=; b=djQxgunaRbfkaY2OmTioNb4U2dAkYD+EoYti4e80HJK+6balW3MZer+mL
 D8+Dl8i2RmSms3usYNsfgAR52k5RfXLRs8s21tbzANkBvjhPWgrFafgo+n8Er7HI
 UCe46EmkLwebEaCrNRBSpOIt6Sf6tRKDrX1XKxATAuw4J78NNbMYGrvgez59PX+H
 gFP77u1ohY41zPK6IRn0Ihz711/M+K/huOsATiobbMlrFpGRfreERYBNZdZW8otK
 cmoaiO6rXWLiPv+Q9ItQs6NkfdxdrR+V43VPtuIEmdCp5MG7rw4xEDhTQ5eUiMJa
 P0iJBNP7zrVgUipei2cJUsLKvkL8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=kgHdBHmh9/Qxc3kDtI
 SbMwQfuygr6ewRHIjlmBqPFV8=; b=iryC6e3/+mcrzF/4Jdh6qO+VvPAptdDCFg
 6hxXIJBXsI6ZJYBm4rGvvyl3DKtmYX6QjV5lTVigGeAQ1Atq9qSTIq9QOIN20yHQ
 qNLfYOZFeBmtjcWr29umJ2pMMuv96RfUs7iY0vO/DBmMst+o/09jhgyflH1feIUL
 gewABW8XacQ5UDEgcDCyS8ROUYFtGl19h8gUdHo0YIhyUojZ9klu8u6aiVSSsY+U
 5UcevWFiXoamHFDvhyjXFwGiN4vNVD9mfNdRvDx1yIUuC7QoIK56z6LFfHh0Nmnu
 y2lrVzQQf45u5bQyASv5Ci9YpPmerdOlvMGCzc211DNPuBF0nzxQ==
X-ME-Sender: <xms:X7nWWcZMLKYOyelh8Ixo4LSi7iaIs_I1KmiXcyFzqB_jI--S8kSxiQ>
X-Sasl-enc: J4QT57dzb8ubXWmEJIWxlM0ECtfIyKy0ObMf1aaqwyfp 1507244382
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id A020C7F9D2;
 Thu,  5 Oct 2017 18:59:41 -0400 (EDT)
Message-ID: <1507244377.5452.99.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 17/31] drivers: fsi: occ: remove
 unused occ_command structure
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:29:37 +1030
In-Reply-To: <1507231464-13635-18-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-18-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tbI75wclXFBrjv+c2sC2"
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
X-List-Received-Date: Thu, 05 Oct 2017 22:59:46 -0000


--=-tbI75wclXFBrjv+c2sC2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/fsi/occ.c | 8 --------
> =C2=A01 file changed, 8 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index cd60c5a..82a60c5 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -46,14 +46,6 @@ struct occ {
> =C2=A0
> =C2=A0#define to_occ(x)	container_of((x), struct occ, mdev)
> =C2=A0
> -struct occ_command {
> -	u8 seq_no;
> -	u8 cmd_type;
> -	u16 data_length;
> -	u8 data[OCC_CMD_DATA_BYTES];
> -	u16 checksum;
> -} __packed;
> -
> =C2=A0struct occ_response {
> =C2=A0	u8 seq_no;
> =C2=A0	u8 cmd_type;
--=-tbI75wclXFBrjv+c2sC2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rlZAAoJEJ0dnzgO5LT5b7AP/RmLjrvv3rz0tqxGGFH+RFlj
qYvzY3wKTyW5kllTeWsdxiX4C3cyIy91LkwpxeJpbmzbVbX+z6VTMgHQbgWJch5d
gJEjnKt/4zHbpmKkL9pto/Umly6SiHMKUyfG+hib0R4VehIK0I356oGP099tn2jt
d++9f18GOLfSDpvWJ6eaByhKww1FANnBkrcuJBFiJhBYtNsIMqdTA0CkxHhGC0bo
Z0qFiHNBMio3yBdBhONI0ZQ1JWRo5HYYVVAq4c6VDsQh1yVwdtZDruTub2IeEBnY
dAtRBKpX3N/Kffw9ovze9C/eWAOfPUK9ALyzV2gI/3xLCoG45V9c+0nXd7whthUj
kYTDyqLHFiaE0xHbxqf4rDNwWMVimnelaOW1uvaKsg2cECMwyctCgRSIYPc1Jb1D
5fQszuHXD6Gr51FlExC5scpqfvyWbpC3bm2lK2AkYa4PUt8BN47V2z2uAoMuNyYh
VtRiPuo3f8HQjOntDHzYPlDaWy14HYcrkZj2QGbjd9mAIcxccN2WJKotbh6s7fXT
Q9FC5mSCmYl/mRFn3RUcm0cH6y3DPq/cdM/OZ3IaHH441WKOEaGDQ+TqPgcBc7ku
3+lEsbjzL9lBoSYRiNaxRkCrqZNMMLutyLm9Sfj62myuNccz1tckvqypjTkCZm80
847tOaXQQLTho4B1qThA
=8Y5I
-----END PGP SIGNATURE-----

--=-tbI75wclXFBrjv+c2sC2--
