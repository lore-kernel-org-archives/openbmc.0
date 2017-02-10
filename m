Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKdNZ5wsRzDqBm
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 01:58:06 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1486738615117751.5452167128113;
 Fri, 10 Feb 2017 06:56:55 -0800 (PST)
Date: Fri, 10 Feb 2017 08:56:54 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drivers/misc: Add Aspeed LPC control driver
Message-ID: <20170210145653.GF5504@heinlein.lan>
References: <20170207234247.19425-1-cyrilbur@gmail.com>
 <20170210143012.GB18321@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline
In-Reply-To: <20170210143012.GB18321@kroah.com>
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
X-List-Received-Date: Fri, 10 Feb 2017 14:58:07 -0000


--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 03:30:12PM +0100, Greg KH wrote:
> On Wed, Feb 08, 2017 at 10:42:47AM +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
>=20
> Without some other reviewed-by: or at least tested-by lines here, I'm
> not going to take this.  Go poke your fellow ppc people to do some work
> here, it shouldn't be up to me to do it for them :(
>=20
> thanks,
>=20
> greg k-h

We are actively using this driver in the OpenBMC project and have
exercised it in booting two different server variants (different
motherboards entirely).

Tested-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYndSzAAoJEKsDR8wtAMEZaEYP/jaq+BD6D40dtaFrXlB2Dk9f
nfMASssJmjcgL3zXsgmQRmbteUsxCmDZJvFldWiAXIzwd1q7NRJxMx+pGjqzj3dg
mRTuwWtZssjK4S0euGGenvn6hi8IIFeFligRAo3fXItiuoze2hfxRNnSkFd+hUvX
iJ1jktLJyajO27Et8U9q8U7r4toFH7KMGY4GbRcysb+O4BLmPBdZT+JLXVVpLsKm
2XybYLRFAfe3eVA8289RCciQqT6DD7t1w9vKTtrvclbpBlb3cIW7wbgPL9GHV24Q
Aay0SRzc7BxjaOZTbXghA/JR+E78+c0/UdMxLkulcm7gsL3EUR+rMKR39kc/tQuC
jlLxfC9gJu4hquR+LmE+g/zRaXmC0bVYmx6rZd67VNJaYBD9w3uqE5S3Kw7sQ77G
H18MW2O4fmgIdCDyBsza57BZRLDbGwSxRY37lEKeMjHTUYay0EAoGU8JOAFJ4x7Y
ktHhUrlWmbyvgoBtYPLgQKNuwiXKsbzwdutJQwNXWUAySM8nx4N6QpwoTLRI+aWY
4FN4tJSF2H+eKFHBppaZAQvedgiuSKkybHDXDbe9DdCQeIhsqNJLGnlanIrFlhaX
UokpjMqhuNaUZgUsLiGuMOMXLChofQKao3JwrTDXFHPTVwj/TK8sR4TXfZ4Nayuk
Qsov7IdlqONQQn5cbyHM
=uQmt
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--
