Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 56CB01A075A
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 20:50:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145345621248748.35768567341279;
 Fri, 22 Jan 2016 01:50:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v5] Set Fault and Present status while
 handling fru
Date: Fri, 22 Jan 2016 03:50:11 -0600
Message-Id: <1453456211-3044-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453456211-3044-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453456211-3044-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 09:50:25 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 fru-area.H      | 154 ++++++++++++
 readeeprom.C    |  10 +-
 strgfnhandler.C |  25 +-
 writefrudata.C  | 770 +++++++++++++++++++++++++++++++++++---------------------
 writefrudata.H  |  11 +-
 5 files changed, 652 insertions(+), 318 deletions(-)
 create mode 100644 fru-area.H

diff --git a/fru-area.H b/fru-area.H
new file mode 100644
index 0000000..82206bb
--- /dev/null
+++ b/fru-area.H
@@ -0,0 +1,154 @@
+#ifndef __IPMI_FRU_AREA_H__
+#define __IPMI_FRU_AREA_H__
+
+#include <stdint.h>
+#include <stddef.h>
+#include <systemd/sd-bus.h>
+#include <string>
+#include <vector>
+#include <memory>
+#include "frup.h"
+#include "writefrudata.H"
+
+class ipmi_fru;
+typedef std::vector<std::unique_ptr<ipmi_fru>> fru_area_vec_t;
+
+class ipmi_fru
+{
+    private:
+        // Unique way of identifying a FRU
+        uint8_t iv_fruid;
+
+        // Type of the fru matching offsets in common header
+        ipmi_fru_area_type iv_type;
+
+        // Name of the fru area. ( BOARD/CHASSIS/PRODUCT )
+        std::string iv_name;
+
+        // Length of a specific fru area.
+        size_t  iv_len;
+
+        // Special bit for BMC readable eeprom only.
+        bool iv_bmc_fru;
+
+        // If a FRU is physically present.
+        bool iv_present;
+
+        // Whether a particular area is valid ?
+        bool iv_valid;
+
+        // Actual area data.
+        uint8_t *iv_data;
+
+        // fru inventory dbus name
+        std::string iv_bus_name;
+
+        // fru inventory dbus object path
+        std::string iv_obj_path;
+
+        // fru inventory dbus interface name
+        std::string iv_intf_name;
+
+        // sd_bus handle
+        sd_bus *iv_bus_type;
+
+        // Default constructor disabled.
+        ipmi_fru();
+
+    public:
+        // constructor
+        ipmi_fru(const uint8_t fruid, const ipmi_fru_area_type type,
+                 sd_bus *bus_type, bool bmc_fru = false);
+
+        // Destructor
+        virtual ~ipmi_fru();
+
+        // If a particular area has been marked valid / invalid
+        inline bool is_valid() const
+        {
+            return iv_valid;
+        }
+
+        // Sets the present bit
+        inline void set_present(const bool present)
+        {
+            iv_present = present;
+        }
+
+        // Sets the valid bit for a corresponding area.
+        inline void set_valid(const bool valid)
+        {
+            iv_valid = valid;
+        }
+
+        // If a particular area accessible only by BMC
+        inline bool is_bmc_fru() const
+        {
+            return iv_bmc_fru;
+        }
+
+        // returns fru id;
+        uint8_t get_fruid() const
+        {
+            return iv_fruid;
+        }
+
+        // Returns the length.
+        size_t get_len() const
+        {
+            return iv_len;
+        }
+
+        // Returns the type of the current fru area
+        ipmi_fru_area_type get_type() const
+        {
+            return iv_type;
+        }
+
+        // Returns the name
+        const char *get_name() const
+        {
+            return iv_name.c_str();
+        }
+
+        // Returns SD bus name
+        const char *get_bus_name() const
+        {
+            return iv_bus_name.c_str();
+        }
+
+        // Retrns SD bus object path
+        const char *get_obj_path() const
+        {
+            return iv_obj_path.c_str();
+        }
+
+        // Returns SD bus interface name
+        const char *get_intf_name() const
+        {
+            return iv_intf_name.c_str();
+        }
+
+        // Returns the data portion
+        inline uint8_t *get_data() const
+        {
+           return iv_data;
+        }
+
+        // Returns the bus type.
+        inline sd_bus *get_bus_type() const
+        {
+            return iv_bus_type;
+        }
+
+        // Sets up the sd_bus variables for the given AREA type
+        int setup_sd_bus_paths(void);
+
+        // Accepts a pointer to data and sets it in the object.
+        void set_data(const uint8_t *, const size_t);
+
+        // Sets the dbus parameters
+        void update_dbus_paths(const char *, const char *, const char *);
+};
+
+#endif
diff --git a/readeeprom.C b/readeeprom.C
index 561aba4..b78f35e 100644
--- a/readeeprom.C
+++ b/readeeprom.C
@@ -12,7 +12,7 @@ static void exit_with_error(const char* err, char** argv)
 }
 
 //--------------------------------------------------------------------------
-// This gets called by udev monitor soon after seeing hog plugs for EEPROMS. 
+// This gets called by udev monitor soon after seeing hog plugs for EEPROMS.
 //--------------------------------------------------------------------------
 int main(int argc, char **argv)
 {
@@ -21,7 +21,7 @@ int main(int argc, char **argv)
 
     // Handle to per process system bus
     sd_bus *bus_type = NULL;
-    
+
     // Read the arguments.
     auto cli_options = std::make_unique<ArgumentParser>(argc, argv);
 
@@ -53,7 +53,7 @@ int main(int argc, char **argv)
 
     // Get a handle to System Bus
     rc = sd_bus_open_system(&bus_type);
-    if (rc < 0) 
+    if (rc < 0)
     {
         fprintf(stderr, "Failed to connect to system bus: %s\n",strerror(-rc));
     }
@@ -61,8 +61,8 @@ int main(int argc, char **argv)
     {
         // Now that we have the file that contains the eeprom data, go read it and
         // update the Inventory DB.
-        bool set_present = true;
-        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type, set_present);
+        bool bmc_fru = true;
+        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type, bmc_fru);
     }
 
     // Cleanup
