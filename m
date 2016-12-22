Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tkXM719PtzDwY1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 11:24:01 +1100 (AEDT)
Received: from localhost (97-125-199-65.desm.qwest.net [97.125.199.65]) by
 mx.zohomail.com with SMTPS id 1482366223005346.67761846606425;
 Wed, 21 Dec 2016 16:23:43 -0800 (PST)
Date: Wed, 21 Dec 2016 18:23:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?0JjQu9GM0Y8g0JrRg9C30L3QtdGG0L7Qsg==?= <ilya@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Why OpenBMC not ready for production?
Message-ID: <20161222002341.jxcpaapbd5muu62e@asimov>
References: <20161220203029.arqocnjnpdtan4bt@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gksouxgvo5iziiej"
Content-Disposition: inline
In-Reply-To: <20161220203029.arqocnjnpdtan4bt@yadro.com>
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
X-List-Received-Date: Thu, 22 Dec 2016 00:24:03 -0000


--gksouxgvo5iziiej
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 11:30:29PM +0300, =D0=98=D0=BB=D1=8C=D1=8F =D0=9A=
=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2 wrote:
> Hello,
> Could you please advice if there are any architectural problem in OpenBMC=
 design or current implementation issues which do not allow use it in end-c=
ustomer environment?
> What significant efforts should be applied to get it ready? It is
> rather rhetorical question, but still I would like to hear opinion of
> development team.

Ready for production can mean one of two things (or some combination of
both):

    - Has sufficient functionality to fit our needs.
    - Has sufficient stability to fit our needs.

There are two branches within our OpenBMC tree: v1.0 and master.  v1.0
was the branch that shipped / ships on the P8 Barreleye machine.  It has
relative stability but only functionality that was specifically
requested by that group.  In that sense it is "ready for production".  Mast=
er
is where we are doing our development for next-generation products (P9) and
as such it currently has less stability than the v1.0 branch.

There are architectural changes being done between v1.0 and master to
better support additional machines and features in the long-term.  In
some cases, the v1.0 code implementation was machine-specific and we are
working to make the master version more generic.  Master is not
currently in a shape where you would place it into production, from a
stability perspective, but we have a path to get there as we near the
end of this major development cycle.

As far as functionality, the master branch is not adding significant
functionality above what the original v1.0 Barreleye code had, but there
are some specific adds.  I can either point you to Github where we have
the "2.0" milestone identified or you can ask about specific features
you might be interested in and if we currently plan to have that
complete.

--=20
Patrick Williams

--gksouxgvo5iziiej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYWx0NAAoJEKsDR8wtAMEZSuMQAI9/IrCpJQHL8lqNXO0Dme8M
gvwlWnR4RwOClWwIBADVzOM4MlCu3ZJLYq4y/p3CG2SRNX0avWPZNQT/GJknHKWj
+VmGBaGDwpud1c/yvpUB+ZGAOo1Wgrzu/cRS/erH63C7RGOLjVlUXTyd08zLNQGU
qWygAvqMA9Y4xWbFJUFBLmgBl4VgMIgX7n1MYhxgTwmc1m3spHQ696rOpUsb24Zz
LryvCGJDxBwhYxfGAvBjFQHpURlP3ru/++b7qL9YlVAQx14u5fbXFmyN4nnm26m8
wnnpRbxfnGy254j/SKmPBXiuZx8EBn2KKdYPar62pdpNG3PMpa4oC/V41DJ5tcBT
iMu3+d7KD3bFVp5rz1tkTotHscx4CD+y89AUyFhK6L7Fa6J0d0kJw+2lOU87gGPU
fE/eNRiTa3naWHsWnnwGOm4T7gsCU/HTX75FmZHJy4kGSSvxPmEME6nb5FAMCoBA
YT/EiCblHh/di2ITHF0lUYHSDlf/dggrDnZvOGi7kY2g7LWhdzC9b6/ipTlxhqQZ
gHZGCpoL/nfmn7+3ODgWsHtVrl2vDLNfF6G+NLWKqnopHG12F9VW9WZsCdbYDYYw
qpGjaO+8s/RnSOq3ZdtVrHYwmTzarreP8U9uELHbziavcXUioEhpND/bs0JvKB+J
L5GRc/nqAUCScoopSRlt
=Biej
-----END PGP SIGNATURE-----

--gksouxgvo5iziiej--
