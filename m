Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D3BDC1A078B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 15:40:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449117623192798.6508550760489;
 Wed, 2 Dec 2015 20:40:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Sprint 3 Candidate
Date: Wed,  2 Dec 2015 23:40:20 -0500
Message-Id: <1449117620-23382-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449117620-23382-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449117620-23382-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 04:40:29 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb      | 4 +---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb        | 4 +---
 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb  | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb     | 2 +-
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index 323a179..b9df28a 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -16,9 +16,7 @@ RDEPENDS_${PN} += " \
         python-dbus \
         python-pygobject \
         "
-SRC_URI += " \
-        git://github.com/openbmc/phosphor-objmgr \
-        "
+SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
 SRCREV = "3f7aa329568d8f191baeeefa4a63dbb19cf26338"
 
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 05f2383..6a8820b 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -17,9 +17,7 @@ RDEPENDS_${PN} += " \
 	python-rocket \
 	python-bottle \
         "
-SRC_URI += " \
-        git://github.com/openbmc/phosphor-rest-server \
-        "
+SRC_URI += "git://github.com/openbmc/phosphor-rest-server"
 
 SRCREV = "34cae732597fb3d4b18a23b6494efdbfeca2033b"
 
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
index 1de0cc4..14a9611 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -11,7 +11,7 @@ inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
 SRC_URI += "git://github.com/openbmc/btbridge"
-SRCREV="eee5a2c00faf794a40bf11650e7c0585adc88932"
+SRCREV="d2f64ecf533ed6940d1de003cf979eb62d05e3e6"
 
 # This is how linux-libc-headers says to include custom uapi headers
 EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index c20bd9a..2dcb2c6 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "7e478ce6b065a8bbd2de0ac00934e43cc1639501"
+SRCREV = "c19eb14de9bfa776d2751413b72cf05102c5da1a"
 
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 73da06c..df3e275 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "c941575c933a2564ee5c4bec4855f379ea9279b5"
+SRCREV = "1355e032d2becbc5afa165af23e3d6aec2146c5e"
 
 S = "${WORKDIR}"
 
-- 
2.6.3
