Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6F3D21A0725
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:56:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259410951604.0917896231651;
 Mon, 19 Oct 2015 05:56:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/9] Remove S and SRC_URI from c daemon class
Date: Mon, 19 Oct 2015 07:56:39 -0500
Message-Id: <1445259405-10312-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:56:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Initially this could be done in one place but as
sources move to git repositories this can't be done
in a generic manner.

Adapted existing recipes to this class change.
---
 meta-phosphor/classes/obmc-phosphor-c-daemon.bbclass           | 10 ++++------
 .../obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb |  4 ++++
 .../recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb   |  5 +++++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-c-daemon.bbclass b/meta-phosphor/classes/obmc-phosphor-c-daemon.bbclass
index e21d17c..0ceed96 100644
--- a/meta-phosphor/classes/obmc-phosphor-c-daemon.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-c-daemon.bbclass
@@ -4,14 +4,12 @@ inherit obmc-phosphor-systemd
 inherit obmc-phosphor-license
 
 DEPENDS += "glib-2.0"
-SRC_URI += " \
-        file://Makefile \
-        file://${PN}.c \
-        "
-S = "${WORKDIR}"
+
+INSTALL_NAME ?= "${PN}"
+BIN_NAME ?= "${INSTALL_NAME}"
 
 do_install_append() {
         # install the binary
         install -d ${D}${sbindir}
-        install -m 0755 ${WORKDIR}/${PN} ${D}${sbindir}
+        install -m 0755 ${S}/${BIN_NAME} ${D}${sbindir}/${INSTALL_NAME}
 }
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
index 89fbdb1..f1a9eb9 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
@@ -7,5 +7,9 @@ DBUS_SERVICES = " \
         org.openbmc.examples.SDBusService1 \
         "
 
+S = "${WORKDIR}"
+SRC_URI += "file://Makefile \
+           file://obmc-phosphor-example-sdbus.c \
+           "
 inherit obmc-phosphor-sdbus-service
 inherit obmc-phosphor-c-daemon
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb
index 79e2e6c..8c937c6 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb
@@ -5,3 +5,8 @@ PR = "r1"
 inherit obmc-phosphor-fan-mgmt
 inherit obmc-phosphor-sdbus-service
 inherit obmc-phosphor-c-daemon
+
+S = "${WORKDIR}"
+SRC_URI += "file://Makefile \
+           file://obmc-phosphor-fand.c \
+           "
-- 
2.6.0
