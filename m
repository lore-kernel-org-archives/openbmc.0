Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qgBKb2gHhzDq65
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2016 02:40:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459960816477288.3502820745889;
 Wed, 6 Apr 2016 09:40:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Fix 'dbus.String not found in lookup' error
 message
Date: Wed,  6 Apr 2016 11:40:13 -0500
Message-Id: <1459960813-14691-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459960813-14691-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459960813-14691-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 06 Apr 2016 16:40:20 -0000

From: Yi Li <adamliyi@msn.com>

Previously the ipmi-fru-parser will call dbus method getObjectFromId()
for each fru areas to get the dbus object path of fru area,
even if the fru area does not exist.
Also ipmi_validate_fru_area() may be invoked multipul times before
full fru data is parsed. This will generate duplicated error
messages from SystemManager:, e.g:
"ERROR SystemManager: dbus.String(u'INTERNAL_13') not found in lookup".
In this case, "INTERNAL" area does not exists for FRU 13.

This patch tries to reduce the messages. For FRUs managed by
hostboot, ipmi-fru-parser only asks for dbus object path when
updating the fru data to BMC inventory.

For FRUs mananged by BMC (eeprom), ipmi-fru-parser also asks for dbus
object path when setting the fru's 'present' and 'fault' status.
ipmi-fru-parser needs to call getObjectFromId() to know whether a
fru should be present, in order to decide the 'present' and 'fault'
status. So this message will still be triggered when SystemManager
does not define object path for a fru area.

