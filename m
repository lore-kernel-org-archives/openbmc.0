Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7sBt1SYCzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 06:15:01 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 146342969518085.69468915948528;
 Mon, 16 May 2016 13:14:55 -0700 (PDT)
Date: Mon, 16 May 2016 15:14:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH openbmc v3 1/8] meta-openbmc-bsp: Add qemu git recipe
Message-ID: <20160516201453.GH19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-2-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline
In-Reply-To: <1458720215-25302-2-git-send-email-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 16 May 2016 20:15:02 -0000


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 06:33:28PM +1030, Andrew Jeffery wrote:
=2E..
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta-openbmc-bsp/conf/layer.conf                   |   8 ++

>  .../recipes-devtools/qemu/qemu-targets.inc         |  22 ++++
>  meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc    | 125 +++++++++++++++=
++++++

These files are originally in meta/recipes-devtools/qemu.  We should
be able to continue to use those.

>  meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb |  21 ++++

I would prefer this under
meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp , since it is the
2400 specific qemu tree.

I think you can avoid the layer.conf and bblayers.conf changes if you
use the (already supported) meta-ast2400 tree as well.

>  .../meta-palmetto/conf/bblayers.conf.sample        |   1 +
>  .../meta-barreleye/conf/bblayers.conf.sample       |   1 +

> diff --git a/meta-openbmc-bsp/conf/layer.conf b/meta-openbmc-bsp/conf/lay=
er.conf
> new file mode 100644
> index 0000000..7f07802
> --- /dev/null
> +++ b/meta-openbmc-bsp/conf/layer.conf
> @@ -0,0 +1,8 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .=3D ":${LAYERDIR}"
> +# We have a recipes directory containing .bb and .bbappend files, add to=
 BBFILES
> +BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes*/*/*.bb \ ${LAYERDIR}/recip=
es*/*/*.bbappend"
> +
> +BBFILE_COLLECTIONS +=3D "openbmc-bsp"
> +BBFILE_PATTERN_openbmc-bsp =3D ""
> +BBFILE_PRIORITY =3D "1"

I think we can remove this by moving to meta-ast2400.  Not sure I
understand why this was required.

> diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb b/meta-op=
enbmc-bsp/recipes-devtools/qemu/qemu_git.bb
> new file mode 100644
> index 0000000..97667ba
> --- /dev/null
> +++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
> @@ -0,0 +1,21 @@
> +# Based off of [1], appears to be MIT licensed [2].
> +#
> +# [1] https://github.com/dirtybit/gumstix-yocto/blob/master/meta/recipes=
-devtools/qemu/qemu_git.bb
> +# [2] https://github.com/dirtybit/gumstix-yocto/blob/master/meta/COPYING=
=2EMIT

I don't think you need to say this.  This doesn't look that much
different from qemu_2.4.0.bb except for the SRCREV / SRC_URI / S
variables and those are really standard with other of our recipes.

> +
> +require qemu.inc
> +
> +SRCREV =3D "d1f8764099022bc1173f2413331b26d4ff609a0c"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
> +                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
> +
> +SRC_URI =3D "git://github.com/openbmc/qemu.git;protocol=3Dhttps"
> +S =3D "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST_class-target_mips64 =3D "null"
> +
> +do_install_append() {
> +    # Prevent QA warnings about installed ${localstatedir}/run
> +    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/=
run; fi
> +}

--=20
Patrick Williams

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOio9AAoJEKsDR8wtAMEZQq4QAKGP2MjE2mK3swXRR/NUgTHw
yoS4KK/kp7A+8htMhOZx/GuABuEe3uy21xOi7ydCjCEb4bE0qHiy9bCMgYE6zqlM
7GN7CxFAmF0MGPx/HcMYPPr8vglO2vfaDJh52XAPaN2KkCMVS7N7v0zs5iK0aPBN
+YYC5GmMJUACShvZggr7HB8zoR2gFvQ6Vq13ELLvaSWtRc499f52JlDockZHHBmY
liARj3UvOzNzIGF8IzdcnB2cXl9bBy7iV6p/elmTBOKLshE1pGdkoBTmgmgMcFMV
lUSgoqwiQ67buz0+ZMAOJfUHCzKoUBhaIeIuLGaj7h/uRE0hqiS1MoQ+K0j7zlPa
rhBmu8aufiZzzJohplW7oM+k3sU0L8yhRckuz4JuUSoYGi0FomVRvBNEo/8Z1F0F
aj9F0if7qLlgsRn9STD9UTOnScIktHJd0aw2PBD5oKO9Wnfh2UVQ8v8ECycXUD9o
OZ55H/kfBNWjg5PzmEobSj25NC3ejIZ9nZ/Zb03uKW17JR40grQbOwP5W2PEZide
2cOgqlL1Rb+n8IoAepAhH+GHO3M7RCketFFm+itEqjHM/yT6jZ+sn50+ivWefW5M
QVRIEffwP9PUwf5AybkGCJ8Rp3AjtEm+d3SYFBb5yoeePitqBGo+MP1FPVkvUCQq
TPv3PSSiT1A2uCmraDRD
=HuBX
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--
