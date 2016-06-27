Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLx4tv4zDqmk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146705347183515.360501464428012;
 Mon, 27 Jun 2016 11:51:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 5/9] Update and run libopenbmc_intf codegen
Date: Mon, 27 Jun 2016 13:50:50 -0500
Message-Id: <20160627185054.12379-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
References: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:22 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Update codegen to reflect new path xml/output locations.
Run updated codegen.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 libopenbmc_intf/codegen        | 2 +-
 libopenbmc_intf/openbmc_intf.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/libopenbmc_intf/codegen b/libopenbmc_intf/codegen
index 0fb688e..1c3700d 100755
--- a/libopenbmc_intf/codegen
+++ b/libopenbmc_intf/codegen
@@ -1 +1 @@
-gdbus-codegen --interface-prefix org.openbmc --c-generate-object-manager --generate-c-code interfaces/$1  xml/$1.xml
+gdbus-codegen --interface-prefix org.openbmc --c-generate-object-manager --generate-c-code $1 $1.xml
diff --git a/libopenbmc_intf/openbmc_intf.h b/libopenbmc_intf/openbmc_intf.h
index 3ba589d..4a1d7d6 100644
--- a/libopenbmc_intf/openbmc_intf.h
+++ b/libopenbmc_intf/openbmc_intf.h
@@ -4,8 +4,8 @@
  * The license of this code is the same as for the source it was derived from.
  */
 
-#ifndef __INTERFACES_OPENBMC_INTF_H__
-#define __INTERFACES_OPENBMC_INTF_H__
+#ifndef __OPENBMC_INTF_H__
+#define __OPENBMC_INTF_H__
 
 #include <gio/gio.h>
 
@@ -4197,4 +4197,4 @@ GDBusObjectManager *object_manager_client_new_for_bus_sync (
 
 G_END_DECLS
 
-#endif /* __INTERFACES_OPENBMC_INTF_H__ */
+#endif /* __OPENBMC_INTF_H__ */
-- 
2.9.0
