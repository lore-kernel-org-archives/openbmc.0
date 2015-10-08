Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B01A01A0026
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 14:13:19 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444273996427422.9938006248781;
 Wed, 7 Oct 2015 20:13:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH rest-dbus v2] Add supporting files
Date: Wed,  7 Oct 2015 22:13:12 -0500
Message-Id: <1444273992-1132-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444273992-1132-1-git-send-email-patches@stwcx.xyz>
References: <1444273992-1132-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 03:13:20 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Add makefile, systemd service file.
Hardcode resources dir filesystem path.
---
 Makefile          | 21 +++++++++++++++++++++
 rest-dbus         |  2 +-
 rest-dbus.service |  8 ++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 Makefile
 create mode 100644 rest-dbus.service

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..3d79547
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,21 @@
+PACKAGE=rest-dbus
+
+prefix?=/usr/local
+bin=$(prefix)/usr/bin
+share=$(prefix)/usr/share/$(PACKAGE)
+srv=$(prefix)/lib/systemd/system/
+
+build clean all:
+
+install:
+	@install -d $(bin) $(share)/resources $(srv)
+	@install -m 755 $(PACKAGE) $(bin)
+	@for f in resources/*; do \
+		install -m644 $$f $(share)/resources; \
+	done
+	@install $(PACKAGE).service $(srv)
+
+uninstall:
+	@rm -f $(bin)/$(PACKAGE)
+	@rm -rf $(share)
+	@rm -f $(srv)/$(PACKAGE).service
diff --git a/rest-dbus b/rest-dbus
index 56ec1f9..078b1cf 100755
--- a/rest-dbus
+++ b/rest-dbus
@@ -40,7 +40,7 @@ class DBusRestResourceResponse(DBusRestResponse):
         'png': 'image/png',
         'gif': 'image/gif',
     }
-    resource_base = 'resources'
+    resource_base = '/usr/share/rest-dbus/resources'
 
     def __init__(self, name):
         (_, ext) = os.path.splitext(name)
diff --git a/rest-dbus.service b/rest-dbus.service
new file mode 100644
index 0000000..686cf69
--- /dev/null
+++ b/rest-dbus.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=DBUS introspecting REST server.
+
+[Service]
+ExecStart=/usr/bin/rest-dbus
+
+[Install]
+WantedBy=multi-user.target
-- 
2.6.0
