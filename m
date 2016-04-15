Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmjhL4FVFzDq64
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 02:30:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460737839508634.0088497457333;
 Fri, 15 Apr 2016 09:30:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/4] skeleton: Use pflash recipe
Date: Fri, 15 Apr 2016 11:30:33 -0500
Message-Id: <1460737833-13353-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 15 Apr 2016 16:30:43 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../meta-openpower/conf/machine/include/openpower.inc              | 1 +
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
index fe2b44a..6660a56 100644
--- a/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
+++ b/meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
@@ -4,6 +4,7 @@ OBMC_MACHINE_FEATURES += "\
         obmc-phosphor-sensor-mgmt \
         obmc-phosphor-flash-mgmt \
         obmc-phosphor-event-mgmt \
+        openpower-pflash \
         "
 
 VIRTUAL-RUNTIME_obmc-phosphor-fan-ctl = " \
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 08e4d33..551843e 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,12 +16,19 @@ DEPENDS += "glib-2.0 systemd"
 RDEPENDS_${PN} += "python-subprocess python-compression libsystemd"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
+# RDEPEND on pflash if the openpower-pflash machine feature is set.
+PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
+PACKAGECONFIG[openpower-pflash] = ",,,pflash"
+
 SRCREV = "27ca44ad1a96f90d42dcb50183700e5ca5358642"
 
 S = "${WORKDIR}"
 
 do_compile() {
         oe_runmake -C git
+
+        # Remove deprecated files.
+        rm ${S}/git/bin/pflash
 }
 
 do_install() {
-- 
2.7.1