diff --git a/strgfnhandler.C b/strgfnhandler.C
index a00688f..eda4290 100644
--- a/strgfnhandler.C
+++ b/strgfnhandler.C
@@ -11,8 +11,8 @@ sd_bus* ipmid_get_sd_bus_connection(void);
 ///-------------------------------------------------------
 // Called by IPMI netfn router for write fru data command
 //--------------------------------------------------------
-ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
-                              ipmi_request_t request, ipmi_response_t response, 
+ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                              ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
     FILE *fp = NULL;
@@ -38,7 +38,7 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // On error there is no response data for this command.
     *data_len = 0;
-    
+
 #ifdef __IPMI__DEBUG__
     printf("IPMI WRITE-FRU-DATA for [%s]  Offset = [%d] Length = [%d]\n",
             fru_file_name, offset, len);
@@ -59,17 +59,17 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
             fclose(fp);
             return rc;
         }
-    
+
         if(fwrite(&reqptr->data, len, 1, fp) != 1)
         {
             perror("Error:");
             fclose(fp);
             return rc;
         }
-    
+
         fclose(fp);
-    } 
-    else 
+    }
+    else
     {
         fprintf(stderr, "Error trying to write to fru file %s\n",fru_file_name);
         return rc;
@@ -82,16 +82,13 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     *data_len = 1;
     rc = IPMI_CC_OK;
 
-	// Get the reference to global sd_bus object
-	sd_bus *bus_type = ipmid_get_sd_bus_connection();
-
-    // Do not need to update present status in the inventory. Its only for
-    // eeprom requirement at this moment. But we may have a need in the future
-    bool set_present = false;
+    // Get the reference to global sd_bus object
+    sd_bus *bus_type = ipmid_get_sd_bus_connection();
 
     // We received some bytes. It may be full or partial. Send a valid
     // FRU file to the inventory controller on DBus for the correct number
-    ipmi_validate_fru_area(reqptr->frunum, fru_file_name, bus_type, set_present);
+    bool bmc_fru = false;
+    ipmi_validate_fru_area(reqptr->frunum, fru_file_name, bus_type, bmc_fru);
 
     return rc;
 }
diff --git a/writefrudata.C b/writefrudata.C
index 9b52da2..8771a92 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -3,28 +3,235 @@
 #include <dlfcn.h>
 #include <errno.h>
 #include <stdio.h>
-#include "frup.h"
-#include "writefrudata.H"
 #include <systemd/sd-bus.h>
 #include <unistd.h>
 #include <host-ipmid/ipmid-api.h>
-
-// Needed to be passed into fru parser alorithm
-typedef std::vector<fru_area_t> fru_area_vec_t;
+#include <iostream>
+#include <memory>
+#include <algorithm>
+#include <fstream>
+#include "frup.h"
+#include "fru-area.H"
 
 // OpenBMC System Manager dbus framework
 const char  *sys_bus_name      =  "org.openbmc.managers.System";
 const char  *sys_object_name   =  "/org/openbmc/managers/System";
 const char  *sys_intf_name     =  "org.openbmc.managers.System";
 
