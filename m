Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C59121A0BFE
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 14:59:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446955155071516.1746162289182;
 Sat, 7 Nov 2015 19:59:15 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser 09/11] Construct format string for
 sd_bus_message_append based on field type encoding.
Date: Sat,  7 Nov 2015 22:59:06 -0500
Message-Id: <1446955148-30303-10-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 03:59:28 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 Makefile |  10 +--
 frup.c   | 278 ++++++++++++++++++++++++++++++++++++++++-----------------------
 frup.h   |   4 +-
 3 files changed, 185 insertions(+), 107 deletions(-)

diff --git a/Makefile b/Makefile
index bcb3648..8e74dd8 100644
--- a/Makefile
+++ b/Makefile
@@ -1,17 +1,17 @@
-CXX ?= $(CROSS_COMPILE)g++
+CXX ?= $(CROSS_COMPILE)gcc
 
 IPMI_FRU_PARSER_LIB = libifp.so
 IPMI_FRU_PARSER_OBJS = frup.o
 
-INC_FLAGS += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
-#LIB_FLAGS += $(shell pkg-config  --libs libsystemd) -rdynamic
+
+INC_FLAGS += -I. -O2 --std=gnu++11 -DIPMI_FRU_PARSER_DEBUG
+#INC_FLAGS += -I. -O2 --std=gnu++11
 LIB_FLAGS += -rdynamic
-#IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
 
 all: $(IPMI_FRU_PARSER_LIB)
 
 %.o: %.c
-	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAGS) $(IPMID_PATH) -o $@
 
 $(IPMI_FRU_PARSER_LIB): $(IPMI_FRU_PARSER_OBJS)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAGS) -o $@
diff --git a/frup.c b/frup.c
index 7e39ad1..2d8cc3b 100644
--- a/frup.c
+++ b/frup.c
@@ -43,8 +43,8 @@
 #include <unistd.h>
 #include <string.h>
 #include <time.h>
+#include <ctype.h>
 
-#define IPMI_FRU_PARSER_DEBUG 1
 #define uint8_t unsigned char
 #define uint32_t unsigned int
 
@@ -81,8 +81,11 @@ return -1; \
 #define OPENBMC_VPD_VAL_LEN                            512
 
 
