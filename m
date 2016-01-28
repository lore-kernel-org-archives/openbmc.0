Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5CBD81A0054
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 14:00:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453950012349679.3489972913435;
 Wed, 27 Jan 2016 19:00:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2] README: Add overview page with index
Date: Wed, 27 Jan 2016 21:00:10 -0600
Message-Id: <1453950010-20498-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453950010-20498-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453950010-20498-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 03:00:18 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

--
v2: Fix typo, add links to other docs.
---
 README.md       | 20 +++++++++++++++++++-
 contributing.md |  2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 9b69328..c0bae54 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,19 @@
-# docs
+# OpenBMC documentation
+
+This repository contains documentation for OpenBMC as a whole. There may
+be component-specific documentation in the repository for each component.
+
+ - [cheatsheet.md](cheatsheet.md): Quick reference for some common
+   development tasks
+
+ - [contributing.md](contributing.md): Guidelines for contributing to
+   OpenBMC
+
+ - [dbus-interfaces.md](dbus-interfaces.md): Reference for APIs exposed
+   to dbus
+
+ - [kernel-development.md](kernel-development.md): Reference for common
+   kernel development tasks
+
+ - [rest-api.md](rest-api.md): Introduction to using the OpenBMC REST
+   API
diff --git a/contributing.md b/contributing.md
index a975983..08ae384 100644
--- a/contributing.md
+++ b/contributing.md
@@ -11,7 +11,7 @@ Authors:
 Structure
 ---------
 
-OpenBMC has quite a module structure, consisting of small daemons with a
+OpenBMC has quite a modular structure, consisting of small daemons with a
 limited set of responsibilities. These communicate over dbus with other
 components, to implement the complete BMC system.
 
-- 
2.6.4
