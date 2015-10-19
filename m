Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 869C11A03A9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 10:02:02 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445295718850458.3139452131205;
 Mon, 19 Oct 2015 16:01:58 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:01:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 7/9] Add recipe for host IPMI DBUS to BT
Message-ID: <20151019230157.GJ13316@asimov.austin.ibm.com>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
 <1445259405-10312-8-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Content-Disposition: inline
In-Reply-To: <1445259405-10312-8-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_6
X-ZohoMail-Owner: <20151019230157.GJ13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Mon, 19 Oct 2015 23:02:03 -0000


--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 07:56:43AM -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> ---
>  .../common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb  | 17 +++++++++++=
++++++
>  .../host-ipmid/host-ipmi-bt/host-ipmi-bt.service        |  8 ++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host=
-ipmi-bt.bb
>  create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host=
-ipmi-bt/host-ipmi-bt.service
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-b=
t.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
> new file mode 100644
> index 0000000..830f754
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Phosphor OpenBMC BT to DBUS"
> +DESCRIPTION =3D "Phosphor OpenBMC BT to DBUS."
> +PR =3D "r1"
> +
> +RDEPENDS_${PN} +=3D "python-subprocess"
> +
> +SYSTEMD_SERVICE_${PN} =3D "host-ipmi-bt.service"
> +
> +inherit obmc-phosphor-pydbus-service
> +inherit obmc-phosphor-host-ipmi-hw
> +
> +S =3D "${WORKDIR}/git"
> +SRC_URI +=3D "git://github.com/openbmc/skeleton.git;subpath=3Dbin;destsu=
ffix=3Dgit"
> +SRCREV=3D"${AUTOREV}"
> +
> +SCRIPT_NAME =3D "ipmid.py"
> +INSTALL_NAME =3D "host-ipmi-bt"
> diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-b=
t/host-ipmi-bt.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/h=
ost-ipmi-bt/host-ipmi-bt.service
> new file mode 100644
> index 0000000..dfc0416
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-=
ipmi-bt.service
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=3DPhosphor OpenBMC BT to DBUS=20
> +
> +[Service]
> +ExecStart=3D/usr/sbin/host-ipmi-bt
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Do we need to start specifying the dbus object provide / require
statements in the systemd service files?  The two IPMI processes are
tied together by the objects being provided and I don't think there is
anything here to show that dependency relationship.

--=20
Patrick Williams

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJXZlAAoJEKsDR8wtAMEZAmgP/1ilJNXzspMxF4TqaKHbOFvl
HteyRsBErWNla5TpAafs8W9qyqRDdcBNMQnf04myLRytPlaWsAEqKHVDm3kaus2Y
ITtCF+X9AaYs6C9YELuNcUR8lbM+eDzZH/hRAyjUMxvmPn+ITxymxllluhrD/G6d
0paZXRldP5hMR3zkGeAP5yLhCwdBM3gq0I0szBgZG6dX1HQEefKe4DtPvPytUQni
ax2XKjfFrpqhzi7lOYrU17jQoo/Y5WOieJpvP7mLgQI4Nos0f0BW1DB+kjSnXDEM
rZIEdCzxJ+TKXmGItRbv9Yt2Oc3yH30Nc5Yio3/RWexI0pvPFLe3dsfqbYtgnQtO
riJkAMMNo/E6UcY7NyjFWc8mw34TQlhLAYJI0M1uK50mzsQnJDhSTqgDAF3+MFjx
lOcshq7yMyOOmukf9Ree+xFR4xvvn/MQEP2OvqrZ5ozR025HcSP2oXSMzasDqh9N
qctQ4Joy4xkVPg+qz1F/tTpmWWPA6pyhIG64k4vfpV8EvKNNf0Kd07nEDk00ELdG
vTu8ceaRVkmkGOMjrnU9lImvUDoW0v1iemkyTx7WesDGbHHmP7VEG1hUOaRcBoiL
YJuUwCTAoYkmaiH34Jd1sZTpXy+EQEVBzrs2s0PeXK2JTv4F2/yfAOAmma1ZWavB
1RPndwW6dL4GhlMp/Vr/
=lxzC
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