+extern "C"
+{
 int sd_bus_message_append (void*, const char*, ...);
 typedef struct sd_bus_message sd_bus_message;
+};
 
 struct ipmi_fru_field
 {
@@ -117,7 +120,15 @@ enum openbmc_vpd_key_id
   OPENBMC_VPD_KEY_CHASSIS_TYPE = 1, /* not a type/len */
   OPENBMC_VPD_KEY_CHASSIS_PART_NUM,
   OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,
-  OPENBMC_VPD_KEY_CHASSIS_MAX = OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM1,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM2,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM3,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM4,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM5,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM6,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM7,
+  OPENBMC_VPD_KEY_CHASSIS_CUSTOM8,
+  OPENBMC_VPD_KEY_CHASSIS_MAX = OPENBMC_VPD_KEY_CHASSIS_CUSTOM8,
   /* TODO: chassis_custom_fields */
 
   OPENBMC_VPD_KEY_BOARD_MFG_DATE, /* not a type/len */
@@ -126,7 +137,15 @@ enum openbmc_vpd_key_id
   OPENBMC_VPD_KEY_BOARD_SERIAL_NUM,
   OPENBMC_VPD_KEY_BOARD_PART_NUM,
   OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID,
-  OPENBMC_VPD_KEY_BOARD_MAX = OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM1,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM2,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM3,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM4,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM5,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM6,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM7,
+  OPENBMC_VPD_KEY_BOARD_CUSTOM8,
+  OPENBMC_VPD_KEY_BOARD_MAX = OPENBMC_VPD_KEY_BOARD_CUSTOM8,
   /* TODO: board_custom_fields */
 
   OPENBMC_VPD_KEY_PRODUCT_MFR,
@@ -136,38 +155,66 @@ enum openbmc_vpd_key_id
   OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM,
   OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG,
   OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID,
-  OPENBMC_VPD_KEY_PRODUCT_MAX = OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID,
-  /* TODO: product_custom_fields */
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM1,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM2,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM3,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM4,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM5,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM6,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM7,
+  OPENBMC_VPD_KEY_PRODUCT_CUSTOM8,
+  OPENBMC_VPD_KEY_PRODUCT_MAX = OPENBMC_VPD_KEY_PRODUCT_CUSTOM8,
 
   OPENBMC_VPD_KEY_MAX,
+  OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX=8,
   
 };
 
 const char* vpd_key_names [] = 
 {
   "Key Names Table Start", 
-  "Chassis Type", /*OPENBMC_VPD_KEY_CHASSIS_TYPE*/
-  "Chassis Part Number", /*OPENBMC_VPD_KEY_CHASSIS_PART_NUM,*/
-  "Chassis Serial Number", /*OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,*/
-
-  /* TODO: chassis_custom_fields */
-
-  "Board Mfg Date", /* OPENBMC_VPD_KEY_BOARD_MFG_DATE, */ /* not a type/len */
-  "Board Manufacturer", /* OPENBMC_VPD_KEY_BOARD_MFR, */
-  "Board Name", /* OPENBMC_VPD_KEY_BOARD_NAME, */
-  "Board Serial Number", /* OPENBMC_VPD_KEY_BOARD_SERIAL_NUM, */
-  "Board Part Number", /* OPENBMC_VPD_KEY_BOARD_PART_NUM, */
-  "Board FRU File ID", /* OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID, */
-  /* TODO: board_custom_fields */
-
-  "Product Manufacturer", /* OPENBMC_VPD_KEY_PRODUCT_MFR, */
-  "Product Name", /* OPENBMC_VPD_KEY_PRODUCT_NAME, */
-  "Product Model Number", /* OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM, */
-  "Product Version", /* OPENBMC_VPD_KEY_PRODUCT_VER, */
-  "Product Serial Number", /* OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM, */
-  "Product Asset Tag", /* OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG, */
-  "Product FRU File ID", /* OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID, */
-  /* TODO: product_custom_fields */
+  "Type", /*OPENBMC_VPD_KEY_CHASSIS_TYPE*/
+  "Part Number", /*OPENBMC_VPD_KEY_CHASSIS_PART_NUM,*/
+  "Serial Number", /*OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,*/
+  "Custom Field 1", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM1,*/
+  "Custom Field 2", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM2,*/
+  "Custom Field 3", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM3,*/
+  "Custom Field 4", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM4,*/
+  "Custom Field 5", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM5,*/
+  "Custom Field 6", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM6,*/
+  "Custom Field 7", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM7,*/
+  "Custom Field 8", /*OPENBMC_VPD_KEY_CHASSIS_CUSTOM8,*/
+
+  "Mfg Date", /* OPENBMC_VPD_KEY_BOARD_MFG_DATE, */ /* not a type/len */
+  "Manufacturer", /* OPENBMC_VPD_KEY_BOARD_MFR, */
+  "Name", /* OPENBMC_VPD_KEY_BOARD_NAME, */
+  "Serial Number", /* OPENBMC_VPD_KEY_BOARD_SERIAL_NUM, */
+  "Part Number", /* OPENBMC_VPD_KEY_BOARD_PART_NUM, */
+  "FRU File ID", /* OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID, */
+  "Custom Field 1", /*OPENBMC_VPD_KEY_BOARD_CUSTOM1,*/
+  "Custom Field 2", /*OPENBMC_VPD_KEY_BOARD_CUSTOM2,*/
+  "Custom Field 3", /*OPENBMC_VPD_KEY_BOARD_CUSTOM3,*/
+  "Custom Field 4", /*OPENBMC_VPD_KEY_BOARD_CUSTOM4,*/
+  "Custom Field 5", /*OPENBMC_VPD_KEY_BOARD_CUSTOM5,*/
+  "Custom Field 6", /*OPENBMC_VPD_KEY_BOARD_CUSTOM6,*/
+  "Custom Field 7", /*OPENBMC_VPD_KEY_BOARD_CUSTOM7,*/
+  "Custom Field 8", /*OPENBMC_VPD_KEY_BOARD_CUSTOM8,*/
+
+  "Manufacturer", /* OPENBMC_VPD_KEY_PRODUCT_MFR, */
+  "Name", /* OPENBMC_VPD_KEY_PRODUCT_NAME, */
+  "Model Number", /* OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM, */
+  "Version", /* OPENBMC_VPD_KEY_PRODUCT_VER, */
+  "Serial Number", /* OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM, */
+  "Asset Tag", /* OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG, */
+  "FRU File ID", /* OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID, */
+  "Custom Field 1", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM1,*/
+  "Custom Field 2", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM2,*/
+  "Custom Field 3", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM3,*/
+  "Custom Field 4", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM4,*/
+  "Custom Field 5", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM5,*/
+  "Custom Field 6", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM6,*/
+  "Custom Field 7", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM7,*/
+  "Custom Field 8", /*OPENBMC_VPD_KEY_PRODUCT_CUSTOM8,*/
 
   "Key Names Table End" /*OPENBMC_VPD_KEY_MAX,*/
 };