+//----------------------------------------------------------------
+// Constructor
+//----------------------------------------------------------------
+ipmi_fru::ipmi_fru(const uint8_t fruid, const ipmi_fru_area_type type,
+                   sd_bus *bus_type, bool bmc_fru)
+{
+    iv_fruid = fruid;
+    iv_type = type;
+    iv_bmc_fru = bmc_fru;
+    iv_bus_type = bus_type;
+    iv_valid = false;
+    iv_data = NULL;
+    iv_present = false;
+
+    if(iv_type == IPMI_FRU_AREA_INTERNAL_USE)
+    {
+        iv_name = "INTERNAL_";
+    }
+    else if(iv_type == IPMI_FRU_AREA_CHASSIS_INFO)
+    {
+        iv_name = "CHASSIS_";
+    }
+    else if(iv_type == IPMI_FRU_AREA_BOARD_INFO)
+    {
+        iv_name = "BOARD_";
+    }
+    else if(iv_type == IPMI_FRU_AREA_PRODUCT_INFO)
+    {
+        iv_name = "PRODUCT_";
+    }
+    else if(iv_type == IPMI_FRU_AREA_MULTI_RECORD)
+    {
+        iv_name = "MULTI_";
+    }
+    else
+    {
+        iv_name = IPMI_FRU_AREA_TYPE_MAX;
+        fprintf(stderr, "ERROR: Invalid Area type :[%d]\n",iv_type);
+    }
+}
+
+//-----------------------------------------------------
+// For a FRU area type, accepts the data and updates
+// area specific data.
+//-----------------------------------------------------
+void ipmi_fru::set_data(const uint8_t *data, const size_t len)
+{
+    iv_len = len;
+    iv_data = new uint8_t[len];
+    memcpy(iv_data, data, len);
+}
+
+//-----------------------------------------------------
+// Sets the dbus parameters
+//-----------------------------------------------------
+void ipmi_fru::update_dbus_paths(const char *bus_name,
+                      const char *obj_path, const char *intf_name)
+{
+    iv_bus_name = bus_name;
+    iv_obj_path = obj_path;
+    iv_intf_name = intf_name;
+}
+
+//-------------------
+// Destructor
+//-------------------
+ipmi_fru::~ipmi_fru()
+{
+    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+    sd_bus_message *response = NULL;
+    int rc = 0;
+
+    if(iv_data != NULL)
+    {
+        delete [] iv_data;
+        iv_data = NULL;
+    }
+
+    // If we have not been successful in doing some updates and we are a BMC
+    // fru, then need to set the fault bits.
+    bool valid_dbus = !(iv_bus_name.empty()) &&
+                      !(iv_obj_path.empty()) &&
+                      !(iv_intf_name.empty());
+
+    // Based on bmc_fru, success in updating the FRU inventory we need to set
+    // some special bits.
+    if(iv_bmc_fru && valid_dbus)
+    {
+        // Set the Fault bit if we did not successfully process the fru
+        const char *fault_bit = iv_valid ? "False" : "True";
+
+        rc = sd_bus_call_method(iv_bus_type,                // On the System Bus
+                                iv_bus_name.c_str(),        // Service to contact
+                                iv_obj_path.c_str(),        // Object path
+                                iv_intf_name.c_str(),       // Interface name
+                                "setFault",                 // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                "s",                        // input message (string)
+                                fault_bit);                 // First argument to setFault
+
+        if(rc <0)
+        {
+            fprintf(stderr,"Failed to set Fault bit, value:[%s] for fruid:[%d], path:[%s]\n",
+                    fault_bit, iv_fruid, iv_obj_path.c_str());
+        }
+        else
+        {
+            printf("Fault bit set to :[%s] for fruid:[%d], Path:[%s]\n",
+                    fault_bit, iv_fruid,iv_obj_path.c_str());
+        }
+
+        sd_bus_error_free(&bus_error);
+        sd_bus_message_unref(response);
+
+        // Set the Present bits
+        const char *present_bit = iv_present ? "True" : "False";
+
+        rc = sd_bus_call_method(iv_bus_type,                // On the System Bus
+                                iv_bus_name.c_str(),        // Service to contact
+                                iv_obj_path.c_str(),        // Object path
+                                iv_intf_name.c_str(),       // Interface name
+                                "setPresent",               // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                "s",                        // input message (string)
+                                present_bit);               // First argument to setPresent
+        if(rc < 0)
+        {
+            fprintf(stderr,"Failed to set Present bit for fruid:[%d], path:[%s]\n",
+                    iv_fruid, iv_obj_path.c_str());
+        }
+        else
+        {
+            printf("Present bit set to :[%s] for fruid:[%d]\n",
+                    iv_obj_path.c_str(), iv_fruid);
+        }
+
+        sd_bus_error_free(&bus_error);
+        sd_bus_message_unref(response);
+    }
+}
+
+// Sets up the sd_bus structures for the given fru type
+int ipmi_fru::setup_sd_bus_paths(void)
+{
+    // Need this to get respective DBUS objects
+    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+    sd_bus_message *response = NULL;
+    int rc = 0;
+
+    // What we need is BOARD_1, PRODUCT_1, CHASSIS_1 etc..
+    char *inv_bus_name, *inv_obj_path, *inv_intf_name;
+    char fru_area_name[16] = {0};
+    sprintf(fru_area_name,"%s%d",iv_name.c_str(), iv_fruid);
+
+#ifdef __IPMI_DEBUG__
+    printf("Getting sd_bus for :[%s]\n",fru_area_name);
+#endif
+
+    // We want to call a method "getObjectFromId" on System Bus that is
+    // made available over  OpenBmc system services.
+    rc = sd_bus_call_method(iv_bus_type,                // On the System Bus
+                            sys_bus_name,               // Service to contact
+                            sys_object_name,            // Object path
+                            sys_intf_name,              // Interface name
+                            "getObjectFromId",          // Method to be called
+                            &bus_error,                 // object to return error
+                            &response,                  // Response message on success
+                            "ss",                       // input message (string,string)
+                            "FRU_STR",                  // First argument to getObjectFromId
+                            fru_area_name);             // Second Argument
+
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to resolve fruid:[%d] to dbus: [%s]\n", iv_fruid, bus_error.message);
+    }
+    else
+    {
+        // Method getObjectFromId returns 3 parameters and all are strings, namely
+        // bus_name , object_path and interface name for accessing that particular
+        // FRU over Inventory SDBUS manager. 'sss' here mentions that format.
+        rc = sd_bus_message_read(response, "(sss)", &inv_bus_name, &inv_obj_path, &inv_intf_name);
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
+        }
+        else
+        {
+            // Update the paths in the area object
+            update_dbus_paths(inv_bus_name, inv_obj_path, inv_intf_name);
+        }
+    }
+
+#ifdef __IPMI_DEBUG__
+            printf("fru_area=[%s], inv_bus_name=[%s], inv_obj_path=[%s], inv_intf_name=[%s]\n",
+                    fru_area_name, inv_bus_name, inv_obj_path, inv_intf_name);
+#endif
+
+    sd_bus_error_free(&bus_error);
+    sd_bus_message_unref(response);
+
+    return rc;
+}
+
 //------------------------------------------------
 // Takes the pointer to stream of bytes and length
-// returns the 8 bit checksum per IPMI spec.
+// and returns the 8 bit checksum
+// This algo is per IPMI V2.0 spec
 //-------------------------------------------------
