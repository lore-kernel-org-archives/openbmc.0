Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnsMr0nwgzDqxH
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468210834433767.6495681782119;
 Sun, 10 Jul 2016 21:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/2] Remove second bus from sdbus example
Date: Sun, 10 Jul 2016 23:20:31 -0500
Message-Id: <20160711042031.5026-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711042031.5026-1-openbmc-patches@stwcx.xyz>
References: <20160711042031.5026-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:20:40 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

There probably aren't any use cases for this and it is
harder to support.
Remove to make things slightly less confusing.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../files/obmc-phosphor-example-sdbus.c                           | 8 +-------
 ....SDBusService0.conf => org.openbmc.examples.SDBusService.conf} | 4 ++--
 ...le-sdbus.service => org.openbmc.examples.SDBusService.service} | 0
 .../files/org.openbmc.examples.SDBusService1.conf                 | 8 --------
 .../obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb    | 3 +--
 5 files changed, 4 insertions(+), 19 deletions(-)
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/{org.openbmc.examples.SDBusService0.conf => org.openbmc.examples.SDBusService.conf} (62%)
 rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/{obmc-phosphor-example-sdbus.service => org.openbmc.examples.SDBusService.service} (100%)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService1.conf

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/obmc-phosphor-example-sdbus.c b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/obmc-phosphor-example-sdbus.c
index a66bb55..769a208 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/obmc-phosphor-example-sdbus.c
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/obmc-phosphor-example-sdbus.c
@@ -79,13 +79,7 @@ int main(int argc, char *argv[]) {
 	}
 
 	/* Take a well-known service name so that clients can find us */
-	r = sd_bus_request_name(bus, "org.openbmc.examples.SDBusService0", 0);
-	if (r < 0) {
-		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
-		goto finish;
-	}
-
-	r = sd_bus_request_name(bus, "org.openbmc.examples.SDBusService1", 0);
+	r = sd_bus_request_name(bus, "org.openbmc.examples.SDBusService", 0);
 	if (r < 0) {
 		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
 		goto finish;
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService0.conf b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService.conf
similarity index 62%
rename from meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService0.conf
rename to meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService.conf
index 45af4f4..86e2a53 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService0.conf
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService.conf
@@ -2,7 +2,7 @@
  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
 <busconfig>
   <policy user="root">
-    <allow own="org.openbmc.examples.SDBusService0"/>
-    <allow send_destination="org.openbmc.examples.SDBusService0"/>
+    <allow own="org.openbmc.examples.SDBusService"/>
+    <allow send_destination="org.openbmc.examples.SDBusService"/>
   </policy>
 </busconfig>
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/obmc-phosphor-example-sdbus.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService.service
similarity index 100%
rename from meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/obmc-phosphor-example-sdbus.service
rename to meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService.service
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService1.conf b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService1.conf
deleted file mode 100644
index 5a7bfb8..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/files/org.openbmc.examples.SDBusService1.conf
+++ /dev/null
@@ -1,8 +0,0 @@
-<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
-<busconfig>
-  <policy user="root">
-    <allow own="org.openbmc.examples.SDBusService1"/>
-    <allow send_destination="org.openbmc.examples.SDBusService1"/>
-  </policy>
-</busconfig>
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
index f1a9eb9..9a3018d 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "Phosphor OpenBMC QEMU BSP example implementation."
 PR = "r1"
 
 DBUS_SERVICES = " \
-        org.openbmc.examples.SDBusService0 \
-        org.openbmc.examples.SDBusService1 \
+        org.openbmc.examples.SDBusService \
         "
 
 S = "${WORKDIR}"
-- 
2.9.0
