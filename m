Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DDE971A0133
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:42:46 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655018132447.05249399046306;
 Wed, 4 Nov 2015 08:36:58 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 3/8] Rename TagListMatch to ListMatch
Date: Wed,  4 Nov 2015 10:33:29 -0600
Message-Id: <1446654814-4705-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446654814-4705-1-git-send-email-patches@stwcx.xyz>
References: <1446654814-4705-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:42:47 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This match functor doesn't have anything to do with 'tags'.
---
 OpenBMCMapper.py | 10 +++++-----
 phosphor-mapper  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index 3b6fe00..c1d2c78 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -48,12 +48,12 @@ class Path:
 def org_dot_openbmc_match(name):
 	return 'org.openbmc' in name
 
-class TagListMatch(object):
-	def __init__(self, tag_list):
-		self.tag_list = tag_list
+class ListMatch(object):
+	def __init__(self, l):
+		self.l = l
 
-	def __call__(self, tag):
-		return tag in self.tag_list
+	def __call__(self, match):
+		return match in self.l
 
 class IntrospectionNodeParser:
 	def __init__(self, data, tag_match = bool, intf_match = bool):
diff --git a/phosphor-mapper b/phosphor-mapper
index fda70c7..1a63317 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -174,7 +174,7 @@ class ObjectMapper(dbus.service.Object):
 		self.bus = bus
 		self.name_match = name_match
 		self.intf_match = intf_match
-		self.tag_match = OpenBMCMapper.TagListMatch(['children', 'interface'])
+		self.tag_match = OpenBMCMapper.ListMatch(['children', 'interface'])
 
 		self.discovery_done = False
 
-- 
2.6.0
