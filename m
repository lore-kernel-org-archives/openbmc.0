Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYDwv5lP0zDqCX
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 01:17:03 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466435815067616.9139082389485;
 Mon, 20 Jun 2016 08:16:55 -0700 (PDT)
Date: Mon, 20 Jun 2016 10:16:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.0 tagged!
Message-ID: <20160620151652.GE19968@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="684cmtc/Pyvt2LSS"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 20 Jun 2016 15:17:04 -0000


--684cmtc/Pyvt2LSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have just tagged v1.0 and uploaded it to Github.  This is meant as the
release to support Barreleye in production capacity.  Thank you to
everyone that contributed over the last year to get us to this point and
congrats on this major milestone!

I have also create a branch named v1.0-stable.  If there are any bug
fixes or minor feature enhancements for Barreleye, they should go there.
You will need to create a pull request against that branch instead of
master.

Looking forward, the majority of the IBM development team is shifting focus
towards a set of Power9-based systems.  You may have already seen
commits related to the Witherspoon system.  With this in mind, 'master'
will become the development branch toward the systems in that
time-frame.  There is also a milestone in Github, 'openBMC v2.0 Backlog'
that enumerates the work-items we plan to do.

Our intention is to continue to support Barreleye (and the other
experimental Power8 machines) in the 2.0 development tree, but since it
is a development tree, expect some instability (and likely API changes)
there.

Even though the IBM development team is focused on Power systems, we
look forward to working with anyone who is interested in extended our
code-base to support non-Power platforms.  This may cause us to shift
release names, time lines, and feature support before we complete our
"2.0" features.

--=20
Patrick Williams

--684cmtc/Pyvt2LSS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaAjkAAoJEKsDR8wtAMEZw94P/3C2iMVg9TZKHyVRTrdKhdyR
OiBtC1v06KScQDxXJdNvQiRe5e5q0ar5URVTiQoFK9uLar6hp8DBqK0FMGGML5TL
LmvIEOQZuwmlc7wFaf/MHlwX86jkG6usy4zJfQF79mQIw7cMon9psscZ3F+vaYQV
mAJxuUbYJb2Z6ynF4u6dfaOJAEpDXwbT0axmTJK5Xo2AOQPJ/98CC8P2d8M2/p+M
kt/ejQdkfacULHnDzda4zAzQt+K7XGT3PB1Cv/QPIaU0HmKIMZXZgUJ8tj49Q6Ox
ZXYGqaGCep0lrUrJr1tP1cKvE5jqZZiItFKaPwhBEnhpjdbwplSRsD5IAdSHRPyB
lZXAamzyk3Twn/ZpXFv3j+fSX+kMx9N5WkXlakcA8+7xa1ybmM3FHOcY8eiclomG
OR9x+kLH0zZdd3Leultk/7gVmQzd7fKGa39ATY1NGCvf+FQmmev+H7y7+oeX+nlK
fUwQ3S6lDQC5Q1Jgwlj+ZYDFhn8t3cmPxtGsB6BABEfYZPdSGc65UrCxaY5Ws8D7
9lMnVQ5Jzg2xgeXOTpDt3q3tF18eqezoMMogbLwR+pnmWjscwKs3OGBiCftPNmTk
/w8n9+qp3siEo/Z1GLI0RCmJhUnQICKGOcqjm8ZEwl4HThFViUWdFKG8x0MrCyoh
7itndi8Nyy/qQkNgReYV
=alHL
-----END PGP SIGNATURE-----

--684cmtc/Pyvt2LSS--
