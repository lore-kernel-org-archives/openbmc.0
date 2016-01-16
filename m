Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FA3B1A011D
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jan 2016 00:20:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452950427364181.7712428322293;
 Sat, 16 Jan 2016 05:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] set usec so settimeofday call doesn't fail
Date: Sat, 16 Jan 2016 07:20:25 -0600
Message-Id: <1452950425-31205-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452950425-31205-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452950425-31205-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 16 Jan 2016 13:20:32 -0000

From: Norman James <njames@us.ibm.com>

---
 storagehandler.C | 1 +
 1 file changed, 1 insertion(+)

diff --git a/storagehandler.C b/storagehandler.C
index f3e2532..a68da8f 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -60,6 +60,7 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     struct timeval sel_time;
     sel_time.tv_sec = le32toh(*secs);
+    sel_time.tv_usec = 0;
     ipmi_ret_t rc = IPMI_CC_OK;
     int rct = settimeofday(&sel_time, NULL);
 
-- 
2.6.4
