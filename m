Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 68D231A034F
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435430226925.7053916716361;
 Tue, 24 Nov 2015 23:10:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 6/7] apphandler: Remove out of bounds
 array access
Date: Wed, 25 Nov 2015 02:10:23 -0500
Message-Id: <1448435424-9067-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:34 -0000

From: Joel Stanley <joel@jms.id.au>

apphandler.C:188:24: warning: array subscript is above array bounds [-Warray-bounds]
             tmp_array[3] = '\0';
                        ^

Initalise tmp_array to zero, and avoid this bad access.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 apphandler.C | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index d3df330..2c9ce6b 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -184,8 +184,7 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
         for(i = 0; i < tmp_size; i++)
         {
-            char tmp_array[3]; // Holder of the 2 chars that will become a byte
-            tmp_array[3] = '\0';
+            char tmp_array[3] = {0}; // Holder of the 2 chars that will become a byte
             strncpy(tmp_array, id_octet, 2); // 2 chars at a time
 
             int resp_byte = strtoul(tmp_array, NULL, 16); // Convert to hex byte
-- 
2.6.3
