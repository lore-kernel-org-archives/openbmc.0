Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qgYsR2ZvVzDq64
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2016 17:20:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460013634837973.812893604214;
 Thu, 7 Apr 2016 00:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH openpower-host-ipmi-oem v2] Support for restricted mode for
 IPMI commands
Date: Thu,  7 Apr 2016 02:20:32 -0500
Message-Id: <1460013632-16618-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460013632-16618-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460013632-16618-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Apr 2016 07:20:44 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 oemhandler.C | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/oemhandler.C b/oemhandler.C
index 22452d6..ce7faca 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -5,6 +5,7 @@
 #include <string.h>
 #include <systemd/sd-bus.h>
 
+
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
 const char *g_esel_path = "/tmp/esel";
@@ -81,6 +82,11 @@ ipmi_ret_t ipmi_ibm_oem_prep_fw_update(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t ipmi_rc = IPMI_CC_OK;
     *data_len = 0;
 
+    if(restricted_mode)
+    {
+       return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     int rc = 0;
     std::ofstream rwfs_file;
     const char  *busname = "org.openbmc.control.Bmc";
-- 
2.7.1
