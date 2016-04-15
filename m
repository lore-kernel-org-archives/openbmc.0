Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmd2l4RK2zDqLl
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 23:01:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460725271655889.6807778891625;
 Fri, 15 Apr 2016 06:01:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH rest-dbus] Update obmc package include path
Date: Fri, 15 Apr 2016 08:01:09 -0500
Message-Id: <1460725269-4684-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460725269-4684-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460725269-4684-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Apr 2016 13:01:20 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

---
 rest-dbus | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rest-dbus b/rest-dbus
index d756dc8..900b74d 100644
--- a/rest-dbus
+++ b/rest-dbus
@@ -7,7 +7,7 @@ import json
 import os
 import sys
 from xml.etree import ElementTree
-from OpenBMCMapper import IntrospectionParser
+from obmc.dbuslib.introspection import IntrospectionParser
 
 busses = {
     'system': dbus.SystemBus,
-- 
2.7.1
