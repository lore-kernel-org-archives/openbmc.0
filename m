Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcylg3fqDzDw0l
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 09:52:31 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1481583141999655.489501167573;
 Mon, 12 Dec 2016 14:52:21 -0800 (PST)
Date: Mon, 12 Dec 2016 16:52:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: eajames.ibm@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <christopher.lee.bostic@gmail.com>,
 "Edward A. James" <eajames@us.ibm.com>
Subject: Re: [RFC linux 1/2] drivers: fsi: Add SBE client device driver
Message-ID: <20161212225215.GA5150@heinlein.lan>
References: <1481064330-20757-1-git-send-email-eajames.ibm@gmail.com>
 <CACPK8Xcwk-ctKv-G-RdOo2xcwb3PHfDVfBJa=r4qkm5Ncbuoqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <CACPK8Xcwk-ctKv-G-RdOo2xcwb3PHfDVfBJa=r4qkm5Ncbuoqw@mail.gmail.com>
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
X-List-Received-Date: Mon, 12 Dec 2016 22:52:32 -0000


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 03:26:46PM +1100, Joel Stanley wrote:
> Lets have a discussion abut what client drivers we will need to have
> in the kernel for FSI.
>=20
> We should consider only creating kernel drivers when the code cannot
> live in userspace. This would mean situations where exclusive access
> to some part of the address space is required (SCOMs), when the
> sequence of reads/writes are timing critical, or when there are IRQs
> involved.
>=20
> For cases where we're simply writing or reading values to the register
> CFAM address space, writing userspace code should be sufficient.
>=20
> What do you think about this approach?

I'm pretty sure there is some layering going on here.  SBE driver uses
FSI, OCC driver (on P9) uses SBE.  We can't get an hwmon OCC driver
without this SBE driver.

Eddie, can you confirm?

--=20
Patrick Williams

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYTyoVAAoJEKsDR8wtAMEZIlsP/RjG5DBk4Y12JUk56lYXz+o/
+ceCOsl3B9o/kNkg645Pm+BFHDFeGA4xfpMI9ISeiVJxJ3oghz1WDsZ8Drf6Ob73
VLv+pgtVC6ucAjFSCv2FyoVnlZyoCoF5zbji3QJ31k/Zx3NrlBaOeCrmPvMMp6Fv
cZRfWHj+fONS17D0OQ4y9kW/DCCNnmyXjClXSuxH6oAxQwomnuyRvdSWmql0frl+
DklWliLQFpa+42i74QjY0/viXFkArPm1MAEdXuqu0dDyZJyGF5/D7OnfyaEWV5RX
aMv4PlQ3XqhdruLTv9rLRv2WK0LdRoJAEcGrzPxmmQoUQRFi1E2vtBeB1uoHCt68
KjnAFbuftNCdmMQdFw1wNjLl7um2dsL/R6NQPJ3wOrZZV7iJDRg7d/IL5+lUYam5
DcVN+stJKdWHNV1cKo51Cny0aWjzDt6+i3DW3S/5VFddnYkBbYz60/cY46LaG9V3
l6nYkm1RzBgFNHInKnlXtiKYfgIWHcFEuS1AtPY+USuycdjtQaQO1WdvGEUzW9oS
b3fdZt7ouRhS8AvVkSE/JDdUrTNJMW9CJcm9jyDYPDuyR77pRN+xnRHHwd/9rRvQ
iVPsA/AwfQMIghO/3m7Ol0bxxade0Rga116gz9aUXgCDmsqB8/kNqbCAB55tAQ2r
BrvSocnWDtisPeV/8wyD
=cO/A
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
