Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZxXD2SZDzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 10:50:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=VTyMILBD; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=J/3M5N1J; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B725206E3;
 Thu, 15 Sep 2016 20:50:18 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 20:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=zvk6/
 U0NB+ayS4NobooSoSZntMg=; b=VTyMILBD1h8jNECRgKdS0rXhtVBE7w564UW1r
 L74Duioz57NZsglrE6tV9ReD2FHlsHrT5tSXlRvxMjQZt+Rsr6H304H3rwzaQ3qe
 /6ixycFxKdv5pIcGPJvrW57kIAv1YYuqz0kBobkpG/nxWW3u1/z3+J/O80uhhF0P
 CfhRBQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=zvk6/U0NB+ayS4NobooSoSZntMg=; b=J/3M5
 N1JvjbUTAKtyYvOKJBVCPGRwIRbUW2HE0++DMicUVjbDvxHKFSM/kTT70Ldx5yF1
 lBDz5o4IyHW7Dpdv+tJe35t0L7LVANV3eVtzQKxPg/QTNEXbAgsT5y2IJaZl6uju
 KFMc+t15ITRRzSmTl0khDxvDTNHNDTo+7jFbB8=
X-Sasl-enc: 1CB463edgbBxjF6MNSSbsA3IFcnjUmoLLJoJQBTDfKKO 1473987017
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB61BF2D2A;
 Thu, 15 Sep 2016 20:50:16 -0400 (EDT)
Message-ID: <1473987013.13249.13.camel@aj.id.au>
Subject: Re: [PATCH 03/16] Ensure that the old style MDIO interface is active
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 10:20:13 +0930
In-Reply-To: <1076636982.194621.1473971629669.JavaMail.zimbra@raptorengineeringinc.com>
References: <1076636982.194621.1473971629669.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-wlKjfl+wIplQCEWKURNa"
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
X-List-Received-Date: Fri, 16 Sep 2016 00:50:20 -0000


--=-wlKjfl+wIplQCEWKURNa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-15 at 15:33 -0500, Timothy Pearson wrote:
> =C2=A0before registering the MDIO bus on Faraday style
> =C2=A0MACs.=C2=A0=C2=A0Without this patch the hardware may continue
> =C2=A0to expect new style commands, yielding MDIO timeouts
> =C2=A0and general lack of communication with the MII.
>=20
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
> =C2=A0drivers/net/ethernet/faraday/ftgmac100.c |=C2=A0=C2=A0=C2=A0=C2=A06=
 ++++++
> =C2=A0drivers/net/ethernet/faraday/ftgmac100.h |=C2=A0=C2=A0=C2=A0=C2=A02=
 ++
> =C2=A02 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index c20f767..778c625 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1250,6 +1250,7 @@ static int ftgmac100_setup_mdio(struct net_device *=
netdev)
> =C2=A0{
> =C2=A0	struct ftgmac100 *priv =3D netdev_priv(netdev);
> =C2=A0	struct platform_device *pdev =3D to_platform_device(priv->dev);
> +	uint32_t revcr;
> =C2=A0	int i, err =3D 0;
> =C2=A0
> =C2=A0	/* initialize mdio bus */
> @@ -1257,6 +1258,11 @@ static int ftgmac100_setup_mdio(struct net_device =
*netdev)
> =C2=A0	if (!priv->mii_bus)
> =C2=A0		return -EIO;
> =C2=A0
> +	/* This driver only supports the old MDIO interface -- enable it */
> +	revcr =3D ioread32(priv->base + FTGMAC100_OFFSET_REVR);
> +	revcr &=3D ~FTGMAC100_OFFSET_REVR_NEW_INTERFACE;
> +	iowrite32(revcr, priv->base + FTGMAC100_OFFSET_REVR);
> +

My gut feeling is this should involve devicetree somehow, though maybe
it's reasonable to 'attach' the old MDIO interface to the existing
compatible string for the driver (and register a new compatible string
for the new MDIO interface whenever that is supported)?

At least for MAC1 we're flipping the bit via the board-file
(do_ast2500_common_setup()). I think either we continue to add hacks
there, or we drop those hacks and use this approach. Twiddling it in
the driver at least means that it will work for any number of MACs...

Thoughts?

Andrew

> =C2=A0	priv->mii_bus->name =3D "ftgmac100_mdio";
> =C2=A0	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%d",
> =C2=A0		=C2=A0pdev->name, pdev->id);
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ether=
net/faraday/ftgmac100.h
> index d07b6ea..ee5f758 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -133,6 +133,8 @@
> =C2=A0#define FTGMAC100_DMAFIFOS_RXDMA_REQ		(1 << 30)
> =C2=A0#define FTGMAC100_DMAFIFOS_TXDMA_REQ		(1 << 31)
> =C2=A0
> +#define FTGMAC100_OFFSET_REVR_NEW_INTERFACE	(1 << 31)
> +
> =C2=A0/*
> =C2=A0 * Receive buffer size register
> =C2=A0 */
--=-wlKjfl+wIplQCEWKURNa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX20HFAAoJEJ0dnzgO5LT5zTUP/RR/u1noS51nWP+cwUzGieVg
uskevr+XM5wfZzmFOvb+c26bqtEaz+i5q0SAdWMWopYTqYR4D+ezTi1TJYxS9t9V
LxEymnP+w71PcjzGU9SEY9qfJxhMM/LtZIsripztUfqCwTrM5WOp0OMxd2tVO7fE
GhMnhOCI08WF9Lfi8jsnufHq9hpiQNj+3j/xUnqvIeaW9x7qg8bmTdrT4296ViDU
HsS6DlzJKUSnIj9Y/vtHWWZ7zp+X8m7u7wx3rCxs69wGjbszK/4WV/SFM1oIbnu0
jhIKlRKBAU3x6gH9H/WRq/3NmkiYQymG5Io021gMdfVNplza+r9v6v9kwYOnm6EW
iWs00/RbPkbqkhxbZUeT0ChAuFLnzgMoAM5Gl5hkqiZGxz658Lv4kf9HK4dYtZFt
vYroHo/qOQyjGLbMpGJYSTJimXmWZgAACHQwhqy92h+zfjFNxxt7zmLVRbPmpFOo
9L2kZL90AlJbINV99VMInOMMvP14tkNj7gIJGmVEtM/qj6dRvJhsOpRFRsUguWM5
zPU4bqe54K1HbzLJnDFFdRMbHnSs9bgloMePxzn6pGawmFFi293qq4Oo52oy53Xz
7Zkyi9naKPJrz89AEx5QT/+bD/F6HYzgjVni524MZdawoXGh2C7mkB61ICHVsrFu
5Fc7MhgJpCPMzCPemlzn
=LEJ5
-----END PGP SIGNATURE-----

--=-wlKjfl+wIplQCEWKURNa--
