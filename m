Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfvWt3qkTzDqwv
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:33:29 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467232405296221.45572518139818;
 Wed, 29 Jun 2016 13:33:25 -0700 (PDT)
Date: Wed, 29 Jun 2016 15:33:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton 2/2] bmc_update: allow whitelist to be files in
 a directory
Message-ID: <20160629203323.GT20922@asimov.austin.ibm.com>
References: <20160623004100.2967-1-openbmc-patches@stwcx.xyz>
 <20160623004100.2967-3-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jPC/Tkukgh9ZDT79"
Content-Disposition: inline
In-Reply-To: <20160623004100.2967-3-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 20:33:31 -0000


--jPC/Tkukgh9ZDT79
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 07:41:00PM -0500, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> The whitelist is moveing from a file to a set of files in a directory.

s/moveing/moving/

> Use try when deleting whitelist entries.
>=20
> It would be better to call update without saving the files in the
> first place but this will suffice for now.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  pyflashbmc/bmc_update.py | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/pyflashbmc/bmc_update.py b/pyflashbmc/bmc_update.py
> index cd2f3c1..50042c1 100644
> --- a/pyflashbmc/bmc_update.py
> +++ b/pyflashbmc/bmc_update.py
> @@ -111,7 +111,27 @@ class BmcFlashControl(DbusProperties,DbusObjectManag=
er):
> =20
>  			if (self.Get(DBUS_NAME,"clear_persistent_files") =3D=3D True):
>  				print "Removing persistent files"
> -				os.unlink(UPDATE_PATH+"/whitelist")
> +				try:
> +					os.unlink(UPDATE_PATH+"/whitelist")
> +				except OSError as e:
> +					if (e.errno =3D=3D errno.EISDIR):
> +						pass
> +					elif (e.errno =3D=3D errno.ENOENT):
> +						pass
> +					else:
> +						raise
> +
> +				try:
> +					wldir =3D UPDATE_PATH + "/whitelist.d"
> +
> +					for file in os.listdir(wldir):
> +						os.unlink(os.path.join(wldir,file))
> +				except OSError as e:
> +					if (e.errno =3D=3D errno.EISDIR):
> +						pass
> +					else:
> +						raise
> +

Is there a reason we aren't doing the python-equivalent of an 'rm -rf
=2E../whitelist.d'?  It seems like simply unlinking the files leaves us
open to accidentally leaving files in place and using up flash space
never to be reclaimed.

>  			if (self.Get(DBUS_NAME,"preserve_network_settings") =3D=3D True):
>  				print "Preserving network settings"
>  				shutil.copy2("/run/fw_env",UPDATE_PATH+"/image-u-boot-env")
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

--jPC/Tkukgh9ZDT79
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdDCTAAoJEKsDR8wtAMEZIugP/26Iaet48ZkUmJxgTZJ7w11d
IKI54WTHtKKETuX7ZaQMu+Zfw1TiRRPpiCSkkkpM9be+tsc6TOtLnjqoiXHFTeGf
1llMeFESLl5t2KTXivPbWjawXvwnlTpKnBY6kQmNRQpx9FEfJLZMdViwP0Ju+xof
BNwOafiE9Ulmh2CyMH8R0zzNqbYKhkVoF0+OddZF7g2SkBDN+OCXjHUaLle/mNzv
24Jq/JYSsebtWQUyA3m0O4r8AybZ7ZPc6iKrcdKcqh3FuSkA2mvEACsbGxUmkR5Q
4NyvEhMx69Eln/NXE+QGVFL5boHegLFyk5gt/KTpH3fFpD65eF7LM3wUdx5rwUL/
F+6jJDSl2ODcwGvTb7dgzrouEMoyoQIapVf+QLHKFNavMKHzIkIJaSqUpLE5kDFP
Ku3d4oHhGr6OiKx7e2sYIHMzPXcT0JMNzhyNzkZ+HAQlFvD53MDKDg1LxFAkSIiD
ItGzvjTi6DfmRDNBxtWe1R4fPK7zWhZrEoLh0JAKbDfuNaHzPmFXyIOcdLxm/g5f
qMiWWiddQhcC6VYa3sb7xd4wYewI/wY4IOL0X4ordMtoWA9/KDvts+0XkClBccoV
rpxRBWeuO4J8mdP8jzbDrCrToAr9CYo5o+oQQpyQ9M/TA4AI+c306W81lsR+lIU5
WyyyUir8oBL+AUkjwqo3
=Z5lQ
-----END PGP SIGNATURE-----

--jPC/Tkukgh9ZDT79--
