Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C75951A0B68
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 03:50:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14490750119181000.0465759341481;
 Wed, 2 Dec 2015 08:50:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] set present status True after updating
 inventory
Date: Wed,  2 Dec 2015 11:50:10 -0500
Message-Id: <1449075010-7221-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449075010-7221-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449075010-7221-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 16:50:19 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 readeeprom.C    |  3 +-
 strgfnhandler.C |  6 +++-
 writefrudata.C  | 93 ++++++++++++++++++++++++++++++++++++---------------------
 writefrudata.H  | 14 ++++++++-
 4 files changed, 79 insertions(+), 37 deletions(-)

diff --git a/readeeprom.C b/readeeprom.C
index b9c6f69..561aba4 100644
--- a/readeeprom.C
+++ b/readeeprom.C
@@ -61,7 +61,8 @@ int main(int argc, char **argv)
     {
         // Now that we have the file that contains the eeprom data, go read it and
         // update the Inventory DB.
-        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type);
+        bool set_present = true;
+        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type, set_present);
     }
 
     // Cleanup
diff --git a/strgfnhandler.C b/strgfnhandler.C
index 28406de..a00688f 100644
--- a/strgfnhandler.C
+++ b/strgfnhandler.C
@@ -85,9 +85,13 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	// Get the reference to global sd_bus object
 	sd_bus *bus_type = ipmid_get_sd_bus_connection();
 
+    // Do not need to update present status in the inventory. Its only for
+    // eeprom requirement at this moment. But we may have a need in the future
+    bool set_present = false;
+
     // We received some bytes. It may be full or partial. Send a valid
     // FRU file to the inventory controller on DBus for the correct number
-    ipmi_validate_fru_area(reqptr->frunum, fru_file_name, bus_type);
+    ipmi_validate_fru_area(reqptr->frunum, fru_file_name, bus_type, set_present);
 
     return rc;
 }
diff --git a/writefrudata.C b/writefrudata.C
index ae0d1eb..9b52da2 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -18,7 +18,7 @@ const char  *sys_object_name   =  "/org/openbmc/managers/System";
 const char  *sys_intf_name     =  "org.openbmc.managers.System";
 
 //------------------------------------------------
-// Takes the pointer to stream of bytes and length 
+// Takes the pointer to stream of bytes and length
 // returns the 8 bit checksum per IPMI spec.
 //-------------------------------------------------
 unsigned char calculate_crc(unsigned char *data, int len)
@@ -30,7 +30,7 @@ unsigned char calculate_crc(unsigned char *data, int len)
     {
         crc += *data++;
     }
-    
+
     return(-crc);
 }
 
@@ -74,13 +74,13 @@ uint8_t get_fru_area_type(uint8_t area_offset)
 // Takes FRU data, invokes Parser for each fru record area and updates
 // Inventory
 //------------------------------------------------------------------------
-int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data, 
-                          fru_area_vec_t & area_vec, sd_bus *bus_type)
+int ipmi_update_inventory(const uint8_t fruid, fru_area_vec_t & area_vec,
+                          sd_bus *bus_type, const bool set_present)
 {
     // Now, use this fru dictionary object and connect with FRU Inventory Dbus
     // and update the data for this FRU ID.
     int rc = 0;
-    
+
     // Dictionary object to hold Name:Value pair
     sd_bus_message *fru_dict = NULL;
 
@@ -123,7 +123,7 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
             fprintf(stderr, "ERROR: Invalid Area type :[%d]",area_type);
             break;
         }
- 
+
         // What we need is BOARD_1, PRODUCT_1, CHASSIS_1 etc..
         char fru_area_name[16] = {0};
         sprintf(fru_area_name,"%s%d",area_name, fruid);
@@ -131,16 +131,16 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
 #ifdef __IPMI_DEBUG__
         printf("Updating Inventory with :[%s]\n",fru_area_name);
 #endif
-        // Each area needs a clean set.       
+        // Each area needs a clean set.
         sd_bus_error_free(&bus_error);
         sd_bus_message_unref(response);
         sd_bus_message_unref(fru_dict);
