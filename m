Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 045731A01D8
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 14:40:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454384421189584.4512894914183;
 Mon, 1 Feb 2016 19:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable DHCP
Date: Mon,  1 Feb 2016 21:40:19 -0600
Message-Id: <1454384419-9859-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454384419-9859-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454384419-9859-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 02 Feb 2016 03:40:25 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Enable DHCP as default in the image.
---
 meta-phosphor/common/recipes-phosphor/network/network.bb            | 6 +++++-
 .../common/recipes-phosphor/network/network/80-dhcp.network         | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100755 meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network

diff --git a/meta-phosphor/common/recipes-phosphor/network/network.bb b/meta-phosphor/common/recipes-phosphor/network/network.bb
index 33e2693..b53f7f4 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network.bb
+++ b/meta-phosphor/common/recipes-phosphor/network/network.bb
@@ -8,7 +8,9 @@ inherit obmc-phosphor-systemd
 
 RDEPENDS_${PN} += "python-dbus python-pygobject"
 
-SRC_URI += "git://github.com/openbmc/phosphor-networkd"
+SRC_URI += "git://github.com/openbmc/phosphor-networkd \
+            file://80-dhcp.network \
+            "
 
 SRCREV = "a657afc9cc76dc6678edb8de9df569f92dd108e1"
 
@@ -17,5 +19,7 @@ S = "${WORKDIR}/git"
 do_install() {
         install -d ${D}/${sbindir}
         install ${S}/netman.py ${D}/${sbindir}
+        install -d ${D}/etc/systemd/network/
+        install ${WORKDIR}/80-dhcp.network ${D}/etc/systemd/network/
 }
 
diff --git a/meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network b/meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network
new file mode 100755
index 0000000..e871c69
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network
@@ -0,0 +1,5 @@
+[Match]
+Name=eth0
+
+[Network]
+DHCP=yes
-- 
2.6.4
