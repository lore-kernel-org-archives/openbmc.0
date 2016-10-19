Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szkBZ4b2xzDvWJ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 07:32:06 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14769091214301004.2405827097643;
 Wed, 19 Oct 2016 13:32:01 -0700 (PDT)
Date: Wed, 19 Oct 2016 15:31:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC for enablement of slpd on openbmc
Message-ID: <20161019203154.GF32710@heinlein.lan>
References: <5807B226.8090400@linux.vnet.ibm.com>
 <CAPLgG==AWcsVvswzJQpqbqV0GBU94fN1yTb3p39SUkv5hnRo8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline
In-Reply-To: <CAPLgG==AWcsVvswzJQpqbqV0GBU94fN1yTb3p39SUkv5hnRo8g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 19 Oct 2016 20:32:07 -0000


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2016 at 01:09:11PM -0700, Rick Altherr wrote:
> Please make sure there is a distro feature for this that can be turned off
> to remove SLP entirely from the image.
>=20

Agreed.  We did structure the Avahi support that way and this should be
done the same.

--=20
Patrick Williams

--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYB9g6AAoJEKsDR8wtAMEZdpQP/0ahhphEon4sifFlJxAs69tm
sKoDgaoCB9TRKL9sIj5D0J5F454bzRK7A1p3zJ2m4pRH3xr+aliZFDRbpAhTHDoP
/Dnv7w5c62fZfyPQdI4UPnTZCk+saXhpyI05Ow0oVOIOuhsNJ2SzBiCa9zjoqCaj
a6WHt8w+cDuK02sgQsPHMacVLrazc1moPfa4j5nykhz5tTUkaJJuchk+RZtkCLX1
gB6qpbh4tu584gsKc0Lqj7FCFP51t0Nk6/t5GgSVImd46TEnm1zDGEEYGQ7LRyMf
1ROM9I9Hzb93HX7mvPh8t7m3hfXrngIUWVlfFY4Cc8NuhnNd9h4ZfNvkPC0n/MN2
f+/wJEB5ZmKV0LDpYNPjcCfI4jQ5ICLef/FMVrF/BLh1HbXv/piPJlfLYs6eUb3c
Ci+ASpomfK2+rVX6po98pChibP08rXMIMxedA31SyaTlKsrVIGE86tHGJPizLRaG
snfabmHpKTWa2lWRWQgx1Wzo1TYMr+iGUL3cZSfiIRMS31z4ZE99Dcjmxg0uDyYz
faX1D2dB9YHcaRs4hWcD+zsUYzkobB0l7YvX3TQK6SoK0pBn3vXCSrmsD5vVX9h9
JGh33HHq5Zu2OynaLgvVYYmxYXtyJ6YFqGI4dYwCl28jA3Y0jj+nZf8UGIzzfxsy
wpMtvviZbxhcBoz/OjBX
=KjPl
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
