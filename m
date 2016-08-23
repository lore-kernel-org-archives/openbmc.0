Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJXNJ5XLYzDrK6
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 00:08:32 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1471961304206346.959788717891;
 Tue, 23 Aug 2016 07:08:24 -0700 (PDT)
Date: Tue, 23 Aug 2016 09:08:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: David =?iso-8859-1?Q?M=FCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Redfish support?
Message-ID: <20160823140822.avm7s3kl52sx6l63@asimov>
References: <57BC0146.6060904@elsoft.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bhgw7eqnzqnlz4a5"
Content-Disposition: inline
In-Reply-To: <57BC0146.6060904@elsoft.ch>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Tue, 23 Aug 2016 14:08:33 -0000


--bhgw7eqnzqnlz4a5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 09:54:46AM +0200, David M=FCller (ELSOFT AG) wrote:
> Hello
>=20
> Are there any plans or activities to support/implement "Redfish"
> https://www.dmtf.org/standards/redfish ?
>=20
> Dave

Hi Dave.

There is interest from a few parties on Redfish support but no active
development yet.  The main machine the IBM team is focused on does not
require Redfish support so it isn't something we're doing right now.
I would see 2H2017 as the earliest we would start development on a
Redfish server for OpenBMC if one hasn't been started before that.

--=20
Patrick Williams

--bhgw7eqnzqnlz4a5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXvFjWAAoJEKsDR8wtAMEZtB0P/1FBTfM6zYQjRS8Yxbny9h4i
rvsuuV15k4iONGxDF+Kdms+d3trNKZ9ujA9g84TxTg4PL/QmP/HvSMt3uVzegX0K
J4/wMo64gPKn459YmLAWLT9uEG+edp9XQ6bhH9M1K2FhEJ9vI/P6ay/haUUbu5G8
rSL5QS+T7kuwVWWfEPDZuTfDLouGWGnhBtQpmU1E45DldpWvc6lrx+ziyQqWOxut
M3u7n93Wvl+su0EP3GxDpNU9jS4/sJi+BrcVY54JpRfqhYsDcCRVFu+PVZcnloWf
jFjShVfIGQ73U6ySPpU6qr13yCeTKt8RV5J8FNd1ie2LG96SacfxbJupNuMYLLRF
FofqfCqgh3AF8iptBBg/Rr7X/xIBOWhV3AIseZmro9O3k40bHDq1bIaHuit9guiJ
sx3HfUPJTuakCj8DUVo+Yfgr9jhytgY9cBshbcaMDLGiTpa2dbkqbPYw0w8dbhR3
igDxij3Xi3smBVyzRQfXWvFsQklW5OTNQRFBCGs+EKjG9ZSKJD8JCTh8N/vn72ja
HnAv8fxUiyOnjpSjz+Fu70iEkM+QVOWZAwcxOBg123RRukKmjrxKFBWkGmwQ3Ecq
txMDY/Zn1/zOBe7q+zq/WPT+JJfmsTwDpxm29RUeyKEBC1+yqm76KWMSa6+oTvqy
ouMoVhOirwwzemknGZWP
=OOyr
-----END PGP SIGNATURE-----

--bhgw7eqnzqnlz4a5--
