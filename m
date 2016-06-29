Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfkpN0hN8zDqts
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:00:27 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467208823764587.5547724911235;
 Wed, 29 Jun 2016 07:00:23 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH ipmi-fru-parser v2] Handle IOBoard VPD for Barreleye
Date: Wed, 29 Jun 2016 09:00:21 -0500
Message-Id: <20160629140021.28683-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629140021.28683-1-openbmc-patches@stwcx.xyz>
References: <20160629140021.28683-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 14:00:28 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Due to changes to the IOBoard VPD for Barreleye to include the MAC
address, the fru parser needs hardening to handle these changes.
First do not try to read data if the area length is 0. Second
adjust the area length as the checksum is now at a 4 byte
boundary instead of 8. Add a new argument to phosphor-read-eeprom
to activate this handling.
Fixes openbmc/ipmi-fru-parser#19

Change-Id: I8f47205712f1f4be43e1c14359070f27e7f704b8
Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 argument.C     |  1 +
 fru-area.H     | 10 +++++++++-
 readeeprom.C   | 11 +++++++++--
 writefrudata.C | 38 +++++++++++++++++++++++++++++++++++---
 writefrudata.H |  3 ++-
 5 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/argument.C b/argument.C
index a7e0a94..a191613 100644
--- a/argument.C
+++ b/argument.C
@@ -53,6 +53,7 @@ const option ArgumentParser::options[] =
     { "eeprom",   required_argument,  NULL, 'e' },
     { "fruid",    required_argument,  NULL, 'f' },
     { "help",     no_argument,        NULL, 'h' },
+    { "iob",      no_argument,        NULL, 'w' }, // ioboard workaround
     { 0, 0, 0, 0},
 };
 
diff --git a/fru-area.H b/fru-area.H
index 82206bb..31e2546 100644
--- a/fru-area.H
+++ b/fru-area.H
@@ -31,6 +31,9 @@ class ipmi_fru
         // Special bit for BMC readable eeprom only.
         bool iv_bmc_fru;
 
+        // Variable for io board workaround
+        bool iv_iob;
+
         // If a FRU is physically present.
         bool iv_present;
 
@@ -58,7 +61,7 @@ class ipmi_fru
     public:
         // constructor
         ipmi_fru(const uint8_t fruid, const ipmi_fru_area_type type,
-                 sd_bus *bus_type, bool bmc_fru = false);
+                 sd_bus *bus_type, bool bmc_fru = false, bool iob = false);
 
         // Destructor
         virtual ~ipmi_fru();
@@ -87,6 +90,11 @@ class ipmi_fru
             return iv_bmc_fru;
         }
 
+        inline bool get_iob() const
+        {
+            return iv_iob;
+        }
+
         // returns fru id;
         uint8_t get_fruid() const
         {
diff --git a/readeeprom.C b/readeeprom.C
index b78f35e..08830f5 100644
--- a/readeeprom.C
+++ b/readeeprom.C
@@ -17,6 +17,7 @@ static void exit_with_error(const char* err, char** argv)
 int main(int argc, char **argv)
 {
     int rc = 0;
+    bool iob = false;
     uint8_t fruid = 0;
 
     // Handle to per process system bus
@@ -34,7 +35,7 @@ int main(int argc, char **argv)
     }
 
     auto fruid_str = (*cli_options)["fruid"];
-    if (eeprom_file == ArgumentParser::empty_string)
+    if (fruid_str == ArgumentParser::empty_string)
     {
         // User has not passed in the appropriate argument value
         exit_with_error("fruid data not found.", argv);
@@ -48,6 +49,12 @@ int main(int argc, char **argv)
         exit_with_error("Invalid fruid.", argv);
     }
 
+    auto iob_str = (*cli_options)["iob"];
+    if (iob_str == ArgumentParser::true_string)
+    {
+        iob = true;
+    }
+
     // Finished getting options out, so release the parser.
     cli_options.release();
 
@@ -62,7 +69,7 @@ int main(int argc, char **argv)
         // Now that we have the file that contains the eeprom data, go read it and
         // update the Inventory DB.
         bool bmc_fru = true;
-        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type, bmc_fru);
+        rc = ipmi_validate_fru_area(fruid, eeprom_file.c_str(), bus_type, bmc_fru, iob);
     }
 
     // Cleanup
diff --git a/writefrudata.C b/writefrudata.C
index 6791148..d8e6d4a 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -23,12 +23,13 @@ const char  *sys_intf_name     =  "org.openbmc.managers.System";
 // Constructor
 //----------------------------------------------------------------
 ipmi_fru::ipmi_fru(const uint8_t fruid, const ipmi_fru_area_type type,
-                   sd_bus *bus_type, bool bmc_fru)
+                   sd_bus *bus_type, bool bmc_fru, bool iob)
 {
     iv_fruid = fruid;
     iv_type = type;
     iv_bmc_fru = bmc_fru;
     iv_bus_type = bus_type;
+    iv_iob = iob;
     iv_valid = false;
     iv_data = NULL;
     iv_present = false;
@@ -442,6 +443,7 @@ int ipmi_populate_fru_areas(uint8_t *fru_data, const size_t data_len,
 {
     size_t area_offset = 0;
     int rc = -1;
+    bool iob = false;
 
     // Now walk the common header and see if the file size has atleast the last
     // offset mentioned by the common_hdr. If the file size is less than the
@@ -469,6 +471,36 @@ int ipmi_populate_fru_areas(uint8_t *fru_data, const size_t data_len,
 
             // Size of this area will be the 2nd byte in the fru area header.
             size_t  area_len = area_hdr[1] * IPMI_EIGHT_BYTES;
+
+            // If area size is 0, skip it
+            if (!area_len)
+            {
+                continue;
+            }
+
+            // Check if the iob workaround has been requested
+            for (auto& iter : fru_area_vec)
+            {
+                iob = iter->get_iob();
+                if (iob)
+                {
+                    break;
+                }
+            }
+            if (iob)
+            {
+                if (fru_entry == IPMI_FRU_BOARD_OFFSET)
+                {
+                    // Adjust board area length to its actual size
+                    area_len -= 3;
+                }
+                else if (fru_entry == IPMI_FRU_PRODUCT_OFFSET)
+                {
+                    // Skip the product area, there's no data there
+                    continue;
+                }
+            }
+
             uint8_t area_data[area_len] = {0};
 
             printf("fru data size:[%d], area offset:[%d], area_size:[%d]\n",
@@ -637,7 +669,7 @@ int get_defined_fru_area(sd_bus *bus_type, const uint8_t fruid,
 // Accepts the filename and validates per IPMI FRU spec
 //----------------------------------------------------
 int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
-                           sd_bus *bus_type, const bool bmc_fru)
+                           sd_bus *bus_type, const bool bmc_fru, const bool iob)
 {
     size_t data_len = 0;
     size_t bytes_read = 0;
@@ -660,7 +692,7 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
     {
         // Create an object and push onto a vector.
         std::unique_ptr<ipmi_fru> fru_area = std::make_unique<ipmi_fru>
-                         (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru);
+                         (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru, iob);
 
         // Physically being present
         bool present = access(fru_file_name, F_OK) == 0;
diff --git a/writefrudata.H b/writefrudata.H
index c65c21b..68f6e5d 100644
--- a/writefrudata.H
+++ b/writefrudata.H
@@ -51,7 +51,8 @@ struct common_header
 extern "C" {
 #endif
 
-int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *, const bool);
+int ipmi_validate_fru_area(const uint8_t, const char *, sd_bus *, const bool,
+                            const bool = false);
 
 #ifdef __cplusplus
 } // extern C
-- 
2.9.0
