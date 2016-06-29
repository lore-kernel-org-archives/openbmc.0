Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rflTK5SlKzDqxG
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:30:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467210641302741.5177432421664;
 Wed, 29 Jun 2016 07:30:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/3] Set PYTHONUNBUFFERED for systemd managed python
Date: Wed, 29 Jun 2016 09:30:35 -0500
Message-Id: <20160629143036.30291-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629143036.30291-1-openbmc-patches@stwcx.xyz>
References: <20160629143036.30291-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 14:30:46 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This lets python scripts print to the journal.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service         | 1 +
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service   | 1 +
 meta-phosphor/common/recipes-phosphor/network/network/network.service    | 1 +
 .../files/obmc-phosphor-example-pydbus.service                           | 1 +
 .../recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service | 1 +
 meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service  | 1 +
 meta-phosphor/common/recipes-phosphor/settings/settings/settings.service | 1 +
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service | 1 +
 8 files changed, 8 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
index 05d1e80..ff863ea 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service
@@ -7,6 +7,7 @@ Type=dbus
 ExecStart=/usr/sbin/phosphor-mapper
 BusName=org.openbmc.ObjectMapper
 TimeoutStartSec=300
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
index a78c86b..8612b98 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
@@ -6,6 +6,7 @@ After=obmc-mapper.service
 [Service]
 Restart=always
 ExecStart=/usr/sbin/obmc-rest
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/network/network/network.service b/meta-phosphor/common/recipes-phosphor/network/network/network.service
index 6d0aad7..70df7c5 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network/network.service
+++ b/meta-phosphor/common/recipes-phosphor/network/network/network.service
@@ -3,6 +3,7 @@ Description=Network DBUS object
 
 [Service]
 ExecStart=/usr/sbin/netman.py
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.service
index fbc50d3..27d9bfe 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.service
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-pydbus/files/obmc-phosphor-example-pydbus.service
@@ -4,6 +4,7 @@ Description=Phosphor OpenBMC QEMU application example
 [Service]
 Restart=always
 ExecStart=/usr/sbin/obmc-phosphor-example-pydbus
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
index fecf835..fc436c1 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
@@ -3,6 +3,7 @@ Description=Phosphor OpenBMC user management daemon
 
 [Service]
 ExecStart=/usr/sbin/obmc-phosphor-userd
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
index 5ad582f..d3bddab 100644
--- a/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
+++ b/meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.service
@@ -4,3 +4,4 @@ Description=DBUS introspecting REST server.
 [Service]
 Restart=always
 ExecStart=/usr/sbin/rest-dbus
+Environment="PYTHONUNBUFFERED=1"
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service b/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
index deed98f..816ebea 100755
--- a/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
@@ -3,6 +3,7 @@ Description=Settings DBUS Object
 
 [Service]
 ExecStart=/usr/sbin/settings_manager.py
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
index 35b6e6c..c39cc40 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service
@@ -4,6 +4,7 @@ Description=Temp placeholder for skeleton function
 [Service]
 Restart=always
 ExecStart=/usr/sbin/system_manager.py
+Environment="PYTHONUNBUFFERED=1"
 
 [Install]
 WantedBy=multi-user.target
-- 
2.9.0
