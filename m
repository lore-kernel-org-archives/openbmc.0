Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C841E1A0D69
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 04:40:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449078010878346.6526308186412;
 Wed, 2 Dec 2015 09:40:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH docs] Add login/logout examples
Date: Wed,  2 Dec 2015 12:40:09 -0500
Message-Id: <1449078009-8256-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449078009-8256-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449078009-8256-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 17:40:16 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 rest-api.md | 64 +++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/rest-api.md b/rest-api.md
index 80e7fb3..935c929 100644
--- a/rest-api.md
+++ b/rest-api.md
@@ -1,52 +1,66 @@
 # OpenBMC REST API
+
+## Logging in
+Before you can do anything you first need to log in:
+```
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST https://bmc/login -d "{\"data\": [ \"root\", \"0penBmc\" ] }"
+```
+
+To log out:
+```
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST https://bmc/logout -d "{\"data\": [ ] }"
+```
+
+You need to use the provided cookie on any subsequent requests with the -c and -b options.
+
 ## HTTP GET operations
 List directory:
 ```
-curl -k https://bmc/<path>/
+curl -c cjar -b cjar -k https://bmc/<path>/
 ```
 Examples:
 ```
-curl -k https://bmc/
-curl -k https://bmc/org/
-curl -k https://bmc/org/openbmc/
-curl -k https://bmc/org/openbmc/inventory/
-curl -k https://bmc/org/openbmc/inventory/system/chassis/
+curl -c cjar -b cjar -k https://bmc/
+curl -c cjar -b cjar -k https://bmc/org/
+curl -c cjar -b cjar -k https://bmc/org/openbmc/
+curl -c cjar -b cjar -k https://bmc/org/openbmc/inventory/
+curl -c cjar -b cjar -k https://bmc/org/openbmc/inventory/system/chassis/
 ```
 
 List objects recursively:
 ```
-curl -k https://bmc/<path>/list
+curl -c cjar -b cjar -k https://bmc/<path>/list
 ```
 Examples:
 ```
-curl -k https://bmc/list
-curl -k https://bmc/org/openbmc/inventory/list
+curl -c cjar -b cjar -k https://bmc/list
+curl -c cjar -b cjar -k https://bmc/org/openbmc/inventory/list
 ```
 
 Enumerate objects recursively:
 ```
-curl -k https://bmc/<path>/enumerate
+curl -c cjar -b cjar -k https://bmc/<path>/enumerate
 ```
 Examples:
 ```
-curl -k https://bmc/enumerate
-curl -k https://bmc/org/openbmc/inventory/enumerate
+curl -c cjar -b cjar -k https://bmc/enumerate
+curl -c cjar -b cjar -k https://bmc/org/openbmc/inventory/enumerate
 
 ```
 
 Get object:
 ```
-curl -k https://bmc/<path>
+curl -c cjar -b cjar -k https://bmc/<path>
 ```
 Examples:
 ```
-curl -k https://bmc/org/openbmc/inventory/system/chassis/fan2
+curl -c cjar -b cjar -k https://bmc/org/openbmc/inventory/system/chassis/fan2
 ```
 
 Get property:
 ```
-curl -k https://bmc/<path>/attr/<attr>
-curl -k https://bmc/org/openbmc/inventory/system/chassis/fan2/attr/is_fru
+curl -c cjar -b cjar -k https://bmc/<path>/attr/<attr>
+curl -c cjar -b cjar -k https://bmc/org/openbmc/inventory/system/chassis/fan2/attr/is_fru
 ```
 
 ## HTTP PUT operations
@@ -58,28 +72,28 @@ http://www.restapitutorial.com/lessons/httpmethods.html
 
 These require a json formatted payload.  To get an example of what that looks like:
 ```
-curl -k https://bmc/org/openbmc/control/flash/bios > bios.json # - or -
-curl -k https://bmc/org/openbmc/control/flash/bios/attr/flasher_path > flasher_path.json
+curl -c cjar -b cjar -k https://bmc/org/openbmc/control/flash/bios > bios.json # - or -
+curl -c cjar -b cjar -k https://bmc/org/openbmc/control/flash/bios/attr/flasher_path > flasher_path.json
 ```
 
 When turning around and sending these as requests, delete the message and status properties.
 
 To make curl use the correct content type header use the -H option:
 ```
-curl -k -H "Content-Type: application/json" -X POST -d <json> <url>
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d <json> <url>
 ```
 A put operation on an object requires a complete object.  For partial updates there is PATCH but that is not implemented yet.  As a workaround individual attributes are PUTable.
 
 Make changes to the file and do a put (upload):
 
 ```
-curl -k -H "Content-Type: application/json" -X PUT -T bios.json https://bmc/org/openbmc/control/flash/bios
-curl -k -H "Content-Type: application/json" -X PUT -T flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X PUT -T bios.json https://bmc/org/openbmc/control/flash/bios
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X PUT -T flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
 ```
 
 Alternatively specify the json inline with -d:
 ```
-curl -k -H "Content-Type: application/json" -X PUT -d "{\"data\": <value>}" flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X PUT -d "{\"data\": <value>}" flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
 ```
 
 When using '-d' Just remember that json requires double quotes and any shell metacharacters need to be escaped.
@@ -90,16 +104,16 @@ These also require a json formatted payload.
 
 To invoke a method with parameters:
 ```
-curl -k -H "Content-Type: application/json" -X POST -d "{\"data\": [<positional-parameters>]}" https://bmc/org/openbmc/control/fan0/action/setspeed
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [<positional-parameters>]}" https://bmc/org/openbmc/control/fan0/action/setspeed
 ```
 To invoke a method without parameters:
 ```
-curl -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/control/fan0/action/getspeed
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/control/fan0/action/getspeed
 ```
 
 ## HTTP DELETE operations
 DELETE operations are for removing instances.  Only DBUS objects (instances) can be removed.  If the underlying DBUS object implements the org.openbmc.Object.Delete interface the REST server will call it.  If org.openbmc.Object.Delete is not implemented, HTTP 403 will be returned.
 
 ```
-curl -k -X DELETE https://bmc/org/openbmc/events/record/0
+curl -c cjar -b cjar -k -X DELETE https://bmc/org/openbmc/events/record/0
 ```
-- 
2.6.3
