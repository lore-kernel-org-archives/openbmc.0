Return-Path: <andrew@aj.id.au>
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP1l618n3zDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 16:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=a5XcoBU2; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id C6FCB5EC07E;
 Mon,  6 Jun 2016 23:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=JAXwU5OQMs5LJeeNNKuHN
 qY47S0=; b=a5XcoBU2jWXUpRIO8ohIgHB12ieshIc45Lamh0chJPglJiua4wAt2
 E3IsoEozbaf5Y0sA6A1h1ZWJ6yIN5DfxkxK8+gK84OoYiznZBXiJaob3iYF0wrdj
 2pdzWR6AdD5sczHcyurfKcK1AYk+JxsC1PR9hqU/gsJZ2az3imQ8y8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id C9B665EC079;
 Mon,  6 Jun 2016 23:25:02 -0700 (PDT)
Message-ID: <1465280684.16048.68.camel@aj.id.au>
Subject: Re: [PATCH qemu 06/12] ast2400: use contents of first SPI flash as
 a rom
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 15:54:44 +0930
In-Reply-To: <1464556805-4340-7-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-7-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0fgXyq+4O/FyEM9CbU7F"
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
X-List-Received-Date: Tue, 07 Jun 2016 06:25:09 -0000


--=-0fgXyq+4O/FyEM9CbU7F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-05-29 at 23:19 +0200, C=C3=A9dric Le Goater wrote:
> This provides support for U-Boot images which are loaded at 0x0.
>=20
> A Palmetto BMC guest can now be simply booted with :
>=20
> =C2=A0 $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults=C2=
=A0=C2=A0\
> 	-mtdblock ./flash-palmetto-20160512040959=C2=A0=C2=A0\
> 	-mtdblock ./palmetto.pnor
>=20
> The first block device uses the file "./flash-palmetto-20160512040959"
> which will act as a SPI flash module for the BMC, handled by the
> SMC/FMC controller. The second block device uses the file
> "./palmetto.pnor" which is an OpenPower firmware image for a palmetto
> OpenPower system. This one will be handled by the SMC/SPI controller.
>=20
> The flash images can be grabbed here :
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0https://openpower.xyz/job/openbmc-build/distro=3D=
ubuntu,target=3Dpalmetto/lastSuccessfulBuild/artifact/images/palmetto/flash=
-palmetto
> =C2=A0=C2=A0=C2=A0=C2=A0https://openpower.xyz/job/openpower-op-build/dist=
ro=3Dubuntu,target=3Dpalmetto/lastSuccessfulBuild/artifact/images/palmetto.=
pnor
>=20
> We could add a second BMC SPI flash by changing the 'num-cs' property
> of the controller and emulate a golden image flash module.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>=20
> =C2=A0That might seem a little too hacky ?=C2=A0
>=20
> =C2=A0hw/arm/palmetto-bmc.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index c4099987d354..50369c0331a6 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -17,6 +17,7 @@
> =C2=A0#include "hw/arm/arm.h"
> =C2=A0#include "hw/arm/ast2400.h"
> =C2=A0#include "hw/boards.h"
> +#include "hw/loader.h"
> =C2=A0
> =C2=A0static struct arm_boot_info palmetto_bmc_binfo =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.loader_start =3D AST2400_SDRAM_BASE,
> @@ -53,6 +54,14 @@ static void palmetto_bmc_init(MachineState *machine)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.smc, "n25=
q256a");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.spi, "mx2=
5l25635e");
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Install first SMC/FMC flash content as a=
 rom.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0if (bmc->soc.smc.flashes[0]) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rom_add_blob_fixed("aspe=
ed.smc.0", bmc->soc.smc.flashes[0]->storage,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0bmc->soc.smc.flashes[0]->size, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +

As mentioned on IRC it's probably best we investigate alternative
approaches and use this as a last resort.

Andrew
--=-0fgXyq+4O/FyEM9CbU7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVmisAAoJEJ0dnzgO5LT5ohcP/i/HGCFYWaD3QdXYaGTgKZr4
jYjV1w3qb84CXGONpezjNlxi/z+2SQSz2S+sukONFa5xFyENRnR4CUDjBQ7tGSlN
OUxwcJHyGG73kAASfTTMDKyR2YPwv1ibvoBbWcSSn12QQ3qIivkJMhCTYm7s/y/r
1EFZ5Bki6O3fDV7XWdyl4ua7BOr3CSixFiu7CGFFRyTqo5FGKbyGkomNkFDHYh9t
xwU6rBsQjrGPj6V15CKH+IHCX+BmolrsVbhvtkfl4TPhvAMBTmVTAZ/zePFUW+5h
FfReBP6VkTJeYCZPlge2w8JK9O2GxRoxW7B2j4Et/cHy7VllRMKDjWS+Tq7FkcyT
eBioLsa45W2S7jHN8gX/E5s5iiKF1MoqS6MGb2zSOuB+sIuhOzhapiQLya3Y4ksO
BlyhBWVEeCpKHInRYMS5cfV9Fmiihb3Ez+JGvJ55IkSOkMOvpefXNSXbxAUdjOuO
ZhDg52eJJgAHiC1luSqUOClfUltMyHkrbOlqF9ZKQ9jt7oW6zy/WTmoG0FUQO2r8
nI1aW5b9RKIALXsVCro28keviI8WJd9s6HU0Kw25+Xsm2WohULPYNPGF3+NJXx82
LmhuJTN4kmc+CyiS/tA+N/feZvFh4SbejGhfAq0A7PAEU7Dl4WMqZ8lqq676LecR
wdLUgRjOAPAGV/2HLv5V
=dXxs
-----END PGP SIGNATURE-----

--=-0fgXyq+4O/FyEM9CbU7F--
