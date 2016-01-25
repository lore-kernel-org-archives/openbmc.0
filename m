Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 1237 seconds by postgrey-1.35 at bilbo;
 Mon, 25 Jan 2016 11:42:54 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ogiFJnwQ; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FDB41A05D0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 11:42:54 +1100 (AEDT)
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 26926604076;
 Sun, 24 Jan 2016 16:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=FIZSUi4wVCxN4w3mfthX0A6RKYU=; b=ogiFJnwQllw7J62q+Mv9NzVirM5
 bTS54ziDqLTvlwxMXk5nrqbm+EZMT4ka8k6iCY368hJdve0q3qqcOSeAGkaTAg10
 kj2FKkIiIkEbgaFBuCCo2ruxJo7bj4Qbob1TzWTpdA6grBUaamoZ0nfQdDA7PbLA
 U9R6ngUYC6MkItak=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 31894604069;
 Sun, 24 Jan 2016 16:42:51 -0800 (PST)
Message-ID: <1453682569.2773.26.camel@aj.id.au>
Subject: Re: [PATCH openbmc 5/6] create u-boot-fw-utils for our u-boot version
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 25 Jan 2016 11:12:49 +1030
In-Reply-To: <1453331420-6524-6-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-6-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 25 Jan 2016 00:42:54 -0000

Hi Milton

On Wed, 2016-01-20 at 17:10 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> This commit creates a class and recipie based on the upstream 2015
> branch of u-boot and patches it with our fw_env.config.
> 
> Having these tools for the initfs will allow us to modify the u-boot
> enviornment to do things like boot from network for update and set the
> bmc mac addresses in the environment for u-boot and use by the kernel.
> 
> Unfornately its broken in that it produces a host binary instead of
> a target binary when building the base package.  I have not been able
> to resolve this despite several attempts.

Not sure what you tried, but maybe a hacky approach is to work around
the u-boot build system and set HOSTCC=$CC in the .bb? Would this have
any negative interactions with BBCLASSEXTEND="cross native"? 

> ---
>  .../u-boot/u-boot-fw-utils_2013.07%.bbappend       | 13 ++++++
>  .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  | 52 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
>  create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> 
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
> new file mode 100644
> index 0000000..4020696
> --- /dev/null
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
> @@ -0,0 +1,13 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI += "file://fw_env.config"
> +SRC_URI += "file://config.patch"
> +
> +do_install_append() {
> +    if [ -e ${WORKDIR}/fw_env.config ] ; then
> +        install -d ${D}${sysconfdir}
> +        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
> +    fi
> +}
> +
> +BBCLASSEXTEND += "native"
> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> new file mode 100644
> index 0000000..6f72945
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> @@ -0,0 +1,52 @@
> +SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
> +SECTION = "bootloader"
> +DEPENDS = "mtd-utils"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +
> +# This revision corresponds to the tag "v2013.07"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +SRCREV="${AUTOREV}"
> +
> +PV = "v2013.07+git${SRCPV}"
> +
> +UBRANCH = "v2013.07-aspeed-openbmc"
> +SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
> +S = "${WORKDIR}/git"
> +
> +INSANE_SKIP_${PN} = "already-stripped"
> +EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
> +EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
> +
> +inherit uboot-config
> +
> +do_compile () {
> +> 	> oe_runmake ${UBOOT_MACHINE}
> +> 	> oe_runmake env
> +}
> +
> +do_install () {
> +> 	> install -d ${D}${base_sbindir}
> +> 	> install -d ${D}${sysconfdir}
> +> 	> install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> +> 	> install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> +> 	> install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> +}
> +
> +do_install_class-cross () {
> +> 	> install -d ${D}${bindir_cross}
> +> 	> install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
> +> 	> install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
> +uboot_fw_utils_cross() {
> +> 	> sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +BBCLASSEXTEND = "cross native"
