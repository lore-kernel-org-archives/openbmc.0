Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E9B591A0965
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:30:55 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549453652369.03134660674993;
 Thu, 22 Oct 2015 14:30:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v5 3/7] Added interface function to parse
 wirte fru data message into a dictionary.
Date: Thu, 22 Oct 2015 16:30:43 -0500
Message-Id: <1445549447-2577-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
References: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:30:56 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.c | 250 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 237 insertions(+), 13 deletions(-)

diff --git a/frup.c b/frup.c
index d3471ff..9711645 100644
--- a/frup.c
+++ b/frup.c
@@ -47,7 +47,19 @@
 #define uint8_t unsigned char
 #define uint32_t unsigned int
 
-#define ASSERT(x) if(!(x)) return -1;
+#define TEXTSTR(a) #a
+# define ASSERT(x) \
+do { \
+if (0 == (x)) { \
+fprintf(stderr, \
+"Assertion failed: %s, " \
+"%d at \'%s\'\n", \
+__FILE__, \
+__LINE__, \
+TEXTSTR(a)); \
+return -1; \
+} \
+} while (0)
 
 
 #define IPMI_FRU_AREA_TYPE_LENGTH_FIELD_MAX            512
@@ -57,6 +69,20 @@
 #define IPMI_FRU_TYPE_LENGTH_NUMBER_OF_DATA_BYTES_MASK 0x3F
 #define IPMI_FRU_TYPE_LENGTH_TYPE_CODE_LANGUAGE_CODE   0x03
 
+/* OpenBMC defines for Parser */
+#define IPMI_FRU_AREA_TYPE_MAX                         0x05
+#define IPMI_FRU_AREA_INTERNAL_USE                     0x00
+#define IPMI_FRU_AREA_CHASSIS_INFO                     0x01
+#define IPMI_FRU_AREA_BOARD_INFO                       0x02
+#define IPMI_FRU_AREA_PRODUCT_INFO                     0x03
+#define IPMI_FRU_AREA_MULTI_RECORD                     0x04
+
+#define OPENBMC_VPD_KEY_LEN                            64
+#define OPENBMC_VPD_VAL_LEN                            512
+
+
+int sd_bus_message_append (void*, const char*, ...);
+typedef struct sd_bus_message sd_bus_message;
 
 struct ipmi_fru_field
 {
@@ -66,7 +92,91 @@ struct ipmi_fru_field
 };
 
 typedef struct ipmi_fru_field ipmi_fru_field_t;
+/* 
+ * FRU Parser 
+ */
+
+typedef struct ipmi_fru_area_info
+{
+    uint8_t off;
+    uint8_t len;
+} ipmi_fru_area_info_t;
+
+typedef struct ipmi_fru_common_hdr
+{
+    uint8_t fmtver;
+    uint8_t internal;
+    uint8_t chassis;
+    uint8_t board;
+    uint8_t product;
+    uint8_t multirec;
+} ipmi_fru_common_hdr_t;
+
+enum openbmc_vpd_key_id
+{
+  OPENBMC_VPD_KEY_CHASSIS_TYPE = 1, /* not a type/len */
+  OPENBMC_VPD_KEY_CHASSIS_PART_NUM,
+  OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,
+  /* TODO: chassis_custom_fields */
+
+  OPENBMC_VPD_KEY_BOARD_MFG_DATE, /* not a type/len */
+  OPENBMC_VPD_KEY_BOARD_MFR,
+  OPENBMC_VPD_KEY_BOARD_NAME,
+  OPENBMC_VPD_KEY_BOARD_SERIAL_NUM,
+  OPENBMC_VPD_KEY_BOARD_PART_NUM,
+  OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID,
+  /* TODO: board_custom_fields */
+
+  OPENBMC_VPD_KEY_PRODUCT_MFR,
+  OPENBMC_VPD_KEY_PRODUCT_NAME,
+  OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM,
+  OPENBMC_VPD_KEY_PRODUCT_VER,
+  OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM,
+  OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG,
+  OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID,
+  /* TODO: product_custom_fields */
+
+  OPENBMC_VPD_KEY_MAX,
+  
+};
+
+const char* vpd_key_names [] = 
+{
+  "Key Names Table Start", 
+  "Chassis Type", /*OPENBMC_VPD_KEY_CHASSIS_TYPE*/
+  "Chassis Part Number", /*OPENBMC_VPD_KEY_CHASSIS_PART_NUM,*/
+  "Chassis Serial Number", /*OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,*/
+
+  /* TODO: chassis_custom_fields */
+
+  "Board Mfg Date", /* OPENBMC_VPD_KEY_BOARD_MFG_DATE, */ /* not a type/len */
+  "Board Manufacturer", /* OPENBMC_VPD_KEY_BOARD_MFR, */
+  "Board Name", /* OPENBMC_VPD_KEY_BOARD_NAME, */
+  "Board Serial Number", /* OPENBMC_VPD_KEY_BOARD_SERIAL_NUM, */
+  "Board Part Number", /* OPENBMC_VPD_KEY_BOARD_PART_NUM, */
+  "Board FRU File ID", /* OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID, */
+  /* TODO: board_custom_fields */
+
+  "Product Manufacturer", /* OPENBMC_VPD_KEY_PRODUCT_MFR, */
+  "Product Name", /* OPENBMC_VPD_KEY_PRODUCT_NAME, */
+  "Product Model Number", /* OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM, */
+  "Product Version", /* OPENBMC_VPD_KEY_PRODUCT_VER, */
+  "Product Serial Number", /* OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM, */
+  "Product Asset Tag", /* OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG, */
+  "Product FRU File ID", /* OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID, */
+  /* TODO: product_custom_fields */
+
+  "Key Names Table End" /*OPENBMC_VPD_KEY_MAX,*/
+};
 
