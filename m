Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sf3R42rD2zDsTQ
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 12:26:37 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1474424792902388.49015376664977;
 Tue, 20 Sep 2016 19:26:32 -0700 (PDT)
Date: Tue, 20 Sep 2016 21:26:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: Re: Aspeed board for development
Message-ID: <20160921022630.GB11301@heinlein.lan>
References: <C160D2872FE0DE4683E1910F9BF829413D2A3893@avsrvexchmbx2.microsemi.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <C160D2872FE0DE4683E1910F9BF829413D2A3893@avsrvexchmbx2.microsemi.net>
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
X-List-Received-Date: Wed, 21 Sep 2016 02:26:41 -0000


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Arjun,

On Tue, Sep 20, 2016 at 06:38:35AM +0000, Arjun Padmanabhan wrote:
> Hi,
>=20
>=20
> I am working on requirement  to deploy our redfish server on openbmc envi=
ronment.

Welcome!

> Initial plan was to work on rapsberryPi3 board.  Since rapsberryPi does n=
ot have full support as of now(Git issue #587), I am planning to build open=
bmc image for aspeed board and deploy the image on it.

As you see, we have an on-going, but somewhat "spare-time" activity, of
getting Raspberry Pi up to the same level as our AST2400 / AST2500 dev
boards.  I'm not sure if we even have any RP hardware to test this out
on, so any assistance you can provide there will probably make this
effort go faster.

It was mentioned elsewhere, but the alternative for you is to use the
qemuarm and/or qemux86-64 images for development purposes.  Since
Redfish has a large "software" component to it, you should be able to do
the majority of your development with qemux86-64 (using KVM to run
at-speed).  This is where I do a large portion of my development work mysel=
f.

> I could not find purchase link to buy aspeed boards. Please let me know t=
he procedure to purchase.

You would need to contact Aspeed directly for this.  If you are planning
on building a product around one of their chips, they have a development
board you can order from them.

> Also if anyone can share some information on which board version/model I =
need to buy for development, it will be helpful.

We have been using the AST2500 development board lately.  I think we have t=
wo
of them.  This has been useful for kernel development but we have not
utilized it for userspace application development.  That we have done
either on QEMU or on some existing AST2400-based systems.

--=20
Patrick Williams

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX4e/WAAoJEKsDR8wtAMEZ6tQP/3pr/dnvq2MNi0IqNl/YO2zm
n28wL3uJalmzy61CEBAdslG6EIoi6/som8+PgdQ5UXUcex8mKthNIFPpJ7v/uFXP
HCJq99lbpyllzDUOoptF0JUpV5YwkSzjufX0wlBihWgOt/uv50se7k+EbBrSU8l8
XJDF8XMvO4CncNObHVsCSvRNIp2ig6qwnYyC3ZqaE25o143iZPyy8gGDTUe9Z2R/
rGCIgAud8EJZdjaR96pS8QXtey7/lB4b4dza1jayWwZK6crZZUl0vwR0xzOmTOFM
g0N5FNUdTm6gBU62OHK12hOs8ASPyekGsje82xNKjnhIC1RrBQRPQaQBOVpRAZL2
rZ/Vi2SA6r9PTox7rPY726feeLqCTHhQBZPkbFUgBdkDUZZXG4cRI6h1fJp0Rwas
Ahi2eikvAuylqilQSdZ/aNnldFC0l0h03++/WEvoRzZt84MLsSOvyYQ8UrKAgsD8
l4MBIwPlkHGBZMTWN6XS0srwZ9+wwQdq7G34qWgiWmC7BpuyqxrtKNYHF5hUXLdG
VLbXd8H5uoM0V3V0l26/2Bsv4ncV4W1J4dSo5UivES/ybw0r/wROg59urxyzEipC
yRFwF2D3UTKm52BmOpebGNx0a7cdGCwhVEtjSaPpIV7SFAxaUZyw0AgiyfSoMGW5
Db+F+ZEIQTnCiSA+pzcu
=ZmlX
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
