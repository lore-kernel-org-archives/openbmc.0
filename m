Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1906C1A0ADA
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 08:09:17 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446152954195543.0065532343517;
 Thu, 29 Oct 2015 14:09:14 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH docs 1/2] Fix description of busctl
Date: Thu, 29 Oct 2015 16:09:08 -0500
Message-Id: <1446152949-8085-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446152949-8085-1-git-send-email-patches@stwcx.xyz>
References: <1446152949-8085-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 21:09:18 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

It doesn't have much to do with REST.
---
 cheatsheet.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cheatsheet.md b/cheatsheet.md
index 273557f..530f6c0 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -58,7 +58,7 @@ and running `oe-init-build-env` again (possibly with `TEMPLATE_CONF` set).
 
 http://www.freedesktop.org/software/systemd/man/busctl.html
 
-Great tool to issue rest commands via cli. That way you don't have to wait for
+Great tool to issue dbus commands via cli. That way you don't have to wait for
 the code to hit the path on the system. Great for running commands with QEMU
 too!
 
-- 
2.6.0
