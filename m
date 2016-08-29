Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNHT832c0zDrJq
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 02:40:44 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1472488395132872.066283643746;
 Mon, 29 Aug 2016 09:33:15 -0700 (PDT)
Date: Mon, 29 Aug 2016 11:33:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Repository integrity (Re: OpenBMC v1.0.5 released.)
Message-ID: <20160829163312.jynack6ej75f4ohf@asimov>
References: <CACPK8XeWuKOy-FwpU1dLwGz6woRQ3SGhpOr-S4pQmd1h8B0t1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xj2xgnkbzc2fczw7"
Content-Disposition: inline
In-Reply-To: <CACPK8XeWuKOy-FwpU1dLwGz6woRQ3SGhpOr-S4pQmd1h8B0t1Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Aug 2016 16:40:45 -0000


--xj2xgnkbzc2fczw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2016 at 03:17:35PM +0930, Joel Stanley wrote:
> Hey Patrick,
>=20
> On Wed, Aug 24, 2016 at 6:33 AM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
> > Due to a major regression, I re-tagged v1.0.5 with the kernel updates
> > removed.  The change log is therefore just:
>=20
> I don't think we should ever overwrite a tag that has hit the public
> repository. There's no harm in doing a quick second tag.

I've heard enough complaining that I won't do it again.  I didn't think
there was honestly any harm it in considering the intended users and the
time-frame of which it was up (around 12 hrs).

> This is particularity important in the context of Brad's account
> becoming compromised recently.

All of my tags are signed with my PGP key and I use 2-factor
authentication on Github.  I sign nearly every email from this address
with that same PGP key for further verification.  I don't think we have
any way to get much more secure without creating the tags on a
network-less machine.

> Can tags be pushed to Gerrit and reviewed through it's interface?

Tags are pushed through Gerrit.  They cannot be 'reviewed' because there
isn't any content to review.  Or at least, Gerrit does not have that as
a concept now.

I'm not sure what you would review anyhow?  A signed tag effectively has:
   1. A message.
   2. A referenced commit number.
   3. A signature.

The only thing really to review here would be if you didn't agree with
my choice in commit number.  The message is as simple as "OpenBMC
vx.y.z".  The signatures can also be verified on Github itself since I
have added my public key there.

> Would Github's protected branches feature have stopped you from being
> able to make this change?
>=20
>  https://help.github.com/articles/about-protected-branches/

Since I am an admin for 'openbmc', the short answer is no.  After I
force pushed the tag to Gerrit, Github actually wasn't allowing the
replication, so I had to manually do things over on the Github side to
get the two in sync.

Like I said, I won't do it again.

--=20
Patrick Williams

--xj2xgnkbzc2fczw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXxGPIAAoJEKsDR8wtAMEZy3kP/jOLeUBpBYDYUtuV+VE78kCj
t0TsvIv8TJkxOcatbO3t82xv2nVXtxd6X3EHwce1p0ARSnqlp9eujJ7dEK//BC2S
b6QOxrB2STq18zPJCotuydKhcSRATZ9y0Z9I+D9BgpBkRbLNuRpz3UbtaUnxjm7e
sIpJB83/TPud6aH8TTlDS5HyrZMO4XaUOl1adqpxte5d1imO/E/P+kvCSpoSU/0Q
1zt2U22P7cUcKWsiGxFEQiegj0VNuyDWLVVwLqlYyql+pp7yrm9ZzT4Wdn/5zdBH
MFU7tu2pW1li60d6TAFPZAZc8xTUV8Z+1Cqf5mwb2WVz5snr6dMpsaDGlULB4IRZ
rVHLt0SlKsYQIZRmUth2S1Ae1L6j7Z8dshyEVX/AZBIAgpzCPY5/XsWm7zBz2XNK
hbvcJpTtccXez8Z4kYIMkSmi7H4B+5nAcsX8jvObCkocr79r9bgoNxE9+B7aVXL3
oY01wuc+ItcIRRRr+d69nL645yjnwsRNGVr7F1kPNtu05Nixsg90EqKbw19reG6b
3gtlSH8wPI+a7epPBmwtMmkb6xtmPsUrFJ3aw3l45GxdPmmruMSF22/HpwsCV+Ga
gtI3JINRLadKKRdtzuQKoxqbFl4wkkav+daKv16oP5FyHpT0TjYKLeCTKAft2OgB
Q3z4EHdK5mWrM+6vycm+
=MHMu
-----END PGP SIGNATURE-----

--xj2xgnkbzc2fczw7--
