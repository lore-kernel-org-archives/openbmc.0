Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C13FD1A03C6
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 14:59:22 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446955155783329.4969149224902;
 Sat, 7 Nov 2015 19:59:15 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser 10/11] Merging IPMI FRU writer and parser.
Date: Sat,  7 Nov 2015 22:59:07 -0500
Message-Id: <1446955148-30303-11-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 03:59:23 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 Makefile       |  26 ++-
 frup.h         |   2 +
 writefrudata.C | 564 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 writefrudata.H |  53 ++++++
 4 files changed, 637 insertions(+), 8 deletions(-)
 create mode 100644 writefrudata.C
 create mode 100644 writefrudata.H

diff --git a/Makefile b/Makefile
index 8e74dd8..076aa76 100644
--- a/Makefile
+++ b/Makefile
@@ -1,20 +1,30 @@
 CXX ?= $(CROSS_COMPILE)gcc
 
-IPMI_FRU_PARSER_LIB = libifp.so
-IPMI_FRU_PARSER_OBJS = frup.o
+FRU_WRITE_AND_PARSER_LIB = libwritefrudata.so
+FRU_WRITE_AND_PARSER_OBJS = frup.o writefrudata.o
 
+INC_FLAGS += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++14
+LIB_FLAGS += $(shell pkg-config  --libs libsystemd) -rdynamic
 
-INC_FLAGS += -I. -O2 --std=gnu++11 -DIPMI_FRU_PARSER_DEBUG
-#INC_FLAGS += -I. -O2 --std=gnu++11
-LIB_FLAGS += -rdynamic
+DESTDIR ?= /
+SBINDIR ?= /usr/sbin
+INCLUDEDIR ?= /usr/include
+LIBDIR ?= /usr/lib
 
-all: $(IPMI_FRU_PARSER_LIB)
+all: $(FRU_WRITE_AND_PARSER_LIB)
 
 %.o: %.c
 	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAGS) $(IPMID_PATH) -o $@
 
-$(IPMI_FRU_PARSER_LIB): $(IPMI_FRU_PARSER_OBJS)
+%.o: %.C
+	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAGS) $(IPMID_PATH) -o $@
+
+$(FRU_WRITE_AND_PARSER_LIB): $(FRU_WRITE_AND_PARSER_OBJS)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAGS) -o $@
 
 clean:
-	rm -f $(IPMI_FRU_PARSER_OBJS) $(IPMI_FRU_PARSER_LIB)
+	rm -f $(FRU_WRITE_AND_PARSER_OBJS) $(FRU_WRITE_AND_PARSER_LIB)
+
+install:
+		install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid
+		install -m 0755 $(FRU_WRITE_AND_PARSER_LIB) $(DESTDIR)$(LIBDIR)/host-ipmid
diff --git a/frup.h b/frup.h
index 0269bf8..3286260 100644
--- a/frup.h
+++ b/frup.h
@@ -1,6 +1,8 @@
 #ifndef OPENBMC_IPMI_FRU_PARSER_H
 #define OPENBMC_IPMI_FRU_PARSER_H
 
