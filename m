Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSz6q4HYNzDqbm
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 02:40:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146583604209626.239142924185444;
 Mon, 13 Jun 2016 09:40:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/2] Turn on socket activation for rest-dbus
Date: Mon, 13 Jun 2016 11:40:33 -0500
Message-Id: <20160613164033.16638-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160613164033.16638-1-openbmc-patches@stwcx.xyz>
References: <20160613164033.16638-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 16:40:52 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Defer starting of rest-dbus until a client connects.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/rest-dbus/files/rest-dbus.service     | 3 ---
 .../common/recipes-phosphor/rest-dbus/files/rest-dbus.socket      | 8 ++++++++
 meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb      | 5 +++--
 3 files changed, 11 insertions(+), 5 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.socket

diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
index 79a848a..5ad582f 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
@@ -4,6 +4,3 @@ Description=DBUS introspecting REST server.
 [Service]
 Restart=always
 ExecStart=/usr/sbin/rest-dbus
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.socket b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.socket
new file mode 100644
index 0000000..89f99b8
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.socket
@@ -0,0 +1,8 @@
+[Unit]
+Description=DBUS introspecting REST server socket.
+
+[Socket]
+ListenStream=3000
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
index 7f990aa..afee21c 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb
@@ -16,11 +16,12 @@ RDEPENDS_${PN} += " \
         pyphosphor \
         "
 
+SYSTEMD_SERVICE_${PN} += "rest-dbus.service rest-dbus.socket"
+
 SRC_URI += " \
         git://github.com/openbmc/rest-dbus.git \
-        file://rest-dbus.service \
         "
 
-SRCREV = "64077101d9f2b6e51c897db82ffc0a399a34d15b"
+SRCREV = "5a65d2f605494d5c308171ba4fd1ab08d7b3a91d"
 
 S = "${WORKDIR}/git"
-- 
2.8.4
