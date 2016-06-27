Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdChZ5vbrzDqRd
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 12:35:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bBHUngHC; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=CmUu6QEJ; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 19ED6100;
 Sun, 26 Jun 2016 22:35:06 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Sun, 26 Jun 2016 22:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=GULtB
 MOnu9B5Bd1/+9NAqb+ghT4=; b=bBHUngHCVdFnaucdkNXkEj6V4oaePe2Ybx+9Z
 Lzn7VZvm1ukHhjJhU03kbOjVHmcjQG7OyFXdB+U3cTnDqjFyw5m+y9NItNfQPTh9
 htodZqueMo/+1H/CnAdRzrS1jejG9K6h4UVF2D2cFt+ezuA58QJEyh9A0Q6XhaOY
 Lp7x+c=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=GULtBMOnu9B5Bd1/+9NAqb+ghT4=; b=CmUu6
 QEJ6+AzPDfTtgZt4M8j7/RQbbvTR5ps1a0UXW6FIkRZvTbPXAQZ0Hrn5q3GTyGv2
 FCQadcMS9zZtACNz8Xc6gs/Q1lVXd9K3Hjbwo8DBo6rWOElbhufaG4Ib/VbxLlC/
 zwsdmMu4wml/WmgJu6zyXAJ/e19D3L665kV77I=
X-Sasl-enc: INfuHtN+mL/Lj3Iz6/HrjOWSv46SFkDPQ26c29+yJhRY 1466994904
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58AC1CCDA7;
 Sun, 26 Jun 2016 22:35:03 -0400 (EDT)
Message-ID: <1466994898.23740.134.camel@aj.id.au>
Subject: Re: [linux 1/2] drivers/net/ftgmac100: Make EDO{R,T}R bits
 configurable
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, clg@kaod.org
Cc: openbmc@lists.ozlabs.org
Date: Mon, 27 Jun 2016 12:04:58 +0930
In-Reply-To: <1466753146-2916-1-git-send-email-joel@jms.id.au>
References: <1466753146-2916-1-git-send-email-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NMehooRL+3+p+KCl+EXB"
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
X-List-Received-Date: Mon, 27 Jun 2016 02:35:12 -0000


--=-NMehooRL+3+p+KCl+EXB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-06-24 at 16:55 +0930, Joel Stanley wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
>=20
> These bits are #defined at a fixed location. In order to support future
> hardware that has chosen to move these bits around move the bits into a
> member of the struct ftgmac100.

I think we should clean the commit message up, it feels a bit mangled
which is probably a product of both of us having a go at it.
Particularly the first sentence could do with a bit of work, and "...
to move these bits around move the bits ..." is pretty awkward.

Cheers,

Andrew

>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/net/ethernet/faraday/ftgmac100.c | 39 ++++++++++++++++++++-=
-----------
> =C2=A0drivers/net/ethernet/faraday/ftgmac100.h |=C2=A0=C2=A02 --
> =C2=A02 files changed, 25 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 818477bbd491..2c2675d6ee3b 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -79,6 +79,9 @@ struct ftgmac100 {
> =C2=A0
> =C2=A0	bool use_ncsi;
> =C2=A0	bool enabled;
> +
> +	uint32_t rxdes0_edorr_mask;
> +	uint32_t txdes0_edotr_mask;
> =C2=A0};
> =C2=A0
> =C2=A0static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
> @@ -268,10 +271,11 @@ static bool ftgmac100_rxdes_packet_ready(struct ftg=
mac100_rxdes *rxdes)
> =C2=A0	return rxdes->rxdes0 & cpu_to_le32(FTGMAC100_RXDES0_RXPKT_RDY);
> =C2=A0}
> =C2=A0
> -static void ftgmac100_rxdes_set_dma_own(struct ftgmac100_rxdes *rxdes)
> +static void ftgmac100_rxdes_set_dma_own(const struct ftgmac100 *priv,
> +		struct ftgmac100_rxdes *rxdes)
> =C2=A0{
> =C2=A0	/* clear status bits */
> -	rxdes->rxdes0 &=3D cpu_to_le32(FTGMAC100_RXDES0_EDORR);
> +	rxdes->rxdes0 &=3D cpu_to_le32(priv->rxdes0_edorr_mask);
> =C2=A0}
> =C2=A0
> =C2=A0static bool ftgmac100_rxdes_rx_error(struct ftgmac100_rxdes *rxdes)
> @@ -309,9 +313,10 @@ static bool ftgmac100_rxdes_multicast(struct ftgmac1=
00_rxdes *rxdes)
> =C2=A0	return rxdes->rxdes0 & cpu_to_le32(FTGMAC100_RXDES0_MULTICAST);
> =C2=A0}
> =C2=A0
> -static void ftgmac100_rxdes_set_end_of_ring(struct ftgmac100_rxdes *rxde=
s)
> +static void ftgmac100_rxdes_set_end_of_ring(const struct ftgmac100 *priv=
,
> +		struct ftgmac100_rxdes *rxdes)
> =C2=A0{
> -	rxdes->rxdes0 |=3D cpu_to_le32(FTGMAC100_RXDES0_EDORR);
> +	rxdes->rxdes0 |=3D cpu_to_le32(priv->rxdes0_edorr_mask);
> =C2=A0}
> =C2=A0
> =C2=A0static void ftgmac100_rxdes_set_dma_addr(struct ftgmac100_rxdes *rx=
des,
> @@ -401,7 +406,7 @@ ftgmac100_rx_locate_first_segment(struct ftgmac100 *p=
riv)
> =C2=A0		if (ftgmac100_rxdes_first_segment(rxdes))
> =C2=A0			return rxdes;
> =C2=A0
> -		ftgmac100_rxdes_set_dma_own(rxdes);
> +		ftgmac100_rxdes_set_dma_own(priv, rxdes);
> =C2=A0		ftgmac100_rx_pointer_advance(priv);
> =C2=A0		rxdes =3D ftgmac100_current_rxdes(priv);
> =C2=A0	}
> @@ -472,7 +477,7 @@ static void ftgmac100_rx_drop_packet(struct ftgmac100=
 *priv)
