Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 91969 seconds by postgrey-1.35 at bilbo;
 Thu, 29 Oct 2015 13:02:22 AEDT
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ED8D91A03EF
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:02:22 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446084137141284.9716904126766;
 Wed, 28 Oct 2015 19:02:17 -0700 (PDT)
Date: Wed, 28 Oct 2015 21:02:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 0/2] rest/mapper recipes
Message-ID: <20151029020215.GB31364@asimov.austin.ibm.com>
References: <1445983600-2660-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <1445983600-2660-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_1
X-ZohoMail-Owner: <20151029020215.GB31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
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
X-List-Received-Date: Thu, 29 Oct 2015 02:02:23 -0000


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I noticed you used AUTOREV on these.  Was that just temporary until the
commits were merged?  I thought we were not going to use AUTOREV in
general.

On Tue, Oct 27, 2015 at 05:06:38PM -0500, OpenBMC Patches wrote:
> These aren't being included in the image at the moment.  They can be merg=
ed without causing any problems.
>=20
> Once my mapper/rest source code pulls have been merged I will follow up w=
ith another pull here to add it to the image and set the SRCREV in these re=
cipes.
>=20
> https://github.com/openbmc/openbmc/pull/40
>=20
> Brad Bishop (2):
>   Add object manager recipe
>   Add REST server recipe
>=20
>  .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 ++++++++++++++++=
++++++
>  .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
>  .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
>  .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 ++++++++++++++++=
+++++
>  .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mappe=
r.bb
>  create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mappe=
r/obmc-mapper.service
>  create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-mappe=
r/org.openbmc.ObjectMapper.conf
>  create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.=
bb
>  create mode 100644 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/=
obmc-rest.service
>=20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWMX4nAAoJEKsDR8wtAMEZhvYP/RPs2uKGhqTD43naNNxl9trz
RqK6t2Vaa1lUo6IOsfyQT+LJirWUHGj+5qBIZaniGe+IlwWJXMYzzjeeuAaEgSnV
Q6dkuRLfTUJRR7iWBQCZmcVBLPV1VgcRLMaBjfpW211azMyM6mzaqlPAhaRQh3jL
oCkjvX8gygbG1NtqyY4WCzPEXwpBwr3VXdocOlhXCZYeQEWutzZCDORrII9hgYCb
9N9Q9miK3qSN17H6PBAJM4AV/+PX/J7gd9e5U8v3FKrC9FRkGVV304IcnppAF4Gi
rYsb7/R4xxegr77hfzJlytkRdbKje4LxggKZtUV1edrSIUzOHCK330exmDCGVTsd
8HxcXYzUZ38isf6Jhsll0m8anlDFa18R/Lt7DapWliBsCOBKF1prJf+flaCyXvsv
GuGM13+Q5DgEf0BwTH9kZiXbdrfpylUrFTi8/NdI4ju2voopeNTyywxc/5nuJNdY
SA0wKoX1uQQ/qOV62dPgLA6tlsHF9bnVAg6Uxh9pg/hSN/DJsGmRWqjIHcoXgNl5
2Pff99RUHkue0NyjY15nd8reaXsDkUmqT9yvZUA2Rrh6TWhBd5j6T2/ZpCrmLsVj
4areTDG0jMD5f6tvBZ5JRr2vH/FsyJ5nQNgJVI5n6/6EG81he7PJ3hL3KU1nRJqo
M2j7lpuflfhAqb8mrT9h
=/x3b
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
