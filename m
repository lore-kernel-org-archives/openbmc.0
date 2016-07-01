Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rh5gG5XPfzDql5
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 05:14:02 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467400438162180.19407210190582;
 Fri, 1 Jul 2016 12:13:58 -0700 (PDT)
Date: Fri, 1 Jul 2016 14:13:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH openbmc v2] Generate code from conf files from IPMI
 packages
Message-ID: <20160701191356.GY20922@asimov.austin.ibm.com>
References: <20160701143037.13669-1-openbmc-patches@stwcx.xyz>
 <20160701143037.13669-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W1uEbMXJ1Mj4g6TI"
Content-Disposition: inline
In-Reply-To: <20160701143037.13669-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Jul 2016 19:14:03 -0000


--W1uEbMXJ1Mj4g6TI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 09:30:37AM -0500, OpenBMC Patches wrote:
> From: tomjose <tomjoseph@in.ibm.com>
>=20
> IPMI whitelisted commands for each package is mentioned in the
> respective conf file. The conf files are merged and code is
> generated to be consumed by ipmi daemon.

> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
> @@ -17,7 +17,10 @@ TARGET_CFLAGS   +=3D "-fpic"
>  RDEPENDS_${PN} +=3D "clear-once"
>  RDEPENDS_${PN} +=3D "settings"
>  RDEPENDS_${PN} +=3D "network"
> -SRC_URI +=3D "git://github.com/openbmc/phosphor-host-ipmid"
> +SRC_URI +=3D "git://github.com/openbmc/phosphor-host-ipmid \
> +			file://host-ipmid-whitelist.conf \
> +			file://host-ipmid-oem-whitelist.conf \
> +			file://host-ipmid-fru-whitelist.conf"

Shouldn't the oem and fru whitelist entries be provided by their
respective packages?

> +do_configure () {
> +        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}

I don't think merge_config is needed here.  The 'generate_whitelist'
appears to take a list of files already.

> +        generate_whitelist .config  > ipmiwhitelist.C
> +}
> +
> +generate_whitelist() {

I think we should move this script into the IPMI package itself.  The
file output format is tied to the IPMI code (vector<pair<uchar,
uchar>>).

> +        # Ensure some files have been passed.
> +        if [ "x$*" =3D=3D "x" ]; then
> +            echo "Usage: $0 [whitelist_files+]" >&2
> +            exit -1
> +        fi
> +		|

Check for excess whitespace throughout this function.  A lot of stray
tabs.

> +        # Output header of C++ file.
> +        echo -e '#include <vector>\n'
> +	=09
> +        echo -e 'using netfncmd_pair =3D std::pair<unsigned char, unsign=
ed char>;\n'

I think there is a header that defines this type already, no?  Should we
include it instead?

> +	=09
> +        echo -e 'const std::vector<netfncmd_pair> whitelist =3D {\n'
> +	=09
> +        # Output each row of whitelist vector.
> +        # Concatenate all the passed files.
> +        # Remove comments and empty lines.
> +        # Sort the list [numerically].
> +        # Remove any duplicates.
> +        # Turn "a:b" -> "{ a, b },"
> +        cat $* | sed "s/#.*//" | sed '/^$/d' | sort -n | uniq | sed "s/^=
/    { /" | \
> +        sed "s/:/, /" | sed "s/$/ }, /"
> +    =09
> +        echo '};'
> +}

> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/h=
ost-ipmid-fru-whitelist.conf
> @@ -0,0 +1,2 @@
> +#<NetFn>:<Command>
> +0x32:0xF0

I'd prefer to also see each netfn/command documented.

    0x32:0xF0   # UserManagement : SetRootPassword

(I totally made up these netfn / command definitions.  Suppose to be an
example).

--=20
Patrick Williams

--W1uEbMXJ1Mj4g6TI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdsD0AAoJEKsDR8wtAMEZY44P/RaDbPzTSXoHXb5Lfq8oQuB4
q21XtgL16x558rz3ikmjjQ3D9il5f49/ypfBoFbYn2Ees5O3Uu/FhJ+kHSAROd8v
gQGXJdiPS6nWZUH/N0lm971OOvuXo5+SX2fyJfsJXnsPuBnZvoySO9AuuPVgeIOm
QNuDN5dk4aTgHphgZKV6kZ5J0o8bgtCsSAwMD7ugUZubaxqiInV96fflxXI70rjb
Gxkli0h+J+TCjkxsMF1vT4pzozrQCTL3iyQpE3EdWSw26wRFteBaPSC/F0dut3Qa
sRthCuxcX1kVWA7gLyQ4wW4VDCmOQSPhG0D/326va6TMfzNAwpDRMjmjrUKbwQOy
SlLMGHiA4Lqv7RkISCpsh2XtrtRRmV2KvrKbJ/lKGnEeh5sF+PhpA6f3PQNkRGQS
za1qlbCDKIM7X4YX4ypNcAkUoeIvAqoLWQZ8Nsu27kBYmZ8zzb7WQJAFUXT2a6uS
99g+kABwNgXqMd7W5b7RyHhgjQ7uDGn2HjNX43BtojIAoEWrMUWyG0/B4LkGpCKG
IRgVhcboCnsf2uHY2jqBm5cozajxPrqH2g83mhqJb1XcY8XH7dF9lc7wJIn/99b4
e4PchBHnlTgTzUWXYe6OROii694RnuvwX1GLYz5UJzJXlqiqIC71f0IefxTnvPc4
f0GZjAql2XChtEzNPJYC
=pPGi
-----END PGP SIGNATURE-----

--W1uEbMXJ1Mj4g6TI--
