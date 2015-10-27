Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.158])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6F7FF1A02CB
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 13:10:09 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144591180332562.587950788939224;
 Mon, 26 Oct 2015 19:10:03 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] add screen, i2ctools, and fix tty issue
Date: Mon, 26 Oct 2015 21:09:59 -0500
Message-Id: <1445911799-16008-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445911799-16008-1-git-send-email-patches@stwcx.xyz>
References: <1445911799-16008-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 02:10:10 -0000

From: Norman James <njames@us.ibm.com>

---
 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf  | 2 ++
 meta-phosphor/classes/obmc-phosphor-image.bbclass                     | 2 ++
 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend  | 4 ++++
 3 files changed, 8 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f6256a7..569f8fd 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -10,3 +10,5 @@ UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
 FLASH_SIZE = "32768"
+SERIAL_CONSOLE = "ttyS4"
+
diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index c50c84a..9a13f7f 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -36,4 +36,6 @@ IMAGE_FEATURES += " \
 IMAGE_INSTALL += " \
        bash \
        packagegroup-obmc-phosphor-apps-extras \
+       i2c-tools \
+       screen \
        "
diff --git a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
new file mode 100644
index 0000000..d692bd0
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
@@ -0,0 +1,4 @@
+SRC_URI_remove = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2"
+SRC_URI_prepend = "http://downloads.yoctoproject.org/mirror/sources/i2c-tools-3.1.2.tar.bz2"
+
+RDEPENDS_${PN}_remove = "${PN}-misc"
-- 
2.6.0
