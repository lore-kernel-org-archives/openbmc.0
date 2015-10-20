Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 266B61A072C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:08 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368805054426.7709201361754;
 Tue, 20 Oct 2015 12:20:05 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 02/20] Remove S and SRC_URI from python daemon class
Date: Tue, 20 Oct 2015 14:19:40 -0500
Message-Id: <1445368798-31274-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:09 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Initially this could be done in one place but as
sources move to git repositories this can't be done
in a generic manner.

Adapted existing recipes to this class change.
---
 meta-phosphor/classes/obmc-phosphor-py-daemon.bbclass             | 8 +++-----
 .../obmc-phosphor-chassis/obmc-phosphor-chassisd.bb               | 3 +++
 .../recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb  | 3 +++
 .../obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb  | 4 +++-
 .../recipes-phosphor/obmc-phosphor-flash/obmc-phosphor-flashd.bb  | 3 +++
 .../obmc-phosphor-policy/obmc-phosphor-policyd.bb                 | 3 +++
 .../obmc-phosphor-sensor/obmc-phosphor-sensord.bb                 | 3 +++
 .../recipes-phosphor/obmc-phosphor-sys/obmc-phosphor-sysd.bb      | 3 +++
 8 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-py-daemon.bbclass b/meta-phosphor/classes/obmc-phosphor-py-daemon.bbclass
index 35c2714..9cb8bfd 100644
--- a/meta-phosphor/classes/obmc-phosphor-py-daemon.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-py-daemon.bbclass
@@ -5,13 +5,11 @@ inherit obmc-phosphor-systemd
 inherit obmc-phosphor-license
 
 RDEPENDS_${PN} += "python-dbus python-pygobject"
-SRC_URI += " \
-        file://${PN}.py \
-        "
-S = "${WORKDIR}"
+INSTALL_NAME ?= "${PN}"
+SCRIPT_NAME ?= "${INSTALL_NAME}.py"
 
 do_install_append() {
         # install the script
         install -d ${D}${sbindir}
-        install -m 0755 ${WORKDIR}/${PN}.py ${D}${sbindir}/${PN}
+        install -m 0755 ${S}/${SCRIPT_NAME} ${D}${sbindir}/${INSTALL_NAME}
 }
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-phosphor-chassisd.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-phosphor-chassisd.bb
index ad642a3..d7a8ed9 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-phosphor-chassisd.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-phosphor-chassisd.bb
@@ -4,3 +4,6 @@ PR = "r1"
 
 inherit obmc-phosphor-chassis-mgmt
 inherit obmc-phosphor-pydbus-service
+
+S = "${WORKDIR}"
+SRC_URI += "file://${PN}.py"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb
index 998648c..b5a54da 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-eventd.bb
@@ -4,3 +4,6 @@ PR = "r1"
 
 inherit obmc-phosphor-event-mgmt
 inherit obmc-phosphor-pydbus-service
+
+S = "${WORKDIR}"
+SRC_URI += "file://${PN}.py"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb
index c140c9b..1446a73 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/obmc-phosphor-example-pydbus.bb
@@ -11,8 +11,10 @@ inherit obmc-phosphor-pydbus-service
 
 client = "pyclient-sample"
 SRC_URI += "file://${client}.py"
+SRC_URI += "file://${PN}.py"
+S = "${WORKDIR}"
 
 do_install_append() {
         install -d ${D}${bindir}
-        install -m 0755 ${WORKDIR}/${client}.py ${D}${bindir}/${client}
+        install -m 0755 ${S}/${client}.py ${D}${bindir}/${client}
 }
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-phosphor-flashd.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-phosphor-flashd.bb
index bd4b1af..6e4c04a 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-phosphor-flashd.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-phosphor-flashd.bb
@@ -4,3 +4,6 @@ PR = "r1"
 
 inherit obmc-phosphor-flash-mgmt
 inherit obmc-phosphor-pydbus-service
+
+S = "${WORKDIR}"
+SRC_URI += "file://${PN}.py"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-policy/obmc-phosphor-policyd.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-policy/obmc-phosphor-policyd.bb
index 664760e..05471d5 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-policy/obmc-phosphor-policyd.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-policy/obmc-phosphor-policyd.bb
@@ -4,3 +4,6 @@ PR = "r1"
 
 inherit obmc-phosphor-policy-mgmt
 inherit obmc-phosphor-pydbus-service
+
+S = "${WORKDIR}"
+SRC_URI += "file://${PN}.py"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-phosphor-sensord.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-phosphor-sensord.bb
index fc646a5..7a82fb5 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-phosphor-sensord.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-phosphor-sensord.bb
@@ -4,3 +4,6 @@ PR = "r1"
 
 inherit obmc-phosphor-sensor-mgmt
 inherit obmc-phosphor-pydbus-service
+
+S = "${WORKDIR}"
+SRC_URI += "file://${PN}.py"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-phosphor-sysd.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-phosphor-sysd.bb
index 3dc9a64..bcb5d32 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-phosphor-sysd.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-phosphor-sysd.bb
@@ -4,3 +4,6 @@ PR = "r1"
 
 inherit obmc-phosphor-system-mgmt
 inherit obmc-phosphor-pydbus-service
+
+S = "${WORKDIR}"
+SRC_URI += "file://${PN}.py"
-- 
2.6.0
