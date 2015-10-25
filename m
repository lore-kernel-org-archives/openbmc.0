Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 822121A0415
 for <openbmc@lists.ozlabs.org>; Sun, 25 Oct 2015 12:42:49 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445737365827389.62789019095385;
 Sat, 24 Oct 2015 18:42:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Austen <causten@users.noreply.github.com>
Subject: [PATCH docs] Update dbus-interfaces.md
Date: Sat, 24 Oct 2015 20:42:41 -0500
Message-Id: <1445737361-27974-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445737361-27974-1-git-send-email-patches@stwcx.xyz>
References: <1445737361-27974-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 25 Oct 2015 01:42:50 -0000

From: Chris Austen <causten@users.noreply.github.com>

---
 dbus-interfaces.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index be9943a..ca90f05 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -14,3 +14,11 @@ methods:
   *  `setAttention()`
 
  
+# Useful dbus cli tools
+
+## 'busctl'  -  http://www.freedesktop.org/software/systemd/man/busctl.html
+Great tool to issue rest commands via cli.  That way you don't have to wait for the code to hit the path on the system.  Great for running commands with QEMU too!
+
+busctl call \<path\> \<interface\> \<object\> \<method\> \<parameters\> 
+
+* \<parameters\> example : sssay "t1" "t2" "t3" 2 2 3
-- 
2.6.0