+
+/*
+ * --------------------------------------------------------------------
+ *
+ * --------------------------------------------------------------------
+ */
+
+/* private method to parse type/length */
 static int
 _parse_type_length (const void *areabuf,
                     unsigned int areabuflen,
@@ -84,14 +194,14 @@ _parse_type_length (const void *areabuf,
   
   type_length = areabufptr[current_area_offset];
 
-  /* IPMI Workaround 
+  /* ipmi workaround 
    *
-   * Dell P weredge R610
+   * dell p weredge r610
    *
-   * My reading of the FRU Spec is that all non-custom fields are
-   * required to be listed by the vendor.  However, on this
+   * my reading of the fru spec is that all non-custom fields are
+   * required to be listed by the vendor.  however, on this
    * motherboard, some areas list this, indicating that there is
-   * no more data to be parsed.  So now, for "required" fields, I
+   * no more data to be parsed.  so now, for "required" fields, i
    * check to see if the type-length field is a sentinel before
    * calling this function.
    */
@@ -101,8 +211,8 @@ _parse_type_length (const void *areabuf,
   type_code = (type_length & IPMI_FRU_TYPE_LENGTH_TYPE_CODE_MASK) >> IPMI_FRU_TYPE_LENGTH_TYPE_CODE_SHIFT;
   (*number_of_data_bytes) = type_length & IPMI_FRU_TYPE_LENGTH_NUMBER_OF_DATA_BYTES_MASK;
 
-  /* Special Case: This shouldn't be a length of 0x01 (see type/length
-   * byte format in FRU Information Storage Definition).
+  /* special case: this shouldn't be a length of 0x01 (see type/length
+   * byte format in fru information storage definition).
    */
   if (type_code == IPMI_FRU_TYPE_LENGTH_TYPE_CODE_LANGUAGE_CODE
       && (*number_of_data_bytes) == 0x01)
@@ -294,19 +404,19 @@ ipmi_fru_board_info_area (const void *areabuf,
       /* mfg_date_time is in minutes, so multiple by 60 to get seconds */
       mfg_date_time_tmp *= 60;
 
-      /* Posix says individual calls need not clear/set all portions of
+      /* posix says individual calls need not clear/set all portions of
        * 'struct tm', thus passing 'struct tm' between functions could
-       * have issues.  So we need to memset.
+       * have issues.  so we need to memset.
        */
       memset (&tm, '\0', sizeof(struct tm));
 
-      /* In FRU, epoch is 0:00 hrs 1/1/96
+      /* in fru, epoch is 0:00 hrs 1/1/96
        *
-       * So convert into ansi epoch
+       * so convert into ansi epoch
        */
 
       tm.tm_year = 96;          /* years since 1900 */
-      tm.tm_mon = 0;            /* months since January */
+      tm.tm_mon = 0;            /* months since january */
       tm.tm_mday = 1;           /* 1-31 */
       tm.tm_hour = 0;
       tm.tm_min = 0;
@@ -597,3 +707,117 @@ ipmi_fru_product_info_area (const void *areabuf,
  cleanup:
   return (rv);
 }
+
+
+int
+parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
+{
+  int ret = 0;
+  int rv = -1;
+  int i = 0;
+  ipmi_fru_area_info_t fru_area_info [ IPMI_FRU_AREA_TYPE_MAX ];
+  ipmi_fru_common_hdr_t* chdr = NULL;
+  uint8_t* hdr = NULL;
+
+
+  ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
+
+  /* Chassis */
+  uint8_t chassis_type;
+
+  /* Board */
+  uint32_t mfg_date_time;
+
+  /* Product */
+  unsigned int product_custom_fields_len;
+
+  ASSERT (msgbuf);
+  ASSERT (vpdtbl);
+
+  chdr = (ipmi_fru_common_hdr_t*) msgbuf;
+  hdr  = (uint8_t*) msgbuf;
+
+  fru_area_info [ IPMI_FRU_AREA_INTERNAL_USE ].off = chdr->internal;
+  fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].off = chdr->chassis;
+  fru_area_info [ IPMI_FRU_AREA_BOARD_INFO   ].off = chdr->board;
+  fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].off = chdr->product;
+  fru_area_info [ IPMI_FRU_AREA_MULTI_RECORD ].off = chdr->multirec;
+
+  if (chdr->internal)
+  {
+    fru_area_info [ IPMI_FRU_AREA_INTERNAL_USE ].len = 8*(*(hdr+chdr->internal+1));
+    
+    /* TODO: Parse internal use area */
+  }
+
+  if (chdr->chassis)
+  {
+    fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].len = 8*(*(hdr+chdr->chassis+1));
+    ipmi_fru_chassis_info_area (hdr+chdr->chassis,
+        fru_area_info [ IPMI_FRU_AREA_CHASSIS_INFO ].len,
+        &chassis_type,
+        &vpd_info [OPENBMC_VPD_KEY_CHASSIS_PART_NUM],
+        &vpd_info [OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM],
+        NULL, 0);
+  }
+    
+  if (chdr->board)
+  {
+    fru_area_info [ IPMI_FRU_AREA_BOARD_INFO ].len = 8*(*(hdr+chdr->board+1));
+    ipmi_fru_board_info_area (hdr+chdr->board, 
+        fru_area_info [ IPMI_FRU_AREA_BOARD_INFO ].len,
+        NULL,
+        &mfg_date_time,
+        &vpd_info [OPENBMC_VPD_KEY_BOARD_MFR],
+        &vpd_info [OPENBMC_VPD_KEY_BOARD_NAME],
+        &vpd_info [OPENBMC_VPD_KEY_BOARD_SERIAL_NUM],
+        &vpd_info [OPENBMC_VPD_KEY_BOARD_PART_NUM],
+        &vpd_info [OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID],
+        NULL, 0);
+  }
+
+  if (chdr->product)
+  {
+    fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].len = 8*(*(hdr+chdr->product+1));
+    ipmi_fru_product_info_area (hdr+chdr->product, 
+        fru_area_info [ IPMI_FRU_AREA_PRODUCT_INFO ].len,
+        NULL,
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_MFR],
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_NAME],
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM],
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_VER],
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM],
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG],
+        &vpd_info [OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID],
+        NULL, 0);
+  }
+
+  if (chdr->multirec)
+  {
+    fru_area_info [ IPMI_FRU_AREA_MULTI_RECORD ].len = 8*(*(hdr+chdr->multirec+1));
+    /* TODO: Parse multi record area */
+  }
+
+  /* Populate VPD Table */
+  for (i=1; i<OPENBMC_VPD_KEY_MAX; i++)
+  {
+    if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
+    {
+        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], chassis_type);
+        continue;
+    }
+
+    if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
+    {
+        sd_bus_message_append (vpdtbl, "sd", vpd_key_names[i], mfg_date_time);
+        continue;
+    }
+    
+    sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+  }
+
+ out:
+  rv = 0;
+ cleanup:
+  return (rv);
+}
-- 
2.6.0
