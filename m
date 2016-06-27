Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdCkQ4v5fzDqRd
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 12:36:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Qb6NTryU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Eg2FrnFw; dkim-atps=neutral
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86FEC2F5;
 Sun, 26 Jun 2016 22:36:44 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute1.internal (MEProxy); Sun, 26 Jun 2016 22:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=yzmBD
 a24uMF239OmgCKSMc7FVHQ=; b=Qb6NTryUhq5dmJIRnrs7M7E58zF2ZAC+bpjAt
 ekkFpldbpUH3jIZrd5XA0KtBFggkUzj+P6396GWLR+mAJay1L8zCBsD7LwkhoO1A
 2yUeoJ0n8sIkzcNBZOZN55LiIRR6fzebNBVfVDpWSi36eYu5jWOWEayDuOobxHZn
 3QnM6I=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=yzmBDa24uMF239OmgCKSMc7FVHQ=; b=Eg2Fr
 nFw0IEoOg21TjFeOAqYejL5QMFBRQSI3TzjBlhB6nsBCxqLJvVIQEHBCWUxcTB3t
 DyWBbyBfwkusKkWzrcwn7rLJEtmlxbujG17XpZ53tWhhOXBvvFTyqVsu+ayRsrc7
 Z0aa5E8w8C0F2sD0pRxtSkxmniNXTHI+DPi5CY=
X-Sasl-enc: z21INcFpiL7WDkXF4MXcs4p/MGVLsbKcT9Nt17/T2saa 1466995003
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 796FBF29FA;
 Sun, 26 Jun 2016 22:36:42 -0400 (EDT)
Message-ID: <1466994998.23740.135.camel@aj.id.au>
Subject: Re: [linux 2/2] drivers/net/ftgmac100: Adapt for Aspeed SoCs
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, clg@kaod.org
Cc: openbmc@lists.ozlabs.org
Date: Mon, 27 Jun 2016 12:06:38 +0930
In-Reply-To: <1466753146-2916-2-git-send-email-joel@jms.id.au>
References: <1466753146-2916-1-git-send-email-joel@jms.id.au>
 <1466753146-2916-2-git-send-email-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9q8WE2TEwpIZxzioSZD/"
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
X-List-Received-Date: Mon, 27 Jun 2016 02:36:47 -0000


--=-9q8WE2TEwpIZxzioSZD/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-06-24 at 16:55 +0930, Joel Stanley wrote:
> The RXDES and TXDES registers bits in the ftgmac100 indicates EDO{R,T}R
> at bit position 15 for the Faraday Tech IP. However, the version of this
> IP present in the Aspeed SoCs has these bits at position 30 in the
> registers.
>=20
> It appers that ast2400 SoCs support both positions, with the 15th bit
> marked as reserved but still functional. In the ast2500 this bit is
> reused for another function, so we need a work around.
>=20
> This was confirmed with engineers from Aspeed that using bit 30 is
> correct for both the ast2400 and ast2500 SoCs.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++--
> =C2=A01 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 2c2675d6ee3b..e805c4d4c5f8 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1358,8 +1358,14 @@ static int ftgmac100_probe(struct platform_device =
*pdev)
> =C2=A0		priv->use_ncsi =3D false;
> =C2=A0	}
> =C2=A0
> -	priv->rxdes0_edorr_mask =3D BIT(15);
> -	priv->txdes0_edotr_mask =3D BIT(15);
> +	if (of_machine_is_compatible("aspeed,ast2400") ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0of_machine_is_compatible("aspeed,ast2500")) {
> +		priv->rxdes0_edorr_mask =3D BIT(30);
> +		priv->txdes0_edotr_mask =3D BIT(30);
> +	} else {
> +		priv->rxdes0_edorr_mask =3D BIT(15);
> +		priv->txdes0_edotr_mask =3D BIT(15);
> +	}
> =C2=A0
> =C2=A0	netdev->ethtool_ops =3D &ftgmac100_ethtool_ops;
> =C2=A0	netdev->netdev_ops =3D &ftgmac100_netdev_ops;
--=-9q8WE2TEwpIZxzioSZD/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcJE2AAoJEJ0dnzgO5LT5EEgP/RVJEsfzszoorryeEnmOfCR7
+J31tlrTFDs6byqHuWgnt8fC+8fC3rIhULUGJPjuUBaF1ytNkQH8EHM2SvezF5YJ
xaGvVyYP7DIKUGfH5NMnUunNmH1IIr06d+06T/ESM2hfhGXMtm8RmrzJXc5gZxtd
DEJcqUXeM8HVU3KRa3KrmnaS9Vc0dFB2GTdGuUqtrMLBGxqzZ3beEYxGjBGv8H61
V4FBF00vTSbSTUuv5azRLh673ozmYQxMOnaSsZQnDLqeuuCknlLh5FFYuk4PRN6d
F1CTaglB8NibV7xxF8V3TkIGTSmDzAbQXbdt4BOCr4QSWD4Jjy7JDdXhRCegYLJ2
yVm6vCijzp6zjDayuavD8P6INaoJuPtGGGkawFQ/ZPNPlGjXCbCj8nWGqlpFOScX
Wn6NVOJT6vcRTQHYavXyB+0d5nCkI0+7uIp2BHT+0ui2UamUvrrUoLaoQZUFUyTk
64yzGgYP1g5QT64w0W9Jl7lPculfJm5V2GWg3B96NOFzKrXZXXaIksF2qp7YBNyX
ndt+WiVjcmDBGLuy+0fRBObr8LfrDAhf6HuZSFv6efl/MaKVMfAoXKjJbNtkwOtV
ziD2IkX7DovSU6bVlYIOffMoX1OF1VrZW8lSuCPGaRrpivSiPSFRej77R9xRguzz
XXC7md9wJMGDp4aLJbIF
=TXPV
-----END PGP SIGNATURE-----

--=-9q8WE2TEwpIZxzioSZD/--
