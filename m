Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJq0h5ljBzDvmL
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 03:07:48 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1479312456749954.6490463100752;
 Wed, 16 Nov 2016 08:07:36 -0800 (PST)
Date: Wed, 16 Nov 2016 10:07:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Hann Wang <hannwang@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Firestone cannot access local network
Message-ID: <20161116160720.GL15757@heinlein.lan>
References: <CALPyGmSubhKwB9NhGDyxfaiqTpv3CdypBcEhTM7wFTc=v9Qyqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AQNmCumFClRcGgHG"
Content-Disposition: inline
In-Reply-To: <CALPyGmSubhKwB9NhGDyxfaiqTpv3CdypBcEhTM7wFTc=v9Qyqw@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Nov 2016 16:07:49 -0000


--AQNmCumFClRcGgHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 07:03:44PM +0800, Hann Wang wrote:
> I add BCM54210E drvier to linux kernel, my machine can get IP from DHCP
> serverip now.
> I try access internet is good, but I can't access local network.
> I can ping my laptop in local network, but ssh/telnet/tftp doesn't work.
> I access from another laptop to my laptop is ok.

That sounds like the subnet mask is wrong?  Have you confirmed
'ifconfig' and 'route' look correct?

--=20
Patrick Williams

--AQNmCumFClRcGgHG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLIQ2AAoJEKsDR8wtAMEZDysQAJuCKRi46Sm5H+p3OaBAQKs1
x9kfFpHUYcMWV3D6Bwlhnc8H0Q3K0j35zKy5TvmZ5MIFPQsqFUb2t8YghXQ0l6cV
i4mVfIRljEky8gyRKK5CdpEMuT9Aa1THgTE/NkfQwpAAjYMqv2SVnukZVxLuXtyA
7SkZUFRQmuoTWQBCnbuIDLCCMDDE3CPuJBSTvTxh9/kQp96iKhTo5VQr4DMWNOWZ
L2fFYxv9RZHIrWPqt55j14oCwrhBHWMc3/ABSibvKg+RBaghZ+TMGCnWfSXfKK8H
Nl2LFjRzuiF107VnBxV1h8XavkYmd9qi46zyjS+f0SNlm+G/pNSHGxMjIt9BNkYe
S3tCqurblc1+4JiVTUSbXVylKbASEny+UmwVvziijZaKRDCHriIDvpqR3leUGeQL
G/xns3DgaSCac4HoLjUDCqXjW5tw20B8+LrNRJp4ccyNO0AGRAXo59GIhwCrEjOm
9FWgeIRdK2gF9Lm5BxxXOyzxNsIkrjKeyGSIok8MkawDKepE3y8/uTUW9k1081Es
Vl9GqsGZNiL2Xx4mhpK3sM6qMz/mZmFW+qCTi9oxM8FZJIvAsDdbudl3tQmKcfos
QCuPOeDwrdPTWzqLC+cF9fqOzUk4aZmAVQj1lgxcY9BoU1ZPrcZDJTfW9RMEx14w
qNdlyh74b0wXxtAhorp7
=uvoC
-----END PGP SIGNATURE-----

--AQNmCumFClRcGgHG--
