Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qZFT161RqzDqDT
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2016 02:44:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459266061250633.1291523281343;
 Tue, 29 Mar 2016 08:41:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-rest-server] Add support for serving jsonp
Date: Tue, 29 Mar 2016 10:40:57 -0500
Message-Id: <1459266057-23662-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 29 Mar 2016 15:44:38 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Jsonp adds a javascript wrapper to json responses.  It allows client
applications to work around cross domain restrictions imposed by some
browsers.  For more information on jsonp:
https://en.wikipedia.org/wiki/JSONP

To get a jsonp response, an application adds a callback url parameter
with the desired name of the wrapper:
https://192.168.252.1/list?callback=my_callback
---
 obmc-rest | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/obmc-rest b/obmc-rest
index 2eaa223..0bc67ef 100644
--- a/obmc-rest
+++ b/obmc-rest
@@ -751,6 +751,32 @@ class JsonApiErrorsPlugin(object):
         return json_response
 
 
+class JsonpPlugin(JsonApiErrorsPlugin):
+    ''' Json javascript wrapper. '''
+    name = 'jsonp'
+    api = 2
+
+    def __init__(self, **kw):
+        super(JsonpPlugin, self).__init__(**kw)
+
+    @staticmethod
+    def to_jsonp(json):
+        jwrapper = request.query.callback or None
+        if(jwrapper):
+            response.set_header('Content-Type', 'application/javascript')
+            json = jwrapper + '(' + json + ');'
+        return json
+
+    def apply(self, callback, route):
+        def wrap(*a, **kw):
+            return self.to_jsonp(callback(*a, **kw))
+        return wrap
+
+    def json_errors(self, res, error):
+        json = super(JsonpPlugin, self).json_errors(res, error)
+        return self.to_jsonp(json)
+
+
 class RestApp(Bottle):
     def __init__(self, bus):
         super(RestApp, self).__init__(autojson=False)
@@ -765,9 +791,9 @@ class RestApp(Bottle):
     def install_plugins(self):
         # install json api plugins
         json_kw = {'indent': 2, 'sort_keys': True}
-        self.install(JSONPlugin(**json_kw))
-        self.install(JsonApiErrorsPlugin(**json_kw))
         self.install(AuthorizationPlugin())
+        self.install(JsonpPlugin(**json_kw))
+        self.install(JSONPlugin(**json_kw))
         self.install(JsonApiResponsePlugin())
         self.install(JsonApiRequestPlugin())
         self.install(JsonApiRequestTypePlugin())
-- 
2.7.1
