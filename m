Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVmKf3bhRzDqjw
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 00:41:26 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466088076400326.109264845968;
 Thu, 16 Jun 2016 07:41:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v7 6/6] Fix gpioutil tool
Date: Thu, 16 Jun 2016 09:40:56 -0500
Message-Id: <20160616144056.17931-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
References: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 14:41:27 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Fix gpioutil tool to parse commands, this broke with the
skeleton refactoring commit.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 pytools/gpioutil | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pytools/gpioutil b/pytools/gpioutil
index b6ec5ea..58e02e6 100644
--- a/pytools/gpioutil
+++ b/pytools/gpioutil
@@ -19,6 +19,9 @@ def printUsage():
 if (len(sys.argv) < 2):
 	printUsage()
 
+# Pop the command name and point to the args
+sys.argv.pop(0)
+
 GPIO_SYSFS = '/sys/class/gpio/'
 
 class Gpio:
-- 
2.8.4
