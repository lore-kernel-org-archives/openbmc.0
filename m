Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qsgbMAY6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="G5ZPLioJ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7TBV6czwzDqhf
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 10:14:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DC6FF20C1A;
 Thu,  5 Oct 2017 19:14:56 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 19:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=pjPvC9jVVzMv2tBE7CYeYf8StgHEqoQuZJodeumio
 wo=; b=qsgbMAY6H38FIojeYfU2sjvhYpDLAryAyXdVsjeXd5B7Sst4xrsFcPTUf
 wLyk6khLVswCPSkCbFIfkMInFuQXn472l8WDggPj5WR65JM/SRmp2a1A2lYiV42I
 XtrBBq3rBklW5QB5v//FkKhRm28asF+CkRbTaeclnu9ZhnD4jjaDXMIA3aAMSzO+
 QB5QTTiLAE0z7anN5pCdFS65HCTRxmtvMfSkgEh7Io00Qo1+sSra/+Rkqn1D6B+c
 oEpXzNbaDwd8q3fKgnBJJs31XVbtVOsCls6QdSyw6oQ3kOsG4ruMnSAXODtthCS9
 uVFDC+XdJsuPeZyp4CSr/iBTJDHsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=pjPvC9jVVzMv2tBE7C
 YeYf8StgHEqoQuZJodeumiowo=; b=G5ZPLioJbrcH/cq+RSPweIREUNTZn/bXh8
 WYVfhcjdLzx9g0vxn8m0NeZ5Bsy1eQEejvYiYyWrCMb5zW1ec/hho3RYje1q6RSf
 MxAWjr47kIAQU427NvyFK6Xze9RLYo2g4Td8RYC53AlK8ZblU59RNyLG0ZvaVZ8H
 ++viBSWhBJV25PObpmw9t7bMaiHQwjJOhJpof0XdBDTxh+Hfr9CHDjNalPBb54pN
 HZEpCcyWvhYRv+T1qouGCk7ijqceBFv62rJEdbymyJOO7pg4G81B5m7FEmqDraNP
 WysCaUC1NcTqMpxt0j5QgezPXRRB1W2tN+7pdlvjkMHPexxgNlqg==
X-ME-Sender: <xms:8LzWWehyTpG-HXxvvl4SOnxVrACM-WPB0yHkJnSo218VpGkOKvIYWw>
X-Sasl-enc: it4XzhADGwWIzQlc98TYaTmJktPf+B9EEVH7Khh8tj/X 1507245296
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id D43707FA8C;
 Thu,  5 Oct 2017 19:14:54 -0400 (EDT)
Message-ID: <1507245291.5452.111.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 24/31] drivers: fsi: occ: Remove
 unnecessary platform_set_drvdata call
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 09:44:51 +1030
In-Reply-To: <1507231464-13635-25-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-25-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZVWCaYdLIsmKlp/JjgX/"
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
X-List-Received-Date: Thu, 05 Oct 2017 23:14:59 -0000


--=-ZVWCaYdLIsmKlp/JjgX/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> The purpose was to set that pointer null before probing. However, it is
> set null by the kernel by default.
>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/occ.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=C2=A0
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index 916c342..561b029 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -703,9 +703,6 @@ static int occ_probe(struct platform_device *pdev)
> =C2=A0	mutex_init(&occ->occ_lock);
> =C2=A0	INIT_WORK(&occ->work, occ_worker);
> =C2=A0
> -	/* ensure NULL before we probe children, so they don't hang FSI */
> -	platform_set_drvdata(pdev, NULL);
> -

Bizarre that it was even there in the first place - do you know the history=
 of
the comment?

> =C2=A0	if (dev->of_node) {
> =C2=A0		rc =3D of_property_read_u32(dev->of_node, "reg", &reg);
> =C2=A0		if (!rc) {
--=-ZVWCaYdLIsmKlp/JjgX/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1rzrAAoJEJ0dnzgO5LT5hEMP/RYZu+gU4DvA28zXmXHCbLOi
oO+19fEge3pcJPd0JgSsW+keEn/i5KaBeDltlLYtzUO7MM77DQELbHL5NDAOMtgo
LAzEuKOOgt6nAqbbnSeltlXG5cCsFz0LRQiIYUpUpudjDhviIqlyDsKn2M+Zq6SZ
rvpM5+aCO1+OECaDm4bW1rXYj4MJ+Ld7YOVKC9q1gs0YFINWqwgU36+MGuUDo+qK
ekUceKz81W2ti2wwmfOc3ixTlZP3XoKKPcDq3LouKBRczhDiGe3w/7zLkH/Pt3aQ
l3NDrLnwh6Uib6XQ+AlPUc72FddkaMUQNsbepVPEWN0+dxlZV59/1GUEfcTIct8+
s9ujLyQwIxCoVl6KlG/gO0MQ2U3bjfLZpFbt6AzvMXe0TO0HpGNbH5GovE0cCea2
vZX0OE55IsxNutQymYlg/Yjg/jO+yE0dSkNA83hSSl8ODWeL/ZUDKdepkawiIpcY
ut1/XFXM8OBfvUe0GWuP35KxjeSa7Q6CR72wlcfyGfvFWj06dAK9+CLAQyYw9paA
6Ykkkyrb20Jn7ChjeJQ3XcMMfJzTK/Ii0X/fMkvj/r8pTm0Xyg8P4zLYdD8qHNp9
DS5Ae4HJMjzJmWNtk/EMCKd5NRqKXaphq2eL3t7YeEeQ4b2As61rjT0fLWuDLrpl
W+TGDQ5VjnyZ1DXN0H2r
=0osa
-----END PGP SIGNATURE-----

--=-ZVWCaYdLIsmKlp/JjgX/--
