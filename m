Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0D32D1A0026
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:03:04 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444262582051446.3740643040635;
 Wed, 7 Oct 2015 17:03:02 -0700 (PDT)
Date: Wed, 7 Oct 2015 19:03:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Github Pull Requests
Message-ID: <20151008000300.GD12084@asimov.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 00:03:05 -0000


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There was some discussion about using Github pull requests for code
reviews or the mailing list.  There was expressed  a preference to use the
mailing list because it is less spammy.

Newer versions of git have a nice tool 'git-send-email', but the version
installed on the internal machines that many of the team members are
using does not support 'git-send-email'.

For those that know how to correct send patches to the mailing list, great.
For those that do not, I decided to write a cronjob that will take our
Github pull requests and forward them to the mailing list properly.
This means that we can use Github pull requests for integrating the code
and the mailing list for review discussion.

I'm going to run the script directed at the mailing list for the first
time momentarily.  Please give feedback if there is anything I can do to
improve it or if you hate it.  I'll post the code itself on Github
sometime.

The script does detect if you update a pull request on Github and it
will resend as v2, v3, etc.
--=20
Patrick Williams

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWFbK0AAoJEKsDR8wtAMEZaNIP/16IE1lNeLPgXaNp/iG+KBbK
qzqU6anEVWRdL50LUw+3G/v18Aqdm/RO54yT7vN6Mj+eP737ma/we6tbFi2/1VK2
P8H1HnrTr0QSJaLOFRSNk4avI4cOf/l0le1vu9Mvrfd6hw95+vKOx0rzqTE5nRnQ
tlqYijZ8qckBPxSY9EkCddqfg1L2y1nM59fVCS1Ov6KOOJBkYJ2KG45I45/ah6q7
ROswOV2hZVBaEpLsOXf/NnURICdD3mULg7CyHSjsyB7Xwc/WpJ1OzYP4nnqO4pUg
Yp5NxuiVqbrjD7PSrBGVsOhcoS2gZUaIUQrUZLyfHleu9sonhH7ASjmmZFWrjYIa
2Iw8Cu0ouhwG9pOxlCxUM3rkLwQeA0IHidUsC5Ermg4Qbk2tAfNS94hBngoUs7LM
jxkZOHH8IEgjVj/laGX5q7uIMZEfw2irOG5cSOS9IPkPDfRScqpefmE8jwNWf2Mt
N/bDztGAeLH3dhW/KpFxMZcKeyuZ/dbC2mkx0NMe5DApGAs/gkF3PLWmrwjCUAGb
2N7DOa7iSP4Gm67oKqFgXrzYNZOnPUd+809em7clcOGrNe1dJYar7XE7bNa4KBVL
Rfq0/DhlHPyi4Uq59h/VhWoRXSajmcZWY2v8CPhvMmITEiNLr8CaDAIWsDmvf89v
KCRKk10GV69rldTTZqrB
=lezC
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