+#include <systemd/sd-bus.h>
+
 /* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
 int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
 int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
diff --git a/writefrudata.C b/writefrudata.C
new file mode 100644
index 0000000..30ba39a
--- /dev/null
+++ b/writefrudata.C
@@ -0,0 +1,564 @@
+#include <ipmid-api.h>
+#include <vector>
+#include <stdlib.h>
+#include <dlfcn.h>
+#include <errno.h>
+#include <stdio.h>
+#include "frup.h"
+#include "writefrudata.H"
+#include <systemd/sd-bus.h>
+
+void register_netfn_storage_write_fru() __attribute__((constructor));
+
+// Needed to be passed into fru parser alorithm
+typedef std::vector<fru_area_t> fru_area_vec_t;
+
+// OpenBMC System Manager dbus framework
+const char  *bus_name      =  "org.openbmc.managers.System";
+const char  *object_name   =  "/org/openbmc/managers/System";
+const char  *intf_name     =  "org.openbmc.managers.System";
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
+//---------------------------------------------------------------------
+// Accepts a fru area offset in commom hdr and tells which area it is.
+//---------------------------------------------------------------------
+uint8_t get_fru_area_type(uint8_t area_offset)
+{
+    ipmi_fru_area_type type = IPMI_FRU_AREA_TYPE_MAX;
+
+    switch(area_offset)
+    {
+        case IPMI_FRU_INTERNAL_OFFSET:
+            type = IPMI_FRU_AREA_INTERNAL_USE;
+            break;
+
+        case IPMI_FRU_CHASSIS_OFFSET:
+            type = IPMI_FRU_AREA_CHASSIS_INFO;
+            break;
+
+        case IPMI_FRU_BOARD_OFFSET:
+            type = IPMI_FRU_AREA_BOARD_INFO;
+            break;
+
+        case IPMI_FRU_PRODUCT_OFFSET:
+            type = IPMI_FRU_AREA_PRODUCT_INFO;
+            break;
+
+        case IPMI_FRU_MULTI_OFFSET:
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
+int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data, 
+                          fru_area_vec_t & area_vec)
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
+        rc = parse_fru_area((iter).type, (void *)area_data, (iter).len, fru_dict);
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
+int ipmi_validate_and_update_inventory(const uint8_t fruid, const uint8_t *fru_data)
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
+    if(common_hdr[0] != IPMI_FRU_HDR_BYTE_ZERO)
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
+    if(checksum != common_hdr[IPMI_FRU_HDR_CRC_OFFSET])
+    {
+#ifdef __IPMI__DEBUG__
+        fprintf(stderr, "ERROR: Common Header checksum mismatch."
+                " Calculated:[0x%X], Embedded:[0x%X]\n", 
+                checksum, common_hdr[IPMI_FRU_HDR_CRC_OFFSET]);
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
+    for(fru_entry = IPMI_FRU_INTERNAL_OFFSET; fru_entry < (sizeof(struct common_header) -2); fru_entry++)
+    {
+        // Offset is 'value given in' internal_offset * 8 from the START of
+        // common header. So an an example, 01 00 00 00 01 00 00 fe has
+        // product area set at the offset 01 * 8 --> 8 bytes from the START of
+        // common header. That means, soon after the header checksum.
+        area_offset = common_hdr[fru_entry] * IPMI_EIGHT_BYTES;
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
+            if(fru_area_hdr[0] != IPMI_FRU_HDR_BYTE_ZERO)
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
+            fru_area.len = fru_area_hdr[1] * IPMI_EIGHT_BYTES;
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
+        rc =  ipmi_update_inventory(fruid, fru_data, fru_area_vec);
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
+int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name)
+{
+    int file_size = 0;
+    uint8_t *fru_data = NULL;
+    int bytes_read = 0;
+    int rc = 0;
+
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
+        fclose(fru_file);
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
+        fclose(fru_file);
+        return -1;
+    }
+
+    bytes_read = fread(fru_data, file_size, 1, fru_file);
+    if(bytes_read != 1)
+    {
+        fprintf(stderr, "ERROR reading common header. Bytes read=:[%d]\n",bytes_read);
+        perror("Error:");
+        fclose(fru_file);
+        return -1;
+    }
+    fclose(fru_file);
+
+    rc = ipmi_validate_and_update_inventory(fruid, fru_data);
+    if(rc == -1)
+    {
+        printf("ERROR: Validation failed for:[%d]\n",fruid);
+    }
+    else
+    {
+        printf("SUCCESS: Validated:[%s]\n",fru_file_name);
+    }
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
+///-------------------------------------------------------
+// Called by IPMI netfn router for write fru data command
+//--------------------------------------------------------
+ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    FILE *fp = NULL;
+    char fru_file_name[16] = {0};
+    uint8_t offset = 0;
+    uint16_t len = 0;
+    ipmi_ret_t rc = IPMI_CC_INVALID;
+    int validate_rc = 0;
+    const char *mode = NULL;
+
+    // From the payload, extract the header that has fruid and the offsets
+    write_fru_data_t *reqptr = (write_fru_data_t*)request;
+
+    // There is no response data for this command.
+    *data_len = 0;
+
+    // Maintaining a temporary file to pump the data
+    sprintf(fru_file_name, "%s%02x", "/tmp/ipmifru", reqptr->frunum);
+
+    offset = ((uint16_t)reqptr->offsetms) << 8 | reqptr->offsetls;
+
+    // Length is the number of request bytes minus the header itself.
+    // The header contains an extra byte to indicate the start of
+    // the data (so didn't need to worry about word/byte boundaries)
+    // hence the -1...
+    len = ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
+    
+#ifdef __IPMI__DEBUG__
+    printf("IPMI WRITE-FRU-DATA for [%s]  Offset = [%d] Length = [%d]\n",
+            fru_file_name, offset, len);
+#endif
+
+    // offset would be zero if the cmd payload is targeting a new fru
+    if (offset == 0)
+    {
+        mode = "wb";
+    } 
+    else 
+    {
+        // offset would be non-zero if the cmd payload is continued for prev
+        // fru
+        mode = "rb+";
+    }
+
+    if ((fp = fopen(fru_file_name, mode)) != NULL) 
+    {
+        if(fseek(fp, offset, SEEK_SET))
+        {
+            perror("Error:");
+            fclose(fp);
+            return rc;
+        }
+    
+        if(fwrite(&reqptr->data, len, 1, fp) != 1)
+        {
+            perror("Error:");
+            fclose(fp);
+            return rc;
+        }
+    
+        fclose(fp);
+    } 
+    else 
+    {
+        fprintf(stderr, "Error trying to write to fru file %s\n",fru_file_name);
+        return rc;
+    }
+    
+    // We received some bytes. It may be full or partial. Run a validator.
+    validate_rc = ipmi_validate_fru_area(reqptr->frunum, fru_file_name);
+    if(validate_rc != -1)
+    {
+        // Success validating _and_ updating the Inventory. We no longer need
+        // this file.
+        remove(fru_file_name);
+    }
+
+    // convert the rc per ipmi spec   
+    rc = (validate_rc != -1) ? IPMI_CC_OK : IPMI_CC_INVALID;
+
+    return rc;
+}
+
+void register_netfn_storage_write_fru()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data);
+}
diff --git a/writefrudata.H b/writefrudata.H
new file mode 100644
index 0000000..42924a3
--- /dev/null
+++ b/writefrudata.H
@@ -0,0 +1,53 @@
+#ifndef __IPMI_WRITE_FRU_DATA_H__
+#define __IPMI_WRITE_FRU_DATA_H__
+
+#include <stdint.h>
+#include <stddef.h>
+
+// IPMI commands for Storage net functions.
+enum ipmi_netfn_storage_cmds
+{
+    IPMI_CMD_WRITE_FRU_DATA = 0x12
+};
+
+// Format of write fru data command
+struct write_fru_data_t 
+{
+    uint8_t  frunum;
+    uint8_t  offsetls;
+    uint8_t  offsetms;
+    uint8_t  data;
+}__attribute__ ((packed));
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
+// first byte in header is 1h per IPMI V2 spec.
+#define IPMI_FRU_HDR_BYTE_ZERO   1
+#define IPMI_FRU_INTERNAL_OFFSET offsetof(struct common_header, internal_offset)
+#define IPMI_FRU_CHASSIS_OFFSET  offsetof(struct common_header, chassis_offset)
+#define IPMI_FRU_BOARD_OFFSET    offsetof(struct common_header, board_offset)
+#define IPMI_FRU_PRODUCT_OFFSET  offsetof(struct common_header, product_offset)
+#define IPMI_FRU_MULTI_OFFSET    offsetof(struct common_header, multi_offset)
+#define IPMI_FRU_HDR_CRC_OFFSET  offsetof(struct common_header, crc)
+#define IPMI_EIGHT_BYTES         8
+
+#endif
-- 
2.6.3
