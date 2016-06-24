Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNC3586RzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=EFynZa6u; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id a186so18941310qkf.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=76ctoTcwkZIk6L3ltCDlnPlmeRP8guWCuncdX6sGZVA=;
 b=EFynZa6uWX2bqqx//ZMMlxt+Z9vYAfSKDx7b9HwalH5XV0pPSWyez7bsxAgbaFIv9s
 MVMD86sI27hIfNWqBsqIDgCGRY4OLwU4yMSKiFDLJj2PQgm58viRBZmLUfNlhecYL+Sd
 NKKJKgsYlXad/20ID4SLzStt0SoucomSOFYdOYzVwywOzQB0QXTgJKg/bnPY4J2oOuon
 v+xU+DD5G9PmPzMcXhgzrod0lkPvabwfepet20IunW/+hX4WMrA/OpfNo1/hHis3qMWN
 pokAMFnIWrku4DVQmkJx6mfIFLyZz+FdmGY1JvG+xxLaLvbUXvzNQEbt71tkmKoKRx5O
 Ri/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=76ctoTcwkZIk6L3ltCDlnPlmeRP8guWCuncdX6sGZVA=;
 b=hRusK4GEXEy4RZbu3AGD38CYzR1LV30K1dbRlmrLEEPqRFx6A4CQ1kR69gOsYxfxcc
 85f7uHg+k2yopzNEWCCv+YfpJcL3wM2YTnR1W38mMU3t/J89b2xXt6n9KSsAj/OPCOaf
 ua3gBjQHOCpYgl7HcXkVbcc5JOmxzUAT1viHMd7vmzDWKUBizLcPvjC6/f6xZWI9V0hA
 ONe26/m2yLzdaKfcg9zjviIKvilpg7tEpilsxgC4Ss0SYi5ULo6zxD52t1VB1P6Y/I64
 gpRUDKpzHsWKTsP0d8vumRlLIAN7E5Ih0UkyvBhuCabLF6reb2A4rgosB2RIT56AddXi
 zPPg==
X-Gm-Message-State: ALyK8tIbqqiZbAa5FWLbkwOE8Ub5QAPRi7yAguF75+7mnBL7O+sda1XPaehI8+vk5TBYirbayRBluo62j5POAg==
X-Received: by 10.200.40.88 with SMTP id 24mr1847269qtr.73.1466736701741; Thu,
 23 Jun 2016 19:51:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:51:22 -0700 (PDT)
In-Reply-To: <20160623204033.13165-12-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-12-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:21:22 +0930
X-Google-Sender-Auth: 7nM0JEftdMWzcyNQ33Pf2a8YJrI
Message-ID: <CACPK8XddH2Br5F_jw+7uyvtmjMsXY2wZEbOkcGD61ZAm0HYu0w@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 11/11] u-boot: Remove unused 2013.07 packages.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Jun 2016 02:51:44 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Yay!

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../u-boot/u-boot-fw-utils_2013.07%.bbappend       |  3 --
>  .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |  3 --
>  .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |  3 --
>  .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  | 55 ----------------------
>  .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    | 23 ---------
>  5 files changed, 87 deletions(-)
>  delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
>  delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
>  delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>  delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
>
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
> deleted file mode 100644
> index 77fcfef..0000000
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -
> -SRC_URI += "file://config.patch"
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
> deleted file mode 100644
> index 77fcfef..0000000
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -
> -SRC_URI += "file://config.patch"
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
> deleted file mode 100644
> index 1eeec2e..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -FILESEXTRAPATHS_append := "${THISDIR}/files:"
> -
> -SRC_URI += "file://u-boot-barreleye.patch"
> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> deleted file mode 100644
> index a514cf2..0000000
> --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -#require recipes-bsp/u-boot/u-boot.inc
> -
> -SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
> -SECTION = "bootloader"
> -DEPENDS = "mtd-utils"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> -
> -# This revision corresponds to the tag "v2013.07"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> -SRCREV="44f1262bdf39ad93032d39f17a298165372be82e"
> -
> -PV = "v2013.07+git${SRCPV}"
> -
> -UBRANCH = "v2013.07-aspeed-openbmc"
> -SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
> -S = "${WORKDIR}/git"
> -
> -#INSANE_SKIP_${PN} = "already-stripped"
> -#EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
> -#EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" CC="${CC}" HOSTSTRIP="true"'
> -
> -inherit uboot-config
> -
> -do_compile () {
> -       oe_runmake ${UBOOT_MACHINE}
> -       oe_runmake env
> -}
> -
> -do_install () {
> -       install -d ${D}${base_sbindir}
> -       install -d ${D}${sysconfdir}
> -       install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> -       ln -sf fw_printenv ${D}${base_sbindir}/fw_setenv
> -       install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> -}
> -
> -#do_install_class-cross () {
> -#      install -d ${D}${bindir_cross}
> -#      install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
> -#      install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
> -#}
> -
> -#SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
> -#uboot_fw_utils_cross() {
> -#      sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
> -#}
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -#BBCLASSEXTEND = "cross native"
> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> deleted file mode 100644
> index f2434ad..0000000
> --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -require recipes-bsp/u-boot/u-boot.inc
> -
> -# To build u-boot for your machine, provide the following lines in your machine
> -# config, replacing the assignments as appropriate for your machine.
> -# UBOOT_MACHINE = "omap3_beagle_config"
> -# UBOOT_ENTRYPOINT = "0x80008000"
> -# UBOOT_LOADADDRESS = "0x80008000"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> -                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> -
> -# We use the revision in order to avoid having to fetch it from the repo during parse
> -SRCREV = "44f1262bdf39ad93032d39f17a298165372be82e"
> -
> -PV = "v2013.07+git${SRCPV}"
> -
> -UBRANCH = "v2013.07-aspeed-openbmc"
> -SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
> -
> -S = "${WORKDIR}/git"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