-unsigned char calculate_crc(unsigned char *data, int len)
+unsigned char calculate_crc(const unsigned char *data, size_t len)
 {
     char crc = 0;
-    int byte = 0;
+    size_t byte = 0;
 
     for(byte = 0; byte < len; byte++)
     {
@@ -37,7 +244,7 @@ unsigned char calculate_crc(unsigned char *data, int len)
 //---------------------------------------------------------------------
 // Accepts a fru area offset in commom hdr and tells which area it is.
 //---------------------------------------------------------------------
-uint8_t get_fru_area_type(uint8_t area_offset)
+ipmi_fru_area_type get_fru_area_type(uint8_t area_offset)
 {
     ipmi_fru_area_type type = IPMI_FRU_AREA_TYPE_MAX;
 
@@ -70,15 +277,56 @@ uint8_t get_fru_area_type(uint8_t area_offset)
     return type;
 }
 
+///-----------------------------------------------
+// Validates the data for crc and mandatory fields
+///-----------------------------------------------
+int verify_fru_data(const uint8_t *data, const size_t len)
+{
+    uint8_t checksum = 0;
+    int rc = -1;
+
+    // Validate for first byte to always have a value of [1]
+    if(data[0] != IPMI_FRU_HDR_BYTE_ZERO)
+    {
+        fprintf(stderr, "Invalid entry:[%d] in byte-0\n",data[0]);
+        return rc;
+    }
+#ifdef __IPMI_DEBUG__
+    else
+    {
+        printf("SUCCESS: Validated [0x%X] in entry_1 of fru_data\n",data[0]);
+    }
+#endif
+
+    // See if the calculated CRC matches with the embedded one.
+    // CRC to be calculated on all except the last one that is CRC itself.
+    checksum = calculate_crc(data, len - 1);
+    if(checksum != data[len-1])
+    {
+#ifdef __IPMI_DEBUG__
+        fprintf(stderr, "Checksum mismatch."
+                " Calculated:[0x%X], Embedded:[0x%X]\n",
+                checksum, data[len]);
+#endif
+        return rc;
+    }
+#ifdef __IPMI_DEBUG__
+    else
+    {
+        printf("SUCCESS: Checksum matches:[0x%X]\n",checksum);
+    }
+#endif
+
+    return EXIT_SUCCESS;
+}
+
 //------------------------------------------------------------------------
 // Takes FRU data, invokes Parser for each fru record area and updates
 // Inventory
 //------------------------------------------------------------------------
-int ipmi_update_inventory(const uint8_t fruid, fru_area_vec_t & area_vec,
-                          sd_bus *bus_type, const bool set_present)
+int ipmi_update_inventory(fru_area_vec_t & area_vec)
 {
-    // Now, use this fru dictionary object and connect with FRU Inventory Dbus
-    // and update the data for this FRU ID.
+    // Generic error reporter
     int rc = 0;
 
     // Dictionary object to hold Name:Value pair
@@ -87,100 +335,29 @@ int ipmi_update_inventory(const uint8_t fruid, fru_area_vec_t & area_vec,
     // SD Bus error report mechanism.
     sd_bus_error bus_error = SD_BUS_ERROR_NULL;
 
-    // Req message contains the specifics about which method etc that we want to
-    // access on which bus, object
+    // Response from sd bus calls
     sd_bus_message *response = NULL;
 
     // For each FRU area, extract the needed data , get it parsed and update
     // the Inventory.
     for(auto& iter : area_vec)
     {
-        uint8_t area_type = (iter).type;
-
-        uint8_t area_data[(iter).len];
-        memset(area_data, 0x0, sizeof(area_data));
-
-        // Grab area specific data
-        memmove(area_data, (iter).offset, (iter).len);
-
-        // Need this to get respective DBUS objects
-        const char *area_name  = NULL;
-
-        if(area_type == IPMI_FRU_AREA_CHASSIS_INFO)
-        {
-            area_name = "CHASSIS_";
-        }
-        else if(area_type == IPMI_FRU_AREA_BOARD_INFO)
-        {
-            area_name = "BOARD_";
-        }
-        else if(area_type == IPMI_FRU_AREA_PRODUCT_INFO)
-        {
-            area_name = "PRODUCT_";
-        }
-        else
-        {
-            fprintf(stderr, "ERROR: Invalid Area type :[%d]",area_type);
-            break;
-        }
-
-        // What we need is BOARD_1, PRODUCT_1, CHASSIS_1 etc..
-        char fru_area_name[16] = {0};
-        sprintf(fru_area_name,"%s%d",area_name, fruid);
-
-#ifdef __IPMI_DEBUG__
-        printf("Updating Inventory with :[%s]\n",fru_area_name);
-#endif
-        // Each area needs a clean set.
+        // Start fresh on each.
         sd_bus_error_free(&bus_error);
         sd_bus_message_unref(response);
         sd_bus_message_unref(fru_dict);
 
-        // We want to call a method "getObjectFromId" on System Bus that is
-        // made available over  OpenBmc system services.
-        rc = sd_bus_call_method(bus_type,                   // On the System Bus
-                                sys_bus_name,               // Service to contact
-                                sys_object_name,            // Object path
-                                sys_intf_name,              // Interface name
-                                "getObjectFromId",          // Method to be called
-                                &bus_error,                 // object to return error
-                                &response,                  // Response message on success
-                                "ss",                       // input message (string,byte)
-                                "FRU_STR",                  // First argument to getObjectFromId
-                                fru_area_name);             // Second Argument
-
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to resolve fruid to dbus: %s\n", bus_error.message);
-            break;
-        }
-
-        // Method getObjectFromId returns 3 parameters and all are strings, namely
-        // bus_name , object_path and interface name for accessing that particular
-        // FRU over Inventory SDBUS manager. 'sss' here mentions that format.
-        char *inv_bus_name, *inv_obj_path, *inv_intf_name;
-        rc = sd_bus_message_read(response, "(sss)", &inv_bus_name, &inv_obj_path, &inv_intf_name);
-        if(rc < 0)
-        {
-            fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-            break;
-        }
-
-#ifdef __IPMI_DEBUG__
-        printf("fru_area=[%s], inv_bus_name=[%s], inv_obj_path=[%s],inv_intf_name=[%s]\n",
-                fru_area_name, inv_bus_name, inv_obj_path, inv_intf_name);
-#endif
-
         // Constructor to allow further initializations and customization.
-        rc = sd_bus_message_new_method_call(bus_type,
+        rc = sd_bus_message_new_method_call((iter)->get_bus_type(),
                                             &fru_dict,
-                                            inv_bus_name,
-                                            inv_obj_path,
-                                            inv_intf_name,
+                                            (iter)->get_bus_name(),
+                                            (iter)->get_obj_path(),
+                                            (iter)->get_intf_name(),
                                             "update");
         if(rc < 0)
         {
-            fprintf(stderr,"ERROR: creating a update method call\n");
+            fprintf(stderr,"ERROR: creating a update method call for bus_name:[%s]\n",
+                    (iter)->get_bus_name());
             break;
         }
 
@@ -193,7 +370,7 @@ int ipmi_update_inventory(const uint8_t fruid, fru_area_vec_t & area_vec,
         }
 
         // Fill the container with information
-        rc = parse_fru_area((iter).type, (void *)area_data, (iter).len, fru_dict);
+        rc = parse_fru_area((iter)->get_type(), (void *)(iter)->get_data(), (iter)->get_len(), fru_dict);
         if(rc < 0)
         {
             fprintf(stderr,"ERROR parsing FRU records\n");
@@ -205,283 +382,298 @@ int ipmi_update_inventory(const uint8_t fruid, fru_area_vec_t & area_vec,
         // Now, Make the actual call to update the FRU inventory database with the
         // dictionary given by FRU Parser. There is no response message expected for
         // this.
-        rc = sd_bus_call(bus_type,            // On the System Bus
-                         fru_dict,            // With the Name:value dictionary array
-                         0,                   //
-                         &bus_error,          // Object to return error.
-                         &response);          // Response message if any.
+        rc = sd_bus_call((iter)->get_bus_type(),     // On the System Bus
+                         fru_dict,                   // With the Name:value dictionary array
+                         0,                          //
+                         &bus_error,                 // Object to return error.
+                         &response);                 // Response message if any.
 
         if(rc < 0)
         {
             fprintf(stderr, "ERROR:[%s] updating FRU inventory for ID:[0x%X]\n",
-                    bus_error.message, fruid);
+                    bus_error.message, (iter)->get_fruid());
+            break;
         }
-        else if(set_present)
+        else if((iter)->is_bmc_fru())
         {
-            printf("SUCCESS: Updated:[%s] successfully. Setting Present status now\n",fru_area_name);
-
-            // Clear any old residue
-            sd_bus_error_free(&bus_error);
-            sd_bus_message_unref(response);
-
-            // If we are asked to set the present status. do it.
-            rc = sd_bus_call_method(bus_type,                   // On the System Bus
-                                    inv_bus_name,               // Service to contact
-                                    inv_obj_path,               // Object path
-                                    inv_intf_name,              // Interface name
-                                    "setPresent",               // Method to be called
-                                    &bus_error,                 // object to return error
-                                    &response,                  // Response message on success
-                                    "s",                        // input message (string)
-                                    "True");                    // First argument to getObjectFromId
+            // For FRUs that are accessible by HostBoot, host boot does all of
+            // these.
+            printf("SUCCESS: Updated:[%s_%d] successfully. Setting Valid bit\n",
+                    (iter)->get_name(), (iter)->get_fruid());
 
-            if(rc < 0)
-            {
-                fprintf(stderr, "Failed to update Present status: %s\n", bus_error.message);
-                break;
-            }
+            (iter)->set_valid(true);
         }
         else
         {
-            printf("SUCCESS: Updated:[%s] successfully\n",fru_area_name);
+            printf("SUCCESS: Updated:[%s_%d] successfully\n",
+                        (iter)->get_name(), (iter)->get_fruid());
         }
     } // END walking the vector of areas and updating
 
     sd_bus_error_free(&bus_error);
     sd_bus_message_unref(response);
     sd_bus_message_unref(fru_dict);
-    sd_bus_unref(bus_type);
 
     return rc;
 }
 
-//-------------------------------------------------------------------------
-// Validates the CRC and if found good, calls fru areas parser and calls
-// Inventory Dbus with the dictionary of Name:Value for updating.
-//-------------------------------------------------------------------------
-int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
-                                       sd_bus *bus_type, const bool set_present)
+///----------------------------------------------------
+// Checks if a particular fru area is populated or not
+///----------------------------------------------------
+bool remove_invalid_area(const std::unique_ptr<ipmi_fru> &fru_area)
 {
-    // Used for generic checksum calculation
-    uint8_t checksum = 0;
-
-    // This can point to any FRU entry.
-    uint8_t fru_entry;
-
-    // A generic offset locator for any FRU record.
-    size_t area_offset = 0;
-
-    // First 2 bytes in the record.
-    uint8_t fru_area_hdr[2] = {0};
-
-    // To hold info about individual FRU record areas.
-    fru_area_t fru_area;
-
-    // For parsing and updating Inventory.
-    fru_area_vec_t fru_area_vec;
-
-    int rc = 0;
-
-    uint8_t common_hdr[sizeof(struct common_header)] = {0};
-    memset(common_hdr, 0x0, sizeof(common_hdr));
-
-    // Copy first 8 bytes to verify common header
-    memcpy(common_hdr, fru_data, sizeof(common_hdr));
-
-    // Validate for first byte to always have a value of [1]
-    if(common_hdr[0] != IPMI_FRU_HDR_BYTE_ZERO)
-    {
-        fprintf(stderr, "Invalid Common Header entry_1:[0x%X]\n",common_hdr[0]);
-        return -1;
-    }
-    else
-    {
-        printf("SUCCESS: Validated [0x%X] in common header\n",common_hdr[0]);
-    }
-
-    // Validate the header checskum that is at last byte ( Offset: 7 )
-    checksum = calculate_crc(common_hdr, sizeof(common_hdr)-1);
-    if(checksum != common_hdr[IPMI_FRU_HDR_CRC_OFFSET])
-    {
-#ifdef __IPMI__DEBUG__
-        fprintf(stderr, "Common Header checksum mismatch."
-                " Calculated:[0x%X], Embedded:[0x%X]\n",
-                checksum, common_hdr[IPMI_FRU_HDR_CRC_OFFSET]);
-#endif
-        return -1;
-    }
-    else
+    // Filter the ones that do not have dbus reference.
+    if((strlen((fru_area)->get_bus_name()) == 0) ||
+       (strlen((fru_area)->get_obj_path()) == 0)  ||
+       (strlen((fru_area)->get_intf_name()) == 0))
     {
-        printf("SUCCESS: Common Header checksum MATCH:[0x%X]\n",checksum);
+        return true;
     }
+    return false;
+}
 
-    //-------------------------------------------
-    // TODO:  Add support for Multi Record later
-    //-------------------------------------------
-
-    //  Now start walking the common_hdr array that has offsets into other FRU
-    //  record areas and validate those. Starting with second entry since the
-    //  first one is always a [0x01]
-    for(fru_entry = IPMI_FRU_INTERNAL_OFFSET; fru_entry < (sizeof(struct common_header) -2); fru_entry++)
+///----------------------------------------------------------------------------------
+// Populates various FRU areas
+// @prereq : This must be called only after validating common header.
+///----------------------------------------------------------------------------------
+int ipmi_populate_fru_areas(uint8_t *fru_data, const size_t data_len,
+                            fru_area_vec_t & fru_area_vec)
+{
+    size_t area_offset = 0;
+    int rc = -1;
+
+    // Now walk the common header and see if the file size has atleast the last
+    // offset mentioned by the common_hdr. If the file size is less than the
+    // offset of any if the fru areas mentioned in the common header, then we do
+    // not have a complete file.
+    for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
+            fru_entry < (sizeof(struct common_header) -2); fru_entry++)
     {
-        // Offset is 'value given in' internal_offset * 8 from the START of
-        // common header. So an an example, 01 00 00 00 01 00 00 fe has
-        // product area set at the offset 01 * 8 --> 8 bytes from the START of
-        // common header. That means, soon after the header checksum.
-        area_offset = common_hdr[fru_entry] * IPMI_EIGHT_BYTES;
-
-        if(area_offset)
+        // Actual offset in the payload is the offset mentioned in common header
+        // multipled by 8. Common header is always the first 8 bytes.
+        area_offset = fru_data[fru_entry] * IPMI_EIGHT_BYTES;
+        if(area_offset && (data_len < (area_offset + 2)))
+        {
+            // Our file size is less than what it needs to be. +2 because we are
+            // using area len that is at 2 byte off area_offset
+            fprintf(stderr, "fru file is incomplete. Size:[%d]\n",data_len);
+            return rc;
+        }
+        else if(area_offset)
         {
-            memset((void *)&fru_area, 0x0, sizeof(fru_area_t));
+            // Read 2 bytes to know the actual size of area.
+            uint8_t area_hdr[2] = {0};
+            memcpy(area_hdr, &((uint8_t *)fru_data)[area_offset], sizeof(area_hdr));
 
-            // Enumerated FRU area.
-            fru_area.type = get_fru_area_type(fru_entry);
+            // Size of this area will be the 2nd byte in the fru area header.
+            size_t  area_len = area_hdr[1] * IPMI_EIGHT_BYTES;
+            uint8_t area_data[area_len] = {0};
 
-            // From start of fru header + record offset, copy 2 bytes.
-            fru_area.offset = &((uint8_t *)fru_data)[area_offset];
-            memcpy(fru_area_hdr, fru_area.offset, sizeof(fru_area_hdr));
+            printf("fru data size:[%d], area offset:[%d], area_size:[%d]\n",
+                    data_len, area_offset, area_len);
 
-            // A NON zero value means that the vpd packet has the data for that
-            // area. err if first element in the record header is _not_ a [0x01].
-            if(fru_area_hdr[0] != IPMI_FRU_HDR_BYTE_ZERO)
+            // See if we really have that much buffer. We have area offset amd
+            // from there, the actual len.
+            if(data_len < (area_len + area_offset))
             {
-                fprintf(stderr, "Unexpected :[0x%X] found at Record header\n",
-                        fru_area_hdr[0]);
+                fprintf(stderr, "Incomplete Fru file.. Size:[%d]\n",data_len);
+                return rc;
+            }
+
+            // Save off the data.
+            memcpy(area_data, &((uint8_t *)fru_data)[area_offset], area_len);
 
-                // This vector by now may have had some entries. Since this is a
-                // failure now, clear the state data.
-                fru_area_vec.clear();
-                return -1;
+            // Validate the crc
+            rc = verify_fru_data(area_data, area_len);
+            if(rc < 0)
+            {
+                fprintf(stderr, "Error validating fru area. offset:[%d]\n",area_offset);
+                return rc;
             }
             else
             {
-                printf("SUCCESS: Validated [0x%X] in fru record:[%d] header\n",
-                        fru_area_hdr[0],fru_entry);
+                printf("Successfully verified area checksum. offset:[%d]\n",area_offset);
             }
 
-            // Read Length bytes ( makes a complete record read now )
-            fru_area.len = fru_area_hdr[1] * IPMI_EIGHT_BYTES;
-#ifdef __IPMI_DEBUG__
-            printf("AREA NO[%d], SIZE = [%d]\n",fru_entry, fru_area.len);
-#endif
-            uint8_t fru_area_data[fru_area.len];
-            memset(fru_area_data, 0x0, sizeof(fru_area_data));
+            // We already have a vector that is passed to us containing all
+            // of the fields populated. Update the data portion now.
+            for(auto& iter : fru_area_vec)
+            {
+                if((iter)->get_type() == get_fru_area_type(fru_entry))
+                {
+                    (iter)->set_data(area_data, area_len);
+                }
+            }
+        } // If we have fru data present
+    } // Walk common_hdr
 
-            memmove(fru_area_data, fru_area.offset, sizeof(fru_area_data));
+    // Not all the fields will be populated in a fru data. Mostly all cases will
+    // not have more than 2 or 3.
+    fru_area_vec.erase(std::remove_if(fru_area_vec.begin(), fru_area_vec.end(),
+                       remove_invalid_area), fru_area_vec.end());
 
-            // Calculate checksum (from offset -> (Length-1)).
-            // All the bytes except the last byte( which is CRC :) ) will
-            // participate in calculating the checksum.
-            checksum = calculate_crc(fru_area_data, sizeof(fru_area_data)-1);
+    return EXIT_SUCCESS;
+}
 
-            // Verify the embedded checksum in last byte with calculated checksum
-            // record_len -1 since length is some N but numbering is 0..N-1
-            if(checksum != fru_area_data[fru_area.len-1])
-            {
-#ifdef __IPMI_DEBUG__
-                fprintf(stderr, "FRU Header checksum mismatch. "
-                        " Calculated:[0x%X], Embedded:[0x%X]\n",
-                        checksum, fru_area_data[fru_area.len - 1]);
-#endif
-                // This vector by now may have had some entries. Since this is a
-                // failure now, clear the state data.
-                fru_area_vec.clear();
-                return -1;
-            }
-            else
-            {
-                printf("SUCCESS: FRU Header checksum MATCH:[0x%X]\n",checksum);
-            }
+///---------------------------------------------------------
+// Validates the fru data per ipmi common header constructs.
+// Returns with updated common_hdr and also file_size
+//----------------------------------------------------------
+int ipmi_validate_common_hdr(const uint8_t *fru_data, const size_t data_len)
+{
+    int rc = -1;
 
-            // Everything is rihgt about this particular FRU record,
-            fru_area_vec.push_back(fru_area);
+    uint8_t common_hdr[sizeof(struct common_header)] = {0};
+    if(data_len >= sizeof(common_hdr))
+    {
+        memcpy(common_hdr, fru_data, sizeof(common_hdr));
+    }
+    else
+    {
+        fprintf(stderr, "Incomplete fru data file. Size:[%d]\n", data_len);
+        return rc;
+    }
 
-            // Update the internal structure with info about this entry that is
-            // needed while handling each areas.
-        } // If the packet has data for a particular data record.
-    } // End walking all the fru records.
+    // Verify the crc and size
+    rc = verify_fru_data(common_hdr, sizeof(common_hdr));
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to validate common header\n");
+        return rc;
+    }
 
