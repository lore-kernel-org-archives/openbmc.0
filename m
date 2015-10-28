Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3CA411A0A9E
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 01:32:27 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446040105229888.5017381630825;
 Wed, 28 Oct 2015 06:48:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 2/3] Remove quotes from skeleton service description
Date: Wed, 28 Oct 2015 08:48:14 -0500
Message-Id: <1446040095-14799-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
References: <1446040095-14799-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 14:32:28 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/skeleton/skeleton/skeleton.service          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
index 545a1f2..53be092 100755
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
@@ -1,5 +1,5 @@
 [Unit]
-Description="Temp placeholder for skeleton function"
+Description=Temp placeholder for skeleton function
 
 [Service]
 ExecStart=/usr/sbin/system_manager.py Palmetto
-- 
2.6.0
