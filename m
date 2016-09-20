Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdNtT57qyzDsjp
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 10:29:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=N7hjz7gb; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=QwJVZA66; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D4D7205C9;
 Mon, 19 Sep 2016 20:29:35 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 19 Sep 2016 20:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=F4RUy
 rzz8a1KsLkOxFoybdQT6lo=; b=N7hjz7gbbwV7DTVx8h7DooI49looWYsFYXyRa
 dVnSkhgSJLNQFiim+0WMJXM5OjT5EfE/Mvb5ewi+y0NW0yy/8556Vhy00kRYXf4R
 tbtrtHFSp9wFPsorLYsIRvKway5ta45vJqn2ZtUGXIc42MHZzSyPc3You5Vhp6Jf
 bXmKX0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=F4RUyrzz8a1KsLkOxFoybdQT6lo=; b=QwJVZ
 A66CO4MulUyZaY59zvhdxB5W+q2Dw5ZaSg7yzpsemL3dzvfNqpPo+whglkiKPGj5
 hbm37DBMSFAqtW/I+/GOChaNEqe89BDwhfZhhdCj5u3XnfNvwAotLutjQwlE8Aa4
 m1xJU067Zs5M1+aHWcZCb4xR0m8bP7tLkVbvBE=
X-Sasl-enc: IpviWc2jEvwZhU683xoru4uaA6lTb1Ob5x/54x2/yDO8 1474331374
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8984DF29CC;
 Mon, 19 Sep 2016 20:29:33 -0400 (EDT)
Message-ID: <1474331367.13249.72.camel@aj.id.au>
Subject: Re: [PATCH 03/19] Ensure that the old style MDIO interface is active
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Tue, 20 Sep 2016 09:59:27 +0930
In-Reply-To: <1035223108.1714.1474325416863.JavaMail.zimbra@raptorengineeringinc.com>
References: <1035223108.1714.1474325416863.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2Ubm+ta3OM6fEkONWPKS"
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
X-List-Received-Date: Tue, 20 Sep 2016 00:29:38 -0000


--=-2Ubm+ta3OM6fEkONWPKS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-09-19 at 17:50 -0500, Timothy Pearson wrote:
> =C2=A0before registering the MDIO bus on Faraday style
> =C2=A0MACs.=C2=A0=C2=A0Without this patch the hardware may continue
> =C2=A0to expect new style commands, yielding MDIO timeouts
> =C2=A0and general lack of communication with the MII.
>=20
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

I've had a look at this patch from your git repo on github. Whilst git-
send-email is changing the patch in ways you're not expecting, it's
because your commit message isn't formatted in the manner expected by
git's tools. Your object looks like:

    $ git cat-file -p 322ca61d9a6adbbc70a89d64a07469e384ca3931
    tree bbbf2ad42043eee22d7daa755c42ce372356053a
    parent f06ba7f29a26de27a2feb1dd8ec26022c4fbd77e
    author Timothy Pearson <    tpearson@raptorengineering.com    > 1473775=
455 -0500
    committer Timothy Pearson <    tpearson@raptorengineering.com    > 1473=
775938 -0500

    Ensure that the old style MDIO interface is active before registering
    the MDIO bus on Faraday style MACs.=C2=A0=C2=A0Without this patch the h=
ardware
    may continue to expect new style commands, yielding MDIO timeouts
    and general lack of communication with the MII.

    Signed-off-by: Timothy Pearson <    tpearson@raptorengineering.com>

=46rom `git help commit`:

    DISCUSSION
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Though not required, it=E2=80=
=99s a good idea to begin the commit message with a single short (less than=
 50 character) line summarizing the change, followed by a blank line
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0and then a more thorough desc=
ription. The text up to the first blank line in a commit message is treated=
 as the commit title, and that title is used throughout Git.
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0For example, git-format-patch=
(1) turns a commit into email, and it uses the title on the Subject line an=
d the rest of the commit in the body.

As you don't have the blank line separator I expect one of git-format-
patch or git-send-email is treating your whole commit message as the
subject.

Separating your commit message into short and long descriptions as
detailed above should resolve your problem. For example, it might look
something like:

    ftgmac100: Enable old-style MDIO interface

    Ensure that the old style MDIO interface is active before registering
    the MDIO bus on Faraday style MACs.=C2=A0=C2=A0Without this patch the h=
ardware
    may continue to expect new style commands, yielding MDIO timeouts
    and general lack of communication with the MII.

Separately, I had some questions on the v1 of the patch. Can you
pleaserespond to those?

Hope that helps,

Andrew

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

--=-2Ubm+ta3OM6fEkONWPKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX4ILoAAoJEJ0dnzgO5LT5nPMP/0huOSmQOrHf9ds5WfJgz6Oc
wobx4CL0W3nVYirDlkVLYUI9AosKlI6mQztYGYU5rFZJC4UqyDv+XoWFn6xtdERW
6xZY/uE8EqOK8WB9wSNMMgLbFDTpY7LTXjOe9AFreumCIcxR/9WDMyHMVZ6y9kNT
PkMG4NBfnK1jdvQs49OilyzMnDUF0sofpNHhHgDzbKJqqxJsxUi+rMFPcnwsq5Fu
ph1IqrWbF9OO6qBJjuAjquhXeZc4sqg0iK5H0EYaKXfLpaicCTt50s9zfQyQmEH7
fptYXEfWLGRZCWxfAT0AQrEghgnGnMr4FVTrqNz/dHxvJNYpK5DutudAEI5qbMJ2
0ND2DdejA/gnOKCEX2ZsJVrBCLFkTr3+t+NBIWPqNBGOTB3QPwuqTWk99nYq8YCA
CpjAjIiwcyMv8zyCge1KTZ0y7a19tJ1D6g9JU0OJemtQC5T/0ZkYzC6579020520
hF6bErN8fv4FV4/so8BSKDNKzM4nfBBzyqB9AIJ/DjvaGVtgwt8kHysgm2GvmFlt
RGLoid4ZCv60UJ9hNlEYpxFbR1m5qhHs9o9quCVastYX28RfGt3PMZRkA2oFbcZP
p39cZMuMOlwXRCq5fliZHIAzZWL0oZpLx+6iM9gaTT+jpzfVWMKO6TjY+n616Z7X
eyblNqxRgPa2bVinWcpN
=/x8G
-----END PGP SIGNATURE-----

--=-2Ubm+ta3OM6fEkONWPKS--
