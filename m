Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qtXLm2sGvzDq9q
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2016 13:50:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461556234737781.7329169392701;
 Sun, 24 Apr 2016 20:50:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Austen <causten@users.noreply.github.com>
Subject: [PATCH openpower-host-ipmi-oem] Update README.md
Date: Sun, 24 Apr 2016 22:50:32 -0500
Message-Id: <1461556232-22308-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461556232-22308-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461556232-22308-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 25 Apr 2016 03:50:41 -0000

From: Chris Austen <causten@users.noreply.github.com>

---
 README.md | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 410a857..703d48b 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,11 @@
-This .so file and accompaning test program is designed to support the OpenPOWER's BIOS OEM command
\ No newline at end of file
+This .so file is designed to support the OpenPOWER's BIOS OEM commands.  Documentation can be found by contacting the OpenPOWER mailing list https://github.com/open-power/op-build 
+
+## To Build
+```
+make
+```
+
+## Supported Commands
+- Partial Add
+- Prepare for host update
+
-- 
2.8.1