@@ -691,6 +738,7 @@ ipmi_fru_product_info_area (const void *areabuf,
                           &number_of_data_bytes,
                           product_fru_file_id) < 0)
     goto cleanup;
+
   area_offset += 1;          /* type/length byte */
   area_offset += number_of_data_bytes;
 
@@ -729,12 +777,42 @@ ipmi_fru_product_info_area (const void *areabuf,
 }
 
 
+int _append_to_dict (uint8_t vpd_key_id, uint8_t* vpd_key_val, sd_bus_message* vpdtbl) 
+{
+    int type_length = vpd_key_val[0];
+    int type_code = (type_length & IPMI_FRU_TYPE_LENGTH_TYPE_CODE_MASK) >> IPMI_FRU_TYPE_LENGTH_TYPE_CODE_SHIFT;
+    int vpd_val_len = type_length & IPMI_FRU_TYPE_LENGTH_NUMBER_OF_DATA_BYTES_MASK;
+    int sdr=0;
+
+    switch (type_code)
+    {
+        case 0:
+            printf ("_append_to_dict: VPD Key = [%s] : Type Code = [BINARY] : Len = [%d] : Val = [%s]\n", vpd_key_names [vpd_key_id], vpd_val_len, &vpd_key_val[1]);
+            sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "ay", vpd_val_len, &vpd_key_val[1]);
+            /*sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "s", &vpd_key_val[1]);*/
+            break;
+        case 3:
+            printf ("_append_to_dict: VPD Key = [%s] : Type Code = [ASCII+Latin] : Len = [%d] : Val = [%s]\n", vpd_key_names [vpd_key_id], vpd_val_len, &vpd_key_val[1]);
+            sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "s", &vpd_key_val[1]);
+            break;
+    }
+
+    if (sdr < 0)
+    {
+#if IPMI_FRU_PARSER_DEBUG
+        printf ("_append_to_dict : sd_bus_message_append Failed [ %d ] for [%s]\n", sdr, vpd_key_names[vpd_key_id]);
+#endif
+    }
+}
+
 int
 parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 {
   int ret = 0;
   int rv = -1;
   int i = 0;
+  int j = 0;
+  int isprintable = 0;
   ipmi_fru_area_info_t fru_area_info [ IPMI_FRU_AREA_TYPE_MAX ];
   ipmi_fru_common_hdr_t* chdr = NULL;
   uint8_t* hdr = NULL;
@@ -742,9 +820,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 
 
   ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
-  /*char ipmi_fru_field_str [ IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX ];
-  uint32_t len=0;*/
-  const uint8_t* ipmi_fru_field_str;
+  uint8_t* ipmi_fru_field_str;
 
   /* Chassis */
   uint8_t chassis_type;
@@ -794,7 +870,8 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
         &chassis_type,
         &vpd_info [OPENBMC_VPD_KEY_CHASSIS_PART_NUM],
         &vpd_info [OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM],
-        NULL, 0);
+        &vpd_info [OPENBMC_VPD_KEY_CHASSIS_CUSTOM1], 
+        OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX);
   }
     
   if (chdr->board)
@@ -809,7 +886,8 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
         &vpd_info [OPENBMC_VPD_KEY_BOARD_SERIAL_NUM],
         &vpd_info [OPENBMC_VPD_KEY_BOARD_PART_NUM],
         &vpd_info [OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID],
-        NULL, 0);
+        &vpd_info [OPENBMC_VPD_KEY_BOARD_CUSTOM1], 
+        OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX);
   }
 
   if (chdr->product)
@@ -825,7 +903,8 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
         &vpd_info [OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM],
         &vpd_info [OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG],
         &vpd_info [OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID],
-        NULL, 0);
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_CUSTOM1], 
+        OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX);
   }
 
   if (chdr->multirec)
