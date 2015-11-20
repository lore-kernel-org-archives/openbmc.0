Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D56461A0066
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 07:00:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448049612865105.88926795999691;
 Fri, 20 Nov 2015 12:00:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH docs v2] Rest API documentation fixes
Date: Fri, 20 Nov 2015 15:00:09 -0500
Message-Id: <1448049609-3508-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448049609-3508-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448049609-3508-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 20:00:19 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

HTTP verbs need to be upper case.
-k appeared twice in some examples.
Add delete description and example.
---
 rest-api.md | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/rest-api.md b/rest-api.md
index 9b35f23..80e7fb3 100644
--- a/rest-api.md
+++ b/rest-api.md
@@ -73,26 +73,33 @@ A put operation on an object requires a complete object.  For partial updates th
 Make changes to the file and do a put (upload):
 
 ```
-curl -k -H "Content-Type: application/json" -X put -T bios.json https://bmc/org/openbmc/control/flash/bios
-curl -k -H "Content-Type: application/json" -X put -T flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
+curl -k -H "Content-Type: application/json" -X PUT -T bios.json https://bmc/org/openbmc/control/flash/bios
+curl -k -H "Content-Type: application/json" -X PUT -T flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
 ```
 
 Alternatively specify the json inline with -d:
 ```
-curl -k -H "Content-Type: application/json" -X put -d "{\"data\": <value>}" flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
+curl -k -H "Content-Type: application/json" -X PUT -d "{\"data\": <value>}" flasher_path.json https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
 ```
 
 When using '-d' Just remember that json requires double quotes and any shell metacharacters need to be escaped.
 
 ## HTTP POST operations
-POST operations are for calling methods, but also for creating new resources when the client doesn't know where to put it.
+POST operations are for calling methods, but also for creating new resources when the client doesn't know where to put it.  OpenBMC does not support creating new resources via REST so any attempt to create a new resource will result in a HTTP 403 ( Forbidden ).
 These also require a json formatted payload.
 
 To invoke a method with parameters:
 ```
-curl -k -H "Content-Type: application/json" -x post -d "{\"data\": [<positional-parameters>]}" -k https://bmc/org/openbmc/control/fan0/action/setspeed
+curl -k -H "Content-Type: application/json" -X POST -d "{\"data\": [<positional-parameters>]}" https://bmc/org/openbmc/control/fan0/action/setspeed
 ```
 To invoke a method without parameters:
 ```
-curl -k -H "Content-Type: application/json" -x post -d "{\"data\": []}" -k https://bmc/org/openbmc/control/fan0/action/getspeed
+curl -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/control/fan0/action/getspeed
+```
+
+## HTTP DELETE operations
+DELETE operations are for removing instances.  Only DBUS objects (instances) can be removed.  If the underlying DBUS object implements the org.openbmc.Object.Delete interface the REST server will call it.  If org.openbmc.Object.Delete is not implemented, HTTP 403 will be returned.
+
+```
+curl -k -X DELETE https://bmc/org/openbmc/events/record/0
 ```
-- 
2.6.3
