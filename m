Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ED191A039A
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 07:40:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455050428757553.0897537081144;
 Tue, 9 Feb 2016 12:40:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable Persistent event logs in OBMC
Date: Tue,  9 Feb 2016 14:40:22 -0600
Message-Id: <1455050422-19194-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1455050422-19194-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455050422-19194-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 20:40:44 -0000

From: Chris Austen <austenc@us.ibm.com>

Enable the /var/lib/obmc/events in the whitelist
Move pointers up for event manager and object manager
---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb  | 2 +-
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist        | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
index b9df28a..ab6dc98 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
@@ -18,6 +18,6 @@ RDEPENDS_${PN} += " \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-objmgr"
 
-SRCREV = "3f7aa329568d8f191baeeefa4a63dbb19cf26338"
+SRCREV = "956dd44fe5c8377ec90cef393f65033d59e082b0"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index 3b8ce0e..4f59e99 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -13,7 +13,7 @@ TARGET_CPPFLAGS += "-std=c++11 -fpic"
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "aa9ec3aa2cc59fc7e2437041d89b19f4a8f1d7f0"
+SRCREV = "01ac3503dc97fb99bee9c25c23fe73a5f4ea0475"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
index 80f9c81..603cec7 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
@@ -6,3 +6,4 @@
 /etc/group
 /etc/shadow
 /etc/gshadow
+/var/lib/obmc/events/
-- 
2.6.4
