Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rkXr60SG0zDqsr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2016 04:45:09 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467744307453129.9037022007808;
 Tue, 5 Jul 2016 11:45:07 -0700 (PDT)
Date: Tue, 5 Jul 2016 13:45:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] skeleton: chassis_control - Add an ESEL when
 emergency shutdown host
Message-ID: <20160705184505.GA20922@asimov.austin.ibm.com>
References: <20160702144052.9068-1-openbmc-patches@stwcx.xyz>
 <20160702144052.9068-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZGDvG9BNY5+B3nxW"
Content-Disposition: inline
In-Reply-To: <20160702144052.9068-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 05 Jul 2016 18:45:10 -0000


--ZGDvG9BNY5+B3nxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 02, 2016 at 09:40:52AM -0500, OpenBMC Patches wrote:
> From: Yi Li <adamliyi@msn.com>
>=20
> This patch fixes issue: https://github.com/openbmc/skeleton/issues/64

Instead of this line, after the description (the next paragraph) add a
new paragraph:

    Fixes openbmc/skeleton#64.

Shouldn't have github URLs in the commit message because they are not
considered permalinks.

> According to BMC Firmware Specification, on occasion the BMC will be requ=
ired
> to shut down the host due to high ambient or fan fails. A SEL must be
> present in this case.
>=20
> Signed-off-by: Yi Li <adamliyi@msn.com>
>=20

Extra whitespace line in commit message needs to be removed.
'Signed-off-by' and 'Change-Id' should be right next to each other at
the end.

> Change-Id: I65ea7e3284eab3e10e14604306f6d8e23f77d57e
> ---
>  pychassisctl/chassis_control.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/pychassisctl/chassis_control.py b/pychassisctl/chassis_contr=
ol.py
> index 56a2116..94fac78 100755
> --- a/pychassisctl/chassis_control.py
> +++ b/pychassisctl/chassis_control.py
> @@ -232,6 +232,18 @@ class ChassisControlObject(DbusProperties, DbusObjec=
tManager):
> =20
>      def emergency_shutdown_signal_handler(self):
>          print "Emergency Shutdown!"
> +        # log an esel
> +        try:
> +            obj =3D bus.get_object("org.openbmc.records.events",
> +                                 "/org/openbmc/records/events", introspe=
ct=3DFalse)
> +            intf =3D dbus.Interface(obj, "org.openbmc.recordlog")
> +            desc =3D message
> +            sev =3D "critical error"
> +            details =3D "Get emergency shutdown signal. Shutdown the hos=
t."
> +            debug =3D dbus.ByteArray("")
> +            intf.acceptBMCMessage(desc, sev, details, debug)
> +        except:
> +            print "Emergency shutdown: log esel error."
>          self.powerOff()
> =20
> =20
> --=20
> 2.9.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--ZGDvG9BNY5+B3nxW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfAAxAAoJEKsDR8wtAMEZBMQP/0709OThX8RMrTGJUPP/v7Zg
jeZt6OZ1Ikj8HfsX4azYOmeHJm0V2aWXnlb+GogyU267USOcKj4fTrq2u8CQySnQ
Neb7WnpfksJ3HhTq++80BVUOiqBtHt35thjUILN4CmB9fffr7X9+wfP+zgVPsupl
P5qZQlcPoBQqWfJa+jJIB7UoMEBvn+z3bU+0splu/zM4NRPvFgdz2SXSXulwrqSa
igtIpR2yFSHzbyQVnaOEfKFqdrpckDwyoEwLK7/l5TIbs34gHfPLvvz+HslYymKP
AxUeoKgvoHcOjBpukeB7ZPc7ENeVfeSnZwIk3QODWyFXcVyG87N51uKk3TjyT+OS
AiyPGOo8/BiZP3RHS0AB25jFnDLESgiuBsll47d6iQrTWj3eTpxOu4tLokxS0id2
460+8SqYMcU50lHi3hc4cqAYIphjIUS9GM5NLedFnjH/XyEp9FMD1khta4cA92En
oNbEJ4mH+3hSGQmMTno595QP8EAz3p0Lb6NW86ehmaiwdcDz2f+pQtDUwZ5zEe7S
BwsbzTlqYwRGpTemJjq7WPC8btDPACLodp43kAPbjvjSVRmsV3a4/Fu6m0gL2MpP
+m6KIGbvHgK5mdoue2VMXgA8vUDP7teibugAe37QLyfMTT4Bm6OYMl5UC8X1UScb
iFt0SDh/7xHhLsSMrqal
=jL6t
-----END PGP SIGNATURE-----

--ZGDvG9BNY5+B3nxW--
