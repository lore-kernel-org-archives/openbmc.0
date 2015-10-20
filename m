Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E4AF01A0736
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:31 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368828110207.28282750313815;
 Tue, 20 Oct 2015 12:20:28 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 13/20] Add skeleton recipe
Date: Tue, 20 Oct 2015 14:19:51 -0500
Message-Id: <1445368798-31274-14-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:32 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

---
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 27 ++++++++++++++++++++++
 .../skeleton/skeleton/skeleton.service             |  8 +++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
 create mode 100755 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
new file mode 100644
index 0000000..ccc5ed1
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Temp placeholder for skeleton function"
+DESCRIPTION = "Temp placeholder for skeleton repository"
+HOMEPAGE = "http://github.com/openbmc/skeleton"
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-systemd
+
+DEPENDS += "glib-2.0"
+RDEPENDS_${PN} += "python-subprocess"
+SRC_URI += "git://github.com/openbmc/skeleton"
+
+SRCREV = "18d4591170779ceb81158c650d31c6c59115b2f2"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+        oe_runmake all
+}
+
+do_install() {
+        install -d ${D}/${sbindir} ${D}${libdir}
+        for i in ${S}/bin/*.py ${S}/bin/*.exe ${S}/bin/tftpy/*.py; do
+                install $i ${D}/${sbindir}
+        done
+        install ${S}/bin/libopenbmc_intf.so ${D}/${libdir}
+}
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
new file mode 100755
index 0000000..545a1f2
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
@@ -0,0 +1,8 @@
+[Unit]
+Description="Temp placeholder for skeleton function"
+
+[Service]
+ExecStart=/usr/sbin/system_manager.py Palmetto
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.0
