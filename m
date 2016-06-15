Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTr9M2JkSzDqfN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 12:31:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146595785552760.96340330371231;
 Tue, 14 Jun 2016 19:30:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Fix broken attempt at hwmon caching
Date: Tue, 14 Jun 2016 21:30:53 -0500
Message-Id: <20160615023053.1980-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615023053.1980-1-openbmc-patches@stwcx.xyz>
References: <20160615023053.1980-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 02:31:04 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This repairs a hwmon regression introduced with efc6897.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pyhwmon/hwmon.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyhwmon/hwmon.py b/pyhwmon/hwmon.py
index a91b761..d662213 100644
--- a/pyhwmon/hwmon.py
+++ b/pyhwmon/hwmon.py
@@ -55,7 +55,7 @@ class Hwmons():
 		with open(filename, 'w') as f:
 			f.write(str(value)+'\n')
 
-	def should_update(attribute, value):
+	def should_update(self, attribute, value):
 		if attribute not in self.cache:
 			self.cache[attribute] = value
 			return True
-- 
2.8.4
