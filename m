Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D056C1A1D13
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 01:20:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447770028582534.5238980733546;
 Tue, 17 Nov 2015 06:20:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Set response type correctly for errors
Date: Tue, 17 Nov 2015 09:20:27 -0500
Message-Id: <1447770027-31819-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447770027-31819-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447770027-31819-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 Nov 2015 14:20:34 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Error response type was 'text/html' but should be
'application/json'
---
 obmc-rest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/obmc-rest b/obmc-rest
index f655599..017a736 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -509,7 +509,7 @@ class JsonApiErrorsPlugin(object):
 			response_object['data']['traceback'] = error.traceback.splitlines()
 
 		json_response = json.dumps(response_object, **self.json_opts)
-		res.content_type = 'application/json'
+		response.content_type = 'application/json'
 		return json_response
 
 class RestApp(Bottle):
-- 
2.6.3
