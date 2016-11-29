Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSSWV1PXRzDvP3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 13:42:29 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1480387343305450.49807769020026;
 Mon, 28 Nov 2016 18:42:23 -0800 (PST)
Date: Mon, 28 Nov 2016 20:42:16 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Starting the phosphor-hwmon service from udev rules
Message-ID: <20161129024216.GS15757@heinlein.lan>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vEk28Nl/eckWL8CC"
Content-Disposition: inline
In-Reply-To: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 02:42:30 -0000


--vEk28Nl/eckWL8CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 10:31:20AM -0600, Matt Spinler wrote:
> The command line in the unit file would then somehow make a=20
> udevadm call to pull out the ENVFILE so it can get passed into the=20
> executable along with the device path.

This was a detail I missed before.  systemd service files natively have
the variable 'ENVFILE'.  If they don't automatically take the ENVFILE
=66rom the environment (via udev invocation) then I would rather we use
unique systemd service files instead of unique udev rules.  Having the
systemd service file launch some kind of piped shell processing is
problematic and certainly not preferred.

--=20
Patrick Williams

--vEk28Nl/eckWL8CC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPOsIAAoJEKsDR8wtAMEZzEEP/RXg6UaUnDltJSri5MP9e28F
O9+ZoZEmoq0L2JTSlxCi/11+W5hs5kE9ZIbnk9dlPD/aajH35vfQnfZSNiM2p2ZJ
4s61nnCBR7936t139dlrVz+vvONje2iqHJsL3TbvHduM76nQD95P7wHB2PswtvUY
S86l+sD2Uc+gfx5MpBWu2aQZ+9FRqYyDyXaJR/F/2sA4O1V5uQB2V/f+kaMG7Ld6
GUd7OIPDw1B56W7I9Ct4vuo17ZbnXKbH5Fe2LK9A7eTgA18G4qVA/zzWeal6WwoZ
fNbdRhV8V0MCZRpWspcIF7n+xnmX1ysAkV1VCEipzjBrOXk73F+31HQ0nP1c2+p2
5POzq7MpnNpsewXGtYYCm6LS75rKA5oVNCbr9bO5fyCLaY72hP/LS38bquA9JvfZ
fVFmM9ZvIjWpJfw6vUWEu8lQ+Fjj5oSNeD85gZ0UPlIcgajcrdKPVzgI+RD4QsIO
zN67O1Gi8j1fmh7GrcO2XkWiQ1PxAq1vozf6WcehOsLE6A8w2ffCH3A3zWZC2jtg
gJN4bcrvHHzugjmalGW6XMN47erSuyDDhSdsIDugl2O6/pAHIUJdLOs6LJc8qZld
tkhIS67PR0YUYoOccRG3axJrngP09kHl3o/giQzi8H71aRJNEsbF/9VOAuGFBZs5
vUoQ4fZ4ZOJ0H6ll/J1v
=8IIo
-----END PGP SIGNATURE-----

--vEk28Nl/eckWL8CC--
