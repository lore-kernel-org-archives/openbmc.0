Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DBFC71A0707
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 03:50:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144898862295515.514043466813177;
 Tue, 1 Dec 2015 08:50:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/2] Adding IPMI Parser Library.
Date: Tue,  1 Dec 2015 11:50:20 -0500
Message-Id: <1448988621-12834-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Dec 2015 16:50:30 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 .../ipmi-fru-parser/ipmi-fru-parser.bb                 | 18 ++++++++++++++++++
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb   |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb

diff --git a/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb b/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb
new file mode 100644
index 0000000..02ff308
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenBMC IPMI FRU Parser"
+DESCRIPTION = "Parse the common/chassis/board/product areas of the FRU data into a VPD dictionary table."
+HOMEPAGE = "https://github.com/openbmc/ipmi-fru-parser"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-sdbus-service
+
+SRC_URI += "git://github.com/hramasub/ipmi-fru-parser"
+
+SRCREV = "e097f0cc58c64564ae059f9b02ecb574e4cbb666"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        install -m 0755 -d ${D}${libdir}/ipmi
+        install -m 0755 ${S}/*.so ${D}${libdir}/ipmi
+}
diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index 4dbcdd3..54e5655 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -26,6 +26,7 @@ SUMMARY_packagegroup-obmc-phosphor-apps-extras = "Extra features"
 RDEPENDS_packagegroup-obmc-phosphor-apps-extras = " \
         rest-dbus \
         host-ipmid \
+        ipmi-fru-parser \
         "
 
 SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt = "Fan management support"
-- 
2.6.3
