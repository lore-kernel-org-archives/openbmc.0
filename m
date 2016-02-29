Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 19A941A0035
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 05:44:54 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14567712282591012.1305972832344;
 Mon, 29 Feb 2016 10:40:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 1/2] Whitespace fixes
Date: Mon, 29 Feb 2016 12:40:22 -0600
Message-Id: <1456771223-7654-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456771223-7654-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456771223-7654-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Mon, 29 Feb 2016 18:44:55 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Indent was only seven spaces.  No functional changes.
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass | 30 +++++++++++------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 7d468ff..811bbd3 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -25,20 +25,20 @@ FEATURE_PACKAGES_obmc-phosphor-system-mgmt ?= "packagegroup-obmc-phosphor-apps-s
 
 # Install entire Phosphor application stack by default
 IMAGE_FEATURES += " \
-       obmc-phosphor-fan-mgmt \
-       obmc-phosphor-chassis-mgmt \
-       obmc-phosphor-sensor-mgmt \
-       obmc-phosphor-flash-mgmt \
-       obmc-phosphor-event-mgmt \
-       obmc-phosphor-policy-mgmt \
-       obmc-phosphor-user-mgmt \
-       obmc-phosphor-system-mgmt \
-       ssh-server-dropbear \
-       "
+        obmc-phosphor-fan-mgmt \
+        obmc-phosphor-chassis-mgmt \
+        obmc-phosphor-sensor-mgmt \
+        obmc-phosphor-flash-mgmt \
+        obmc-phosphor-event-mgmt \
+        obmc-phosphor-policy-mgmt \
+        obmc-phosphor-user-mgmt \
+        obmc-phosphor-system-mgmt \
+        ssh-server-dropbear \
+        "
 
 IMAGE_INSTALL += " \
-       bash \
-       packagegroup-obmc-phosphor-apps-extras \
-       i2c-tools \
-       screen \
-       "
+        bash \
+        packagegroup-obmc-phosphor-apps-extras \
+        i2c-tools \
+        screen \
+        "
-- 
2.7.1
