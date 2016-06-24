Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnxP5ll4zDqlS
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:11:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466795474274735.0983553013828;
 Fri, 24 Jun 2016 12:11:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 3/3] Cast dbus.Double for python-json
Date: Fri, 24 Jun 2016 14:11:09 -0500
Message-Id: <20160624191109.26490-4-openbmc-patches@stwcx.xyz>
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

At some point a floating point value was added to a sensor
object.

python-json doesn't handle the dbus wrapper types like
dbus.Double.  Cast dbus.Double to a float, similar to integers.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 pytools/obmcutil | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pytools/obmcutil b/pytools/obmcutil
index 6db589e..9207eca 100644
--- a/pytools/obmcutil
+++ b/pytools/obmcutil
@@ -16,6 +16,9 @@ def fix_byte(it,key,parent):
     elif (isinstance(it,dbus.Byte)):   
         if (key != None):              
                 parent[key] = int(it)  
+    elif (isinstance(it,dbus.Double)):
+        if (key != None):
+                parent[key] = float(it)
     else:                              
         pass                           
 
-- 
2.9.0
