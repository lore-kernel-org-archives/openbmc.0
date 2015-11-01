Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9FF451A099E
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:13:32 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340406835730.1791101256956;
 Sat, 31 Oct 2015 18:13:26 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v8 05/11] Added interface parse_fru_area to
 parse a specific area and populate a name/value dictionary.
Date: Sat, 31 Oct 2015 20:13:10 -0500
Message-Id: <1446340396-8562-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:13:33 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 frup.h |  11 +++++++
 2 files changed, 119 insertions(+)

diff --git a/frup.c b/frup.c
index ab58426..d279666 100644
--- a/frup.c
+++ b/frup.c
@@ -117,6 +117,7 @@ enum openbmc_vpd_key_id
   OPENBMC_VPD_KEY_CHASSIS_TYPE = 1, /* not a type/len */
   OPENBMC_VPD_KEY_CHASSIS_PART_NUM,
   OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,
+  OPENBMC_VPD_KEY_CHASSIS_MAX = OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM,
   /* TODO: chassis_custom_fields */
 
   OPENBMC_VPD_KEY_BOARD_MFG_DATE, /* not a type/len */
@@ -125,6 +126,7 @@ enum openbmc_vpd_key_id
   OPENBMC_VPD_KEY_BOARD_SERIAL_NUM,
   OPENBMC_VPD_KEY_BOARD_PART_NUM,
   OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID,
+  OPENBMC_VPD_KEY_BOARD_MAX = OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID,
   /* TODO: board_custom_fields */
 
   OPENBMC_VPD_KEY_PRODUCT_MFR,
@@ -134,6 +136,7 @@ enum openbmc_vpd_key_id
   OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM,
   OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG,
   OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID,
+  OPENBMC_VPD_KEY_PRODUCT_MAX = OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID,
   /* TODO: product_custom_fields */
 
   OPENBMC_VPD_KEY_MAX,
@@ -821,3 +824,108 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
  cleanup:
   return (rv);
 }
+
+int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl)
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
+  switch (area)
+  {
+    case IPMI_FRU_AREA_CHASSIS_INFO:
+        ipmi_fru_chassis_info_area (msgbuf,
+            len,
+            &chassis_type,
+            &vpd_info [OPENBMC_VPD_KEY_CHASSIS_PART_NUM],
+            &vpd_info [OPENBMC_VPD_KEY_CHASSIS_SERIAL_NUM],
+            NULL, 0);
+
+          /* Populate VPD Table */
+          for (i=1; i<=OPENBMC_VPD_KEY_CHASSIS_MAX; i++)
+          {
+            if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
+            {
+                sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_type);
+                continue;
+            }
+            sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+          }
+        break;
+    case IPMI_FRU_AREA_BOARD_INFO:
+            ipmi_fru_board_info_area (msgbuf, 
+                len,
+                NULL,
+                &mfg_date_time,
+                &vpd_info [OPENBMC_VPD_KEY_BOARD_MFR],
+                &vpd_info [OPENBMC_VPD_KEY_BOARD_NAME],
+                &vpd_info [OPENBMC_VPD_KEY_BOARD_SERIAL_NUM],
+                &vpd_info [OPENBMC_VPD_KEY_BOARD_PART_NUM],
+                &vpd_info [OPENBMC_VPD_KEY_BOARD_FRU_FILE_ID],
+                NULL, 0);
+
+          /* Populate VPD Table */
+            for (i=OPENBMC_VPD_KEY_BOARD_MFR; i<=OPENBMC_VPD_KEY_BOARD_MAX; i++)
+            {
+                if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
+                {
+                    sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_date_time);
+                    continue;
+                }
+                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+            }
+            break;
+    case IPMI_FRU_AREA_PRODUCT_INFO:
+            ipmi_fru_product_info_area (msgbuf,
+                len,
+                NULL,
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_MFR],
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_NAME],
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_PART_MODEL_NUM],
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_VER],
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_SERIAL_NUM],
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_ASSET_TAG],
+                &vpd_info [OPENBMC_VPD_KEY_PRODUCT_FRU_FILE_ID],
+                NULL, 0);
+            for (i=OPENBMC_VPD_KEY_PRODUCT_MFR; i<=OPENBMC_VPD_KEY_PRODUCT_MAX; i++)
+            {
+                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], vpd_info [i].type_length_field); 
+            }
+            break;
+    defualt:
+    /* TODO: Parse Multi Rec / Internal use area */
+    break;
+  }
+
+ out:
+  rv = 0;
+ cleanup:
+  return (rv);
+}
diff --git a/frup.h b/frup.h
index 2270470..b6b9476 100644
--- a/frup.h
+++ b/frup.h
@@ -3,5 +3,16 @@
 
 /* Parse an IPMI write fru data message into a dictionary containing name value pair of VPD entries.*/
 int parse_fru (const void* msgbuf, sd_bus_message* vpdtbl);
+int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, sd_bus_message* vpdtbl);
+
+enum openbmc_ipmi_fru_area_type
+{
+    IPMI_FRU_AREA_INTERNAL_USE = 0x00,
+    IPMI_FRU_AREA_CHASSIS_INFO,
+    IPMI_FRU_AREA_BOARD_INFO,
+    IPMI_FRU_AREA_PRODUCT_INFO,
+    IPMI_FRU_AREA_MULTI_RECORD,
+    IPMI_FRU_AREA_TYPE_MAX
+}
 
 #endif
-- 
2.6.0
