Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.158])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EEB881A0252
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:25:03 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445639096396697.7679542508649;
 Fri, 23 Oct 2015 15:24:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v6 8/8] Fix format string in
 sd_bus_message_append to add as dictionary. Store manufacturing time in
 ISO8601 format.
Date: Fri, 23 Oct 2015 17:23:13 -0500
Message-Id: <1445638993-8170-9-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
References: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 23 Oct 2015 22:25:04 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 frup.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/frup.c b/frup.c
index 87669f8..7e39ad1 100644
--- a/frup.c
+++ b/frup.c
@@ -178,6 +178,25 @@ const char* vpd_key_names [] =
  *
  * --------------------------------------------------------------------
  */
+
+static size_t _to_time_str (uint32_t mfg_date_time, char* timestr, uint32_t len)
+{
+    struct tm tm;
+    time_t t;
+    size_t s;
+
+    ASSERT (timestr);
+    ASSERT (len);
+
+    memset (&tm, '\0', sizeof (struct tm));
+
+    t = mfg_date_time;
+    gmtime_r (&t, &tm);
+    s = strftime (timestr, len, "%F - %H:%M:%S", &tm);
+
+    return s;
+}
+
 /* private method to parse type/length */
 static int
 _parse_type_length (const void *areabuf,
@@ -719,6 +738,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   ipmi_fru_area_info_t fru_area_info [ IPMI_FRU_AREA_TYPE_MAX ];
   ipmi_fru_common_hdr_t* chdr = NULL;
   uint8_t* hdr = NULL;
+  char timestr [ OPENBMC_VPD_VAL_LEN ];
 
 
   ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
@@ -828,7 +848,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   {
     if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
     {
-        sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_type);
+        sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "y", chassis_type);
 #if IPMI_FRU_PARSER_DEBUG
         printf ("[%s] = [%d]\n", vpd_key_names[i], chassis_type);
 #else
@@ -839,7 +859,8 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
 
     if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
     {
-        sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_date_time);
+        _to_time_str (mfg_date_time, timestr, OPENBMC_VPD_VAL_LEN);
+        sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", timestr);
 #if IPMI_FRU_PARSER_DEBUG
         printf ("[%s] = [%d]\n", vpd_key_names[i], mfg_date_time);
 #else
@@ -850,7 +871,7 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
     
     /* FIXME: Field type encoding *ASSUMED* to be *BINARY* */
     ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-    sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str); 
+    sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str); 
     if (vpd_info[i].type_length_field_length)
     {
 #if IPMI_FRU_PARSER_DEBUG
@@ -876,6 +897,7 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
   ipmi_fru_common_hdr_t* chdr = NULL;
   uint8_t* hdr = NULL;
   const uint8_t* ipmi_fru_field_str=NULL;
+  char timestr [ OPENBMC_VPD_VAL_LEN ];
 
 
   ipmi_fru_field_t vpd_info [ OPENBMC_VPD_KEY_MAX ];
@@ -912,7 +934,7 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
           {
             if (i==OPENBMC_VPD_KEY_CHASSIS_TYPE)
             {
-                sd_bus_message_append (vpdtbl, "sy", vpd_key_names[i], chassis_type);
+                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "y", chassis_type);
 #if IPMI_FRU_PARSER_DEBUG
                 printf ("Chassis : [%s] = [%d]\n", vpd_key_names[i], chassis_type);
 #else
@@ -921,7 +943,7 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                 continue;
             }
             ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-            sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str);
+            sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
 #if IPMI_FRU_PARSER_DEBUG
             printf ("Chassis : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
 #else
@@ -946,7 +968,8 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
             {
                 if (i==OPENBMC_VPD_KEY_BOARD_MFG_DATE)
                 {
-                    sd_bus_message_append (vpdtbl, "sa{y}", vpd_key_names[i], mfg_date_time);
+                    _to_time_str (mfg_date_time, timestr, OPENBMC_VPD_VAL_LEN);
+                    sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", timestr);
 #if IPMI_FRU_PARSER_DEBUG
                     printf ("Board : [%s] = [%d]\n", vpd_key_names[i], mfg_date_time);
 #else
@@ -955,7 +978,7 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
                     continue;
                 }
                 ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str);
+                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
 #if IPMI_FRU_PARSER_DEBUG
                 printf ("Board : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
 #else
@@ -978,7 +1001,7 @@ int parse_fru_area (const uint8_t area, const void* msgbuf, const uint8_t len, s
             for (i=OPENBMC_VPD_KEY_PRODUCT_MFR; i<=OPENBMC_VPD_KEY_PRODUCT_MAX; i++)
             {
                 ipmi_fru_field_str = (unsigned char*) &(vpd_info[i].type_length_field) + 1;
-                sd_bus_message_append (vpdtbl, "ss", vpd_key_names[i], ipmi_fru_field_str);
+                sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[i], "s", ipmi_fru_field_str);
 #if IPMI_FRU_PARSER_DEBUG
                 printf ("Product : [%s] = [%s]\n", vpd_key_names[i], ipmi_fru_field_str);
 #else
-- 
2.6.0
