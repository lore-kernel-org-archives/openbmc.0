Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 13FD41A0296
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 06:40:13 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447098010122479.68263218113464;
 Mon, 9 Nov 2015 11:40:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH docs] REST API updates
Date: Mon,  9 Nov 2015 14:40:08 -0500
Message-Id: <1447098008-27418-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447098008-27418-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447098008-27418-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 19:40:14 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

I am working on a number of API (json format) changes.
Use https:// instead of http://
Show how to set the Content-Type HTTP header.
Show how to set the HTTP verb.
---
 rest-api.md | 73 +++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/rest-api.md b/rest-api.md
index 7167e71..9b35f23 100644
--- a/rest-api.md
+++ b/rest-api.md
@@ -2,80 +2,97 @@
 ## HTTP GET operations
 List directory:
 ```
-curl http://bmc/<path>/
+curl -k https://bmc/<path>/
 ```
 Examples:
 ```
-curl http://bmc/
-curl http://bmc/org/
-curl http://bmc/org/openbmc/
-curl http://bmc/org/openbmc/inventory/
-curl http://bmc/org/openbmc/inventory/system/chassis/
+curl -k https://bmc/
+curl -k https://bmc/org/
+curl -k https://bmc/org/openbmc/
+curl -k https://bmc/org/openbmc/inventory/
+curl -k https://bmc/org/openbmc/inventory/system/chassis/
 ```
 
 List objects recursively:
 ```
-curl http://bmc/<path>/list
+curl -k https://bmc/<path>/list
 ```
 Examples:
 ```
-curl http://bmc/list
-curl http://bmc/org/openbmc/inventory/list
+curl -k https://bmc/list
+curl -k https://bmc/org/openbmc/inventory/list
 ```
 
 Enumerate objects recursively:
 ```
-curl http://bmc/<path>/enumerate
+curl -k https://bmc/<path>/enumerate
 ```
 Examples:
 ```
-curl http://bmc/enumerate
-curl http://bmc/org/openbmc/inventory/enumerate
+curl -k https://bmc/enumerate
+curl -k https://bmc/org/openbmc/inventory/enumerate
 
 ```
 
 Get object:
 ```
-curl http://bmc/<path>
+curl -k https://bmc/<path>
 ```
 Examples:
 ```
-curl http://bmc/org/openbmc/inventory/system/chassis/fan2
+curl -k https://bmc/org/openbmc/inventory/system/chassis/fan2
 ```
 
 Get property:
 ```
-curl http://bmc/<path>/attr/<attr>
-curl http://bmc/org/openbmc/inventory/system/chassis/fan2/attr/is_fru
+curl -k https://bmc/<path>/attr/<attr>
+curl -k https://bmc/org/openbmc/inventory/system/chassis/fan2/attr/is_fru
 ```
 
 ## HTTP PUT operations
+PUT operations are for updating an existing resource ( an object or property ), or for creating a new resource when the client already knows where to put it.
+For a quick explanation of HTTP verbs and how they relate to a RESTful API see this page:
+```
+http://www.restapitutorial.com/lessons/httpmethods.html
+```
+
 These require a json formatted payload.  To get an example of what that looks like:
 ```
-curl http://bmc/org/openbmc/flash/Bios_0 > bios.json # - or -
-curl http://bmc/org/openbmc/flash/Bios_0/attr/flasher_path > flasher_path.json
+curl -k https://bmc/org/openbmc/control/flash/bios > bios.json # - or -
+curl -k https://bmc/org/openbmc/control/flash/bios/attr/flasher_path > flasher_path.json
 ```
 
-A put operation on an object requires a complete object.  For partial updates see POST.
+When turning around and sending these as requests, delete the message and status properties.
+
+To make curl use the correct content type header use the -H option:
+```
+curl -k -H "Content-Type: application/json" -X POST -d <json> <url>
+```
+A put operation on an object requires a complete object.  For partial updates there is PATCH but that is not implemented yet.  As a workaround individual attributes are PUTable.
 
 Make changes to the file and do a put (upload):
 
 ```
-curl -T bios.json http://bmc/org/openbmc/flash/Bios_0
-curl -T flasher_path.json http://bmc/org/openbmc/flash/Bios_0/attr/flasher_path
+curl -k -H "Content-Type: application/json" -X put -T bios.json https://bmc/org/openbmc/control/flash/bios
+curl -k -H "Content-Type: application/json" -X put -T flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
 ```
 
+Alternatively specify the json inline with -d:
+```
+curl -k -H "Content-Type: application/json" -X put -d "{\"data\": <value>}" flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
+```
+
+When using '-d' Just remember that json requires double quotes and any shell metacharacters need to be escaped.
+
 ## HTTP POST operations
+POST operations are for calling methods, but also for creating new resources when the client doesn't know where to put it.
 These also require a json formatted payload.
 
-To make a partial change to an object, try removing some properties from the bios.json example above.  Then do:
-
+To invoke a method with parameters:
 ```
-curl -d "`cat bios.partial.json`" http://bmc/org/openbmc/flash/Bios_0
+curl -k -H "Content-Type: application/json" -x post -d "{\"data\": [<positional-parameters>]}" -k https://bmc/org/openbmc/control/fan0/action/setspeed
 ```
-
-To invoke a method:
+To invoke a method without parameters:
 ```
-curl -d "[ \"foo\", \"bar\" ]" http://bmc/org/openbmc/managers/System/action/getObjectFromId
+curl -k -H "Content-Type: application/json" -x post -d "{\"data\": []}" -k https://bmc/org/openbmc/control/fan0/action/getspeed
 ```
-
-- 
2.6.3
