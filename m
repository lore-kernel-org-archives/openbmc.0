Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYQp76FYnzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 08:41:51 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466462507292337.2244376544884;
 Mon, 20 Jun 2016 15:41:47 -0700 (PDT)
Date: Mon, 20 Jun 2016 17:41:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH docs] host-management: Add section on power control
Message-ID: <20160620224145.GH19968@asimov.austin.ibm.com>
References: <20160620094012.11079-1-openbmc-patches@stwcx.xyz>
 <20160620094012.11079-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0LmNHwgdxaw8o0U/"
Content-Disposition: inline
In-Reply-To: <20160620094012.11079-2-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Mon, 20 Jun 2016 22:41:52 -0000


--0LmNHwgdxaw8o0U/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

On Mon, Jun 20, 2016 at 04:40:12AM -0500, OpenBMC Patches wrote:
> From: Joel Stanley <joel@jms.id.au>
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  host-management.md | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/host-management.md b/host-management.md
> index d223850..e313468 100644
> --- a/host-management.md
> +++ b/host-management.md
> @@ -140,3 +140,27 @@ Each boot parameter is represented by an individual =
property, and their hex
>  value is displayed in a string format. For example, a boot flags paramet=
er value
>  of `0x8014000000` would be stored as a `8014000000` string in the
>  `settings/host0/boot_flags` property.
> +
> +Host power control
> +------------------
> +
> +The host can be controlled through the `chassis` object. It implements a=
 number
> +of actions including powerOn and powerOff. These correspond to the IPMI
> +`chassis power on` and `chassis power off` commands.
> +
> +Assuming you have logged in, the following will issue a POST with an emp=
ty data
> +payload that powers the host on:
> +
> +```
> +curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST \
> +   -d '{"data": []}'  https://bmc/org/openbmc/control/chassis0/action/po=
werOn
> +```
> +
> +Other actions available are:
> +
> + * `setIdentify` / `clearIdentify`
> + * `powerOff`
> + * `softPowerOff`
> + * `reboot`
> + * `softReboot`
> + * `getPowerState`
> --=20
> 2.8.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--0LmNHwgdxaw8o0U/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaHEpAAoJEKsDR8wtAMEZuuMP/2N0QG/63xEXvBRVkxGXj4kS
MlI0+vOYwoyL3uKnF05FJJ7jUvAPuf+yd77Bma1q+rhu5JvVSMXyph7zYK6lG2mp
/Mlu+fPZAAV5lzzRlDvRpGH2R1T6sPaBJuf+RU2r6N9kxa+6YQC2G8s85qq7aQ1n
rjlq59+17DvaOirJrJYwWrxKNRDAdR+NNsJBmE+yXDXYFqZZrg9Se96Nr1pbPzrm
rk2w6LvJH6P78q53IP2Deig5egvNCTVVhjjycLZdvd5hTXfoUfz19mkKoWMSQA8/
Yge9WSGFE6wiK/bnYKDQTjVBVjo2ob428BJs8UPl+1ApKQkotDAzeUlWL9x6iztz
+VXb238sw0Ur4HH5fSzZPbwnBc50uWhwiY5i/xuMajVfmmC77LSfFJBgRFdx2QvO
KQNhOSDSxeK7/e0hhezan27sQRHmgtfBLqvFiq4q7mvfV1JPPtTYtT0RWlWJWKLW
4/Nh1/MjYigHonk6MM07Wbyf39K2iOJyx/yyG3wlsEJ5F3Z4fXuqlAX7Fw9An6lk
aQtzfQyhz7XlIlvIiLa77YtBnXLUlPTc3rJgRYLK1lgDsoRQu/jckQTKPV+D2qdj
9CQ31Nm8lWm8Jfs9fQPbIQxJ9UZCd5+G/JK3N7+7c5x5vlWV0ugWzKrYVlwZhq6K
cHzhEKunsBAvjIC9y6uH
=9HWf
-----END PGP SIGNATURE-----

--0LmNHwgdxaw8o0U/--
