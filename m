Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMXVw6N4ZzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 04:25:11 +1100 (AEDT)
Received: from localhost (32.97.110.56 [32.97.110.56]) by mx.zohomail.com
 with SMTPS id 1487006686711543.9124964795362;
 Mon, 13 Feb 2017 09:24:46 -0800 (PST)
Date: Mon, 13 Feb 2017 11:24:40 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Xo Wang <xow@google.com>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
Message-ID: <20170213172440.lrqaf5v7jk66denq@asimov>
References: <20170213025851.6051-1-andrew@aj.id.au>
 <20170213025851.6051-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="stsa72csl2hacipy"
Content-Disposition: inline
In-Reply-To: <20170213025851.6051-2-andrew@aj.id.au>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 13 Feb 2017 17:25:14 -0000


--stsa72csl2hacipy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 01:28:49PM +1030, Andrew Jeffery wrote:
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index e1994c9e38c3..5ce0a7a65e77 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -1005,6 +1005,12 @@
>  				reg =3D <0x1e6e202c 0x4>;
>  			};
> =20
> +			gfx: display@1e6e6000 {
> +				compatible =3D "aspeed,ast2500-gfx", "syscon";
> +				reg =3D <0x1e6e6000 0x1000>;
> +				reg-io-width =3D <4>;
> +			};
> +

Is this valid to add on all G5 chips?  I believe Zaius is using a
variant of the 2500 that does not have the graphics engine.


--=20
Patrick Williams

--stsa72csl2hacipy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYoevYAAoJEKsDR8wtAMEZ+pkP/3B+kGyEY/xNVGZgX1blPElL
O5PO4w2U07Q0/r7JoIo0FTrR7aa180t9DRnNO0kaBi8km9L/pvfXE0BiwgceZjQ5
MhWg7BU69OLJY6Mp6aZ8x+VoD6sbI+V3spzJkWPMIR1/UbXxlG1++JvaoZVLMMz5
P3j58bVtpNsdANX7cGqD5VSrrgvdArexwNV8nchFj2dnwCWdG8eqN0LjWakCY331
JKGRQnNUBD/fX+jznHCCNuj89a5Nfoqf00fXvjBlhal/HqhEBrRJyLD3hf9MFu89
KOe/O6Da4oywqmmVwwOgu0jt8vIr4SHNWlYqr9uPBA2pZ8p/ePuDp3abpb8W3K3I
quZypU+/W9kGs8zHbcRx5T03oW1yAG47P/SGwdLJlCS90P/ZMX8l4Luw3aEqf+D0
PpUJ6B2tjHJiVoxs+9HwGi1S6IqAM3cWpFPeFR/gs5J3VpfMRE7Re6zI8FHeTQFj
GWJcFv7esvoQOy+M6RnYIOzep6amFKdjusCE5LRSjEQaEniHN03jYWGjmoEG37iE
e9OGIGU6OeCl7F9KMi0jYlPQfmz64f8dKcuuiGVe64hgvP2bRKfQ/ZdSlptGuv0V
39KzfP13sH2AjnfsrzwQgv6zQYY1imyDfzd8d/7gAVfWLgoTnvjUB7HwUaBoGThM
scsNnF2+k+k/ACkoD60s
=9ueL
-----END PGP SIGNATURE-----

--stsa72csl2hacipy--
