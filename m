Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v4qwq0csVzDqQH
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 06:08:10 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1484939283221197.21271473522063;
 Fri, 20 Jan 2017 11:08:03 -0800 (PST)
Date: Fri, 20 Jan 2017 13:08:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mine <mine260309@gmail.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
Message-ID: <20170120190801.GB5120@heinlein.lan>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
 <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
 <38683dc2-7d4f-11eb-589c-c87784253610@linux.vnet.ibm.com>
 <CAARXrt=ZcCdUC73c27aY28ZgLo8Fsu7GH49RWc-wySK4AcXnkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <CAARXrt=ZcCdUC73c27aY28ZgLo8Fsu7GH49RWc-wySK4AcXnkw@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Jan 2017 19:08:11 -0000


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 03:37:34PM +0800, Mine wrote:
> Currently the time_mode/owner has 8 combinations, some of them are not va=
lid.
> Could you help to verify what's the expected behavior in each combination=
s?
>=20
> Mode      | Owner | Set BMC Time  | Set Host Time
> ------------- | --------- | ----------------------- |
> -------------------------------------
> NTP        | BMC   | Not allowed      | Not allowed
> NTP        | HOST | Invalid case     | Invalid case
> NTP        | SPLIT | Not allowed      | OK, and just save offset
> NTP        | BOTH | Not allowed     | OK, and set time to BMC
> MANUAL | BMC   | OK                  | Not allowed
> MANUAL | HOST | Not allowed      | OK, and set time to BMC
> MANUAL | SPLIT | OK                  | OK, and just save offset
> MANUAL | BOTH | OK                  | OK, and set time to BMC

Why is 'Set BMC Time' not allowed in any NTP mode in your table?  There
is no reason to stop 'Set BMC Time' except in the NTP/HOST case.

> If my understanding is correct, then we can see:
> * NTP/HOST is invalid case, such case shall not exist, the current
> implementation
>   either hacks settingsd to change the mode to MANUAL, or just behaves
> like MANUAL;

When the 'host' owns the clock, 'ntp' vs 'manual' is irrelevant.

> * NTP/BOTH has the same behavior as MANULA/HOST, they can be merged.

No, these are significantly different.  NTP/BOTH means that we run the
NTP client on the BMC but allow either side to set the time.
MANUAL/HOST means we do not run the NTP client and the BMC is prohibited
=66rom setting the time in any way.

> That's why I propose to combine the settings to:
> * NTP-BMC
> * NTP-SPLIT
> * NTP-BOTH (or MANUAL-HOST)
> * MANUAL-BMC
> * MANUAL-SPLIT
> * MANUAL-BOTH
>=20
> Then we don't have to "hack" or "disagree" with settingsd, and the
> logic could be
> a little simpler.

1. NTP vs Manual controls if the NTP-client is running.
2. Owner controls who is allowed to set the time.

--=20
Patrick Williams

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgmAOAAoJEKsDR8wtAMEZO3MP/21lIxu9UWsFOPR3PxYYugPu
mtAlkCh4Mw8x9+fRNOe0RMt83AgKAFvG0t/OkWMY176/HvVSdSQmUzyxHniEEGP+
my2GQ4WSzqhTLUbUUUE7vWMBO/NaAOHujGwocNq+DAg3BZKDr2f9Cz5VYmnfZVtZ
ZpEHF0LgA/W4IEnNTMs9V2kOTvkRAAZvjIhpJX8OUr1TZpKcceIxUmVpxP57Od+A
m7Al/GFgO6oX8eB//w/czBw/a9xwcwUD6YW4N7ovCGoBHp+wHwtoqUBw8ZNPawy4
pj+1/5hhxz3O6wxqmSus8H1QH6NLoTDrZQL6OGI2cRiyAXDK2xU3068cXbKYFw8v
O8Vci/o9fxisbV6LkpKAm96UcFoMk8VxZT48CmsFzf39qrXpz/F/FxsLGEw+/Ttq
m8iSKRbSPBity2yuR7VSWbwBiupUBoxVIdkTy6aA8gyX3FG4FT5OLSPGmqLyyVAw
nUjnHpsv1JvYVvPbaacTYyYahD3FJ5nXbWSw+zPafzgTwK3ynyHEt9uDnrJxhIpM
AOEDuco12EnNdU8HJRTENsFf20W5JcpCtjf5WG3cM2rWU/0os7LBg5YUTyk8Fsfj
dECOGPxRKfU3/XiXuCi15+aLeTt30vFSUQC1IybiwHAgjts/1lQHo1K3ubkfm2TJ
CzzfolnnqqPdW783k0AX
=ofHE
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
