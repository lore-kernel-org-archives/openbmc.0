Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 96C301A0352
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448436027165166.8901592327635;
 Tue, 24 Nov 2015 23:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 3/3] fixing build break in my master
Date: Wed, 25 Nov 2015 02:20:24 -0500
Message-Id: <1448436024-9396-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:20:31 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid-api.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index f9c03dd..e957ee6 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -69,7 +69,7 @@ enum ipmi_net_fns
     NETFUN_APP      =   0x06,
     NETFUN_FIRMWARE =   0x08,
     NETFUN_STORAGE  =   0x0a,
-    NETFUN_TRANPORT =   0x0c,
+    NETFUN_TRANSPORT =   0x0c,
     NETFUN_GRPEXT   =   0x2c,
     NETFUN_NONE     =   0x30,
     NETFUN_OEM      =   0x32
-- 
2.6.3