-    // If we reach here, then we have validated the crc for all the records and
-    // time to call FRU area parser to get a Name:Value pair dictionary.
-    // This will start iterating all over again on the buffer -BUT- now with the
-    // job of taking each areas, getting it parsed and then updating the
-    // DBUS.
+    return EXIT_SUCCESS;
+}
 
-    if(!(fru_area_vec.empty()))
+//------------------------------------------------------------
+// Cleanup routine
+//------------------------------------------------------------
+int cleanup_error(FILE *fru_fp, fru_area_vec_t & fru_area_vec)
+{
+    if(fru_fp != NULL)
     {
-        rc =  ipmi_update_inventory(fruid, fru_area_vec, bus_type, set_present);
+        fclose(fru_fp);
+        fru_fp = NULL;
     }
 
-    // We are done with this FRU write packet.
-    fru_area_vec.clear();
+    if(!(fru_area_vec.empty()))
+    {
+        fru_area_vec.clear();
+    }
 
-    return rc;
+    return  -1;
 }
 
 ///-----------------------------------------------------
 // Accepts the filename and validates per IPMI FRU spec
 //----------------------------------------------------
 int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
-                           sd_bus *bus_type, const bool set_present)
+                           sd_bus *bus_type, const bool bmc_fru)
 {
-    int file_size = 0;
-    uint8_t *fru_data = NULL;
-    int bytes_read = 0;
-    int rc = 0;
+    size_t data_len = 0;
+    size_t bytes_read = 0;
+    int rc = -1;
+
+    // Vector that holds individual IPMI FRU AREAs. Although MULTI and INTERNAL
+    // are not used, keeping it here for completeness.
+    fru_area_vec_t fru_area_vec;
+    for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
+        fru_entry < (sizeof(struct common_header) -2); fru_entry++)
+    {
+        // Create an object and push onto a vector.
+        std::unique_ptr<ipmi_fru> fru_area = std::make_unique<ipmi_fru>
+                         (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru);
+
+        // Physically being present
+        bool present = std::ifstream(fru_file_name);
+        fru_area->set_present(present);
+
+        // And update the sd_bus paths as well.
+        fru_area->setup_sd_bus_paths();
+        fru_area_vec.emplace_back(std::move(fru_area));
+    }
 
