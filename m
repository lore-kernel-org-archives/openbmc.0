Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsf01zCzDr0R
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467309041465319.5286504570943;
 Thu, 30 Jun 2016 10:50:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 4/6] host-ipmi-hw-example: use skeleton class
Date: Thu, 30 Jun 2016 12:50:31 -0500
Message-Id: <20160630175033.5212-5-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
References: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:46 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Use the new skeleton classes.  This has the side
effect of a version bump.

Added a couple missing dependencies.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb       | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
index 13b07ad..3c4766e 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
@@ -2,16 +2,11 @@ SUMMARY = "Phosphor OpenBMC host IPMI to DBUS Example"
 DESCRIPTION = "Phosphor OpenBMC host IPMI to DBUS example implementation."
 PR = "r1"
 
-RDEPENDS_${PN} += "python-subprocess"
+RDEPENDS_${PN} += "python-subprocess python-dbus python-pygobject"
 
 SYSTEMD_SERVICE_${PN} = "host-ipmi-hw.service"
 
-inherit obmc-phosphor-pydbus-service
 inherit obmc-phosphor-host-ipmi-hw
+inherit skeleton-python
 
-S = "${WORKDIR}/git"
-SRC_URI += "git://github.com/openbmc/skeleton.git;subpath=bin;destsuffix=git"
-SRCREV="2f9ee83356fba3f6f843bf2584f3e7e95763ec98"
-
-SCRIPT_NAME = "ipmi_debug.py"
-INSTALL_NAME = "host-ipmi-hw"
+SKELETON_DIR = "pyipmitest"
-- 
2.9.0
