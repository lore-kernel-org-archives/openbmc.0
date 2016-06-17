Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW59K5PbJzDqpJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 13:20:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466133615210221.80321179973646;
 Thu, 16 Jun 2016 20:20:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] cheatsheet: Explain how to boot the host with curl
Date: Thu, 16 Jun 2016 22:20:11 -0500
Message-Id: <20160617032011.12542-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160617032011.12542-1-openbmc-patches@stwcx.xyz>
References: <20160617032011.12542-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 03:20:22 -0000

From: Joel Stanley <joel@jms.id.au>

---
 cheatsheet.md | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/cheatsheet.md b/cheatsheet.md
index f51522c..873fbf9 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -104,3 +104,20 @@ qemu-system-arm \
 ```
 
 To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
+
+## Booting the host
+
+Login:
+```
+curl -c cjar -k -X POST -H "Content-Type: application/json" -d '{"data": [ "root", "0penBmc" ] }' https://palm5-bmc/login
+```
+
+Connect to host console:
+```
+ssh -p 2200 root@bmc
+```
+
+Power on:
+```
+curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST     -d '{"data": []}'  https://palm5-bmc/org/openbmc/control/chassis0/action/powerOn
+```
-- 
2.8.4
