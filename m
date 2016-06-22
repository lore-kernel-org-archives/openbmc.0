Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZ8W40NkQzDqjH
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 13:01:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466564471251938.1096919444303;
 Tue, 21 Jun 2016 20:01:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 1/4] Remove unused python modules from obmcutil
Date: Tue, 21 Jun 2016 22:01:06 -0500
Message-Id: <20160622030109.17283-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
References: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 03:01:21 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This should help with startup time a little bit.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pytools/obmcutil | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/pytools/obmcutil b/pytools/obmcutil
index bd753ca..02c2c2c 100644
--- a/pytools/obmcutil
+++ b/pytools/obmcutil
@@ -1,13 +1,9 @@
 #!/usr/bin/python
 
 import sys
-#import subprocess
-import gobject
 import dbus
-import dbus.service
-import dbus.mainloop.glib
-import xml.etree.ElementTree as ET
 import json
+import xml.etree.ElementTree as ET
 
 
 def fix_byte(it,key,parent):   
-- 
2.9.0
