Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1C0A11A001D
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140389944660.7243389488495;
 Thu, 29 Oct 2015 10:39:49 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH rest-dbus 1/3] Remove session bus from bus list
Date: Thu, 29 Oct 2015 12:39:35 -0500
Message-Id: <1446140377-7626-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
References: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

A session bus isn't being started so this hangs on startup.
---
 rest-dbus | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rest-dbus b/rest-dbus
index 56ec1f9..ffaa0ed 100755
--- a/rest-dbus
+++ b/rest-dbus
@@ -8,7 +8,6 @@ import os
 from xml.etree import ElementTree
 
 busses = {
-    'session': dbus.SessionBus,
     'system': dbus.SystemBus,
 }
 
-- 
2.6.0
