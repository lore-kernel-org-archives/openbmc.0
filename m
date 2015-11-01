Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5224C1A07C5
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:13:36 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340409897292.38679138339967;
 Sat, 31 Oct 2015 18:13:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v8 07/11] Internal parser functions expect the
 area buffer to point to location where language code. Hence advance 2 bytes
 on the areabuf(to go past the fmt/version and len fields) and pass it to the
 area specific parser routines. Also fix bugs on offset/len calcuation.
Date: Sat, 31 Oct 2015 20:13:12 -0500
Message-Id: <1446340396-8562-8-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446340396-8562-1-git-send-email-patches@stwcx.xyz>
References: <1446340396-8562-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:13:36 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.c | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 27 deletions(-)

diff --git a/frup.c b/frup.c
index d279666..87669f8 100644
--- a/frup.c
+++ b/frup.c
@@ -44,6 +44,7 @@
 #include <string.h>
 #include <time.h>
 
+#define IPMI_FRU_PARSER_DEBUG 1
 #define uint8_t unsigned char
 #define uint32_t unsigned int
 
@@ -61,7 +62,6 @@ return -1; \
 } \
 } while (0)
 
-
 #define IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX            512
 #define IPMI_FRU_SENTINEL_VALUE                        0xC1
 #define IPMI_FRU_TYPE_LENGTH_TYPE_CODE_MASK            0xC0
@@ -70,12 +70,12 @@ return -1; \
 #define IPMI_FRU_TYPE_LENGTH_TYPE_CODE_LANGUAGE_CODE   0x03
 
 /* OpenBMC defines for Parser */
-#define IPMI_FRU_AREA_TYPE_MAX                         0x05
 #define IPMI_FRU_AREA_INTERNAL_USE                     0x00
 #define IPMI_FRU_AREA_CHASSIS_INFO                     0x01
 #define IPMI_FRU_AREA_BOARD_INFO                       0x02
 #define IPMI_FRU_AREA_PRODUCT_INFO                     0x03
 #define IPMI_FRU_AREA_MULTI_RECORD                     0x04
+#define IPMI_FRU_AREA_TYPE_MAX                         0x05
 
 #define OPENBMC_VPD_KEY_LEN                            64
 #define OPENBMC_VPD_VAL_LEN                            512
@@ -110,7 +110,7 @@ typedef struct ipmi_fru_common_hdr
     uint8_t board;
     uint8_t product;
     uint8_t multirec;
