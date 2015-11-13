Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 528F61A0AA2
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 08:10:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447449010545963.0611216155661;
 Fri, 13 Nov 2015 13:10:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Fru write was growing the number of
 connections on dbus
Date: Fri, 13 Nov 2015 16:10:09 -0500
Message-Id: <1447449009-12895-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447449009-12895-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447449009-12895-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 21:10:14 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 writefrudata.C | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/writefrudata.C b/writefrudata.C
index 69bbb47..91aef45 100644
--- a/writefrudata.C
+++ b/writefrudata.C
@@ -91,19 +91,12 @@ int ipmi_update_inventory(const uint8_t fruid, const uint8_t *fru_data,
     sd_bus_error bus_error = SD_BUS_ERROR_NULL;
 
     // Gets a hook onto either a SYSTEM or SESSION bus
-    sd_bus *bus_type = NULL;
+    sd_bus *bus_type = ipmid_get_sd_bus_connection();
 
     // Req message contains the specifics about which method etc that we want to
     // access on which bus, object
     sd_bus_message *response = NULL;
 
-    rc = sd_bus_open_system(&bus_type);
-    if(rc < 0)
-    {
-        fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
-        return -1;
-    }
-
     // For each FRU area, extract the needed data , get it parsed and update
     // the Inventory.
     for(auto& iter : area_vec)
-- 
2.6.3