-    
+
         // We want to call a method "getObjectFromId" on System Bus that is
         // made available over  OpenBmc system services.
         rc = sd_bus_call_method(bus_type,                   // On the System Bus
                                 sys_bus_name,               // Service to contact
-                                sys_object_name,            // Object path 
+                                sys_object_name,            // Object path
                                 sys_intf_name,              // Interface name
                                 "getObjectFromId",          // Method to be called
                                 &bus_error,                 // object to return error
@@ -151,12 +151,12 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
 
         if(rc < 0)
         {
-            fprintf(stderr, "Failed to issue method call: %s\n", bus_error.message);
+            fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
             break;
         }
 
         // Method getObjectFromId returns 3 parameters and all are strings, namely
-        // bus_name , object_path and interface name for accessing that particular 
+        // bus_name , object_path and interface name for accessing that particular
         // FRU over Inventory SDBUS manager. 'sss' here mentions that format.
         char *inv_bus_name, *inv_obj_path, *inv_intf_name;
         rc = sd_bus_message_read(response, "(sss)", &inv_bus_name, &inv_obj_path, &inv_intf_name);
@@ -207,7 +207,7 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
         // this.
         rc = sd_bus_call(bus_type,            // On the System Bus
                          fru_dict,            // With the Name:value dictionary array
-                         0,                   // 
+                         0,                   //
                          &bus_error,          // Object to return error.
                          &response);          // Response message if any.
 
@@ -216,6 +216,31 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
             fprintf(stderr, "ERROR:[%s] updating FRU inventory for ID:[0x%X]\n",
                     bus_error.message, fruid);
         }
