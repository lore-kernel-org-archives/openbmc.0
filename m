Return-Path: <clg@fr.ibm.com>
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qkD8Q6pMszDq9q
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2016 01:12:54 +1000 (AEST)
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@fr.ibm.com>;
 Mon, 11 Apr 2016 16:12:50 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 11 Apr 2016 16:12:49 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@fr.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id B206E1B0805F
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 16:13:29 +0100 (BST)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
 [9.149.37.228])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3BFCnG73473796
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 15:12:49 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3BFCm72020510
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 09:12:48 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3BFCmY2020499; Mon, 11 Apr 2016 09:12:48 -0600
Received: from [9.164.152.71] (icon-9-164-152-71.megacenter.de.ibm.com
 [9.164.152.71])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 274A2220083;
 Mon, 11 Apr 2016 17:12:48 +0200 (CEST)
Subject: Re: [PATCH openbmc v3 1/2] meta-phosphor/u-boot: Move to newer version
To: Cyril Bur <cyrilbur@gmail.com>
References: <1459778435-28142-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459778435-28142-2-git-send-email-openbmc-patches@stwcx.xyz>
 <5703D8D5.3090203@fr.ibm.com> <20160411134218.68c9d659@camb691>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>
Message-ID: <570BBEE8.6090703@fr.ibm.com>
Date: Mon, 11 Apr 2016 17:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <20160411134218.68c9d659@camb691>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16041115-0029-0000-0000-000010360CD9
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
X-List-Received-Date: Mon, 11 Apr 2016 15:12:56 -0000

On 04/11/2016 05:42 AM, Cyril Bur wrote:
> On Tue, 5 Apr 2016 17:25:09 +0200
> Cédric Le Goater <clg@fr.ibm.com> wrote:
> 
>> Hello,
>>
>> I have given some time recently to the OpenBmc U-Boot and came up with
>> a first initial port of the aspeed code on a recent version, v2016.03.
>> Here is the tree :
>>
>> 	https://github.com/legoater/u-boot/commits/v2016.03-aspeed-openbmc
>>
>> There is still quite a lot of cleanup to do, the code has warnings, some
>> configure defines are probably obsolete. This is clearly not finished yet.
>> But it is usable.
>>
>> These compilers on jessie generate a u-boot.bin file which boots a
>> palmetto bmc with success :
>>
>> gcc version 5.2.0 (crosstool-NG crosstool-ng-1.22.0)
>> gcc version 4.8.4 20141219 (release) (4.8.4-1+11-1)
>>
>> So if some of you has time (and a flash programmer), could you please
>> give it a try ? I will be glad to have positive feedback. You can curse
>> me if not :)
> 
> Hi Cedric,
> 
> Took me a couple of days to get around to actually booting it, sorry. Now
> that I've done it though, nice work!
> 
> DRAM Init-DDR3
> CBR0-1357135670123456701234567
> CBR134Done
> 
> 
> U-Boot 2016.03 (Apr 08 2016 - 14:53:05 +1000)
> 
> I2C:   ready
> DRAM:  256 MiB
> WARNING: Caches not enabled
> Flash: SPI Flash ID: 19ba20 
> 32 MiB
> In:    serial
> Out:   serial
> Err:   serial
> H/W:   AST2400 series chip Rev. 01 
> Watchdog: 300s
> Net:   aspeednic#0
> autoboot in 10 seconds (stop with 'Delete' key)...
> 
> It appears to work how we want it. By default it just boots exactly as before.
> I tftped a kernel and initramfs and that works fine.
> 
> Thumbs up from me,

Hello Cyril,

Thanks for testing ! 



Here's a patch below to integrate the branch in the openbmc build. 
This is a new  build framework for me, so may be there is a better 
way to do so.

The resulting flash image was tested on a palmetto.

Cheers,

C.



From: Cédric Le Goater <clg@fr.ibm.com>
Subject: [PATCH] uboot: use v2016.03-aspeed-openbmc branch
Date: Mon, 11 Apr 2016 16:49:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Cédric Le Goater <clg@fr.ibm.com>
---
 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2016.03%.bbappend |   13 ++
 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2016.03%.bbappend          |   10 +
 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb                             |   54 ++++++++++
 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.03.bb                                      |   31 +++++
 4 files changed, 108 insertions(+)

Index: openbmc.git/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
===================================================================
--- /dev/null
+++ openbmc.git/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
@@ -0,0 +1,54 @@
+#require recipes-bsp/u-boot/u-boot.inc
+
+SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
+SECTION = "bootloader"
+DEPENDS = "mtd-utils"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+
+# This revision corresponds to the tag "v2013.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+SRCREV="28aaabf6d1ebd144755287cef417bb59a50f0191"
+
+PV = "v2016.03+git${SRCPV}"
+
+UBRANCH = "v2016.03-aspeed-openbmc"
+SRC_URI = "git://git@github.com/legoater/u-boot.git;branch=${UBRANCH};protocol=https"
+S = "${WORKDIR}/git"
+
+#INSANE_SKIP_${PN} = "already-stripped"
+#EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+#EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+
+inherit uboot-config
+
+do_compile () {
+	oe_runmake ${MACHINE}_defconfig
+	oe_runmake env
+}
+
+do_install () {
+	install -d ${D}${base_sbindir}
+	install -d ${D}${sysconfdir}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+	ln -sf fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+}
+
+#do_install_class-cross () {
+#	install -d ${D}${bindir_cross}
+#	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+#	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+#}
+
+#SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
+#uboot_fw_utils_cross() {
+#	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+#}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+#BBCLASSEXTEND = "cross native"
Index: openbmc.git/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.03.bb
===================================================================
--- /dev/null
+++ openbmc.git/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.03.bb
@@ -0,0 +1,31 @@
+require recipes-bsp/u-boot/u-boot.inc
+
+# To build u-boot for your machine, provide the following lines in your machine
+# config, replacing the assignments as appropriate for your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+# UBOOT_ENTRYPOINT = "0x80008000"
+# UBOOT_LOADADDRESS = "0x80008000"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "28aaabf6d1ebd144755287cef417bb59a50f0191"
+
+PV = "v2016.03+git${SRCPV}"
+
+UBRANCH = "v2016.03-aspeed-openbmc"
+SRC_URI = "git://git@github.com/legoater/u-boot.git;branch=${UBRANCH};protocol=https"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+
+do_compile () {
+	oe_runmake ${MACHINE}_defconfig
+	oe_runmake
+}
+
+
Index: openbmc.git/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2016.03%.bbappend
===================================================================
--- /dev/null
+++ openbmc.git/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2016.03%.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://fw_env.config"
+SRC_URI += "file://config.patch"
+
+do_install_append() {
+    if [ -e ${WORKDIR}/fw_env.config ] ; then
+        install -d ${D}${sysconfdir}
+        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+    fi
+}
+
+BBCLASSEXTEND += "native"
Index: openbmc.git/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2016.03%.bbappend
===================================================================
--- /dev/null
+++ openbmc.git/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2016.03%.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://fw_env.config"
+SRC_URI += "file://config.patch"
+
+# Do not install u-boot in rootfs
+#do_install[postfuncs] += "remove_uboot_from_rootfs"
+#remove_uboot_from_rootfs() {
+#    rm -rf ${D}/boot/u-boot*
+#}
