Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5169D1A045E
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:50:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449420624265394.2550494658989;
 Sun, 6 Dec 2015 08:50:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 7/8] Sprint 3 candidate 6
Date: Sun,  6 Dec 2015 11:50:17 -0500
Message-Id: <1449420618-3202-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 06 Dec 2015 16:50:30 -0000

From: Chris Austen <austenc@us.ibm.com>

Updates include more sensors, reboot capabiltiies and so much more!
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 2dcb2c6..c03405c 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "c19eb14de9bfa776d2751413b72cf05102c5da1a"
+SRCREV = "903327c4e9f901a692939338b0b4651aa815cedd"
 
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 78856dd..6cdf398 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -12,7 +12,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "bebdb23ea092df6cde23e6da2a8940bd84de4810"
+SRCREV = "aa9ec3aa2cc59fc7e2437041d89b19f4a8f1d7f0"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index df3e275..28ed2d2 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "1355e032d2becbc5afa165af23e3d6aec2146c5e"
+SRCREV = "14caa527e0b10e0aece119693bf003ec95929370"
 
 S = "${WORKDIR}"
 
-- 
2.6.3
