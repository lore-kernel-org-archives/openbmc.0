Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A6271A017C
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:49:24 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431740017229.00528012861344;
 Wed, 21 Oct 2015 05:49:00 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 20/20] Refactored fru validator to use
 sd_bus
Date: Wed, 21 Oct 2015 07:48:21 -0500
Message-Id: <1445431701-8681-21-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
References: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:49:24 -0000

From: vishwabmc <vishwanath@in.ibm.com>

---
 fruvalidator.C        | 252 ----------------------
 sd_bus_fruvalidator.C | 568 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 568 insertions(+), 252 deletions(-)
 delete mode 100644 fruvalidator.C
 create mode 100644 sd_bus_fruvalidator.C

diff --git a/fruvalidator.C b/fruvalidator.C
deleted file mode 100644
index 5e2ffaf..0000000
--- a/fruvalidator.C
+++ /dev/null
@@ -1,252 +0,0 @@
-#include <stdio.h>
-#include <string.h>
-#include <sys/stat.h>
-
-typedef unsigned char uint8_t;
-
-/*
- * --- For Reference.----
-typedef struct
-{
-    uint8_t fixed;
-    uint8_t internal_offset;
-    uint8_t chassis_offset;
-    uint8_t board_offset;
-    uint8_t product_offset;
-    uint8_t multi_offset;
-    uint8_t pad;
-    uint8_t crc;
-}common_header_t;
-*/
-
-#define HDR_BYTE_ZERO   1
-#define INTERNAL_OFFSET 1
-#define HDR_CRC_OFFSET  7
-#define COMMON_HDR_SIZE 8
-
-#define RECORD_NOT_PRESENT 0
-#define EIGHT_BYTES 8
-
-uint8_t common_hdr[COMMON_HDR_SIZE] = {0};
-
-//------------------------------------------------
-// Takes the pointer to stream of bytes and length 
-// returns the 8 bit checksum per IPMI spec.
-//--------------------------------------------------
-unsigned char calculate_checksum(unsigned char *ptr, int len)
-{
-    // REFER :: http://coreipm.googlecode.com/svn-history/r40/trunk/coreipm/ipmi_pkt.c
-    char checksum = 0;
-    int byte = 0;
-
-    for(byte = 0; byte < len; byte++)
-    {
-        checksum += *ptr++;
-    }
-    
-    return( -checksum );
-}
-
-//---------------
-// Display Usage
-//---------------
-void usage(char *binary)
-{
-    printf("Usage: %s <valid binary ipmi fru file>\n", binary);
-    return;
-}    
-
-//-----------------------------------------------------
-// Accepts the filename and validated per IPMI FRU spec
-//------------------------------------------------------
-bool validate_fru_record(char *fru_file_name)
-{    
-    // Used for generic checksum calculation
-    uint8_t checksum = 0;
-
-    // This can point to 
-    uint8_t fru_section;
-
-    // A generic offset locator for any FRU record.
-    uint8_t record_offset = 0;
-
-    // Number of bytes read from FRU file.
-    size_t bytes_read = 0;
-
-    // First 2 bytes in the record.
-    uint8_t fru_record_hdr[2] = {0};
-
-    //common_header_t com_hdr;
-    memset(common_hdr, 0x0, sizeof(common_hdr));
-
-    // For now, this is user supplied in CLI. But this will be a parameter from
-    // fru handler
-    FILE *fru_file = fopen(fru_file_name,"rb");
-    if(fru_file == NULL)
-    {
-        fprintf(stderr, "ERROR: opening:[%s]\n",fru_file_name);
-        return false;
-    }
-
-    // Read first 8 bytes into common_header so we know the offsets and hdr
-    // checksum.
-    fseek(fru_file, 0, SEEK_SET);
-    bytes_read = fread(common_hdr, sizeof(common_hdr), 1, fru_file);
-    if(bytes_read != 1)
-    {
-        fprintf(stderr, "ERROR reading common header. Bytes read=:[%ld]\n",bytes_read);
-        return false;
-    }
-    
-    // 1: Validate for first byte to always have a value of [1]
-    if(common_hdr[0] != HDR_BYTE_ZERO)
-    {
-        fprintf(stderr, "ERROR: Common Header entry_1:[0x%X] Invalid.\n",common_hdr[0]);
-        return false;
-    }
-    else
-    {
-        printf("SUCCESS: Validated [0x%X] in common header\n",common_hdr[0]);
-    }
-
-    // 2: Validate the header checskum that is at last byte ( Offset: 7 )
-    checksum = calculate_checksum(common_hdr, sizeof(common_hdr)-1);
-    if(checksum != common_hdr[HDR_CRC_OFFSET])
-    {
-        fprintf(stderr, "ERROR: Common Header checksum mismatch."
-                " Calculated:[0x%X], Embedded:[0x%X]\n", 
-                checksum, common_hdr[HDR_CRC_OFFSET]);
-    
-        return false;
-    }
-    else
-    {
-        printf("SUCCESS: Common Header checksum MATCH:[0x%X]\n",checksum);
-    }
-
-    // !! FIXME FIXME FIXME FIXME
-    // This below logic fails if the record type is "Multi". I however have not
-    // seen a usecase of that in FRU inventory.. But, if I need to fix, its
-    // easy.
-    // !! FIXME FIXME FIXME FIXME
-
-    // 3: Now start walking the common_hdr array that has offsets into other FRU
-    //    record areas and validate those. Starting with second entry since the
-    //    first one is always a [0x01]
-    for(fru_section = INTERNAL_OFFSET ; fru_section < (COMMON_HDR_SIZE - 2)  ; fru_section++)
-    {
-        // Offset is 'value given in' internal_offset * 8 from the START of
-        // common header. So an an example, 01 00 00 00 01 00 00 fe has
-        // product area set at the offset 01 * 8 --> 8 bytes from the START of
-        // common header. That means, soon after the header checksum.
-        record_offset = common_hdr[fru_section] * EIGHT_BYTES;
-
-        if(record_offset)
-        {
-            // A NON zero value means that the vpd packet has the data for that
-            // section.  These are the things needed at this moment:
-
-            // 1: Goto beginning of the FILE
-            rewind(fru_file);
-
-            // 2: Move the file pointer to record_offset
-            fseek(fru_file, record_offset, SEEK_SET);
-
-            // 3: Read first 2 bytes containing FIXED[0x1] and record Length.
-            fread(fru_record_hdr, sizeof(fru_record_hdr), 1, fru_file);
-
-            // 5: If first element in the record header is _not_ a fixed:[0x01], err out.
-            if(fru_record_hdr[0] != HDR_BYTE_ZERO)
-            {
-                fprintf(stderr, "ERROR: Unexpected :[0x%X] found at Record header",
-                        fru_record_hdr[0]);
-
-                return false;
-            }
-            else
-            {
-                printf("SUCCESS: Validated [0x%X] in fru record:[%d] header\n",
-                        fru_record_hdr[0],fru_section);
-            }
-
-            // 4: Read Length bytes ( makes a complete record read now )
-            uint8_t fru_record_len = fru_record_hdr[1] * EIGHT_BYTES;
-
-            printf("RECORD NO[%d], SIZE = [%d] \n",fru_section, fru_record_len);
-
-            uint8_t fru_record_data[fru_record_len];
-            memset(fru_record_data, 0x0, sizeof(fru_record_data));
-
-            // Since the data is from record data[0], move the file pointer again to
-            // beginning of record.
-            fseek(fru_file, -2, SEEK_CUR);
-            fread(fru_record_data, sizeof(fru_record_data), 1, fru_file);
-
-            // 5: Calculate checksum (from offset -> (Length-1)).
-            //    All the bytes except the last byte( which is CRC :) ) will
-            //    participate in calculating the checksum.
-            checksum = calculate_checksum(fru_record_data, sizeof(fru_record_data)-1);
-
-            // 6: Verify the embedded checksum in last byte with calculated checksum
-            //    record_len -1 since length is some N but numbering is 0..N-1
-            if(checksum != fru_record_data[fru_record_len-1])
-            {
-                fprintf(stderr, "ERROR: FRU Header checksum mismatch. "
-                        " Calculated:[0x%X], Embedded:[0x%X]\n", 
-                        checksum, fru_record_data[fru_record_len-1]);
-
-                return false;
-            }
-            else
-            {
-                printf("SUCCESS: FRU Header checksum MATCH:[0x%X]\n",checksum);
-            }
-
-            // 7: If everything is okay, then we are fine.. Else mostly we are
-            //    awaiting another FRU write -OR- worst case, the VPD is corrupted
-            //    over BT.
-        } // If the packet has data for a particular data record.
-    } // End walking all the fru records.
-        
-    return true;
-}
-
-//---------------------------------------------------------------------
-// Main function but this will be integrated as a API for
-// Open BMC code that accepts a filename and returns success or failure
-//----------------------------------------------------------------------
-int main(int argc, char *argv[])
-{
-    // Right way is to do a parse_opt but that is poky for now.
-    if(argc != 2)
-    {
-        usage(argv[0]);
-        return -1;
-    }
-
-    // Check if this file is really present.
-    struct stat statbuff;
-    if(stat(argv[1], &statbuff) == -1)
-    {
-        usage(argv[0]);
-        return -1;
-    }
-    else if(statbuff.st_mode & S_IFMT != S_IFREG)
-    {
-        usage(argv[0]);
-        return -1;
-    }
-        
-    bool scan_result = validate_fru_record(argv[1]);
-    if(scan_result == true)
-    {
-        printf("SUCCESS: Validated:[%s]\n",argv[1]);
-    }
-    else
-    {
-        printf("ERROR: Validation failed for:[%s]\n",argv[1]);
-        return -1;
-    }
-
-    return 0;
-}
diff --git a/sd_bus_fruvalidator.C b/sd_bus_fruvalidator.C
new file mode 100644
index 0000000..632873c
--- /dev/null
+++ b/sd_bus_fruvalidator.C
@@ -0,0 +1,568 @@
+#include <stdio.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <stdint.h>
+#include <stddef.h>
+#include <stdlib.h>
+#include <systemd/sd-bus.h>
+#include <errno.h>
+#include <vector>
+#include <iostream>
+#include <sstream>
+#include "frup.h" // copied to host-ipmid folder for now
+#include <dlfcn.h>
+
+// Per IPMI v2.0 FRU specification
+struct common_header
+{
+    uint8_t fixed;
+    uint8_t internal_offset;
+    uint8_t chassis_offset;
+    uint8_t board_offset;
+    uint8_t product_offset;
+    uint8_t multi_offset;
+    uint8_t pad;
+    uint8_t crc;
+}__attribute__((packed));
+
+// Contains key info about a particular area.
+typedef struct
+{
+    uint8_t type;
+    uint8_t *offset;
+    size_t  len;
+}__attribute__((packed)) fru_area_t;
+
+// Needed to be passed into fru parser alorithm
+typedef std::vector<fru_area_t> fru_area_vec_t;
+
+// To call parse_fru_area function until its packaged and it's .h file is in dev
+// repo.
+typedef int (*parse_fun)(uint8_t, void *, uint8_t, sd_bus_message*);  
+
+// first byte in header is 1h per IPMI V2 spec.
+#define HDR_BYTE_ZERO   1
+#define INTERNAL_OFFSET offsetof(struct common_header, internal_offset)
+#define CHASSIS_OFFSET  offsetof(struct common_header, chassis_offset)
+#define BOARD_OFFSET    offsetof(struct common_header, board_offset)
+#define PRODUCT_OFFSET  offsetof(struct common_header, product_offset)
+#define MULTI_OFFSET    offsetof(struct common_header, multi_offset)
+#define HDR_CRC_OFFSET  offsetof(struct common_header, crc)
+#define EIGHT_BYTES     8
+
+// OpenBMC System Manager dbus framework
+const char  *bus_name      =  "org.openbmc.managers.System";
+const char  *object_name   =  "/org/openbmc/managers/System";
+const char  *intf_name     =  "org.openbmc.managers.System";
+
+//int update_inventory(const uint8_t, const uint8_t *, fru_area_vec_t &);
+
+//------------------------------------------------
+// Takes the pointer to stream of bytes and length 
+// returns the 8 bit checksum per IPMI spec.
+//-------------------------------------------------
+unsigned char calculate_crc(unsigned char *data, int len)
+{
+    char crc = 0;
+    int byte = 0;
+
+    for(byte = 0; byte < len; byte++)
+    {
+        crc += *data++;
+    }
+    
+    return(-crc);
+}
+
+//---------------
+// Display Usage
+//---------------
+void usage(char *binary)
+{
+    printf("Usage: %s <valid binary ipmi fru file>\n", binary);
+}    
+
+//---------------------------------------------------------------------------
+// fru parser wrapper until we get things working okay from FRU parser library
+//---------------------------------------------------------------------------
+int _parse_fru_area(uint8_t area_type, void *fru_data, size_t len, sd_bus_message *fru_dictn)
+{
+    int rc = 0;
+    parse_fun fru_parse_fun;
+
+    void *lib_handle = dlopen("/usr/lib/libifp.so", RTLD_LAZY); 
+    fru_parse_fun = (parse_fun)dlsym(lib_handle, "_Z14parse_fru_areahPKvhP14sd_bus_message");
+
+    rc = (*fru_parse_fun)(area_type, fru_data, (uint8_t)len, fru_dictn);
+
+    return rc;
+}
+
+//---------------------------------------------------------------------
+// Accepts a fru area offset in commom hdr and tells which area it is.
+//---------------------------------------------------------------------
+uint8_t get_fru_area_type(uint8_t area_offset)
+{
+    openbmc_ipmi_fru_area_type type = IPMI_FRU_AREA_TYPE_MAX;
+
+    switch(area_offset)
+    {
+        case INTERNAL_OFFSET:
+            type = IPMI_FRU_AREA_INTERNAL_USE;
+            break;
+
+        case CHASSIS_OFFSET:
+            type = IPMI_FRU_AREA_CHASSIS_INFO;
+            break;
+
+        case BOARD_OFFSET:
+            type = IPMI_FRU_AREA_BOARD_INFO;
+            break;
+
+        case PRODUCT_OFFSET:
+            type = IPMI_FRU_AREA_PRODUCT_INFO;
+            break;
+
+        case MULTI_OFFSET:
+            type = IPMI_FRU_AREA_MULTI_RECORD;
+            break;
+
+        default:
+            type = IPMI_FRU_AREA_TYPE_MAX;
+    }
+
+    return type;
+}
+
+//------------------------------------------------------------------------
+// Takes FRU data, invokes Parser for each fru record area and updates
+// Inventory
+//------------------------------------------------------------------------
+int update_inventory(const uint8_t fruid, const uint8_t *fru_data, 
+                     fru_area_vec_t & area_vec)
+{
+    // Now, use this fru dictionary object and connect with FRU Inventory Dbus
+    // and update the data for this FRU ID.
+    int rc = 0;
+    
+    // Dictionary object to hold Name:Value pair
+    sd_bus_message *fru_dict = NULL;
+
+    // SD Bus error report mechanism.
+    sd_bus_error bus_error = SD_BUS_ERROR_NULL;
+
+    // Gets a hook onto either a SYSTEM or SESSION bus
+    sd_bus *bus_type = NULL;
+
+    // Req message contains the specifics about which method etc that we want to
+    // access on which bus, object
+    sd_bus_message *response = NULL;
+
+    rc = sd_bus_open_system(&bus_type);
+    if(rc < 0)
+    {
+        fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
+        return -1;
+    }
+
+    // For each FRU area, extract the needed data , get it parsed and update
+    // the Inventory.
+    for(auto& iter : area_vec)
+    {
+        uint8_t area_type = (iter).type;
+
+        uint8_t area_data[(iter).len];
+        memset(area_data, 0x0, sizeof(area_data));
+
+        // Grab area specific data
+        memmove(area_data, (iter).offset, (iter).len);
+
+        // Need this to get respective DBUS objects
+        const char *area_name  = NULL;
+
+        if(area_type == IPMI_FRU_AREA_CHASSIS_INFO)
+        {
+            area_name = "CHASSIS_";
+        }
+        else if(area_type == IPMI_FRU_AREA_BOARD_INFO)
+        {
+            area_name = "BOARD_";
+        }
+        else if(area_type == IPMI_FRU_AREA_PRODUCT_INFO)
+        {
+            area_name = "PRODUCT_";
+        }
+        else
+        {
+            fprintf(stderr, "ERROR: Invalid Area type :[%d]",area_type);
+            break;
+        }
+ 
+        // What we need is BOARD_1, PRODUCT_1, CHASSIS_1 etc..
+        char fru_area_name[16] = {0};
+        sprintf(fru_area_name,"%s%d",area_name, fruid);
+
+#ifdef __IPMI_DEBUG__
+        printf("Updating Inventory with :[%s]\n",fru_area_name);
+#endif
+        // Each area needs a clean set.       
+        sd_bus_error_free(&bus_error);
+        sd_bus_message_unref(response);
+        sd_bus_message_unref(fru_dict);
+    
+        // We want to call a method "getObjectFromId" on System Bus that is
+        // made available over  OpenBmc system services.
+        rc = sd_bus_call_method(bus_type,                   // On the System Bus
+                                bus_name,                   // Service to contact
+                                object_name,                // Object path 
+                                intf_name,                  // Interface name
+                                "getObjectFromId",          // Method to be called
+                                &bus_error,                 // object to return error
+                                &response,                  // Response message on success
+                                "ss",                       // input message (string,byte)
+                                "FRU_STR",                  // First argument to getObjectFromId
+                                fru_area_name);             // Second Argument
+
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to issue method call: %s\n", bus_error.message);
+            break;
+        }
+
+        // Method getObjectFromId returns 3 parameters and all are strings, namely
+        // bus_name , object_path and interface name for accessing that particular 
+        // FRU over Inventory SDBUS manager. 'sss' here mentions that format.
+        char *inv_bus_name, *inv_obj_path, *inv_intf_name;
+        rc = sd_bus_message_read(response, "(sss)", &inv_bus_name, &inv_obj_path, &inv_intf_name);
+        if(rc < 0)
+        {
+            fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
+            break;
+        }
+
+#ifdef __IPMI_DEBUG__
+        printf("fru_area=[%s], inv_bus_name=[%s], inv_obj_path=[%s],inv_intf_name=[%s]\n",
+                fru_area_name, inv_bus_name, inv_obj_path, inv_intf_name);
+#endif
+
+        // Constructor to allow further initializations and customization.
+        rc = sd_bus_message_new_method_call(bus_type,
+                                            &fru_dict,
+                                            inv_bus_name,
+                                            inv_obj_path,
+                                            inv_intf_name,
+                                            "update");
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR: creating a update method call\n");
+            break;
+        }
+
+        // A Dictionary ({}) having (string, variant)
+        rc = sd_bus_message_open_container(fru_dict, 'a', "{sv}");
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR:[%d] creating a dict container:\n",errno);
+            break;
+        }
+
+        // Fill the container with information
+        rc = _parse_fru_area((iter).type, (void *)area_data, (iter).len, fru_dict);
+        if(rc < 0)
+        {
+            fprintf(stderr,"ERROR parsing FRU records\n");
+            break;
+        }
+
+        sd_bus_message_close_container(fru_dict);
+
+        // Now, Make the actual call to update the FRU inventory database with the
+        // dictionary given by FRU Parser. There is no response message expected for
+        // this.
+        rc = sd_bus_call(bus_type,            // On the System Bus
+                         fru_dict,            // With the Name:value dictionary array
+                         0,                   // 
+                         &bus_error,          // Object to return error.
+                         &response);          // Response message if any.
+
+        if(rc < 0)
+        {
+            fprintf(stderr, "ERROR:[%s] updating FRU inventory for ID:[0x%X]\n",
+                    bus_error.message, fruid);
+        }
+        else
+        {
+            printf("SUCCESS: Updated:[%s] successfully\n",fru_area_name);
+        }
+    } // END walking the vector of areas and updating
+
+    sd_bus_error_free(&bus_error);
+    sd_bus_message_unref(response);
+    sd_bus_message_unref(fru_dict);
+    sd_bus_unref(bus_type);
+
+    return rc;
+}
+
+//-------------------------------------------------------------------------
+// Validates the CRC and if found good, calls fru areas parser and calls
+// Inventory Dbus with the dictionary of Name:Value for updating. 
+//-------------------------------------------------------------------------
+int validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_data)
+{
+    // Used for generic checksum calculation
+    uint8_t checksum = 0;
+
+    // This can point to any FRU entry.
+    uint8_t fru_entry;
+
+    // A generic offset locator for any FRU record.
+    uint8_t area_offset = 0;
+
+    // First 2 bytes in the record.
+    uint8_t fru_area_hdr[2] = {0};
+
+    // To hold info about individual FRU record areas.
+    fru_area_t fru_area;
+
+    // For parsing and updating Inventory.
+    fru_area_vec_t fru_area_vec;
+
+    int rc = 0;
+
+    uint8_t common_hdr[sizeof(struct common_header)] = {0};
+    memset(common_hdr, 0x0, sizeof(common_hdr));
+
+    // Copy first 8 bytes to verify common header
+    memcpy(common_hdr, fru_data, sizeof(common_hdr));
+
+    // Validate for first byte to always have a value of [1]
+    if(common_hdr[0] != HDR_BYTE_ZERO)
+    {
+        fprintf(stderr, "ERROR: Common Header entry_1:[0x%X] Invalid.\n",common_hdr[0]);
+        return -1;
+    }
+    else
+    {
+        printf("SUCCESS: Validated [0x%X] in common header\n",common_hdr[0]);
+    }
+
+    // Validate the header checskum that is at last byte ( Offset: 7 )
+    checksum = calculate_crc(common_hdr, sizeof(common_hdr)-1);
+    if(checksum != common_hdr[HDR_CRC_OFFSET])
+    {
+#ifdef __IPMI__DEBUG__
+        fprintf(stderr, "ERROR: Common Header checksum mismatch."
+                " Calculated:[0x%X], Embedded:[0x%X]\n", 
+                checksum, common_hdr[HDR_CRC_OFFSET]);
+#endif    
+        return -1;
+    }
+    else
+    {
+        printf("SUCCESS: Common Header checksum MATCH:[0x%X]\n",checksum);
+    }
+
+    //-------------------------------------------
+    // TODO:  Add support for Multi Record later
+    //-------------------------------------------
+
+    //  Now start walking the common_hdr array that has offsets into other FRU
+    //  record areas and validate those. Starting with second entry since the
+    //  first one is always a [0x01]
+    for(fru_entry = INTERNAL_OFFSET; fru_entry < (sizeof(struct common_header) -2); fru_entry++)
+    {
+        // Offset is 'value given in' internal_offset * 8 from the START of
+        // common header. So an an example, 01 00 00 00 01 00 00 fe has
+        // product area set at the offset 01 * 8 --> 8 bytes from the START of
+        // common header. That means, soon after the header checksum.
+        area_offset = common_hdr[fru_entry] * EIGHT_BYTES;
+        
+        if(area_offset)
+        {
+            memset((void *)&fru_area, 0x0, sizeof(fru_area_t));
+
+            // Enumerated FRU area.
+            fru_area.type = get_fru_area_type(fru_entry);
+
+            // From start of fru header + record offset, copy 2 bytes.
+            fru_area.offset = &((uint8_t *)fru_data)[area_offset];
+            memcpy(fru_area_hdr, fru_area.offset, sizeof(fru_area_hdr));
+
+            // A NON zero value means that the vpd packet has the data for that
+            // area. err if first element in the record header is _not_ a [0x01].
+            if(fru_area_hdr[0] != HDR_BYTE_ZERO)
+            {
+                fprintf(stderr, "ERROR: Unexpected :[0x%X] found at Record header\n",
+                        fru_area_hdr[0]);
+
+                // This vector by now may have had some entries. Since this is a
+                // failure now, clear the state data.
+                fru_area_vec.clear();
+                return -1;
+            }
+            else
+            {
+                printf("SUCCESS: Validated [0x%X] in fru record:[%d] header\n",
+                        fru_area_hdr[0],fru_entry);
+            }
+
+            // Read Length bytes ( makes a complete record read now )
+            fru_area.len = fru_area_hdr[1] * EIGHT_BYTES;
+#ifdef __IPMI_DEBUG__
+            printf("AREA NO[%d], SIZE = [%d]\n",fru_entry, fru_area.len);
+#endif
+            uint8_t fru_area_data[fru_area.len];
+            memset(fru_area_data, 0x0, sizeof(fru_area_data));
+
+            memmove(fru_area_data, fru_area.offset, sizeof(fru_area_data));
+
+            // Calculate checksum (from offset -> (Length-1)).
+            // All the bytes except the last byte( which is CRC :) ) will
+            // participate in calculating the checksum.
+            checksum = calculate_crc(fru_area_data, sizeof(fru_area_data)-1);
+
+            // Verify the embedded checksum in last byte with calculated checksum
+            // record_len -1 since length is some N but numbering is 0..N-1
+            if(checksum != fru_area_data[fru_area.len-1])
+            {
+#ifdef __IPMI_DEBUG__
+                fprintf(stderr, "ERROR: FRU Header checksum mismatch. "
+                        " Calculated:[0x%X], Embedded:[0x%X]\n", 
+                        checksum, fru_area_data[fru_area.len - 1]);
+#endif
+                // This vector by now may have had some entries. Since this is a
+                // failure now, clear the state data.
+                fru_area_vec.clear();
+                return -1;
+            }
+            else
+            {
+                printf("SUCCESS: FRU Header checksum MATCH:[0x%X]\n",checksum);
+            }
+
+            // Everything is rihgt about this particular FRU record,
+            fru_area_vec.push_back(fru_area);
+
+            // Update the internal structure with info about this entry that is
+            // needed while handling each areas.
+        } // If the packet has data for a particular data record.
+    } // End walking all the fru records.
+        
+    // If we reach here, then we have validated the crc for all the records and
+    // time to call FRU area parser to get a Name:Value pair dictionary.
+    // This will start iterating all over again on the buffer -BUT- now with the
+    // job of taking each areas, getting it parsed and then updating the
+    // DBUS.
+        
+    if(!(fru_area_vec.empty()))
+    {
+        rc =  update_inventory(fruid, fru_data, fru_area_vec);
+    }
+ 
+    // We are done with this FRU write packet. 
+    fru_area_vec.clear();
+
+    return rc;
+}
+
+///-----------------------------------------------------
+// Accepts the filename and validates per IPMI FRU spec
+//----------------------------------------------------
+int validate_fru_area(const uint8_t fruid, const char *fru_file_name)
+{    
+    int file_size = 0;
+    uint8_t *fru_data = NULL;
+    int bytes_read = 0;
+    int rc = 0;
+
+    // For now, this is user supplied in CLI. But this will be a parameter from
+    // fru handler
+    FILE *fru_file = fopen(fru_file_name,"rb");
+    if(fru_file == NULL)
+    {
+        fprintf(stderr, "ERROR: opening:[%s]\n",fru_file_name);
+        perror("Error:");
+        return -1;
+    }
+
+    // Get the size of the file to allocate buffer to hold the entire contents.
+    if(fseek(fru_file, 0, SEEK_END))
+    {
+        perror("Error:");
+        return -1;
+    }
+
+    file_size = ftell(fru_file);
+    fru_data = (uint8_t *)malloc(file_size);
+
+    // Read entire file contents to the internal buffer
+    if(fseek(fru_file, 0, SEEK_SET))
+    {
+        perror("Error:");
+        return -1;
+    }
+
+    bytes_read = fread(fru_data, file_size, 1, fru_file);
+    if(bytes_read != 1)
+    {
+        fprintf(stderr, "ERROR reading common header. Bytes read=:[%d]\n",bytes_read);
+        perror("Error:");
+        return -1;
+    }
+    fclose(fru_file);
+
+    rc = validate_and_update_inventory(fruid, fru_data);
+
+    if(fru_data)
+    {
+        free(fru_data);
+        fru_data = NULL;
+    }
+
+    return rc;
+}
+
+// ---------------------------------------------------------------------
+// Main function but this will be integrated as a API for
+// Open BMC code that accepts a filename and returns success or failure
+//--------------------------------------------------------------------
+int main(int argc, char *argv[])
+{
+    // Right way is to do a parse_opt but that is poky for now.
+    if(argc != 2)
+    {
+        usage(argv[0]);
+        return -1;
+    }
+
+    /* Check if this file is really present. */
+    struct stat statbuff;
+    if(stat(argv[1], &statbuff) == -1)
+    {
+        usage(argv[0]);
+        return -1;
+    }
+    else if((statbuff.st_mode & S_IFMT) != S_IFREG)
+    {
+        usage(argv[0]);
+        return -1;
+    }
+
+    // For now, I am having FRU file numbers as 1 , 2 , 3..
+    uint8_t fruid = 0;
+    fruid = atoi(argv[1]);
+
+    int scan_result = validate_fru_area(fruid, argv[1]);
+    if(scan_result < 0)
+    {
+        printf("ERROR: Validation failed for:[%d]\n",fruid);
+        return -1;
+    }
+    else
+    {
+        printf("SUCCESS: Validated:[%s]\n",argv[1]);
+    }
+
+    return 0;
+}
-- 
2.6.0
