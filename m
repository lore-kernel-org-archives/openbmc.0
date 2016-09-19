Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scnQn5f9XzDsTW
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 10:52:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=dHtTvxR6; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=NrNLCo7j; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 52AE1203D5;
 Sun, 18 Sep 2016 20:51:57 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Sun, 18 Sep 2016 20:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Ekei3
 O6M7ikTxC6TbA+VeOkOWDo=; b=dHtTvxR6zOcp5pkTy5Kozvu4rG9PLpZ6lxI60
 ExN8O7MxLuC1LiL7C3xzY2/zQpQTWoF/zWpSLK7o9wLlF0R7mcVIvBen7kU8PxrS
 r8+qMy8vNFALR8rUjJ/HAUSZogGakwWatSqHvyaUcRS0jzE35WVzEwF/COriZMQV
 sF2OEs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=Ekei3O6M7ikTxC6TbA+VeOkOWDo=; b=NrNLC
 o7jyvScc3Rkxr5VbJGCqFRtKoPxd1lY7vbaq0pJ9lxZjB8ac0v8BuQpU6TLmzxZh
 Br0kHa6wUDWU5t/WhtddhkemP/X/ee2oAHVr/soTBsnv0p84lLq6kDjn7crv680G
 B+qp6yz/gt8Ec8uXWgl9ytKbgpMoXxtiz52H40=
X-Sasl-enc: MY/1cZ4bZxjnfVRCJY2LkjrhTZR88wuYiD9eXI71y/9q 1474246316
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFF85CCE7E;
 Sun, 18 Sep 2016 20:51:55 -0400 (EDT)
Message-ID: <1474246308.13249.46.camel@aj.id.au>
Subject: Re: [PATCH 03/17] Ensure that the old style MDIO interface is
 active before registering the MDIO bus on Faraday style MACs. Without this
 patch the hardware may continue to expect new style commands, yielding MDIO
 timeouts and general lack of communication with the MII.
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Mon, 19 Sep 2016 10:21:48 +0930
In-Reply-To: <1474058133-27363-4-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-4-git-send-email-tpearson@raptorengineering.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XNS4A+fx7xg62VefZ5pl"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 19 Sep 2016 00:52:03 -0000


--=-XNS4A+fx7xg62VefZ5pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like your entire commit message went into the subject...

On Fri, 2016-09-16 at 15:35 -0500, Timothy Pearson wrote:
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

Did you have any thoughts on my comments from v1 for this change?

Cheers,

Andrew

> +
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
--=-XNS4A+fx7xg62VefZ5pl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX3zakAAoJEJ0dnzgO5LT5cYQP/iYTh8+sultLHBhnqYxNDzdJ
wdLtR12h4BjDoORWyErmjBM8OT7jZzkqkYxbbSFANJZfNPJlKhhcDmxIk+j0obT4
i4F4M6yenhBxqTY7xu4XTHVf5EcJG63q8zAmAXYEBdHfDOYiHmuZHYz4DV5frwpb
iYUMWz0QZtKgzfs4M0YhKZ1ipvbdxI6+xvUdC9XrI53vJzvOAKG0oK0I8Y4fea9I
fBlNQfOB/PQS9i4tY+OeOlqEeGQNwpstl0/08Q5VtFfDDB0RrFca7mMC5kR2OP/E
Mkxu6LjnEoOZnO5k9ho0eTeqMAyke82v00xQRbPZ7qTKP3gl7qZHKPTiPKkftWN+
lYGjrN9OSUdmzow7C5vieG4yKc3jr2yrHDoSye6gv4fl7Dt6hHyG4LDp2xMhGCGy
ynJcSAgLgbUFKpXuOdOba5pZeAfbuMT+2jjfZWiQoaCuia6XaT5yWxtgFxinZ9f0
kHaeUZpLDydZsbS7thspmq17l1UpdRjKaUmaqfBtWKLAPJ+GkcDNBmDvWGHgZa32
dz9pqIJxQ1OIu7dYKsA5BruG4y0cwQnTcvnDZeU882VqnbOlB8ZkKatX4QwYDpAZ
4EqQsi+OVylccwUTM38GpsXoWPpQn+xIkUug9SpfGrV3yfg37IMwHA2HKQHt1+yW
s7evivtZEXA8es7j85h7
=xf18
-----END PGP SIGNATURE-----

--=-XNS4A+fx7xg62VefZ5pl--
