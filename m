Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsc12ldzDqtP
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146730903576688.41032616732366;
 Thu, 30 Jun 2016 10:50:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 1/6] Fix invalid layer paths in non-removable
Date: Thu, 30 Jun 2016 12:50:28 -0500
Message-Id: <20160630175033.5212-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:44 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

A number of the layer paths in the non-removable section
of the bblayers.conf templates had invalid paths.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-ibm/meta-firestone/conf/bblayers.conf.sample          | 10 +++++-----
 .../meta-ibm/meta-garrison/conf/bblayers.conf.sample           | 10 +++++-----
 .../meta-ibm/meta-palmetto/conf/bblayers.conf.sample           | 10 +++++-----
 .../meta-ibm/meta-witherspoon/conf/bblayers.conf.sample        | 10 +++++-----
 .../meta-rackspace/meta-barreleye/conf/bblayers.conf.sample    | 10 +++++-----
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
index c675a18..d231e88 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
@@ -19,9 +19,9 @@ BBLAYERS_NON_REMOVABLE ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
-  ##OEROOT##/meta-aspeed \
-  ##OEROOT##/meta-aspeed/meta-ast2400 \
-  ##OEROOT##/meta-openpower \
-  ##OEROOT##/meta-openpower/meta-ibm \
-  ##OEROOT##/meta-openpower/meta-ibm/meta-firestone \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone \
   "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
index 76777e4..11bfa80 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
@@ -19,9 +19,9 @@ BBLAYERS_NON_REMOVABLE ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
-  ##OEROOT##/meta-aspeed \
-  ##OEROOT##/meta-aspeed/meta-ast2400 \
-  ##OEROOT##/meta-openpower \
-  ##OEROOT##/meta-openpower/meta-ibm \
-  ##OEROOT##/meta-openpower/meta-ibm/meta-garrison \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison \
   "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample
index d0e0219..7156d9b 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample
@@ -19,9 +19,9 @@ BBLAYERS_NON_REMOVABLE ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
-  ##OEROOT##/meta-aspeed \
-  ##OEROOT##/meta-aspeed/meta-ast2400 \
-  ##OEROOT##/meta-openpower \
-  ##OEROOT##/meta-openpower/meta-ibm \
-  ##OEROOT##/meta-openpower/meta-ibm/meta-palmetto \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto \
   "
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
index 333c7ef..59942f1 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/conf/bblayers.conf.sample
@@ -19,9 +19,9 @@ BBLAYERS_NON_REMOVABLE ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
-  ##OEROOT##/meta-aspeed \
-  ##OEROOT##/meta-aspeed/meta-ast2500 \
-  ##OEROOT##/meta-openpower \
-  ##OEROOT##/meta-openpower/meta-ibm \
-  ##OEROOT##/meta-openpower/meta-ibm/meta-witherspoon\
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon \
   "
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
index a261b26..163ef19 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
@@ -19,9 +19,9 @@ BBLAYERS_NON_REMOVABLE ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
-  ##OEROOT##/meta-aspeed \
-  ##OEROOT##/meta-aspeed/meta-ast2400 \
-  ##OEROOT##/meta-openpower \
-  ##OEROOT##/meta-openpower/meta-rackspace \
-  ##OEROOT##/meta-openpower/meta-rackspace/meta-barreleye \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
+  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-rackspace \
+  ##OEROOT##/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye \
   "
-- 
2.9.0