-    FILE *fru_file = fopen(fru_file_name,"rb");
-    if(fru_file == NULL)
+    FILE *fru_fp = fopen(fru_file_name,"rb");
+    if(fru_fp == NULL)
     {
         fprintf(stderr, "ERROR: opening:[%s]\n",fru_file_name);
         perror("Error:");
-        return -1;
+        return cleanup_error(fru_fp, fru_area_vec);
     }
 
-    // Get the size of the file to allocate buffer to hold the entire contents.
-    if(fseek(fru_file, 0, SEEK_END))
+    // Get the size of the file to see if it meets minimum requirement
+    if(fseek(fru_fp, 0, SEEK_END))
     {
         perror("Error:");
-        fclose(fru_file);
-        return -1;
+        return cleanup_error(fru_fp, fru_area_vec);
     }
 
-    file_size = ftell(fru_file);
-    fru_data = (uint8_t *)malloc(file_size);
+    // Allocate a buffer to hold entire file content
+    data_len = ftell(fru_fp);
+    uint8_t fru_data[data_len] = {0};
 
-    // Read entire file contents to the internal buffer
-    if(fseek(fru_file, 0, SEEK_SET))
+    rewind(fru_fp);
+    bytes_read = fread(fru_data, data_len, 1, fru_fp);
+    if(bytes_read != 1)
     {
+        fprintf(stderr, "Failed reading fru data. Bytes_read=[%d]\n",bytes_read);
         perror("Error:");
-        fclose(fru_file);
-        return -1;
+        return cleanup_error(fru_fp, fru_area_vec);
     }
 
