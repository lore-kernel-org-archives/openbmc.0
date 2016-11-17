Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK6050DYBzDvp2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 14:23:16 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1479352982551533.5028838938496;
 Wed, 16 Nov 2016 19:23:02 -0800 (PST)
Date: Wed, 16 Nov 2016 21:22:55 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Abhishek Pandit <abhishekpandit@google.com>
Cc: Cyril Bur <cyrilbur@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rick Altherr <raltherr@google.com>, anoo@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>
Subject: Re: Refactoring skeleton flash control
Message-ID: <20161117032255.GM15757@heinlein.lan>
References: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
 <20161115113954.GK15757@heinlein.lan>
 <CAN61AdfuRqu=fB1UnOhHBti=xPErz3uETfh8jcPtyftxnbUMVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vdqwC0msT4ilQ2it"
Content-Disposition: inline
In-Reply-To: <CAN61AdfuRqu=fB1UnOhHBti=xPErz3uETfh8jcPtyftxnbUMVQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Nov 2016 03:23:17 -0000


--vdqwC0msT4ilQ2it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 05:06:27PM -0800, Abhishek Pandit wrote:
> I think the flash interface will need to be updated to be able to identify
> exactly what software on the flash (i.e. Active). I don't know if a single
> version for the entire flash (i.e. bmc_v0.1.0) is appropriate or a version
> for each individual piece of the bmc image (i.e. uboot_v1.1.0,
> kernel_v4.7.11, rofs_v1.2.3). Providing this would probably require some
> compile time specialization on the host flash for different architectures.

Certainly, agree.  I expect different applications for different Host
flash layout schemes.  In fact, for Power, we are strongly considering
not even having the Host-NOR flash actually be laid out in "Power NOR"
format because we are going to use 'memboot' mode.

> For the other states (persisted, available, backup, etc), those just seem
> like policies and the actual flash interface shouldn't really care about =
it
> (unless the intent is to write the "backup" image to the flash itself).

Persisted vs Available is an indication of on-flash or in-tmpfs.
Backup vs Primary may be an indication of dual-sided flash scheme.

--=20
Patrick Williams

--vdqwC0msT4ilQ2it
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLSKNAAoJEKsDR8wtAMEZAnIP/Rw23pZXelqzo1CXl4PW/g4P
aXm1Uph2ERrw0WqPhAxmwpVvxcGyKbPkaupgEqvLxNs35riJqEgHRV84i4fuKLrF
sDmiAqgwXRzQO+gisYLtumF76aQEZ5IIEr01pcrm7WPgfjK4tV22Hfs0wCQFPhAY
knI5jCOBwLRiy1a8Yo06BO9+zB/0ZHYiujyuSZq8EleBd+/1pxYk1dvsqbXwmNp8
EUK6c/48mi2bEiwrgjna+ClKc3HUXjFeuCIQTsR/UtHxyeyCeiDHw2R0JepdC5Tk
nWWUGZp+qKtGClq1MtaObUyfc2NHt3RFG7c6qgg0GoyXyaLXoAwKPmPCFSRPqND4
9iuhRFETIP6RBAeQUlt3ATGcNXgj6agkzuDzAHykeHv6uBea0ObDS350f7UoSk+z
09CEpNAXCc/MS1XEII0hR+Qym+MW9dz8WoyoO8vL2f8A3ZFAh1A6pn7BhOY5vQBc
fFIUYWjCMbhZWC3esmPRHeT5FNnNsG7sQ/d9Qx21gSpTq8rf7BkTp/y0o5fIAvG1
88SX5byzc4peXF3aTANav8jBYFS9Dg6tjZp4xOu3a6VLbhCBtgHpZIAhF+8T2nVW
y+KU5kjqjny/dG1eOgNBkRuN31xx6T/c7GnbEz+l4WR+E9pbYTyP0kqCcR/O7FnI
2qv41Is4Kb81/mPwBBGB
=faqy
-----END PGP SIGNATURE-----

--vdqwC0msT4ilQ2it--
