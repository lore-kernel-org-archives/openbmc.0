Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVxdQ0Vh7zDqs5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:40:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466113234769874.4417364984661;
 Thu, 16 Jun 2016 14:40:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc 1/2] Move rest-dbus to development package
Date: Thu, 16 Jun 2016 16:40:30 -0500
Message-Id: <20160616214031.1461-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616214031.1461-1-openbmc-patches@stwcx.xyz>
References: <20160616214031.1461-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 21:40:43 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The rest-dbus package is a lightweight REST interface intended
for development debug. Classify it as a dev package so that it
is easy to remove from production images.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass                  | 1 +
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb               | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index c715ded..d3960c7 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -38,6 +38,7 @@ IMAGE_FEATURES += " \
 
 CORE_IMAGE_EXTRA_INSTALL_append = " bash \
         packagegroup-obmc-phosphor-apps-extras \
+        packagegroup-obmc-phosphor-apps-extrasdev \
         i2c-tools \
         screen \
         inarp \
diff --git a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
index 21b4a2d..25f3468 100644
--- a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb
@@ -13,6 +13,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-flash-ctl ?= "virtual/obmc-phosphor-flash-ctl"
 PROVIDES = "${PACKAGES}"
 PACKAGES = " \
         packagegroup-obmc-phosphor-apps-extras \
+        packagegroup-obmc-phosphor-apps-extrasdev \
         ${@mf_enabled("obmc-phosphor-fan-mgmt", "packagegroup-obmc-phosphor-apps-fan-mgmt", d)} \
         ${@mf_enabled("obmc-phosphor-chassis-mgmt", "packagegroup-obmc-phosphor-apps-chassis-mgmt", d)} \
         ${@mf_enabled("obmc-phosphor-sensor-mgmt", "packagegroup-obmc-phosphor-apps-sensor-mgmt", d)} \
@@ -25,11 +26,15 @@ PACKAGES = " \
 
 SUMMARY_packagegroup-obmc-phosphor-apps-extras = "Extra features"
 RDEPENDS_packagegroup-obmc-phosphor-apps-extras = " \
-        rest-dbus \
 	obmc-rest \
         host-ipmid \
         "
 
+SUMMARY_packagegroup-obmc-phosphor-apps-extrasdev = "Development features"
+RDEPENDS_packagegroup-obmc-phosphor-apps-extrasdev = " \
+        rest-dbus \
+        "
+
 SUMMARY_packagegroup-obmc-phosphor-apps-fan-mgmt = "Fan management support"
 RDEPENDS_packagegroup-obmc-phosphor-apps-fan-mgmt = \
         "${@cf_enabled("obmc-phosphor-fan-mgmt", " \
-- 
2.8.4