@@ -838,8 +917,6 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   {
 #if IPMI_FRU_PARSER_DEBUG
     printf ("IPMI_FRU_AREA_TYPE=[%d] : Offset=[%d] : Len=[%d]\n", i, fru_area_info [i].off, fru_area_info[i].len);
-#else
-;
 #endif
   }
 
@@ -851,8 +928,6 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
         sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "y", chassis_type);
 #if IPMI_FRU_PARSER_DEBUG
         printf ("[%s] = [%d]\n", vpd_key_names[i], chassis_type);
-#else
-;
 #endif
         continue;
     }
@@ -863,25 +938,16 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
         sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", timestr);
 #if IPMI_FRU_PARSER_DEBUG
         printf ("[%s] = [%d]\n", vpd_key_names[i], mfg_date_time);
-#else
-;
 #endif
         continue;
     }
-    
-    /* FIXME: Field type encoding *ASSUMED* to be *BINARY* */
-    ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-    sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str); 
-    if (vpd_info[i].type_length_field_length)
-    {
-#if IPMI_FRU_PARSER_DEBUG
-        printf ("[%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
-#else
-;
-#endif
-    }
-  }
 
+    /* Append TypeLen Field to Dictionary */
+    _append_to_dict (i, vpd_info[i].type_length_field, vpdtbl);
+
+    /*ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;*/
+    /*sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str); */
+  }
  out:
   rv = 0;
  cleanup:
@@ -893,66 +959,72 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
   int ret = 0;
   int rv = -1;
   int i = 0;
-  ipmi_fru_area_info_t fru_area_info [ IPMI_FRU_AREA_TYPE_MAX ];
-  ipmi_fru_common_hdr_t* chdr = NULL;
-  uint8_t* hdr = NULL;
-  const uint8_t* ipmi_fru_field_str=NULL;
-  char timestr [ OPENBMC_VPD_VAL_LEN ];
-
-
-  ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
-  for (i=0; i<OPENBMC_VPD_KEY_MAX; i++)
-  {
-    memset (vpd_info[i].type_length_field, '\0', IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX);
-    vpd_info[i].type_length_field_length = 0;
-  }
+  int j = 0;
+  int sdr = 0;
+  int isprintable = 0;
 
   /* Chassis */
   uint8_t chassis_type;
-
   /* Board */
   uint32_t mfg_date_time;
-
   /* Product */
   unsigned int product_custom_fields_len;
 
+  ipmi_fru_area_info_t fru_area_info [ IPMI_FRU_AREA_TYPE_MAX ];
+  ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
+  char timestr [ OPENBMC_VPD_VAL_LEN ];
+
+  uint8_t* ipmi_fru_field_str=NULL;
+  ipmi_fru_common_hdr_t* chdr = NULL;
+  uint8_t* hdr = NULL;
+
   ASSERT (msgbuf);
   ASSERT (vpdtbl);
 
+  for (i=0; i<OPENBMC_VPD_KEY_MAX; i++)
+  {
+    memset (vpd_info[i].type_length_field, '\0', IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX);
+    vpd_info[i].type_length_field_length = 0;
+  }
+
   switch (area)
   {
     case IPMI_FRU_AREA_CHASSIS_INFO:
-        ipmi_fru_chassis_info_area (msgbuf,
+#if IPMI_FRU_PARSER_DEBUG
+          printf ("Chassis : Buf len = [%d]\n", len);
+#endif
+        ipmi_fru_chassis_info_area ((uint8_t*)msgbuf+2,
             len,
             &chassis_type,
             &vpd_info [OPENBMC_VPD_KEY_CHASSIS_PART_NUM],
             &vpd_info [OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM],
-            NULL, 0);
+            &vpd_info [OPENBMC_VPD_KEY_CHASSIS_CUSTOM1],
+            OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX);
 
           /* Populate VPD Table */
           for (i=1; i<=OPENBMC_VPD_KEY_CHASSIS_MAX; i++)
           {
             if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
             {
-                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "y", chassis_type);
 #if IPMI_FRU_PARSER_DEBUG
-                printf ("Chassis : [%s] = [%d]\n", vpd_key_names[i], chassis_type);
-#else
-;
+                printf ("Chassis : Appending [%s] = [%d]\n", vpd_key_names[i], chassis_type);
 #endif
+                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "y", chassis_type);
                 continue;
             }
