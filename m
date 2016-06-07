Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP1r9630yzDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 16:29:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=d2AX8uot; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id C5C057EC064;
 Mon,  6 Jun 2016 23:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=P8m2+w6dcaxbwJbEZqvVc
 gHMEWs=; b=d2AX8uotZ56EfQStfjCc19gNfKZKSie2P1LwlMsjnI1usLmUc/flT
 5Sv3nJ3hSMzjnI0ex2m6thXPFWPD2MmigMIMwnD1sphUCfDiKiABCbnRT3t1FyuM
 JHCRjjqGlRPNOgK2FOTfh5/z9Pw92vKYJDH0znxRl3Vj7sWQHyqVkI=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id C94767EC063;
 Mon,  6 Jun 2016 23:29:26 -0700 (PDT)
Message-ID: <1465280955.16048.69.camel@aj.id.au>
Subject: Re: [PATCH qemu 09/12] ast2400: use a mx25l25635f chip
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 15:59:15 +0930
In-Reply-To: <1464556805-4340-10-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-10-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-n0e1Jr/Y93KcJt1MPWkd"
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
X-List-Received-Date: Tue, 07 Jun 2016 06:29:30 -0000


--=-n0e1Jr/Y93KcJt1MPWkd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-05-29 at 23:20 +0200, C=C3=A9dric Le Goater wrote:
> The pflash command on OpenBmc is used to update the flash and it
> expects a mx25l25635f and not a mx25l25635e.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Assuming the m25p80 changes are fine,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/palmetto-bmc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index 50369c0331a6..a1db516baf9e 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -52,7 +52,7 @@ static void palmetto_bmc_init(MachineState
> *machine)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.smc, "n25=
q256a");
> -=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l256=
35e");
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l256=
35f");
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Install first SMC/FMC flash content=
 as a rom.
--=-n0e1Jr/Y93KcJt1MPWkd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVmm7AAoJEJ0dnzgO5LT5CkgQAJ/FihXzSnxygYB+r6C0Kcae
A5iOf6P2yaHU6FCHlil16/68nmiJuyE+qishQIh6q8ffELllnNf0wYuFbqRfKKl5
53rbgWRW901nq0B6CfbhqIlw0uPcgyqpXqe9sD2FHUEeZ54v/VCSU5RaBk3Y9Pvs
bw4pS9d63iAIpaaYCKJOi/zOHr654AuiBzNCpls7CVXfwodB5RvtlQRzeEU5qcVc
eesQapysDUV5BSaLHR7LuZ3R4uFhBZ+tPYsxH0Bg85+p19tCKpB/daUgx/kpmAMH
1SDLQktxAlndKdnLegfkbNXf1C48vXvdy+IhJCheUqHHHtQzyfwcNFbiBvVAPutB
YZIRfumC6JVUNHmd+qpHsuyuClja6W0T3Kfi5dT4D9icDSJx0+LpVJM6wPax1wOK
zY9iZuqno1IiCnajj/5/4zOuDW78xagFdKaEcVmp0cR5dy959uqSr5CUX4tL2J4Z
4UPUW5hc5jnaBDRL9GtdETyYfyHF83WSap5U6AWvkESM/s1HpnPiX/it2EFOWuQ4
yCALHfT5mEtKLbxPdEPhtuiAhY85Icc+PmcaA54p8mhAMNeSbclyN9T3fNuDPR/I
0iX5cs2Ci2iChbC6aC+zkC9OGmfUQO1xG1jl021xHfi3OastrBbhc8ezhJHDqNnf
Eyk1Prs5dGopcDqAJpUJ
=ufkW
-----END PGP SIGNATURE-----

--=-n0e1Jr/Y93KcJt1MPWkd--
