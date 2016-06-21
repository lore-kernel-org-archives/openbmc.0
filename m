Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwHy4wLnzDqGK
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:50:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466531444142872.5440732608844;
 Tue, 21 Jun 2016 10:50:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Remove unnecessary skeleton dependencies
Date: Tue, 21 Jun 2016 12:50:40 -0500
Message-Id: <20160621175040.25109-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621175040.25109-1-openbmc-patches@stwcx.xyz>
References: <20160621175040.25109-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:50:55 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The network and settings daemons had unnecessary startup dependencies
on the skeleton service.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes-phosphor/network/network/network.service   | 2 --
 .../common/recipes-phosphor/settings/settings/settings.service          | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/network/network/network.service b/meta-phosphor/common/recipes-phosphor/network/network/network.service
index 85a44bb..6d0aad7 100644
--- a/meta-phosphor/common/recipes-phosphor/network/network/network.service
+++ b/meta-phosphor/common/recipes-phosphor/network/network/network.service
@@ -1,7 +1,5 @@
 [Unit]
 Description=Network DBUS object
-Requires=skeleton.service
-After=skeleton.service
 
 [Service]
 ExecStart=/usr/sbin/netman.py
diff --git a/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service b/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
index 24c4a5a..deed98f 100755
--- a/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
+++ b/meta-phosphor/common/recipes-phosphor/settings/settings/settings.service
@@ -1,7 +1,5 @@
 [Unit]
 Description=Settings DBUS Object
-Requires=skeleton.service
-After=skeleton.service
 
 [Service]
 ExecStart=/usr/sbin/settings_manager.py
-- 
2.9.0
