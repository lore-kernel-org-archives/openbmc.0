Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8BE1F1A03ED
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 08:54:08 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444946044983951.3365413862759;
 Thu, 15 Oct 2015 14:54:04 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/4] Refactor sdbus-service.bbclass
Date: Thu, 15 Oct 2015 16:53:58 -0500
Message-Id: <1444946041-22756-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
References: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 21:54:09 -0000

From: Patrick Williams <patrick@stwcx.xyz>

sdbus-service.bbclass currently depends on c-daemon.bbclass, which is
used for samples that have their code and makefiles in the repository.
Removed this inherit to make the sdbus-service class more generally
applicable.
---
 meta-phosphor/classes/obmc-phosphor-sdbus-service.bbclass                | 1 -
 .../obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb           | 1 +
 .../common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-sdbus-service.bbclass b/meta-phosphor/classes/obmc-phosphor-sdbus-service.bbclass
index 8a9853c..bc190d4 100644
--- a/meta-phosphor/classes/obmc-phosphor-sdbus-service.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-sdbus-service.bbclass
@@ -6,4 +6,3 @@ DEPENDS += "systemd"
 RDEPENDS_${PN} += "libsystemd"
 
 inherit obmc-phosphor-dbus-service
-inherit obmc-phosphor-c-daemon
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
index 3735007..89fbdb1 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-example-sdbus/obmc-phosphor-example-sdbus.bb
@@ -8,3 +8,4 @@ DBUS_SERVICES = " \
         "
 
 inherit obmc-phosphor-sdbus-service
+inherit obmc-phosphor-c-daemon
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb
index 13c4b70..79e2e6c 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-phosphor-fand.bb
@@ -4,3 +4,4 @@ PR = "r1"
 
 inherit obmc-phosphor-fan-mgmt
 inherit obmc-phosphor-sdbus-service
+inherit obmc-phosphor-c-daemon
-- 
2.6.0
