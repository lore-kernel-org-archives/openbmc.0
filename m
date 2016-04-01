Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qc6F412z6zDq5y
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2016 03:25:43 +1100 (AEDT)
Received: from localhost (32.97.110.54 [32.97.110.54]) by mx.zohomail.com
 with SMTPS id 1459527933033465.00249498489313;
 Fri, 1 Apr 2016 09:25:33 -0700 (PDT)
Date: Fri, 1 Apr 2016 11:25:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH phosphor-settingsd] Add Restricted mode as a host setting
Message-ID: <20160401162531.GI11491@asimov.austin.ibm.com>
References: <1459195274-17203-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459195274-17203-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline
In-Reply-To: <1459195274-17203-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 01 Apr 2016 16:25:44 -0000


--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2016 at 03:01:14PM -0500, OpenBMC Patches wrote:
> From: tomjose <tomjoseph@in.ibm.com>
>=20
> ---
> diff --git a/settings_file.py b/settings_file.py
> index 3efad0b..698d941 100644
> --- a/settings_file.py
> +++ b/settings_file.py
> @@ -1,2 +1,2 @@
>  #!/usr/bin/python -u
> -SETTINGS=3D{'host': {'bootflags': {'default': 'default', 'type': 's', 'n=
ame': 'boot_flags'}, 'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type=
': 's', 'name': 'power_policy'}, 'powercap': {'name': 'power_cap', 'min': 0=
, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'d=
efault': '', 'type': 's', 'name': 'system_state'}}}
> \ No newline at end of file
> +SETTINGS=3D{'host': {'bootflags': {'default': 'default', 'type': 's', 'n=
ame': 'boot_flags'}, 'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type=
': 's', 'name': 'power_policy'}, 'restrictedmode': {'default': False, 'type=
': 'b', 'name': 'restricted_mode'}, 'powercap': {'name': 'power_cap', 'min'=
: 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': =
{'default': '', 'type': 's', 'name': 'system_state'}}}
> \ No newline at end of file

Would be nice for us to do a refactor of this to either:
    1) Generate from the YAML.
    2) Be defined on multiple lines so you can added a new entry without
       changing the whole variable.

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

> --=20
> 2.7.1
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW/qD7AAoJEKsDR8wtAMEZ4voP/06W+Y1lgBag2HYxzFCGj46U
m6aNczVRZ9ycRCm7lSTE14QWy7TdW7sFXIHNeqGC1EW3HfhOlOI5y5TEfrOZJWel
9MMQtPCvf1YmZZAXOT3/sZLRXfWwXvBPA3sQK80K1PxXvhDPOjXP2MZJA6lcN7KP
4f0fOsQIN5L+zOeXzhdpZyDcS831vyoRzWCj0s0Edgoi07l1wdeR403BRP87bBCo
SlotdzDHycBrNxiULH/7bx/0KoWyuVR+OfB0rPN2e4gyvSy4mU62ZEWd8wmhkDHv
9byd/ZS8IVtncS8VOx0Xc1wZqxtrVgqt+S+SpHhgu5tX83C5kCojYzE+1ett1cPR
pEXaKqYiCrzz9LZn/eTIX4ovyF+I0Ap3StuyXigXWS13cGe776wdKQ2ojE83H41S
yqwsKYJSLLUMAOqz6i7theYBTB8zdrYu7G+PKafT7NzMxHXuBL6ohmmJBlVxEi19
wsCK567npJav/ltFU1csFe43FQaESzjyQ+lUsWy6oqXEM5xwF0xy8pP9SrZRsKE9
xKpELSULLqxdqKL2PEYYeT/FnZN+gYyUNgPA/WUvzB/rPKmv3DAECdWsQ6+8CW4R
vw0nA2ILq2a+6OcTmg8jOjU6g2sdmHy9QF/S4peUjN7GceTib/WlxI1jW2w2xGMB
Pjm8Yq5TCe4S9TK5hrJg
=a86R
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
