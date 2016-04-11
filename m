Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qk50D033hzDqBD
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 19:50:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460368216050239.53320957887513;
 Mon, 11 Apr 2016 02:50:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Using new getFRUOjbect() API to fix 'not
 found in lookup' error message
Date: Mon, 11 Apr 2016 04:50:13 -0500
Message-Id: <1460368213-20074-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460368213-20074-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460368213-20074-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 09:50:20 -0000

From: Yi Li <adamliyi@msn.com>

The ipmi-fru-parser calls the dbus method
SystemManager::getObjectFromId('FRU_STR', fru_area_name) for each fru areas
to get the dbus object path of fru area, even if the fru area does not exist.
Also ipmi_validate_fru_area() may be invoked multipul times before
full fru data is parsed. This will generate duplicated error
messages from SystemManager:, e.g:
"ERROR SystemManager: dbus.String(u'INTERNAL_13') not found in lookup".
In this case, "INTERNAL" area does not exists for FRU

For FRUs mananged by BMC (eeprom), ipmi-fru-parser sets the
'present' and 'fault' status of a fru area.
ipmi-fru-parser needs to know whether a fru should be present, based on
whether getObjectFromId() returns valid dbus object path.
So it is expected that getObjectFromId() may be called with
a 'fru_area_name' not defined in Skeleton's ID_LOOKUP table.

In another pull request for skeleton, a new method:
getFRUObject('fru_area_name') is added specially for ipmi-fru-parser.
See PR: https://github.com/openbmc/skeleton/pull/60.

This new method does not report any error message when 'fru_area_name'
not defined in skeleton.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 writefrudata.C | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/writefrudata.C b/writefrudata.C
index 8771a92..986b3d8 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -152,8 +152,8 @@ ipmi_fru::~ipmi_fru()
         }
         else
         {
-            printf("Present bit set to :[%s] for fruid:[%d]\n",
-                    iv_obj_path.c_str(), iv_fruid);
+            printf("Present bit set to :[%s] for fruid:[%d], Path[%s]:\n",
+                    present_bit, iv_fruid, iv_obj_path.c_str());
         }
 
         sd_bus_error_free(&bus_error);
@@ -184,12 +184,11 @@ int ipmi_fru::setup_sd_bus_paths(void)
                             sys_bus_name,               // Service to contact
                             sys_object_name,            // Object path
                             sys_intf_name,              // Interface name
-                            "getObjectFromId",          // Method to be called
+                            "getFRUObject",             // Method to be called
                             &bus_error,                 // object to return error
                             &response,                  // Response message on success
-                            "ss",                       // input message (string,string)
-                            "FRU_STR",                  // First argument to getObjectFromId
-                            fru_area_name);             // Second Argument
+                            "s",                        // input message (string)
+                            fru_area_name);             // Argument
 
     if(rc < 0)
     {
@@ -449,6 +448,7 @@ int ipmi_populate_fru_areas(uint8_t *fru_data, const size_t data_len,
     for(uint8_t fru_entry = IPMI_FRU_INTERNAL_OFFSET;
             fru_entry < (sizeof(struct common_header) -2); fru_entry++)
     {
+        rc = -1;
         // Actual offset in the payload is the offset mentioned in common header
         // multipled by 8. Common header is always the first 8 bytes.
         area_offset = fru_data[fru_entry] * IPMI_EIGHT_BYTES;
-- 
2.7.1
