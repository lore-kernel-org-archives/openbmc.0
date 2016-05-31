Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJjys1ghWzDqXS
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 16:20:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464675617049878.7465351955116;
 Mon, 30 May 2016 23:20:17 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v2] Replacing std::ifstream by access(2) for
 checking file existence
Date: Tue, 31 May 2016 01:20:14 -0500
Message-Id: <20160531062014.373-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160531062014.373-1-openbmc-patches@stwcx.xyz>
References: <20160531062014.373-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 31 May 2016 06:20:21 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 writefrudata.C | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/writefrudata.C b/writefrudata.C
index 7ee2127..6ca1f16 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -663,7 +663,7 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
                          (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru);
 
         // Physically being present
-        bool present = std::ifstream(fru_file_name);
+        bool present = access(fru_file_name, F_OK) != -1;
         fru_area->set_present(present);
 
         // Only setup dbus path for areas defined in BMC.
-- 
2.8.3
