Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWJk301rkzDqwF
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 22:00:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146616484906732.126097541653735;
 Fri, 17 Jun 2016 05:00:49 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH phosphor-rest-server] Add a convenient/short logout command
Date: Fri, 17 Jun 2016 07:00:46 -0500
Message-Id: <20160617120046.29620-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160617120046.29620-1-openbmc-patches@stwcx.xyz>
References: <20160617120046.29620-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 12:01:00 -0000

From: Nan Li <bjlinan@cn.ibm.com>

With this patch, we can logout by:
    curl -c cjar -b cjar -k https://BMC/logout
Traditional/json format logout is retained.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 obmc-rest | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/obmc-rest b/obmc-rest
index e7dbbba..8750a1f 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -411,6 +411,7 @@ class SessionHandler(MethodHandler):
     ''' Handles the /login and /logout routes, manages
     server side session store and session cookies.  '''
 
+    verbs = ['POST', 'GET']
     rules = ['/login', '/logout']
     login_str = "User '%s' logged %s"
     bad_passwd_str = "Invalid username or password"
@@ -460,6 +461,10 @@ class SessionHandler(MethodHandler):
             request.get_cookie(
                 'sid', secret=self.hmac_key))
 
+    def do_get(self, **kw):
+        if request.path == '/logout':
+            return self.do_logout(**kw)
+
     def do_post(self, **kw):
         if request.path == '/login':
             return self.do_login(**kw)
-- 
2.8.4
