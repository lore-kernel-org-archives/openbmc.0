Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYQnK4CTfzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 08:41:08 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466462461329735.1942309387907;
 Mon, 20 Jun 2016 15:41:01 -0700 (PDT)
Date: Mon, 20 Jun 2016 17:40:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v4] Whitelist IPMI commands based on
 Restricted mode
Message-ID: <20160620224059.GG19968@asimov.austin.ibm.com>
References: <20160616114041.11908-1-openbmc-patches@stwcx.xyz>
 <20160616114041.11908-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tS13At5XYQCJjijI"
Content-Disposition: inline
In-Reply-To: <20160616114041.11908-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 22:41:10 -0000


--tS13At5XYQCJjijI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2016 at 06:40:41AM -0500, OpenBMC Patches wrote:
> From: tomjose <tomjoseph@in.ibm.com>
>=20
> diff --git a/Makefile b/Makefile
> index 7a3b6af..fdae66c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -38,6 +38,7 @@ CFLAGS +=3D -Wall -Wno-unused-result
>  INC_FLAG +=3D $(shell pkg-config --cflags --libs libsystemd) -I. -O2
>  LIB_FLAG +=3D $(shell pkg-config  --libs libsystemd) -rdynamic
>  IPMID_PATH ?=3D -DHOST_IPMI_LIB_PATH=3D\"/usr/lib/host-ipmid/\"
> +WHITELIST_PATH?=3D -DIPMI_WHITELIST_CONF=3D\"/usr/share/host-ipmid/white=
list.conf\"

I am surprised to see a runtime parsing component here.  I thought we
were going to pass the configuration file to the build and generate a
static set for the whitelist.  Are there pros to this solution?  A
build-time static set would be smaller / faster.

> @@ -157,6 +171,21 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipm=
i_cmd_t cmd, ipmi_request_t
>      // Extract the map data onto appropriate containers
>      auto handler_and_context =3D iter->second;
> =20
> +    // If restricted mode is true and command is not whitelisted, don't
> +    // execute the command
> +    if(restricted_mode)
> +    {
> +        auto iter =3D g_ipmi_whitelist.find(std::make_pair(netfn, cmd));
> +        if(iter =3D=3D g_ipmi_whitelist.end())

Prefer 'g_ipmi_whitelist.count(ipmi_fn_cmd_t(netfn, cmd)) =3D=3D 0'.

Reasons:

1. Counts on sets are guaranteed to return 0 or 1 and has the same
   performance as 'find'.

2. Calling the constructor of the underlying set-member ensures there is
   not a conversion cast from pair<X> to pair<Y>.

3. The call for and comparison with the 'end' iterator is eliminated.

> +        {
> +            printf("Net function:[0x%X], Command:[0x%X] is not whitelist=
ed\n", netfn, cmd);
> +            rc =3D IPMI_CC_INSUFFICIENT_PRIVILEGE;
> +            memcpy(response, &rc, IPMI_CC_LEN);

A little odd pattern for us to use memcpy for one byte, but lucky the
GCC optimizer turns this into a byte-store directly anyhow.

> +void ipmi_populate_whitelist()
> +{
> +    std::ifstream file(IPMI_WHITELIST_CONF);
> +    std::string str;
> +    std::string str_netfn;
> +    std::string str_cmd;
> +    ipmi_netfn_t netfn;
> +    ipmi_cmd_t cmd;
> +    size_t pos =3D std::string::npos;
> +
> +    // Read the whitelist.conf file and insert the NetFn and Command pai=
r.
> +    // Each entry in the conf file looks like this 0x01:0x02
> +    // ':' character is the separator between NetFn and Command.
> +    while(std::getline(file, str))
> +    {
> +        pos =3D str.find(':');
> +        if(pos !=3D std::string::npos)
> +        {
> +            str_netfn.assign(str.substr(pos-2,pos-1));
> +            str_cmd.assign(str.substr(pos+3,pos+4));
> +
> +            netfn =3D strtoul(str_netfn.c_str(), NULL, 16);
> +            cmd =3D strtoul(str_cmd.c_str(), NULL, 16);
> +
> +            g_ipmi_whitelist.emplace(std::make_pair(netfn, cmd));

Prefer the direct constructor on this one as well.

I know we may change this to build-time but a few comments:

1. Any reason to not support a comment character?
2. Any reason not to use istream >> operators instead of getline and
   then string parsing?
3. Considering the limited utility of the iostream APIs, fscanf might
   be more concise in this case.

--=20
Patrick Williams

--tS13At5XYQCJjijI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaHD7AAoJEKsDR8wtAMEZQgUQAKWobdV/i3zPc2k0BnNT7UPX
u4hl3Y/Tw9XZREfr1mLGgPpkppet8mZvgJXBVELhgIUmkXyPeEI8fG9EYdRXUmu2
Ogspaya/i7ZvpIyaKr/RB4O5ReOoEJPPbWe+PYAt5zK2hfwGSjMyO6jWJz5CYxVK
69VMhBhk9o/V62tkSwfUUp5ujLpoah3lIQOYA+5L5ypishOag434ZeMom1+dlYbw
kfo49lwWWodf68z/mdw8zI0/v2lWu0MlBJBX8t7uLH8BO6q/kw5DYkPv7XmDLMzM
v7stSTzhN902r2PF/pXjU0mnbWyOnBkcXHzG07BJqhY8WijP4MABc3/LIdAu6/Ns
h+flsnGEolrh60E6oxPHBCuUHuojHdqmCDq1P5P7I/IfaQoIWgOt9qz2lCduwhxq
V9WDHRBWNWGnmyZd09N4tiBuSHb4gMBLRRBaNz2pCyHaVxDicO8d1U7Rx7jRPfx2
Te9xlrhJsuDlH0GtiBckBtcpXginI2gxhV7caUyW0Fx5g5lkYqOt3nrC87gyC5uy
+ekmOaJNLfxpOo1y74na9usWfUXLClUWe+C0+zx/ken6jFsX+G5hXPOVUYTENpsT
IzDGCF91k8aRCKFMDTNnlJgMV1IA1lhKV0IwowYZDpAe2NDyLUrXS/ZImDtll9IX
dNjFmH8gnPyP2kln18sZ
=DUdp
-----END PGP SIGNATURE-----

--tS13At5XYQCJjijI--
