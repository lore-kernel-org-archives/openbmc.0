Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 26A6A1A0376
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448436026476652.9583453539991;
 Tue, 24 Nov 2015 23:20:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 2/3] ipmid: Remove assumptions about host
 IPMI sender objects
Date: Wed, 25 Nov 2015 02:20:23 -0500
Message-Id: <1448436024-9396-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448436024-9396-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:20:31 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Currently, the IPMI daemon will only receive messages from a specific
(arbitrary) object path that the debug daemon used.

Instead, we should be listening to any signal that matches our interface
(org.openbmc.HostIpmi.ReceivedMessage). When replying to the message,
we should be using the signal sender info to properly address the
reply method.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 ipmid.C | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 440705c..fe989e0 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -26,10 +26,7 @@ void print_usage(void) {
   fprintf(stderr, "    mask : 0xFF - Print all trace\n");
 }
 
-
-
 const char * DBUS_INTF = "org.openbmc.HostIpmi";
-
 const char * FILTER = "type='signal',interface='org.openbmc.HostIpmi',member='ReceivedMessage'";
 
 
-- 
2.6.3
