Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qYklw38gVzDqBZ
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 06:40:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145919403648381.58344082379244;
 Mon, 28 Mar 2016 12:40:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH openpower-host-ipmi-oem] Support for restricted mode for IPMI
 commands
Date: Mon, 28 Mar 2016 14:40:33 -0500
Message-Id: <1459194033-16368-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459194033-16368-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459194033-16368-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 28 Mar 2016 19:40:44 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 oemhandler.C | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/oemhandler.C b/oemhandler.C
index 22452d6..1ffb8eb 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -5,6 +5,8 @@
 #include <string.h>
 #include <systemd/sd-bus.h>
 
+extern bool restricted_mode;
+
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
 const char *g_esel_path = "/tmp/esel";
@@ -81,6 +83,11 @@ ipmi_ret_t ipmi_ibm_oem_prep_fw_update(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
