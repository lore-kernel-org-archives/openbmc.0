Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdZGZ2FQnzDqm9
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 02:32:21 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1467045132639373.438832821403;
 Mon, 27 Jun 2016 09:32:12 -0700 (PDT)
Date: Mon, 27 Jun 2016 11:32:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] Fix two issues in Issue #80
Message-ID: <20160627163209.GL20922@asimov.austin.ibm.com>
References: <20160627134042.28142-1-openbmc-patches@stwcx.xyz>
 <20160627134042.28142-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8cpS+6Cx+xtICsjy"
Content-Disposition: inline
In-Reply-To: <20160627134042.28142-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 16:32:23 -0000


--8cpS+6Cx+xtICsjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 08:40:42AM -0500, OpenBMC Patches wrote:
> From: tomjose <tomjoseph@in.ibm.com>
>=20
> Corrected the comment for the Get Channel Info command to
> reflect the logic in the code. For issue two, corrected the
> condition for returning the unspecifed error.
>=20
> Resolves: #80
> See also: #77,#78

These should be of the form 'openbmc/host-ipmid#80'.

https://help.github.com/articles/closing-issues-via-commit-messages/

Also would prefer not to have "Tag: Info" because sometimes git and/or
tools ascribe meaning to them.  This is the "Footer" of the message and
is the same place that 'Reviewed-By' tags and Gerrit 'Change-Id' tags
go.  Best to not use something in that format to avoid confusing a tool.

> ---
>  apphandler.C | 4 +++-
>  ipmid.C      | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/apphandler.C b/apphandler.C
> index 71dba66..9ce8829 100644
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -443,7 +443,9 @@ ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t netfn, =
ipmi_cmd_t cmd,
> =20
>      printf("IPMI APP GET CHANNEL INFO\n");
> =20
> -    // I"m only supporting channel 1.  0xE is the 'default channel'
> +    // The supported channels numbers are 1 and 8.
> +    // Channel Number E is used as way to identify the current channel
> +    // that the command is being is received from.
>      if (*p =3D=3D 0xe || *p =3D=3D 1 || *p =3D=3D 8) {
> =20
>          *data_len =3D sizeof(resp);
> diff --git a/ipmid.C b/ipmid.C
> index 7354958..374ede2 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -273,7 +273,7 @@ static int handle_ipmi_command(sd_bus_message *m, voi=
d *user_data, sd_bus_error
>      {
>          fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n=
",r, netfn, cmd);
> =20
> -        if(r =3D=3D -1) {
> +        if(r < 0) {
>             response[0] =3D IPMI_CC_UNSPECIFIED_ERROR;
>          }
>      }

Code changes look good.

--=20
Patrick Williams

--8cpS+6Cx+xtICsjy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXcVUJAAoJEKsDR8wtAMEZdA8QAKEoxk9eOXEcryglPego06m5
aDDsW+/x4fttQgmMUwU0NSSKHkobj/XoWaAqrdFfvz5qfrj9+STaX8lQ8JLhwnUw
xzwkMDucMJ5ZhyyVw2AwEI6EJRHhUZgxfnmshDfpPfc6zJjenrprVHMct7rel3wg
wd9jKHZ4xRMYVnNsFZqBWInK7BZZix+SUW4ZcFcDAKUpCVivF7UTsMVceCchYMeM
lV1NBT1j2ZgrhVaI5Bhj6V6ZqvuT/CIAYFmkBFH/Rpw1YVoRaiRT5lQT83bTf8sz
Irdvl+/r8eObflcVkJGJd1Kjwk0Kp8LWHG6e5VnNj6HlxupVUlIylFFba0lHl8ok
PmQhk2S0rBuJHI7S4UAZIERonKodb2psuvCs3VVqMILHgDHQaR/UxshWpARGW4+O
rU5Aqe4D+hUGY/JbMdoN6RsHs+9SJzHS7KQgxanl3SdYUFRwGdtfJk+p6Wt+04T+
mfXbcnTpvYA8MuNGzzl8eJf+RWXDO0IhG4QrwhTv6tjZqMpPNXMLuB8Xhh0suNnH
E6cmAR9/IXiUIIC1Kh8CUSZUDIsLSgdQ/b52uSPybjOgFEqFGGl3eSK5f3v6h32L
Jf+Fimj8cksdTbyoeYzkpt5A6IK5lh+22Tyo1p5ENyIpE6pY9+XCQ40oDizRMZy4
WseTzZ5KOi+eoQ7ruI4s
=iLju
-----END PGP SIGNATURE-----

--8cpS+6Cx+xtICsjy--
