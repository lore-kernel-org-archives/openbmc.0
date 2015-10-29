Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3DB001A0C00
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 06:43:35 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446147811200686.936560893291;
 Thu, 29 Oct 2015 12:43:31 -0700 (PDT)
Date: Thu, 29 Oct 2015 14:43:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc v3 0/3] rest/mapper recipes
Message-ID: <20151029194329.GF31364@asimov.austin.ibm.com>
References: <1446140725-11766-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline
In-Reply-To: <1446140725-11766-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151029194329.GF31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Thu, 29 Oct 2015 19:43:35 -0000


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patch-set looks fine.  Will merge after SRCREV updates.

On Thu, Oct 29, 2015 at 12:45:22PM -0500, OpenBMC Patches wrote:
> These aren't being included in the image at the moment.  They can be merg=
ed without causing any problems.
>=20
> Once my mapper/rest source code pulls have been merged I will follow up w=
ith another pull here to add it to the image and set the SRCREV in these re=
cipes.
>=20
> https://github.com/openbmc/openbmc/pull/40
>=20
> Brad Bishop (3):
>   Add object manager recipe
>   Add REST server recipe
>   Add rest server and mapper to image
>=20
>  .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 ++++++++++++++++=
++++++
>  .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
>  .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
>  .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 ++++++++++++++++=
+++++
>  .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
>  .../packagegroup-obmc-phosphor-apps.bb             |  1 +
>  6 files changed, 78 insertions(+)
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

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWMnbhAAoJEKsDR8wtAMEZc/gP/i3Icyh0hickUfwJVJ5BllyA
+fs4mDzaQzwxFLoFyDprBIiG5gPJIx6ZbVCLH8jRh9Y63lfWwBFD3Pk8JD0bKeb8
SHo4KlbjqIrEP42Z+/9V49nEo8TbAs55d+5x2YYqxUByew1qCzG7/Hfp6WlMmPh7
nQdQIq+m6rPihnq4PCw/riJp9FC+Nq2cGnMQrE4naGFxaH1zItvDdda+TdUy6DFC
b6pGKWSFgs12IcWmCeq+c/WtOQxPk6Pw8EeEvRaw2grxkY25YoZg8R79Dc94bWfw
VfHBjW0D25IGoHgNSkmqKMQk/QPXzEWtrKISjWqgMMmBpQhXBzVZ+ljweUQ0f5ex
5wyMIzzr8VRcWfM0vpZuXGRKZTr7Sm0wGGE+zgBRSYRCao1yH9BL5/EgT0SPqF7y
Hvf27FjR45+B1GczQ1UdSa7K2yWTnKpM4cW4UbbCZ0q8vjb0Nw9Gm0d23tF+wxmj
6c7v3Yy3a+QIDBmtQtFQOmSm4dKGzs24AYE3AJt3VBYA+Hhgf237prp1f1zoBrgI
RsAlUXRLaaCbAuVVZyMUn3G24RNDeaGIdft8iHhkiTtRHfNs3kpQq/mkNmdQddJQ
zOZYDs3curJSVDsV0gGLumI3g9IcVO7i6838hXYji26U14gKdcKPNsnR9hAs1XpL
xcVNKCbv7tEzS35ZDlMZ
=DQQ0
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
