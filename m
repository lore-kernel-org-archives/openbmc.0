Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV2Zz2sDpzDqkX
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 20:20:27 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465986019510639.3636011115964;
 Wed, 15 Jun 2016 03:20:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v2] Update BINARY encoded IPMI FRU area data
 to FRU Inventory
Date: Wed, 15 Jun 2016 05:20:15 -0500
Message-Id: <20160615102015.19670-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615102015.19670-1-openbmc-patches@stwcx.xyz>
References: <20160615102015.19670-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 10:20:28 -0000

From: vishwa <vishwanath@in.ibm.com>

IPMI fru record format can contain BINARY and ASCII encodings.
There was an error in the way FRU parser was handling the BINARY
encoded data and that resulted in incorrect updates to FRU Inventory object.

The reason why it was done like that was to workaround a limitation
encountered while creating the dictionary having a name and value pair
where value is an array of bytes.

This proposed fix will convert the array of binary encoded data into ascii
string and updates the FRU inventory as a string. Since string is a single
element, it fits in within the limits of dictionary.

Fixes openbmc/ipmi-fru-parser#3
---
 frup.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/frup.c b/frup.c
index 49718ba..4d3758a 100644
--- a/frup.c
+++ b/frup.c
@@ -770,7 +770,6 @@ ipmi_fru_product_info_area (const void *areabuf,
   return (rv);
 }
 
-
 int _append_to_dict (uint8_t vpd_key_id, uint8_t* vpd_key_val, sd_bus_message* vpdtbl)
 {
     int type_length = vpd_key_val[0];
@@ -778,19 +777,62 @@ int _append_to_dict (uint8_t vpd_key_id, uint8_t* vpd_key_val, sd_bus_message* v
     int vpd_val_len = type_length & IPMI_FRU_TYPE_LENGTH_NUMBER_OF_DATA_BYTES_MASK;
     int sdr=0;
 
+    /* Needed to convert each uint8_t byte to a ascii */
+    char bin_byte[3] = {0};
+
+    /*
+     * Max number of characters needed to represent 1 unsigned byte in string
+     * is number of bytes multipled by 2. Extra 3 for 0x and a ending '\0';
+     */
+    char bin_in_ascii_len = vpd_val_len * 2 + 3;
+
+    /* Binary converted to ascii in array */
+    char *bin_in_ascii = (char *)malloc(bin_in_ascii_len);
+
+    /* For reading byte from the area */
+    size_t val = 0;
+
+    char *bin_copy = &((char *)bin_in_ascii)[2];
+
     switch (type_code)
     {
         case 0:
-            printf ("_append_to_dict: VPD Key = [%s] : Type Code = [BINARY] : Len = [%d] : Val = [%s]\n", vpd_key_names [vpd_key_id], vpd_val_len, &vpd_key_val[1]);
-            sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "ay", vpd_val_len, &vpd_key_val[1]);
-            /*sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "s", &vpd_key_val[1]);*/
+            memset(bin_in_ascii, 0x0, bin_in_ascii_len);
+
+            /* Offset 1 is where actual data starts */
+            for(val = 1; val <= vpd_val_len ; val++)
+            {
+                /* 2 bytes for data and 1 for terminating '\0' */
+                snprintf(bin_byte, 3, "%02x", vpd_key_val[val]);
+
+                /* Its a running string so strip off the '\0' */
+                strncat(bin_copy, bin_byte, 2);
+            }
+
+            /* We need the data represented as 0x...... */
+            if(vpd_val_len > 0)
+            {
+                strncpy(bin_in_ascii, "0x", 2);
+            }
+
+            printf ("_append_to_dict: VPD Key = [%s] : Type Code = [BINARY] : Len = [%d] : Val = [%s]\n",
+                    vpd_key_names [vpd_key_id], vpd_val_len, bin_in_ascii);
+            sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "s", bin_in_ascii);
             break;
+
         case 3:
             printf ("_append_to_dict: VPD Key = [%s] : Type Code = [ASCII+Latin] : Len = [%d] : Val = [%s]\n", vpd_key_names [vpd_key_id], vpd_val_len, &vpd_key_val[1]);
             sdr = sd_bus_message_append (vpdtbl, "{sv}", vpd_key_names[vpd_key_id], "s", &vpd_key_val[1]);
             break;
     }
 
+    if(bin_in_ascii)
+    {
+        free(bin_in_ascii);
+        bin_in_ascii = NULL;
+    }
+
+
     if (sdr < 0)
     {
 #if IPMI_FRU_PARSER_DEBUG
@@ -944,7 +986,6 @@ parse_fru (const void* msgbuf, sd_bus_message* vpdtbl)
   }
  out:
   rv = 0;
- cleanup:
   return (rv);
 }
 
-- 
2.8.4
