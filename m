Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E100D1A03BF
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 14:08:11 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
Subject: Re: [PATCH openbmc] meta-phosphor: Update kernel version
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1447821019-21779-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Wed, 18 Nov 2015 22:08:06 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AE72D0A-C340-4F18-A06C-E0907893B453@fuzziesquirrel.com>
References: <1447821019-21779-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1447821019-21779-2-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 03:08:12 -0000


> On Nov 17, 2015, at 11:30 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Joel Stanley <joel@jms.id.au>
>=20
> The kenrel contains many changes, including
>=20
>  - rewritten i2c driver
>  - interrupt facilities for the iBT host driver
>  - rebased on Linux 4.3
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
> index 1d8106d..09c18a5 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Linux kernel for OpenBMC"
> SECTION =3D "kernel"
> LICENSE =3D "GPLv2"
>=20
> -KBRANCH ?=3D "dev"
> +KBRANCH ?=3D "dev-4.3"
> KCONFIG_MODE=3D"--alldefconfig"
>=20
> SRC_URI =3D =
"git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}"
> @@ -10,7 +10,7 @@ SRC_URI =3D =
"git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}"
> LINUX_VERSION ?=3D =E2=80=9C4.2"

Should this be 4.3 ?

> LINUX_VERSION_EXTENSION ?=3D "-${SRCREV}"
>=20
> -SRCREV=3D"openbmc-20151104-1"
> +SRCREV=3D"openbmc-20151118-1"
>=20
> PV =3D "${LINUX_VERSION}+git${SRCPV}"
>=20
> --=20
> 2.6.3
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
