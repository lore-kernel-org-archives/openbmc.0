Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJ8gn168gzDq5k
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 18:20:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464596416985356.8011238534027;
 Mon, 30 May 2016 01:20:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Replacing std::ifstream by access(2) for
 checking file existence
Date: Mon, 30 May 2016 03:20:14 -0500
Message-Id: <20160530082014.21716-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160530082014.21716-1-openbmc-patches@stwcx.xyz>
References: <20160530082014.21716-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 30 May 2016 08:20:21 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 writefrudata.C | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/writefrudata.C b/writefrudata.C
index 7ee2127..6e28341 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -663,7 +663,7 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
                          (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru);
 
         // Physically being present
-        bool present = std::ifstream(fru_file_name);
+        bool present = (access(fru_file_name, F_OK) != -1) ? true : false;
         fru_area->set_present(present);
 
         // Only setup dbus path for areas defined in BMC.
-- 
2.8.3