This patch also sets 'present' and 'fault' properly when there is error
processing a BMC managed FRU.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 writefrudata.C | 83 +++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/writefrudata.C b/writefrudata.C
index 8771a92..be06f9b 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -31,6 +31,7 @@ ipmi_fru::ipmi_fru(const uint8_t fruid, const ipmi_fru_area_type type,
     iv_valid = false;
     iv_data = NULL;
     iv_present = false;
+    iv_len = 0;
 
     if(iv_type == IPMI_FRU_AREA_INTERNAL_USE)
     {
@@ -96,16 +97,18 @@ ipmi_fru::~ipmi_fru()
         iv_data = NULL;
     }
 
-    // If we have not been successful in doing some updates and we are a BMC
-    // fru, then need to set the fault bits.
-    bool valid_dbus = !(iv_bus_name.empty()) &&
-                      !(iv_obj_path.empty()) &&
-                      !(iv_intf_name.empty());
-
-    // Based on bmc_fru, success in updating the FRU inventory we need to set
-    // some special bits.
-    if(iv_bmc_fru && valid_dbus)
-    {
+    // For FRUs manged by BMC, We need to set 'present' and 'fault' status.
+    // For FRUs managed by hostboot, 'present' and 'fault' status are set by
+    // ipmi 'set sensor reading' command, we don't care.
+    if(iv_bmc_fru)
+    {
+        // Some FRUs may fail to be updated. Get the dbus path again.
+        this->setup_sd_bus_paths();
+        bool valid_dbus = !(iv_bus_name.empty()) &&
+                          !(iv_obj_path.empty()) &&
+                          !(iv_intf_name.empty());
+        if (!valid_dbus)
+            return;
         // Set the Fault bit if we did not successfully process the fru
         const char *fault_bit = iv_valid ? "False" : "True";
 
@@ -153,7 +156,7 @@ ipmi_fru::~ipmi_fru()
         else
         {
             printf("Present bit set to :[%s] for fruid:[%d]\n",
-                    iv_obj_path.c_str(), iv_fruid);
+                    present_bit, iv_fruid);
         }
 
         sd_bus_error_free(&bus_error);
@@ -342,6 +345,13 @@ int ipmi_update_inventory(fru_area_vec_t & area_vec)
     // the Inventory.
     for(auto& iter : area_vec)
     {
+        rc = (iter)->setup_sd_bus_paths();
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR: cannot get dbus path for fru:[%s_%d]\n",
+                    (iter)->get_name(), (iter)->get_fruid());
+            continue;
+        }
         // Start fresh on each.
         sd_bus_error_free(&bus_error);
         sd_bus_message_unref(response);
@@ -422,14 +432,7 @@ int ipmi_update_inventory(fru_area_vec_t & area_vec)
 ///----------------------------------------------------
 bool remove_invalid_area(const std::unique_ptr<ipmi_fru> &fru_area)
 {
-    // Filter the ones that do not have dbus reference.
-    if((strlen((fru_area)->get_bus_name()) == 0) ||
-       (strlen((fru_area)->get_obj_path()) == 0)  ||
-       (strlen((fru_area)->get_intf_name()) == 0))
-    {
-        return true;
-    }
-    return false;
+    return (fru_area)->get_len() == 0 ? true : false;
 }
 
 ///----------------------------------------------------------------------------------
@@ -449,6 +452,7 @@ int ipmi_populate_fru_areas(uint8_t *fru_data, const size_t data_len,
     for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
             fru_entry < (sizeof(struct common_header) -2); fru_entry++)
     {
+        rc = -1;
         // Actual offset in the payload is the offset mentioned in common header
         // multipled by 8. Common header is always the first 8 bytes.
         area_offset = fru_data[fru_entry] * IPMI_EIGHT_BYTES;
@@ -550,6 +554,17 @@ int ipmi_validate_common_hdr(const uint8_t *fru_data, const size_t data_len)
 //------------------------------------------------------------
 int cleanup_error(FILE *fru_fp, fru_area_vec_t & fru_area_vec)
 {
+    for (auto& iter : fru_area_vec)
+    {
+       // if the fru file exists, the fru is regarded as 'present'
+       if(fru_fp != NULL)
+           (iter)->set_present(true);
+       else
+           (iter)->set_present(false);
+       // error happens, regard fru as 'false'
+       (iter)->set_valid(false);
+    }
+
     if(fru_fp != NULL)
     {
         fclose(fru_fp);
@@ -587,9 +602,10 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
         // Physically being present
         bool present = std::ifstream(fru_file_name);
         fru_area->set_present(present);
+        // When FRU InventoryItem is updated successfully,
+        // 'valid' will be set to true
+        fru_area->set_valid(false);
 
-        // And update the sd_bus paths as well.
-        fru_area->setup_sd_bus_paths();
         fru_area_vec.emplace_back(std::move(fru_area));
     }
 
@@ -643,18 +659,6 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
         printf("SUCCESS: Populated FRU areas for:[%s]\n",fru_file_name);
     }
 
-#ifdef __IPMI_DEBUG__
-    for(auto& iter : fru_area_vec)
-    {
-        printf("FRU ID : [%d]\n",(iter)->get_fruid());
-        printf("AREA NAME : [%s]\n",(iter)->get_name());
-        printf("TYPE : [%d]\n",(iter)->get_type());
-        printf("LEN : [%d]\n",(iter)->get_len());
-        printf("BUS NAME : [%s]\n", (iter)->get_bus_name());
-        printf("OBJ PATH : [%s]\n", (iter)->get_obj_path());
-        printf("INTF NAME :[%s]\n", (iter)->get_intf_name());
-    }
-#endif
 
     // If the vector is populated with everything, then go ahead and update the
     // inventory.
@@ -671,6 +675,19 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
         }
     }
 
+#ifdef __IPMI_DEBUG__
+    for(auto& iter : fru_area_vec)
+    {
+        printf("FRU ID : [%d]\n",(iter)->get_fruid());
+        printf("AREA NAME : [%s]\n",(iter)->get_name());
+        printf("TYPE : [%d]\n",(iter)->get_type());
+        printf("LEN : [%d]\n",(iter)->get_len());
+        printf("BUS NAME : [%s]\n", (iter)->get_bus_name());
+        printf("OBJ PATH : [%s]\n", (iter)->get_obj_path());
+        printf("INTF NAME :[%s]\n", (iter)->get_intf_name());
+    }
+#endif
+
     // we are done with all that we wanted to do. This will do the job of
     // calling any destructors too.
     fru_area_vec.clear();
-- 
2.7.1
