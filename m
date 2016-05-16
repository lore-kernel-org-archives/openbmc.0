Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7sGT0jCmzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 06:18:08 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1463429882413926.708978754969;
 Mon, 16 May 2016 13:18:02 -0700 (PDT)
Date: Mon, 16 May 2016 15:18:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH openbmc v3 4/8] linux-obmc: Allow processing of
 multiple device trees
Message-ID: <20160516201800.GJ19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-5-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline
In-Reply-To: <1458720215-25302-5-git-send-email-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 16 May 2016 20:18:09 -0000


--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Suggest submitting this upstream to yocto.

On Wed, Mar 23, 2016 at 06:33:31PM +1030, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> index 3e74f7c..05dff55 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> @@ -20,7 +20,7 @@ inherit kernel
>  require recipes-kernel/linux/linux-yocto.inc
> =20
>  do_patch_append() {
> -        for DTB in "${KERNEL_DEVICETREE}"; do
> +        for DTB in ${KERNEL_DEVICETREE}; do
>  		DT=3D`basename ${DTB} .dtb`
>                  if [ -r "${WORKDIR}/${DT}.dts" ]; then
>                          cp ${WORKDIR}/${DT}.dts \
> --=20
> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOir4AAoJEKsDR8wtAMEZl6oQAKX5NwmFcZCOtN8Wp0VBCbtF
Id9pV/6AwWQFKMD930ybGQurkfm03SZKV9fYepMsGY/aP2yHqDW/xY3rtkjc8UzM
SMjJ6Ayfw9pjUKbcxEEHr/gBv259SAP29ff00spbYewXgCC/05NZQg4nkC09yO6I
AvJ4Y8iP6o4EQ7jEoomOTa9octXqCOh4tHa6tISrtAs6LfopfcXSyC6f8brUGHPQ
DwiOBvY01tNfQAEADK0WZZF1+wZBcFgE6U0GH7QD8c2kXdQgyDk3jnZneJhItKDh
b9gYqU4J1cKf7THks1ntFxz5iMPvjjsmNNyi6hQufRInp9vC1w1C3eU5FBuajld9
pyQ1lxAZlnKbHuiKWrWmaF1RHi4jt+bQBp8CFfxdc2GK/dkGXzkt/Ws0ZJd1hpGP
hzuLFfFpabFp+OFV8bDOAv0XRiM8oRXOkghydiO2XYagAPBcduwvd6eDotr+hdnz
pmR1FTPIIpNQTOrBJNIlAfY6BT4K68S5C20nJOxXrrzkWfJAu08Ar3kPYqyWVLvS
IBFHQXRGvQOStOLrANOq22KnRCqQqNLhJ9HnyUywlvWqU3lXMKag92DaS7Fll+6o
HWIg1p5GJgkoW/+2c3FXpafxIoJq3UqRKCzbQB49IQKNa0WL+nJikwCQMaBWYSU0
B6rw+dJGP/a7395tWIzY
=BW0N
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--
