Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8gRJ0fhXzDqJ5
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 04:58:51 +1000 (AEST)
Received: from localhost (32.97.110.50 [32.97.110.50]) by mx.zohomail.com
 with SMTPS id 1470855526224874.1215224018005;
 Wed, 10 Aug 2016 11:58:46 -0700 (PDT)
Date: Wed, 10 Aug 2016 13:58:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: discovery of openbmc
Message-ID: <20160810185842.gkrmf4pazdqqxv2e@asimov>
References: <OFB7A77BFE.3A84627D-ON0025800A.0080354A-0025800A.00810503@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rx3ixlfhfxg32px6"
Content-Disposition: inline
In-Reply-To: <OFB7A77BFE.3A84627D-ON0025800A.0080354A-0025800A.00810503@notes.na.collabserv.com>
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
X-List-Received-Date: Wed, 10 Aug 2016 18:58:52 -0000


--rx3ixlfhfxg32px6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 11:29:14PM +0000, Chris Austen wrote:
>  I should know the answer to this but is inarp the only way to programmat=
ically discover an ip is an OpenBMC system? =20

inarp allows you to determine the ip address from a MAC address. To the
best of my knowledge, it doesn't tell you anything about what is running
on the machine.  There isn't any way to know that it is an openbmc machine
just by looking at the result of the inarp packet.

> Any desire for Avahi or something else? =20

I had a request today from IBM manufacturing tools to support SLP
because the FSP currently does.  They want to have a well-supported way
to determine if a machine is FSP-based or [open]BMC-based so that they
can use a different toolset.

Avahi is a zeroconf daemon that uses DNS-SD.  There are a few SLP
daemon options also.

=46rom a greater openBMC perspective, I think it makes sense for us to add
a Yocto FEATURE support for both SLP and DNS-SD/Avahi.  We would use this
FEATURE to add configure flags to some of the userspace applications,
like the REST and console servers, so that they register properly with
Avahi and SLP as appropriate.

--=20
Patrick Williams

--rx3ixlfhfxg32px6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXq3liAAoJEKsDR8wtAMEZm34P/0kwPpZpewvAuuHcumh3PRUc
/fCCLrCc8fYKwMCtvfZ4cjFVmDehdbTE7Js8onczWVqmkuGSlTyF/oKNHChhD4UQ
LjMRlQvGGQpkFq3fnl4R+DXcJlCxCOp6q1KZ8fTa9uXm10dpxILTkZ3xdSTdm9b0
0H0YHfTPFfXpVxgrIMZATfTBK/mYZutPI7v5mu5LfjtQ8fsTGw3AIYzFbTAJMmJp
NpxCgubk2xqAANCsSCbM0sgT/WAcxeUv3aKY1NC077YabzwMKKPrCXtjQM8VcXA0
6GNxNF4lLN5eJr1ICUvAJ8JEGvftAp4bDjJRq7JPgUQ+qF3+ewIJXY1jVB1gHqKk
wItu+GAXapA8A+1f2zU3hii/moHwdKhsF93fdrCJ/fjksvVwJHPwhIt6x/Hvu4sb
3lKCmzuccykTv/m9txrLmbyd74mEhvGecA6fa1CrpY2Gplvg2Ya94428tLP1sxnr
aHHqy3QBO8j8y1Q2S4lSxj1LWmg2vjyRgxUpwPwNRGBx5e4GPkUJ/1BJFToqtFA1
NxlZz5LIKsgdv4lJvF4l8NJn8rECK4GcxiygOuVztYI9e1ZFv5FX5z4BqZnt5Z3w
o3402uv5TNTK04bwJZSyvl6We2ZwMMZailppkZqNYxGQEusCq9yoMTAB9oojgUVV
9lIJNWGXZUV/0MdekUBs
=J83Z
-----END PGP SIGNATURE-----

--rx3ixlfhfxg32px6--