> =C2=A0		if (ftgmac100_rxdes_last_segment(rxdes))
> =C2=A0			done =3D true;
> =C2=A0
> -		ftgmac100_rxdes_set_dma_own(rxdes);
> +		ftgmac100_rxdes_set_dma_own(priv, rxdes);
> =C2=A0		ftgmac100_rx_pointer_advance(priv);
> =C2=A0		rxdes =3D ftgmac100_current_rxdes(priv);
> =C2=A0	} while (!done && ftgmac100_rxdes_packet_ready(rxdes));
> @@ -564,10 +569,10 @@ static bool ftgmac100_rx_packet(struct ftgmac100 *p=
riv, int *processed)
> =C2=A0/******************************************************************=
************
> =C2=A0 * internal functions (transmit descriptor)
> =C2=A0 ******************************************************************=
***********/
> -static void ftgmac100_txdes_reset(struct ftgmac100_txdes *txdes)
> +static void ftgmac100_txdes_reset(const struct ftgmac100 *priv, struct f=
tgmac100_txdes *txdes)
> =C2=A0{
> =C2=A0	/* clear all except end of ring bit */
> -	txdes->txdes0 &=3D cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
> +	txdes->txdes0 &=3D cpu_to_le32(priv->txdes0_edotr_mask);
> =C2=A0	txdes->txdes1 =3D 0;
> =C2=A0	txdes->txdes2 =3D 0;
> =C2=A0	txdes->txdes3 =3D 0;
> @@ -588,9 +593,10 @@ static void ftgmac100_txdes_set_dma_own(struct ftgma=
c100_txdes *txdes)
> =C2=A0	txdes->txdes0 |=3D cpu_to_le32(FTGMAC100_TXDES0_TXDMA_OWN);
> =C2=A0}
> =C2=A0
> -static void ftgmac100_txdes_set_end_of_ring(struct ftgmac100_txdes *txde=
s)
> +static void ftgmac100_txdes_set_end_of_ring(const struct ftgmac100 *priv=
,
> +		struct ftgmac100_txdes *txdes)
> =C2=A0{
> -	txdes->txdes0 |=3D cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
> +	txdes->txdes0 |=3D cpu_to_le32(priv->txdes0_edotr_mask);
> =C2=A0}
> =C2=A0
> =C2=A0static void ftgmac100_txdes_set_first_segment(struct ftgmac100_txde=
s *txdes)
> @@ -709,7 +715,7 @@ static bool ftgmac100_tx_complete_packet(struct ftgma=
c100 *priv)
> =C2=A0
> =C2=A0	dev_kfree_skb(skb);
> =C2=A0
> -	ftgmac100_txdes_reset(txdes);
> +	ftgmac100_txdes_reset(priv, txdes);
> =C2=A0
> =C2=A0	ftgmac100_tx_clean_pointer_advance(priv);
> =C2=A0
> @@ -800,7 +806,7 @@ static int ftgmac100_alloc_rx_page(struct ftgmac100 *=
priv,
> =C2=A0
> =C2=A0	ftgmac100_rxdes_set_page(priv, rxdes, page);
> =C2=A0	ftgmac100_rxdes_set_dma_addr(rxdes, map);
> -	ftgmac100_rxdes_set_dma_own(rxdes);
> +	ftgmac100_rxdes_set_dma_own(priv, rxdes);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -847,7 +853,8 @@ static int ftgmac100_alloc_buffers(struct ftgmac100 *=
priv)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	/* initialize RX ring */
> -	ftgmac100_rxdes_set_end_of_ring(&priv->descs->rxdes[RX_QUEUE_ENTRIES - =
1]);
> +	ftgmac100_rxdes_set_end_of_ring(priv,
> +			&priv->descs->rxdes[RX_QUEUE_ENTRIES - 1]);
> =C2=A0
> =C2=A0	for (i =3D 0; i < RX_QUEUE_ENTRIES; i++) {
> =C2=A0		struct ftgmac100_rxdes *rxdes =3D &priv->descs->rxdes[i];
> @@ -857,7 +864,8 @@ static int ftgmac100_alloc_buffers(struct ftgmac100 *=
priv)
> =C2=A0	}
> =C2=A0
> =C2=A0	/* initialize TX ring */
> -	ftgmac100_txdes_set_end_of_ring(&priv->descs->txdes[TX_QUEUE_ENTRIES - =
1]);
> +	ftgmac100_txdes_set_end_of_ring(priv,
> +			&priv->descs->txdes[TX_QUEUE_ENTRIES - 1]);
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err:
> @@ -1350,6 +1358,9 @@ static int ftgmac100_probe(struct platform_device *=
pdev)
> =C2=A0		priv->use_ncsi =3D false;
> =C2=A0	}
> =C2=A0
> +	priv->rxdes0_edorr_mask =3D BIT(15);
> +	priv->txdes0_edotr_mask =3D BIT(15);
> +
> =C2=A0	netdev->ethtool_ops =3D &ftgmac100_ethtool_ops;
> =C2=A0	netdev->netdev_ops =3D &ftgmac100_netdev_ops;
> =C2=A0	if (pdev->dev.of_node &&
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ether=
net/faraday/ftgmac100.h
> index 13408d448b05..c258586ce4a4 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -189,7 +189,6 @@ struct ftgmac100_txdes {
> =C2=A0} __attribute__ ((aligned(16)));
> =C2=A0
> =C2=A0#define FTGMAC100_TXDES0_TXBUF_SIZE(x)	((x) & 0x3fff)
> -#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
> =C2=A0#define FTGMAC100_TXDES0_CRC_ERR	(1 << 19)
> =C2=A0#define FTGMAC100_TXDES0_LTS		(1 << 28)
> =C2=A0#define FTGMAC100_TXDES0_FTS		(1 << 29)
> @@ -215,7 +214,6 @@ struct ftgmac100_rxdes {
> =C2=A0} __attribute__ ((aligned(16)));
> =C2=A0
> =C2=A0#define FTGMAC100_RXDES0_VDBC		0x3fff
> -#define FTGMAC100_RXDES0_EDORR		(1 << 15)
> =C2=A0#define FTGMAC100_RXDES0_MULTICAST	(1 << 16)
> =C2=A0#define FTGMAC100_RXDES0_BROADCAST	(1 << 17)
> =C2=A0#define FTGMAC100_RXDES0_RX_ERR		(1 << 18)
--=-NMehooRL+3+p+KCl+EXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcJDSAAoJEJ0dnzgO5LT5eI8QAIojGGg0okkgPDJKmFsw0ZeC
TNcTDcfLPHZ9GWCqdev3ACB1180lWZbHbUB0G6WToyyUuUzti51DOhbHvxIhZNz1
ZX+YUR7PTfC8CJnMAnz7RHJhKk1BKbXPT5vpFoJ7gQnxe9+5wJrFeQUsYg2x/+fh
VQ49NOak3aTbD26098usXVItJ+TeVqrQIULlcHWriJGDRcOEScEUYDwvEnYLDsf1
o8g/xZc0oQIt/3dvFD/nUWBc8nRjmoDY6VQRfQDLeTybELANPkm1xbp3YIEkKOMJ
z5EqTdF8tug9HE3Iu4/Qnt3Spjn26rDZ2aE3kNWEThqIAfU6jqJdLoNOo/ZW8GeH
PxGxHGVOdHOosGcs0z9Rnykvgw/TIqvYG7/bN9cUH1Oa5CF/+aI2uwLike/Igkqt
lByWH+j2IvyLzWFXolAkI8UKqb5u/vEXpL7hEiZJKUs2G252qEhrAhwaUyUkA9YE
EEmg3NFh/o1oQRl+oZ3PynwH27WrRsG+pt4clQXZvUFfqVH2pe4vnPKVFHZAKa9r
kjWUx1ZqYIkmhnJkJaKH11I8eQ9fKnBSPzya+ZbtdUDaPkIoVX5xsGJlOJBp5t+n
4QKhKYiuvFwgcBxXM5MEZvKb7Ul9S20IUF0mFeLf2KSbbUquRB5oGKzsq/XakDL3
bUpfmgpAtzqB+MPLMhVs
=GzDD
-----END PGP SIGNATURE-----

--=-NMehooRL+3+p+KCl+EXB--
