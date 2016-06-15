Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTp9J71StzDqh9
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 11:00:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465952446054293.1435099966004;
 Tue, 14 Jun 2016 18:00:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-host-ipmid] Update ObjectMapper service/interface/path
Date: Tue, 14 Jun 2016 20:00:42 -0500
Message-Id: <20160615010042.30468-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615010042.30468-1-openbmc-patches@stwcx.xyz>
References: <20160615010042.30468-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 01:00:54 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The well known service name, interface and path for the mapper
all changed.  This patch reacts to that.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 chassishandler.C | 6 +++---
 globalhandler.C  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/chassishandler.C b/chassishandler.C
index d5b3404..6a9a28f 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -27,9 +27,9 @@ const char *settings_object_name  =  "/org/openbmc/settings/host0";
 const char *settings_intf_name    =  "org.freedesktop.DBus.Properties";
 const char *host_intf_name        =  "org.openbmc.settings.Host";
 
-const char *objmapper_service_name =  "org.openbmc.objectmapper";
-const char *objmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
-const char *objmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
+const char *objmapper_service_name =  "org.openbmc.ObjectMapper";
+const char *objmapper_object_name  =  "/org/openbmc/ObjectMapper";
+const char *objmapper_intf_name    =  "org.openbmc.ObjectMapper";
 
 int object_mapper_get_connection(char **buf, const char *obj_path)
 {
diff --git a/globalhandler.C b/globalhandler.C
index 2d3af92..889d127 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -7,9 +7,9 @@
 const char  *control_object_name  =  "/org/openbmc/control/bmc0";
 const char  *control_intf_name    =  "org.openbmc.control.Bmc";
 
-const char  *objectmapper_service_name =  "org.openbmc.objectmapper";
-const char  *objectmapper_object_name  =  "/org/openbmc/objectmapper/objectmapper";
-const char  *objectmapper_intf_name    =  "org.openbmc.objectmapper.ObjectMapper";
+const char  *objectmapper_service_name =  "org.openbmc.ObjectMapper";
+const char  *objectmapper_object_name  =  "/org/openbmc/ObjectMapper";
+const char  *objectmapper_intf_name    =  "org.openbmc.ObjectMapper";
 
 void register_netfn_global_functions() __attribute__((constructor));
 
-- 
2.8.4
