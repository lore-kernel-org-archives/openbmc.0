Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t962G6WCfzDv07
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 13:57:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Zb0OM2Uu"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XKMQC1FK"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 73C842068F;
 Thu,  3 Nov 2016 22:57:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 22:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=LVplJAEH19c51zUkQnr5Oq993bo=; b=Zb0OM2
 UuR93TPDBUP47qSqXeDRUMmcPNTAX1pAxOG/14NrYf9ul6BacOo1doUVaQsuFcrS
 0uf79pi4+X1yeZCW3pBZ4qBTcXOaPpykFzviVst6iNw9G+YRI9734WHyVgLegf0W
 k6IQKh3OJwvE90u8eicrDl8p1U6yQLHS2l74M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=LVplJAEH19c51z
 UkQnr5Oq993bo=; b=XKMQC1FKCXEHr8J/w6ovxe3F2gPQZ5RiF6cwZinjYUzHvz
 2w9Fng4NowTTJoZJLux6DJJsVa98uGKy9rSBiX2/GhZe2QqTkys0ZE1av3FIb8e8
 fqYvbQge/LnCIyFgr8Cd3hMsSy3FCTaNfTPC39PR4HrCnrw/S6AXzSS/qhhfQ=
X-ME-Sender: <xms:FPkbWASGUqrKU_JREsoU7gED7ljEZ8uEaHVAKVJ6v95h-pKHiaPPtA>
X-Sasl-enc: FTC9U3yMaN5BWEAvkOcFCXXMS9Y1u9eR97MGdAUouZxO 1478228242
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F51ACC0B7;
 Thu,  3 Nov 2016 22:57:20 -0400 (EDT)
Message-ID: <1478228236.27396.60.camel@aj.id.au>
Subject: Re: [linux dev-4.7 PATCH 1/4] arm: aspeed: Remove MDIO hack
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 04 Nov 2016 13:27:16 +1030
In-Reply-To: <20161103223009.4794-2-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
 <20161103223009.4794-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FoYs8TQafMCWhLTb/9Xv"
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
X-List-Received-Date: Fri, 04 Nov 2016 02:57:28 -0000


--=-FoYs8TQafMCWhLTb/9Xv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 09:00 +1030, Joel Stanley wrote:
> The ftgmac100 driver now knows to configure the new MDIO interface. We
> can remove it from the early init process.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/mach-aspeed/aspeed.c | 7 -------
> =C2=A01 file changed, 7 deletions(-)
>=20
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 57c32ff0fa83..202bf3d9d467 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -146,13 +146,6 @@ static void __init do_garrison_setup(void)
> =C2=A0
> =C2=A0static void __init do_ast2500_common_setup(void)
> =C2=A0{
> -	unsigned long reg;
> -
> -	/* Set old MDIO interface */
> -	reg =3D readl(AST_IO(AST_BASE_MAC0 | 0x40));
> -	reg &=3D ~0x80000000;
> -	writel(reg, AST_IO(AST_BASE_MAC0 | 0x40));
> -
> =C2=A0	/* Set strap[13:12] to 01, Enable SPI master */
> =C2=A0	/* Set bits in writes to SCU7C are cleared from SCU70 */
> =C2=A0	writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
--=-FoYs8TQafMCWhLTb/9Xv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG/kMAAoJEJ0dnzgO5LT5Wx0P/0juvE3TM4gxKiazMAt/eBG8
KbLbSst5HpT+A99Nnn8sHe0P4P5Tx5dRbhK7HYZJ6M7e+Zi/f34ZZJdlg/cMHxL7
uiKO6IDCfg9vB3t2YNkj3DZLarHVDyfwGtoUJ/Gy3FLxCRIoOEiioLBI0cg9HQq9
cY1i4wFgtY18Phq9GPKiuzaSp2B7ZHjkEg7XrlkbPpHQ8LxBWABmvegWPYgokIJs
2piY9jrqu4DKGx6/kav5vqXvg57TKzDhEdWI3lI+kwkBu888fyPTSKumBU1sBiN2
tYhnDolAhMal3HGPLEYFEt7PlUx6OzGHmP5GyLTsaQMDT/1cjSTd5Vi2FwqP6UfJ
T4qqBU6DdWQ5GA7aVruzf97I66bmB7lKi2wqarHHlV9ILOOKkKuqjL6fC5cCh3f6
diqz6AgaO3Zki1yGK5HzQc9ORbLccF10RWlyiG5da2z6GKtrQWID6d0xUfZGZQZ4
2Lt2sYbTJQc5HxEKrsgNrxxchgTLs3kDbNVeZmUaeM2eVqGtEjo1zoV+nqD0Ch4U
NCNTFTDACmVXfs9D5oc5a1eK8gBCw8rHMZ1SlNLsYykDC5YLwcAP6evZoQjTaU2R
DKXvNLiLNOmDRzbKhaIN6X4k7wcH9WeFmrcf1+325S6yFhzZldfuToPoTYbfJqf+
nxw84uBlqUGtbA6noC1G
=X3nc
-----END PGP SIGNATURE-----

--=-FoYs8TQafMCWhLTb/9Xv--
