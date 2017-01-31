Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZGb6pQczDq9B
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:16:55 +1100 (AEDT)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 1485886608657815.4849970985829;
 Tue, 31 Jan 2017 10:16:48 -0800 (PST)
Date: Tue, 31 Jan 2017 12:16:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Image Management
Message-ID: <20170131181641.k3jnv73ha5v2kjsh@asimov>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan>
 <87o9ypw13y.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nzrl2jq7r6xkcdu6"
Content-Disposition: inline
In-Reply-To: <87o9ypw13y.fsf@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 31 Jan 2017 18:16:56 -0000


--nzrl2jq7r6xkcdu6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 04:47:13PM +1100, Stewart Smith wrote:
> dm-verity (a device-mapper target taht cryptographically verifies each
> filesystem block) could be a way to very easily get most of what's
> needed here.
>=20
> https://lwn.net/Articles/459420/
>=20
> https://source.android.com/security/verifiedboot/
>=20

Any ideas on how nicely that plays with mtd/ubi?  I don't see anything
about it.  I do see some dm-verity presentations claiming that IMA is
slow and dm-verity is much faster.

We should have all code in a SquashFS image anyhow.  Signing / verifying
that whole image might be reasonable as well.

--=20
Patrick Williams

--nzrl2jq7r6xkcdu6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkNSJAAoJEKsDR8wtAMEZWL0QAKQw/592M0DkSLjw6XruW1aj
7uaUSiETXk06YRQBpVlTItkfywACX+/D0DXlpPZ8Z9H/M7Zh+ujcvgzEVrRX0Ltt
YNm8pI8TcgiKikeSoDPR2RY2VsrxF3zGdpkQfEMQ+nzeQMtLYaOGB8qEXG0k0pQc
MhD+XF4uPL1yyx+14NxNrkdiTT9E9rXTV5wH841jSvCwJE+7qHixy4Q7eBMbvpK+
tOvwK5N65tFLl66sJLhl7Js445jK66t5WUfYoEE+kIrAfDUKJs09itdsz1tFbL8W
H8VdgJCJx67PV4U6NQTx0IlDAK9bElSeWUeHOfUXhLZBpufx1lR+e1VNqsYdyV9/
/6QCMikLba6PcPTl1dpXbKZAkc0Kc/1esy7Kihsgi98Pr7Da21Gyyzq9k3khDJdb
ulj0UwVjtd4op3QNqIOdGmqnjWROK74Ikblaqz6BNEEk2e5b1WNG2dSbNsyHF/Vg
ArtDzVb3lD0I4bfcGJslgEGzWBtYEyRIq/HdnDARPL4rqNFbKJDktGkO8zqhYocW
v6xra2bG7m0wDKigsL/ykaYe8dyYE2Mg7EeTGL/883n8M52c99RF9g/b6kX0n/Vr
pAuHf9pPpTqsVRBDKgn1M5x/0k0llAc6AYtxl0JZ4/1h8QqS9wbJZNCWPQ/rRScZ
GGzMl26yKJmlVuJXdDct
=1AKU
-----END PGP SIGNATURE-----

--nzrl2jq7r6xkcdu6--
