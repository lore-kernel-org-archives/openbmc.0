Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scndh6KDNzDsTW
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 11:01:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Tzs3XAjP; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=SiRkgXOi; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D1878203D0;
 Sun, 18 Sep 2016 21:01:26 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Sun, 18 Sep 2016 21:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=8Bt9Z
 vGp+VHB+/53pPZhYj0UBSA=; b=Tzs3XAjPMteJRgAa/C5P0kelMe+OU8+Adtt+0
 yfME76cKMw4mUj5lhkfqc7A+uRmuGkLkkdjeF7E2EAhfWwhIiRS6xJ6z+GeHookv
 mpf7nenBupEnmrjAN3HhkvRJPPcVXHEopD3k/2I+rCA/XDHEBk7HHPjKmyjXxN1u
 uSMkbM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=8Bt9ZvGp+VHB+/53pPZhYj0UBSA=; b=SiRkg
 XOisJKsb1nsv2pEBgKlrL1qm6bYr3U1UMDPh2TAiupDLcc44rBqU828qk3BjQy29
 +Q2h5VaDSIWypxUcDwoj5Cx3LpUhfElZI4plsyu3b4deaPh9C09ZmlW7iO5KK3a9
 U/Wvrq/A1yDYUXIcEBJoVTB3ILi/wLMIwUf6qU=
X-Sasl-enc: MYdg5bExnxDVZjMcT8ReRZjk+EVUngigTUVNA7uP4iRH 1474246885
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C888F2985;
 Sun, 18 Sep 2016 21:01:25 -0400 (EDT)
Message-ID: <1474246880.13249.49.camel@aj.id.au>
Subject: Re: [PATCH 08/17] pinctrl-aspeed-g4: Add missing MDIO1 pingroup
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Mon, 19 Sep 2016 10:31:20 +0930
In-Reply-To: <1474058133-27363-9-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-9-git-send-email-tpearson@raptorengineering.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-W8AuQcKsT9iYxVrCyGYQ"
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
X-List-Received-Date: Mon, 19 Sep 2016 01:01:29 -0000


--=-W8AuQcKsT9iYxVrCyGYQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-09-16 at 15:35 -0500, Timothy Pearson wrote:
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi |=C2=A0=C2=A0=C2=A0=C2=A05 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 072a921..b2c6b53 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -122,6 +122,11 @@
> =C2=A0						groups =3D "TIMER6";
> =C2=A0					};
> =C2=A0
> +					pinctrl_mdio1_default: mdio1_default {
> +						function =3D "MDIO1";
> +						groups =3D "MDIO1";
> +					};
> +
> =C2=A0					pinctrl_mdio2_default: mdio2_default {
> =C2=A0						function =3D "MDIO2";
> =C2=A0						groups =3D "MDIO2";
--=-W8AuQcKsT9iYxVrCyGYQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX3zjgAAoJEJ0dnzgO5LT5/aMP/2lPBr+EkbM+kG4RLzqNRtId
kG4adLsDH40v76ufwFjiOI5PMYMZckaGTO1V1J1cO2BZSwRH3LcM4xavB25p7XD9
BbS4cNLAPXc63w3+ptFNX6qaM2PEL4zUN9BAxH1QYf6rDS44BmeZ/V71n/QCNCY3
9cJe6rP6J/B5XbjUT1EIK/x1Jt4BmBdaq9gQltsgX20c7v/Hc+kWjie3JfmScRJ8
Mlyxxkzs4YdQ+fcrsMSmeTDC6yIzivO6Dmh2ypzU//hDSRJAjdi0Was8DNaq5ikT
HC0drvIp/Vcarya6rYG36HmDjzGZ5lz8I2Bb2lw2LcvES6IT7jVdt5AcgLElS262
8HeEcqwBrdkI6JbdTNlrrPhEaVoDumzmnS2Aupd3ZvELHZKapbfp8exgKACE8FE0
A4omF2NHFRlgNkLS9PR15LNTvQFDLqWaNukKuhMgyUswnxRedrjmeDv4AUClAfb4
hTSyQK0Y3ip/ZHs/IaQixTCTeQNB9yWRDK+GRLJyqYyGOucCZP2xF7IF/ee0tTt1
vJV7QLl7k4yjWiudaCzNkKnWtTw8jNTE57O8HS/GeRzcEPrBjxxxyQZTyHPcnIAz
NvlelHiItBjD6+DkvIkY+YUZpA7Z+gZMTtQgPjSwRloxP+azOZ8HoNQb799GbIqH
os/DW5OQr6Y8eai4tDZ5
=iexy
-----END PGP SIGNATURE-----

--=-W8AuQcKsT9iYxVrCyGYQ--
