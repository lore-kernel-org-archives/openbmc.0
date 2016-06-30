Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgXgR4V22zDqmL
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 07:27:15 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 146732203092787.0406418566049;
 Thu, 30 Jun 2016 14:27:10 -0700 (PDT)
Date: Thu, 30 Jun 2016 16:27:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 3/3] meta-openpower: Update pflash version
Message-ID: <20160630212709.GV20922@asimov.austin.ibm.com>
References: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
 <20160630162033.2330-4-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/CHBEyLWSSL2QXIQ"
Content-Disposition: inline
In-Reply-To: <20160630162033.2330-4-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 21:27:16 -0000


--/CHBEyLWSSL2QXIQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 11:20:33AM -0500, OpenBMC Patches wrote:
> From: Joel Stanley <joel@jms.id.au>
>=20
> Move to HEAD so we can drop the patches we carry.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Stewart released 5.2.3 with these fixes.  Can you put us onto that
instead?  Prefer to stay on a released version rather than a commit.

> ----
Patrick Williams

--/CHBEyLWSSL2QXIQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdY6sAAoJEKsDR8wtAMEZ6CgP/joifKBpM9AQs0ullOzn+bUs
ovr/hK/MKHsKUVeazAbKLEwrWn9Zjxp8pJKQTkfDSy4rv3cTWOZb+naryn27ZwEQ
n8sGEDGe2dwVWAG85zNSARgh2AI6glAEveGJGziT7OhAtT+UBXs0sKncW/0tV5n2
iz6Ol1PAr6avNPyenC4OERhOVwYClSCf13d0xFgOKdoxsnX1kMNfIGSi1zwMfJex
+03vDy4jCnN3iFcGd/1LR8RPk12i/uGKn8QdyzRj+orOEsjX3MfRDo7dwRPl+hKx
58NilBVrpczlWSWpB9jT+kIp7KBfv8uu/VWAn1oRFYDmGqvyJCpRV0IKZUJneP/U
IM4H6VVEe44rqK0gL44pLEkATuvGnU7fcEPsJVS/8r1WA+tIu6h+9C9nbfoOIMqR
eImUi9023gCzjaKkUGHEHRHNjq7SQkXGa2pFtNfaZSvrV5owuNoHiWqgjPE6XNhO
8WqwZ+EbCMly+FQdvCCajPe42LEtutY6vJbV1wVIwJ1JQ9tjnVZLNled6l+vqSm4
rQh+Grcf1Gzg1qBdA+rpr+U++DVODbMGLwfJRav46CSNbcPXPrZnIPS0wZOpj8do
OKHZ6tisltaJ79Sr2+CZaFASLRYemewe7e1YEBkNof6fleIeoyjdS48FR97lFZMI
IwOIh1pmKU0Pkk0S8zzm
=bFh3
-----END PGP SIGNATURE-----

--/CHBEyLWSSL2QXIQ--
