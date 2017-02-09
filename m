Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 459 seconds by postgrey-1.36 at bilbo;
 Fri, 10 Feb 2017 08:24:48 AEDT
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKB1D3Rg7zDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 08:24:48 +1100 (AEDT)
Received: from localhost (170.225.9.144 [170.225.9.144]) by mx.zohomail.com
 with SMTPS id 1486675471956172.7024048159676;
 Thu, 9 Feb 2017 13:24:31 -0800 (PST)
Date: Thu, 9 Feb 2017 15:24:30 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
Message-ID: <20170209212430.nksmzxt3kjktahac@asimov>
References: <20170131183927.30887-1-raltherr@google.com>
 <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
 <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
 <490CE008-B094-4008-83A7-7CD13F3F6C26@fuzziesquirrel.com>
 <CAPH-5w7D9XeTpFHJefE-7abYnBY6r32UsRSjZnN4aCEzm1JF0Q@mail.gmail.com>
 <CACPK8XfM3JiKPAHaab0yStVD04BFvsfqtyZjRQXD2p+TPip0yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cfyg3w47saygelij"
Content-Disposition: inline
In-Reply-To: <CACPK8XfM3JiKPAHaab0yStVD04BFvsfqtyZjRQXD2p+TPip0yg@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Thu, 09 Feb 2017 21:24:49 -0000


--cfyg3w47saygelij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2017 at 10:43:11AM +1030, Joel Stanley wrote:
> I was waiting for some more acks but it's been a week now so time is up.
>=20
> I will merge this change today.
>=20
> Cheers,
>=20
> Joel

I've been out on vacation for a week so just seeing this.  We have to
make this change anyhow, but we should probably discuss what the upgrade
options are before we bump the kernel pointer in openbmc/openbmc.

--=20
Patrick Williams

--cfyg3w47saygelij
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnN4OAAoJEKsDR8wtAMEZe4oP/2x4A4Bfl8P4sjvgv1PxJ2dy
sZjD3uipaETi1Rt707fYiAuaxclRfkU3v9eor4OCJNnzk8n2sPyW2FeZ08jRELXg
SK8MsHXl+l07rHfAtEGM9mFr2jzvgGutJSQMidwpMxtKohUGmjaU9u3q+AmMcXPg
pR+ZvOF9KfG2Pa4qZs14Mkb5Fo8PHkRBPHG8Zahvw0nfoHhV41Wgqxh09siSkuHg
f6W72TOo0ifoYEGvKyvaWkI3b6pbc7XoIw0wDJdc84KQv9NSoGOemiYttuCOSE08
YtvS2OHt5hfyTFC9A2hca5SCakxeWDVrM9dXeVgI2DcNuAyJ/5pAtQdwin3ltmkV
V27SFEp3LoL6nLKmmDfL8YfLJtbTAHZpZKITMf1x/D3ns+OPeT+1wT1x20QpAFWQ
v6/D57sy4ZfCN2fgNAdHX4Y38er4Mx/IWDYOG+GJjARGrAmcdtr5tunpSX7gR4xR
MSzYrGnawTXN2v1k4M3yn9jMwFulNCf/Tlv06qQlr0RZvUk/KYJKLP+FlCyGHcdm
ICeLDD3rTH8IAnwtL/yzV0BeLOVGAybWoN4YEx1IotAB3ohyPbMR2kZG8v2BN4ed
d9B2xgVj8OiT5A0qfKQHH4Jv2x8bAOIhy+xvuYBixWBPI7+xlTlwPcvZ+WWpm5kt
AQVm6xB2nTjZkUwft5uY
=mta/
-----END PGP SIGNATURE-----

--cfyg3w47saygelij--