+
+            _append_to_dict (i, vpd_info[i].type_length_field, vpdtbl);
+/*
             ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-            sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
-#if IPMI_FRU_PARSER_DEBUG
-            printf ("Chassis : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
-#else
-;
-#endif
+            sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
+*/
           }
         break;
     case IPMI_FRU_AREA_BOARD_INFO:
-            ipmi_fru_board_info_area (msgbuf, 
+#if IPMI_FRU_PARSER_DEBUG
+            printf ("Board : Buf len = [%d]\n", len);
+#endif
+            ipmi_fru_board_info_area ((uint8_t*)msgbuf+2,
                 len,
                 NULL,
                 &mfg_date_time,
@@ -961,7 +1033,8 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                 &vpd_info [OPENBMC_VPD_KEY_BOARD_SERIAL_NUM],
                 &vpd_info [OPENBMC_VPD_KEY_BOARD_PART_NUM],
                 &vpd_info [OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID],
-                NULL, 0);
+                &vpd_info [OPENBMC_VPD_KEY_BOARD_CUSTOM1],
+                OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX);
 
           /* Populate VPD Table */
             for (i=OPENBMC_VPD_KEY_BOARD_MFR; i<=OPENBMC_VPD_KEY_BOARD_MAX; i++)
@@ -969,25 +1042,31 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                 if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
                 {
                     _to_time_str (mfg_date_time, timestr, OPENBMC_VPD_VAL_LEN);
-                    sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", timestr);
 #if IPMI_FRU_PARSER_DEBUG
-                    printf ("Board : [%s] = [%d]\n", vpd_key_names[i], mfg_date_time);
-#else
-;
+                    printf ("Board : Appending [%s] = [%d]\n", vpd_key_names[i], timestr);
+#endif
+                    sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", timestr);
+                    if (sdr < 0)
+                    {
+#if IPMI_FRU_PARSER_DEBUG
+                        printf ("ipmi_fru_board_info_area : sd_bus_message_append Failed [ %d ] for [%s]\n", sdr, vpd_key_names[i]);
 #endif
+                    }
                     continue;
                 }
+
+                _append_to_dict (i, vpd_info[i].type_length_field, vpdtbl);
+/*
                 ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
-#if IPMI_FRU_PARSER_DEBUG
-                printf ("Board : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
-#else
-;
-#endif
+                sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
+*/
             }
             break;
     case IPMI_FRU_AREA_PRODUCT_INFO:
-            ipmi_fru_product_info_area (msgbuf,
+#if IPMI_FRU_PARSER_DEBUG
+            printf ("Product : Buf len = [%d]\n", len);
+#endif
+            ipmi_fru_product_info_area ((uint8_t*)msgbuf+2,
                 len,
                 NULL,
                 &vpd_info [OPENBMC_VPD_KEY_PRODUCT_MFR],
@@ -997,16 +1076,12 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                 &vpd_info [OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM],
                 &vpd_info [OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG],
                 &vpd_info [OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID],
-                NULL, 0);
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_CUSTOM1],
+                OPENBMC_VPD_KEY_CUSTOM_FIELDS_MAX);
+
             for (i=OPENBMC_VPD_KEY_PRODUCT_MFR; i<=OPENBMC_VPD_KEY_PRODUCT_MAX; i++)
             {
-                ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
-#if IPMI_FRU_PARSER_DEBUG
-                printf ("Product : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
-#else
-;
-#endif
+                _append_to_dict (i, vpd_info[i].type_length_field, vpdtbl);
             }
             break;
     defualt:
@@ -1014,6 +1089,9 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
     break;
   }
 
+#if IPMI_FRU_PARSER_DEBUG
+    printf ("parse_fru_area : Dictionary Packing Complete\n");
+#endif
  out:
   rv = 0;
  cleanup:
diff --git a/frup.h b/frup.h
index b6b9476..0269bf8 100644
--- a/frup.h
+++ b/frup.h
@@ -5,7 +5,7 @@
 int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
 int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
 
-enum openbmc_ipmi_fru_area_type
+enum ipmi_fru_area_type
 {
     IPMI_FRU_AREA_INTERNAL_USE = 0x00,
     IPMI_FRU_AREA_CHASSIS_INFO,
@@ -13,6 +13,6 @@ enum openbmc_ipmi_fru_area_type
     IPMI_FRU_AREA_PRODUCT_INFO,
     IPMI_FRU_AREA_MULTI_RECORD,
     IPMI_FRU_AREA_TYPE_MAX
-}
+};
 
 #endif
-- 
2.6.3
