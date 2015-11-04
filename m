Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EFDD91A0133
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:42:39 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144665517176855.50082827837264;
 Wed, 4 Nov 2015 08:39:31 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server 4/5] Check for path component length
Date: Wed,  4 Nov 2015 10:39:01 -0600
Message-Id: <1446655142-5884-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446655142-5884-1-git-send-email-patches@stwcx.xyz>
References: <1446655142-5884-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:42:40 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

If someone makes a call against '/org' for instance
we die checking for the attr action because there is
only path one component to the URL.
---
 phosphor-rest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/phosphor-rest b/phosphor-rest
index 08065ed..4c13b08 100644
--- a/phosphor-rest
+++ b/phosphor-rest
@@ -275,10 +275,10 @@ class DBusRestHandler(BaseHTTPServer.BaseHTTPRequestHandler):
 		if path.parts[-1] == 'enumerate':
 			return EnumerateHandler(self, path.fq(last = -1), data)
 
-		if path.parts[-2] == 'attr':
+		if path.depth() > 1 and path.parts[-2] == 'attr':
 			return AttrHandler(self, path.fq(last = -2), data)
 
-		if path.parts[-2] == 'action':
+		if path.depth() > 1 and path.parts[-2] == 'action':
 			return MethodHandler(self, path.fq(last = -2), data)
 
 		# have to do an objectmapper query at this point
-- 
2.6.0
