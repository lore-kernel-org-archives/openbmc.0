Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qc6GN3xTfzDq5y
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2016 03:26:52 +1100 (AEDT)
Received: from localhost (32.97.110.54 [32.97.110.54]) by mx.zohomail.com
 with SMTPS id 1459528009526695.8006159771555;
 Fri, 1 Apr 2016 09:26:49 -0700 (PDT)
Date: Fri, 1 Apr 2016 11:26:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-rest-server] Add support for serving jsonp
Message-ID: <20160401162647.GJ11491@asimov.austin.ibm.com>
References: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YrlhzR9YrZtruaFS"
Content-Disposition: inline
In-Reply-To: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 01 Apr 2016 16:26:53 -0000


--YrlhzR9YrZtruaFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 10:40:56AM -0500, OpenBMC Patches wrote:
> Jsonp adds a javascript wrapper to json responses.  It allows client
> applications to work around cross domain restrictions imposed by some
> browsers.  For more information on jsonp:
> https://en.wikipedia.org/wiki/JSONP
>=20
> To get a jsonp response, an application adds a callback url parameter
> with the desired name of the wrapper:
> https://192.168.252.1/list?callback=3Dmy_callback
>=20
> <!-- Reviewable:start -->
> ---
> This change is [<img src=3D"https://reviewable.io/review_button.svg" heig=
ht=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](https://reviewable.io/r=
eviews/openbmc/phosphor-rest-server/17)
> <!-- Reviewable:end -->
>=20
>=20
> https://github.com/openbmc/phosphor-rest-server/pull/17
>=20
> Brad Bishop (1):
>   Add support for serving jsonp
>=20
>  obmc-rest | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.7.1
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--YrlhzR9YrZtruaFS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW/qFHAAoJEKsDR8wtAMEZQPIQAJKhzoR3vZ80YvOT3mhPQwR1
nuMCqKb2YJ5HUs/UXY/qwQgQT0HrFrD4DMNhgoy1CQvjnP+huaTLV3/BZdELLprF
rOCSwUZNAY6WzZ1LkKrHI50sUGGFw9k8KspCtA5xYFSff4bX6s6em0zywoOm1xrP
djP73zYzE2nZ44Mmy+PnotbdKbnVek7itnNyX1IchYXt0Jtjn1xiCNEXkawIKHHW
K9Q3qYgNQBmzUGBqhfUZz5NxO5bjjMre+At9AAXJPvwfMPyFqa9MZV921MpHdfWi
YI4WuUAkPuyVgdeP0pa/L76+52nVW8ILb8/Lba7JITKJOqjQtZZo+bFhXyoFVj0+
uQVPMoxU0lfxUgqpVo7a7PcIP1Sliys1qBCsbKbaYCOCLnopQkZRSV7TUG2PYMKA
uTZJSGggvXqC7Mxu2n72LjNZnHSlJhA752cV9b2+OWAwzzdiUdjFAZN77Poe+A88
NNbD0pM2ZcCoUlkAJPsytNCTcPrXVCld1fqxDhagT+07ajKuLzJKqcj66J1bX9lI
68+e3OI7CAvdVzuzY2pf6Y2gtTasSRdjuVWmfIUY9XwSty/wcMLwgtslcoFvhP0x
Qcu89ZHbqOYsRygLRNadIh106oUxJY+ACynipaxKBSNY64xjglUgmQyzBGIOdkP+
m3cinNc9FWM9vFFyr8uJ
=ctIE
-----END PGP SIGNATURE-----

--YrlhzR9YrZtruaFS--
