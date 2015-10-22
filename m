Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1ECE31A0728
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:31:42 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481100106708.0724738204545;
 Wed, 21 Oct 2015 19:31:40 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/2] Remove example applications from build.
Date: Wed, 21 Oct 2015 21:31:35 -0500
Message-Id: <1445481095-29630-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481095-29630-1-git-send-email-patches@stwcx.xyz>
References: <1445481095-29630-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:31:43 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

They can still be built.
Not included in any images.
Part 2 of 2 (meta-palmetto, meta-phosphor).
---
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb               | 1 -
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 7 +++++++
 meta-phosphor/conf/machine/include/sample.inc                      | 7 +++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index 02fb8d4..4dbcdd3 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -26,7 +26,6 @@ SUMMARY_packagegroup-obmc-phosphor-apps-extras = "Extra features"
 RDEPENDS_packagegroup-obmc-phosphor-apps-extras = " \
         rest-dbus \
         host-ipmid \
-        skeleton \
         "
 
 SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt = "Fan management support"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index c6369b0..57f36f1 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -5,6 +5,13 @@ PR = "r1"
 
 inherit obmc-phosphor-license
 inherit obmc-phosphor-systemd
+inherit obmc-phosphor-chassis-mgmt
+inherit obmc-phosphor-event-mgmt
+inherit obmc-phosphor-fan-mgmt
+inherit obmc-phosphor-flash-mgmt
+inherit obmc-phosphor-policy-mgmt
+inherit obmc-phosphor-sensor-mgmt
+inherit obmc-phosphor-system-mgmt
 
 DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
index 801706f..16e2980 100644
--- a/meta-phosphor/conf/machine/include/sample.inc
+++ b/meta-phosphor/conf/machine/include/sample.inc
@@ -19,3 +19,10 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl = " \
        "
 
 PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw ?= "host-ipmi-hw-example"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "obmc-phosphor-chassisd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-eventd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "obmc-phosphor-fand"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "obmc-phosphor-flashd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "obmc-phosphor-policyd"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-sensor-mgmt = "obmc-phosphor-sensord"
+PREFERRED_PROVIDER_virtual/obmc-phosphor-system-mgmt = "obmc-phosphor-sysd"
-- 
2.6.0
