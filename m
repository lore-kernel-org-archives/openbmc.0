Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZdp51BFrzDqWq
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 08:01:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146663285367956.603488201120854;
 Wed, 22 Jun 2016 15:00:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Fix minor fw revision to be BCD encoded
Date: Wed, 22 Jun 2016 17:00:51 -0500
Message-Id: <20160622220051.29188-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622220051.29188-1-openbmc-patches@stwcx.xyz>
References: <20160622220051.29188-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 22:01:02 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The IPMI spec requires the minor version revision to be BCD encoded.
Currently the hex value was returned.
Fixes https://github.com/openbmc/phosphor-host-ipmid

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 apphandler.C | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/apphandler.C b/apphandler.C
index 71dba66..d014f5b 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -187,7 +187,9 @@ ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         if( r >= 0 ) {
             // bit7 identifies state of SDR repository, hence the mask
             dev_id[DEVICE_FW1] |= 0x7F & rev.major;
-            dev_id[DEVICE_FW2] = rev.minor;
+
+            rev.minor = (rev.minor > 99 ? 99 : rev.minor);
+            dev_id[DEVICE_FW2] = rev.minor % 10 + (rev.minor / 10) * 16;
             memcpy(&dev_id[DEVICE_AUX], rev.d, 4);
         }
     }
-- 
2.9.0