+        else if(set_present)
+        {
+            printf("SUCCESS: Updated:[%s] successfully. Setting Present status now\n",fru_area_name);
+
+            // Clear any old residue
+            sd_bus_error_free(&bus_error);
+            sd_bus_message_unref(response);
+
+            // If we are asked to set the present status. do it.
+            rc = sd_bus_call_method(bus_type,                   // On the System Bus
+                                    inv_bus_name,               // Service to contact
+                                    inv_obj_path,               // Object path
+                                    inv_intf_name,              // Interface name
+                                    "setPresent",               // Method to be called
+                                    &bus_error,                 // object to return error
+                                    &response,                  // Response message on success
+                                    "s",                        // input message (string)
+                                    "True");                    // First argument to getObjectFromId
+
+            if(rc < 0)
+            {
+                fprintf(stderr, "Failed to update Present status: %s\n", bus_error.message);
+                break;
+            }
+        }
         else
         {
             printf("SUCCESS: Updated:[%s] successfully\n",fru_area_name);
@@ -232,10 +257,10 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
 
 //-------------------------------------------------------------------------
 // Validates the CRC and if found good, calls fru areas parser and calls
-// Inventory Dbus with the dictionary of Name:Value for updating. 
+// Inventory Dbus with the dictionary of Name:Value for updating.
 //-------------------------------------------------------------------------
-int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_data, 
-                                       sd_bus *bus_type)
+int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
+                                       sd_bus *bus_type, const bool set_present)
 {
     // Used for generic checksum calculation
     uint8_t checksum = 0;
@@ -266,7 +291,7 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
     // Validate for first byte to always have a value of [1]
     if(common_hdr[0] != IPMI_FRU_HDR_BYTE_ZERO)
     {
-        fprintf(stderr, "ERROR: Common Header entry_1:[0x%X] Invalid.\n",common_hdr[0]);
+        fprintf(stderr, "Invalid Common Header entry_1:[0x%X]\n",common_hdr[0]);
         return -1;
     }
     else
@@ -279,10 +304,10 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
     if(checksum != common_hdr[IPMI_FRU_HDR_CRC_OFFSET])
     {
 #ifdef __IPMI__DEBUG__
-        fprintf(stderr, "ERROR: Common Header checksum mismatch."
-                " Calculated:[0x%X], Embedded:[0x%X]\n", 
+        fprintf(stderr, "Common Header checksum mismatch."
+                " Calculated:[0x%X], Embedded:[0x%X]\n",
                 checksum, common_hdr[IPMI_FRU_HDR_CRC_OFFSET]);
-#endif    
+#endif
         return -1;
     }
     else
@@ -304,7 +329,7 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
         // product area set at the offset 01 * 8 --> 8 bytes from the START of
         // common header. That means, soon after the header checksum.
         area_offset = common_hdr[fru_entry] * IPMI_EIGHT_BYTES;
-        
+
         if(area_offset)
         {
             memset((void *)&fru_area, 0x0, sizeof(fru_area_t));
@@ -320,7 +345,7 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
             // area. err if first element in the record header is _not_ a [0x01].
             if(fru_area_hdr[0] != IPMI_FRU_HDR_BYTE_ZERO)
             {
-                fprintf(stderr, "ERROR: Unexpected :[0x%X] found at Record header\n",
+                fprintf(stderr, "Unexpected :[0x%X] found at Record header\n",
                         fru_area_hdr[0]);
 
                 // This vector by now may have had some entries. Since this is a
@@ -354,8 +379,8 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
             if(checksum != fru_area_data[fru_area.len-1])
             {
 #ifdef __IPMI_DEBUG__
-                fprintf(stderr, "ERROR: FRU Header checksum mismatch. "
-                        " Calculated:[0x%X], Embedded:[0x%X]\n", 
+                fprintf(stderr, "FRU Header checksum mismatch. "
+                        " Calculated:[0x%X], Embedded:[0x%X]\n",
                         checksum, fru_area_data[fru_area.len - 1]);
 #endif
                 // This vector by now may have had some entries. Since this is a
@@ -375,19 +400,19 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
             // needed while handling each areas.
         } // If the packet has data for a particular data record.
     } // End walking all the fru records.
-        
+
     // If we reach here, then we have validated the crc for all the records and
     // time to call FRU area parser to get a Name:Value pair dictionary.
     // This will start iterating all over again on the buffer -BUT- now with the
     // job of taking each areas, getting it parsed and then updating the
     // DBUS.
-        
+
     if(!(fru_area_vec.empty()))
     {
-        rc =  ipmi_update_inventory(fruid, fru_data, fru_area_vec, bus_type);
+        rc =  ipmi_update_inventory(fruid, fru_area_vec, bus_type, set_present);
     }
- 
-    // We are done with this FRU write packet. 
+
+    // We are done with this FRU write packet.
     fru_area_vec.clear();
 
     return rc;
@@ -396,8 +421,8 @@ int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_d
 ///-----------------------------------------------------
 // Accepts the filename and validates per IPMI FRU spec
 //----------------------------------------------------
-int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name, 
-						   sd_bus *bus_type)
+int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
+                           sd_bus *bus_type, const bool set_present)
 {
     int file_size = 0;
     uint8_t *fru_data = NULL;
@@ -434,17 +459,17 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
     bytes_read = fread(fru_data, file_size, 1, fru_file);
     if(bytes_read != 1)
     {
-        fprintf(stderr, "ERROR reading common header. Bytes read=:[%d]\n",bytes_read);
+        fprintf(stderr, "failed reading common header. Bytes read=:[%d]\n",bytes_read);
         perror("Error:");
         fclose(fru_file);
         return -1;
     }
     fclose(fru_file);
 
-    rc = ipmi_validate_and_update_inventory(fruid, fru_data, bus_type);
-    if(rc == -1)
+    rc = ipmi_validate_and_update_inventory(fruid, fru_data, bus_type, set_present);
+    if(rc < 0)
     {
-        printf("ERROR: Validation failed for:[%d]\n",fruid);
+        fprintf(stderr,"Validation failed for:[%d]\n",fruid);
     }
     else
     {
diff --git a/writefrudata.H b/writefrudata.H
index 89c20ac..9c0c6b3 100644
--- a/writefrudata.H
+++ b/writefrudata.H
@@ -5,6 +5,10 @@
 #include <stddef.h>
 #include <systemd/sd-bus.h>
 
+#ifndef __cplusplus
+#include <stdbool.h> // For bool variable
+#endif
+
 // IPMI commands for Storage net functions.
 enum ipmi_netfn_storage_cmds
 {
@@ -51,6 +55,14 @@ typedef struct
 #define IPMI_FRU_HDR_CRC_OFFSET  offsetof(struct common_header, crc)
 #define IPMI_EIGHT_BYTES         8
 
-extern "C" int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *);
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *, const bool);
+
+#ifdef __cplusplus
+} // extern C
+#endif
 
 #endif
-- 
2.6.3
