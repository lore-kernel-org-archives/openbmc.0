Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnxP1Gt9zDqlP
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:11:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466795471761325.5319024975661;
 Fri, 24 Jun 2016 12:11:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 1/3] Revert "Fix broken attempt at hwmon caching"
Date: Fri, 24 Jun 2016 14:11:07 -0500
Message-Id: <20160624191109.26490-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624191109.26490-1-openbmc-patches@stwcx.xyz>
References: <20160624191109.26490-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:11:22 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This reverts commit 8224ff87c914861d28ed0dc6a251ba213a9ee607.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pyhwmon/hwmon.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyhwmon/hwmon.py b/pyhwmon/hwmon.py
index e7821f4..d9c1353 100644
--- a/pyhwmon/hwmon.py
+++ b/pyhwmon/hwmon.py
@@ -55,7 +55,7 @@ class Hwmons():
 		with open(filename, 'w') as f:
 			f.write(str(value)+'\n')
 
-	def should_update(self, attribute, value):
+	def should_update(attribute, value):
 		if attribute not in self.cache:
 			self.cache[attribute] = value
 			return True
-- 
2.9.0
