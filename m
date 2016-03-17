Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQvTn2p6VzDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 03:49:49 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1458232599654220.8138020613046;
 Thu, 17 Mar 2016 09:36:39 -0700 (PDT)
Date: Thu, 17 Mar 2016 11:36:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH RFC] Add obmc-console project
Message-ID: <20160317163637.GE6045@asimov.austin.ibm.com>
References: <1458208528-4143-1-git-send-email-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline
In-Reply-To: <1458208528-4143-1-git-send-email-jk@ozlabs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 16:49:50 -0000


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 05:55:28PM +0800, Jeremy Kerr wrote:
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-cons=
ole/obmc-console.service b/meta-phosphor/common/recipes-phosphor/obmc-conso=
le/obmc-console/obmc-console.service
> new file mode 100644
> index 0000000..b8bf87d
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obm=
c-console.service
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=3DOpenBMC console daemon
> +
> +[Service]
> +ExecStart=3D/usr/sbin/obmc-console-server
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> --=20

Someone has another pull request that added 'restart' policy to all the
service files.  I think we want that policy on this service.

> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW6t0VAAoJEKsDR8wtAMEZ8GMP/ROpug2kuekbEtNVZqhAgGIj
8dtAuKith6wkglIbBhmmKqLH4h+MF/awZu0va/EXFJ8+3Slf/NJkk2g1xWdJQ64W
ea+uTRUWlGoIvzZ4p0Ga5bi251iIA7qs6cR/QHyLwctV860fxNhl7wThvYtAYUnw
ATt1KxQ7vBG3c8zgLte4fxAY9+tkWgfpK6rpiT/U1sKCxVuj72LHPokve9/7cyuT
Rp0jqOgiWcQtzXnh3+NUBnQI5qL5zHdT2gyI+Fk15scjOythjxZSrJikbisXDJwx
wmi0qfz3jE3YGPFzL2o2LJRbYFOIc0PThUQDGgdSSWJGQoL17m3VTaB00Sgp7XPX
XXfANIwCxZP23DImbe2Bnr5ffwe7lpE9wVX30H4nlXM/vFwNQVG4C9KKVNLSMdM/
tDiMoMbuezkE4Yw6Eq8HCHjngbruuLxtJ3hjaxKyqFZALWiqcFmwefApzJaW+edZ
6cG95MRU9YtgDAwz5UXc4IrWHVT5jc2FgAleMNK46As59OZhvKfEEsWoRu3LbBhT
+mNAXbkuIpyufFS3HbbOMkDzUo5ZpjU2pZ8nnHwM9xS2I9tO6OV43ZeJP5u9Q/Ub
eB7y4p4Hag6G1lTrHeiiqM1AxY13YsjnY4ktUvGzPaYtCSM8zWz+G5XUW1xCPDM8
3+mGAcTCthU1jtXy3AeY
=zzCy
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
