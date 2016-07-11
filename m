Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpJqT3ByVzDr11
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 07:57:41 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 146827425377295.24207348681898;
 Mon, 11 Jul 2016 14:57:33 -0700 (PDT)
Date: Mon, 11 Jul 2016 16:57:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc 3/3] meta-openpower: Update pflash version
Message-ID: <20160711215731.GB12483@asimov.austin.ibm.com>
References: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
 <20160630162033.2330-4-openbmc-patches@stwcx.xyz>
 <20160630212709.GV20922@asimov.austin.ibm.com>
 <CACPK8XdYZrNXFrxp2beXwWKrORCApWtSh+1LRG+qOrd_DHvz-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <CACPK8XdYZrNXFrxp2beXwWKrORCApWtSh+1LRG+qOrd_DHvz-g@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Jul 2016 21:57:42 -0000


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stewart,

Bump.  Didn't see a reply from you on this.

On Fri, Jul 01, 2016 at 10:23:24AM +0930, Joel Stanley wrote:
> On Fri, Jul 1, 2016 at 6:57 AM, Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> > On Thu, Jun 30, 2016 at 11:20:33AM -0500, OpenBMC Patches wrote:
> >> From: Joel Stanley <joel@jms.id.au>
> >>
> >> Move to HEAD so we can drop the patches we carry.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >
> > Stewart released 5.2.3 with these fixes.  Can you put us onto that
> > instead?  Prefer to stay on a released version rather than a commit.
>=20
> It was my intention to bump us to 5.2.3. However, I went and looked at
> the recipe and we were carrying 7 patches against skiboot. Only the
> 7th is on the stable branch.
>=20
> Stewart,
>=20
> I assume you don't want to tag master at all?
>=20
> If not, can you please pull this list of commits into the stable branch:
>=20
>  e42206bf0729782330778e77283af2aca23499dc
>  7c7911eb7bea505474c3062bf5b0c60d99b502a5
>  e5fc583e610d4360f8fe50f225c868cb3019c1a7
>  e415b3b9bf0441745f442e12bfce25ed49c589bf
>  45e548176e16ad8ba9540fcd75131ba4993e42b7
>  24ae270984a37525f8393eeccbd0ac55da4503e1
>=20
> They are all related to building pflash.
>=20
> Cheers,
>=20
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhBZLAAoJEKsDR8wtAMEZiHgP/1o6YlvoCPnhFRj/5YrJJhuD
WM5a5pAqdn5YUnBFRVrvkonQL2KUVBJGwTS6+vUAcpYhtx+cwpNp3En/kLjx+sJM
ttUQK2fUGJFTx7NQGK24g3BgLeEUbLVd10nMPShNhk3KBTqm0TFrEGVBjpIKs/yb
93qSP6Ap4JkDALHmivUHevQeP9CEC+ZL6FBO4cnC/okaJGrqBB0SwMJR+gCWIFCp
ZrI4pmHmK4UVaLjXruYgKXyJ+iSKf3VUmOK2u5c5UFN8lfFhMuCFMPDcVQkXUPrG
JliegnFBvBC3cd1SWKDf2Cu/ExMFKRRPsA3dlX89TTJNnn6/+O+dnBH/mHeIFTjz
l2YvYN30/GUvYs2wfHxHtig94eEBYj7waYzEMB6uwCYSn7saV27T763Mc6P82iKM
tWh5fRNzgZwyHuGyy6cQ7SuyXCZGS296sqH6sk9Pe/DEv0I0RoP2V5euNzwTRaTp
l6l3x/I35zdr9p3GRfsuGUSxA/0MpP2lOrPyEQISTBk2Bv0RCE461vxxtxU+eMDi
uXy9wUqpFuVkiRbmN4EaLGiS4bSgvBG63LppFKKkT8f1S9Q/L69m5xjKtKQchYAV
XFDKBiXCRAGA63L0p4eeppe4mM2QCeKp8lpZovi80/McculFgZh3wZVxSjKlx1ka
HnHID1DcDBXZ13BRCPxV
=WqMG
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
