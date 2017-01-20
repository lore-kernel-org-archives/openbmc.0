Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v4rCn1jPHzDqHW
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 06:21:09 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1484940061165961.5955142240729;
 Fri, 20 Jan 2017 11:21:01 -0800 (PST)
Date: Fri, 20 Jan 2017 13:20:59 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: Mine <mine260309@gmail.com>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
Message-ID: <20170120192059.GD5120@heinlein.lan>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
 <b5a30dfb-8b32-ef9d-f928-a6def24e21f1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
In-Reply-To: <b5a30dfb-8b32-ef9d-f928-a6def24e21f1@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 20 Jan 2017 19:21:09 -0000


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 05:54:02PM +0530, vishwa wrote:
=20
> I thought and partially agree to their concern. For changing the owner=20
> *away from SPLIT*, we can actually consume that readily. Its only the=20
> change * TO SPLIT* that needs to delayed until off.

Actually the opposite.  You can safely switch to split while running,
but switch from split or host needs to be deferred.

> >      2. If the process restarts we need it to go back into the "current
> >         state" and not the "requested state".  How do we make this
> >         happen?  The current implementation might also have a flaw here
> >         so maybe we log it as an issue for follow up.
>=20
>=20
> The current implementation only sets the values based on what was set=20
> prior to reset.
> It does that by consuming the saved data in /var/lib/obmc/saved_*. So=20
> there is not an issue there.

Sounds good.

--=20
Patrick Williams

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgmMbAAoJEKsDR8wtAMEZreEQAJd7N6xqHKkHYrPvDDVadeTM
67jA3FPM2LgHx4EaDchURNaa5TJPJBpACVsB+dcY1teWIR8GMLxn6lAclV2mHBlV
xokYcmeZa5nAsejQWSerBLd9xMrY9kPWOQ5xwtooV/C23bX9rYjX3IH4zSGa2z/T
0n/szShD+fosoPTdsb9LhGI+XNu/L4VPOjEJbzlCIjsARMoJ30sGfiN0eb+/AxFs
Qyu9hDHuh8a2fXXWt9XcawOpD3wfD6FeWCgFok2C18mFDHowaJayiLm99DK4c70t
JDjCXr7JAn8tcV4X2Bu33GcopvKU+oY0l3gxR0B7nZj/4pcy2DE3V3zeqqHDNz1l
mNRKN7BdZu3jisvNA/G7+SY+hWRFhrqHCTdgX/PcjuXO82w5Bo6aG8ILww6hxxcO
pxnvnaU8+Y9qyaNwrX6x3XJH7SRdXbz4CH1C/lM5oCuEZAkspqkDey0YhshzkRnj
JZUVCJOlJGvj27FSeo/5N9+VBYFU4Cxq5W/KWntNQS2jWHdOPJ/Vy2Q2VF08Xi5d
pBfEmZNfWH8TEbh3sqat+791MaWG7VAOhwEJACSsK8mYfl8pdcX0uAYk2mT2gMkD
C0FByZ+BE3lwXHthU+P56LZi38nDhdS1fS1p6qtOEzDgKCHjz9fyOcPP/9o0KkO2
cdOgUq5gkc3C7hAgC4fJ
=WmL9
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
