Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F41A91A004E
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 19:10:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145310460972080.0847471138893;
 Mon, 18 Jan 2016 00:10:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] README: Add overview page with index
Date: Mon, 18 Jan 2016 02:10:08 -0600
Message-Id: <1453104608-22459-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453104608-22459-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453104608-22459-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Jan 2016 08:10:16 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 README.md | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 9b69328..689cd3d 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,14 @@
-# docs
+# OpenBMC documentation
+
+This repository contains documentation for OpenBMC as a whole. There may
+be component-specific documentation in the repository for each component.
+
+ - cheatsheet.md: Quick reference for some common development tasks
+
+ - contributing.md: Guidelines for contributing to OpenBMC
+
+ - dbus-interfaces.md: Reference for APIs exposed to dbus
+
+ - kernel-development.md: Reference for common kernel development tasks
+
+ - rest-api.md: Introduction to using the OpenBMC REST API
-- 
2.6.4