-    bytes_read = fread(fru_data, file_size, 1, fru_file);
-    if(bytes_read != 1)
+    // We are done reading.
+    fclose(fru_fp);
+    fru_fp = NULL;
+
+    rc = ipmi_validate_common_hdr(fru_data, data_len);
+    if(rc < 0)
     {
-        fprintf(stderr, "failed reading common header. Bytes read=:[%d]\n",bytes_read);
-        perror("Error:");
-        fclose(fru_file);
-        return -1;
+        return cleanup_error(fru_fp, fru_area_vec);
     }
-    fclose(fru_file);
 
-    rc = ipmi_validate_and_update_inventory(fruid, fru_data, bus_type, set_present);
+    // Now that we validated the common header, populate various fru sections if we have them here.
+    rc = ipmi_populate_fru_areas(fru_data, data_len, fru_area_vec);
     if(rc < 0)
     {
-        fprintf(stderr,"Validation failed for:[%d]\n",fruid);
+        fprintf(stderr,"Populating FRU areas failed for:[%d]\n",fruid);
+        return cleanup_error(fru_fp, fru_area_vec);
     }
     else
     {
-        printf("SUCCESS: Validated:[%s]\n",fru_file_name);
+        printf("SUCCESS: Populated FRU areas for:[%s]\n",fru_file_name);
+    }
+
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
     }
