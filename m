Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZ3D6SFBzDq9d
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:07:04 +1100 (AEDT)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 1485886016029822.5107813267296;
 Tue, 31 Jan 2017 10:06:56 -0800 (PST)
Date: Tue, 31 Jan 2017 12:06:49 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "Hergert, Nolan" <nolan.hergert@intel.com>,
 Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: GPIO offsets used by userspace
Message-ID: <20170131180649.pue34l4u26vvvvma@asimov>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <20F6DE8D093BC149AEF7D895510943F51447A0ED@ORSMSX101.amr.corp.intel.com>
 <1485825155.4137.23.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2e7zjkj6tegpopc"
Content-Disposition: inline
In-Reply-To: <1485825155.4137.23.camel@aj.id.au>
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
X-List-Received-Date: Tue, 31 Jan 2017 18:07:05 -0000


--f2e7zjkj6tegpopc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 11:42:35AM +1030, Andrew Jeffery wrote:
> Patrick: Did you have any plans for reworking the userspace bits?

Yes.  Joel has previously talked about writing a proposal based on the
kernel team's desires.  I think we're getting close to queuing up the
work to refactor anything using GPIOs.

--=20
Patrick Williams

--f2e7zjkj6tegpopc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkNI5AAoJEKsDR8wtAMEZX+0P/jq+IITXnSSD7w5jh42pms9r
lRzP6RBHHccgN9LsBJcjkGdd0pESDwWAWTcJVRfEsy8637QBA+YhCaUXxWETxCMl
bouysABailp+KLh5d3hkklKKlOGVA27F4tcR3AQtvJobBcg6+/Po+/H7WgE3Dy4N
6cSTAZEID6UvFutYmaL9Yha/TOj9QAiUHggOkmuBpUYHmnFOLke8Ok3lsG1RqAsh
EeQYtcw4gatWLc6xmSuB5s2SQcbKwiPcjV7eYKHliuDtxKA0tddHEs7KAELanfsi
SDEeXZ/zCfURmo25n+cjj3mm4HHfl472KZj00Sa+LRkySCieL2HtbwLQ6hpKiYPi
GcZU2h1K8x7pKcopY93Ssp2UCYvEK1s9l4HUNPXpltb1xq511zMIBm9ttBnfDOcf
yf75OkVMvO/hmMHjqFOcqP30HiKrEQbrlX1ORBk+nY00n7IXfSy7uqi5eZh9kevJ
N/MNVaIbO5V9x5vjgfz+lthdCeIWpzDLItg9J52vMs8jdU91bkQeBhIR3K1wnLx1
GeNyCLYvsfVRrfFbLWCVK7aC64i66sdYrRJCSZfzn63hcdMUXGhmqfr8XfKCMATN
qGmil2mCYYh7LuAXmPIfGPN8/AqY4hWiWH0E5yQxwRDb66Y0o86FhYEbXPD5Usg/
uIVhsgUbomvuLtucr0aI
=hocF
-----END PGP SIGNATURE-----

--f2e7zjkj6tegpopc--