-} ipmi_fru_common_hdr_t;
+} __attribute__((packed)) ipmi_fru_common_hdr_t;
 
 enum openbmc_vpd_key_id
 {
@@ -178,7 +178,6 @@ const char* vpd_key_names [] =
  *
  * --------------------------------------------------------------------
  */
-
 /* private method to parse type/length */
 static int
 _parse_type_length (const void *areabuf,
@@ -476,8 +475,7 @@ ipmi_fru_board_info_area (const void *areabuf,
   if (areabufptr[area_offset] == IPMI_FRU_SENTINEL_VALUE)
     goto out;
 
-  if (_parse_type_length (
-                          areabufptr,
+  if (_parse_type_length (areabufptr,
                           areabuflen,
                           area_offset,
                           &number_of_data_bytes,
@@ -724,6 +722,9 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 
 
   ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
+  /*char ipmi_fru_field_str [ IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX ];
+  uint32_t len=0;*/
+  const uint8_t* ipmi_fru_field_str;
 
   /* Chassis */
   uint8_t chassis_type;
@@ -737,6 +738,18 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   ASSERT (msgbuf);
   ASSERT (vpdtbl);
 
+  for (i=0; i<OPENBMC_VPD_KEY_MAX; i++)
+  {
+    memset (vpd_info[i].type_length_field, '\0', IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX);
+    vpd_info[i].type_length_field_length = 0;
+  }
+
+  for (i=0; i<IPMI_FRU_AREA_TYPE_MAX; i++)
+  {
+    fru_area_info [ i ].off = 0;
+    fru_area_info [ i ].len = 0;
+  }
+
   chdr = (ipmi_fru_common_hdr_t*) msgbuf;
   hdr  = (uint8_t*) msgbuf;
 
@@ -748,15 +761,15 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 
   if (chdr->internal)
   {
-    fru_area_info [ IPMI_FRU_AREA_INTERNAL_USE ].len = 8*(*(hdr+chdr->internal+1));
+    fru_area_info [ IPMI_FRU_AREA_INTERNAL_USE ].len =  8*(*(hdr+8*chdr->internal+1));
     
     /* TODO: Parse internal use area */
   }
 
   if (chdr->chassis)
   {
-    fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].len = 8*(*(hdr+chdr->chassis+1));
-    ipmi_fru_chassis_info_area (hdr+chdr->chassis,
+    fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].len = 8*(*(hdr+8*chdr->chassis+1));
+    ipmi_fru_chassis_info_area (hdr+8*chdr->chassis+2,
         fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].len,
         &chassis_type,
         &vpd_info [OPENBMC_VPD_KEY_CHASSIS_PART_NUM],
@@ -766,8 +779,8 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
     
   if (chdr->board)
   {
-    fru_area_info [ IPMI_FRU_AREA_BOARD_INFO ].len = 8*(*(hdr+chdr->board+1));
-    ipmi_fru_board_info_area (hdr+chdr->board, 
+    fru_area_info [ IPMI_FRU_AREA_BOARD_INFO ].len = 8*(*(hdr+8*chdr->board+1));
+    ipmi_fru_board_info_area (hdr+8*chdr->board+2,
         fru_area_info [ IPMI_FRU_AREA_BOARD_INFO ].len,
         NULL,
         &mfg_date_time,
@@ -781,8 +794,8 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 
   if (chdr->product)
   {
-    fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].len = 8*(*(hdr+chdr->product+1));
-    ipmi_fru_product_info_area (hdr+chdr->product, 
+    fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].len = 8*(*(hdr+8*chdr->product+1));
+    ipmi_fru_product_info_area (hdr+8*chdr->product+2,
         fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].len,
         NULL,
         &vpd_info [OPENBMC_VPD_KEY_PRODUCT_MFR],
@@ -797,26 +810,55 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 
   if (chdr->multirec)
   {
-    fru_area_info [ IPMI_FRU_AREA_MULTI_RECORD ].len = 8*(*(hdr+chdr->multirec+1));
+    fru_area_info [ IPMI_FRU_AREA_MULTI_RECORD ].len = 8*(*(hdr+8*chdr->multirec+1));
     /* TODO: Parse multi record area */
   }
 
+  for (i=0; i<IPMI_FRU_AREA_TYPE_MAX; i++)
+  {
+#if IPMI_FRU_PARSER_DEBUG
+    printf ("IPMI_FRU_AREA_TYPE=[%d] : Offset=[%d] : Len=[%d]\n", i, fru_area_info [i].off, fru_area_info[i].len);
+#else
+;
+#endif
+  }
+
   /* Populate VPD Table */
   for (i=1; i<OPENBMC_VPD_KEY_MAX; i++)
   {
     if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
     {
         sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_type);
+#if IPMI_FRU_PARSER_DEBUG
+        printf ("[%s] = [%d]\n", vpd_key_names[i], chassis_type);
+#else
+;
+#endif
         continue;
     }
 
     if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
     {
         sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_date_time);
+#if IPMI_FRU_PARSER_DEBUG
+        printf ("[%s] = [%d]\n", vpd_key_names[i], mfg_date_time);
+#else
+;
+#endif
         continue;
     }
     
-    sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+    /* FIXME: Field type encoding *ASSUMED* to be *BINARY* */
+    ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
+    sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str); 
+    if (vpd_info[i].type_length_field_length)
+    {
+#if IPMI_FRU_PARSER_DEBUG
+        printf ("[%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
+#else
+;
+#endif
+    }
   }
 
  out:
@@ -833,9 +875,15 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
   ipmi_fru_area_info_t fru_area_info [ IPMI_FRU_AREA_TYPE_MAX ];
   ipmi_fru_common_hdr_t* chdr = NULL;
   uint8_t* hdr = NULL;
+  const uint8_t* ipmi_fru_field_str=NULL;
 
 
   ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
+  for (i=0; i<OPENBMC_VPD_KEY_MAX; i++)
+  {
+    memset (vpd_info[i].type_length_field, '\0', IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX);
+    vpd_info[i].type_length_field_length = 0;
+  }
 
   /* Chassis */
   uint8_t chassis_type;
@@ -849,15 +897,6 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
   ASSERT (msgbuf);
   ASSERT (vpdtbl);
 
-  chdr = (ipmi_fru_common_hdr_t*) msgbuf;
-  hdr  = (uint8_t*) msgbuf;
-
-  fru_area_info [ IPMI_FRU_AREA_INTERNAL_USE ].off = chdr->internal;
-  fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].off = chdr->chassis;
-  fru_area_info [ IPMI_FRU_AREA_BOARD_INFO   ].off = chdr->board;
-  fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].off = chdr->product;
-  fru_area_info [ IPMI_FRU_AREA_MULTI_RECORD ].off = chdr->multirec;
-
   switch (area)
   {
     case IPMI_FRU_AREA_CHASSIS_INFO:
@@ -874,9 +913,20 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
             if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
             {
                 sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_type);
+#if IPMI_FRU_PARSER_DEBUG
+                printf ("Chassis : [%s] = [%d]\n", vpd_key_names[i], chassis_type);
+#else
+;
+#endif
                 continue;
             }
-            sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+            ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
+            sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str);
+#if IPMI_FRU_PARSER_DEBUG
+            printf ("Chassis : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
+#else
+;
+#endif
           }
         break;
     case IPMI_FRU_AREA_BOARD_INFO:
@@ -897,9 +947,20 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                 if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
                 {
                     sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_date_time);
+#if IPMI_FRU_PARSER_DEBUG
+                    printf ("Board : [%s] = [%d]\n", vpd_key_names[i], mfg_date_time);
+#else
+;
+#endif
                     continue;
                 }
-                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+                ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
+                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str);
+#if IPMI_FRU_PARSER_DEBUG
+                printf ("Board : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
+#else
+;
+#endif
             }
             break;
     case IPMI_FRU_AREA_PRODUCT_INFO:
@@ -916,7 +977,13 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                 NULL, 0);
             for (i=OPENBMC_VPD_KEY_PRODUCT_MFR; i<=OPENBMC_VPD_KEY_PRODUCT_MAX; i++)
             {
-                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+                ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
+                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str);
+#if IPMI_FRU_PARSER_DEBUG
+                printf ("Product : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
+#else
+;
+#endif
             }
             break;
     defualt:
-- 
2.6.0