+#endif
 
-    if(fru_data)
+    // If the vector is populated with everything, then go ahead and update the
+    // inventory.
+    if(!(fru_area_vec.empty()))
     {
-        free(fru_data);
-        fru_data = NULL;
+
+#ifdef __IPMI_DEBUG__
+        printf("\n SIZE of vector is : [%d] \n",fru_area_vec.size());
+#endif
+        rc = ipmi_update_inventory(fru_area_vec);
+        if(rc <0)
+        {
+            fprintf(stderr, "Error updating inventory\n");
+        }
     }
 
+    // we are done with all that we wanted to do. This will do the job of
+    // calling any destructors too.
+    fru_area_vec.clear();
+
     return rc;
 }
-
diff --git a/writefrudata.H b/writefrudata.H
index 9c0c6b3..c65c21b 100644
--- a/writefrudata.H
+++ b/writefrudata.H
@@ -16,7 +16,7 @@ enum ipmi_netfn_storage_cmds
 };
 
 // Format of write fru data command
-struct write_fru_data_t 
+struct write_fru_data_t
 {
     uint8_t  frunum;
     uint8_t  offsetls;
@@ -37,14 +37,6 @@ struct common_header
     uint8_t crc;
 }__attribute__((packed));
 
-// Contains key info about a particular area.
-typedef struct
-{
-    uint8_t type;
-    uint8_t *offset;
-    size_t  len;
-}__attribute__((packed)) fru_area_t;
-
 // first byte in header is 1h per IPMI V2 spec.
 #define IPMI_FRU_HDR_BYTE_ZERO   1
 #define IPMI_FRU_INTERNAL_OFFSET offsetof(struct common_header, internal_offset)
@@ -64,5 +56,4 @@ int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *, const bool);
 #ifdef __cplusplus
 } // extern C
 #endif
-
 #endif
-- 
2.6.4
