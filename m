Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwYWd5LxLzDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 20:50:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461840615843251.30593692374316;
 Thu, 28 Apr 2016 03:50:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v3] Using new getFRUArea() API to fix 'not
 found in lookup' error message
Date: Thu, 28 Apr 2016 05:50:13 -0500
Message-Id: <1461840613-31229-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461840613-31229-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461840613-31229-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Apr 2016 10:50:22 -0000

From: Yi Li <adamliyi@msn.com>

The ipmi-fru-parser calls the dbus method
SystemManager::getObjectFromId('FRU_STR', fru_area_name) for each fru areas
to get the dbus object path of fru area, even if the fru area does not exist.
Also ipmi_validate_fru_area() may be invoked multipul times before
full fru data is parsed. This will generate duplicated error
messages from SystemManager:, e.g:
"ERROR SystemManager: dbus.String(u'INTERNAL_13') not found in lookup".
In this case, "INTERNAL" area does not exists for FRU

In another pull request for skeleton, a new method:
getFRUArea(fru_id) is added specially for ipmi-fru-parser.
See PR: https://github.com/openbmc/skeleton/pull/62.

ipmi-fru-parser gets fru area names defined in Skeleton, and it calls
getObjectFromId() only for fru_aream_name already defined.
This way the 'not found in lookup' error message can be avoided.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 writefrudata.C | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 5 deletions(-)

diff --git a/writefrudata.C b/writefrudata.C
index 8771a92..7ee2127 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -10,6 +10,7 @@
 #include <memory>
 #include <algorithm>
 #include <fstream>
+#include <sstream>
 #include "frup.h"
 #include "fru-area.H"
 
@@ -152,8 +153,8 @@ ipmi_fru::~ipmi_fru()
         }
         else
         {
-            printf("Present bit set to :[%s] for fruid:[%d]\n",
-                    iv_obj_path.c_str(), iv_fruid);
+            printf("Present bit set to :[%s] for fruid:[%d], Path[%s]:\n",
+                    present_bit, iv_fruid, iv_obj_path.c_str());
         }
 
         sd_bus_error_free(&bus_error);
@@ -180,6 +181,7 @@ int ipmi_fru::setup_sd_bus_paths(void)
 
     // We want to call a method "getObjectFromId" on System Bus that is
     // made available over  OpenBmc system services.
+
     rc = sd_bus_call_method(iv_bus_type,                // On the System Bus
                             sys_bus_name,               // Service to contact
                             sys_object_name,            // Object path
@@ -190,7 +192,6 @@ int ipmi_fru::setup_sd_bus_paths(void)
                             "ss",                       // input message (string,string)
                             "FRU_STR",                  // First argument to getObjectFromId
                             fru_area_name);             // Second Argument
-
     if(rc < 0)
     {
         fprintf(stderr, "Failed to resolve fruid:[%d] to dbus: [%s]\n", iv_fruid, bus_error.message);
@@ -449,6 +450,7 @@ int ipmi_populate_fru_areas(uint8_t *fru_data, const size_t data_len,
     for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
             fru_entry < (sizeof(struct common_header) -2); fru_entry++)
     {
+        rc = -1;
         // Actual offset in the payload is the offset mentioned in common header
         // multipled by 8. Common header is always the first 8 bytes.
         area_offset = fru_data[fru_entry] * IPMI_EIGHT_BYTES;
@@ -564,6 +566,73 @@ int cleanup_error(FILE *fru_fp, fru_area_vec_t & fru_area_vec)
     return  -1;
 }
 
+
+///-----------------------------------------------------
+// Get the fru area names defined in BMC for a given @fruid.
+//----------------------------------------------------
+int get_defined_fru_area(sd_bus *bus_type, const uint8_t fruid,
+                         std::vector<std::string> &defined_fru_area)
+{
+    // Need this to get respective DBUS objects
+    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+    sd_bus_message *response = NULL;
+    int rc = 0;
+    char *areas = NULL;
+
+#ifdef __IPMI_DEBUG__
+    printf("Getting fru areas defined in Skeleton for :[%d]\n", fruid);
+#endif
+
+    // We want to call a method "getFRUArea" on System Bus that is
+    // made available over OpenBmc system services.
+    rc = sd_bus_call_method(bus_type,                   // On the System Bus
+                            sys_bus_name,               // Service to contact
+                            sys_object_name,            // Object path
+                            sys_intf_name,              // Interface name
+                            "getFRUArea",               // Method to be called
+                            &bus_error,                 // object to return error
+                            &response,                  // Response message on success
+                            "y",                        // input message (integer)
+                            fruid);                     // Argument
+
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to get fru area for fruid:[%d] to dbus: [%s]\n",
+                    fruid, bus_error.message);
+    }
+    else
+    {
+        // if several fru area names are defined, the names are combined to
+        // a string seperated by ','
+        rc = sd_bus_message_read(response, "s", &areas);
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to parse response message from getFRUArea:[%s]\n",
+                        strerror(-rc));
+        }
+        else
+        {
+#ifdef __IPMI_DEBUG__
+            printf("get defined fru area: id: %d, areas: %s\n", fruid, areas);
+#endif
+            std::string area_name;
+            std::stringstream ss(areas);
+            // fru area names string is seperated by ',', parse it into tokens
+            while (std::getline(ss, area_name, ','))
+            {
+                if (!area_name.empty())
+                    defined_fru_area.emplace_back(area_name);
+            }
+        }
+    }
+
+    sd_bus_error_free(&bus_error);
+    sd_bus_message_unref(response);
+
+    return rc;
+}
+
+
 ///-----------------------------------------------------
 // Accepts the filename and validates per IPMI FRU spec
 //----------------------------------------------------
@@ -577,6 +646,15 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
     // Vector that holds individual IPMI FRU AREAs. Although MULTI and INTERNAL
     // are not used, keeping it here for completeness.
     fru_area_vec_t fru_area_vec;
+    std::vector<std::string> defined_fru_area;
+
+    // BMC defines fru areas that should be present in Skeleton
+    rc = get_defined_fru_area(bus_type, fruid, defined_fru_area);
+    if(rc < 0)
+    {
+        fprintf(stderr, "ERROR: cannot get defined fru area\n");
+        return rc;
+    }
     for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
         fru_entry < (sizeof(struct common_header) -2); fru_entry++)
     {
@@ -588,8 +666,15 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
         bool present = std::ifstream(fru_file_name);
         fru_area->set_present(present);
 
-        // And update the sd_bus paths as well.
-        fru_area->setup_sd_bus_paths();
+        // Only setup dbus path for areas defined in BMC.
+        // Otherwise Skeleton will report 'not found' error
+        std::string fru_area_name = fru_area->get_name() + std::to_string(fruid);
+        auto iter = std::find(defined_fru_area.begin(), defined_fru_area.end(),
+                                  fru_area_name);
+        if (iter != defined_fru_area.end())
+        {
+            fru_area->setup_sd_bus_paths();
+        }
         fru_area_vec.emplace_back(std::move(fru_area));
     }
 
-- 
2.8.1
