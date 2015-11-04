Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C57141A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:46:52 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655128168192.31102142011832;
 Wed, 4 Nov 2015 08:38:48 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr 6/8] Add enumerate iface alias to OpenBMCMapper
Date: Wed,  4 Nov 2015 10:33:32 -0600
Message-Id: <1446654814-4705-7-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:46:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 OpenBMCMapper.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index c1d2c78..fde385e 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -22,6 +22,7 @@ import dbus
 MAPPER_NAME = 'org.openbmc.objectmapper'
 MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
 MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
+ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
 
 class Path:
 	def __init__(self, path):
-- 
2.6.0
