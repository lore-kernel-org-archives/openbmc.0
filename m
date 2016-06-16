Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVmKN71s5zDqnP
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 00:41:12 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466088063819914.1798233681847;
 Thu, 16 Jun 2016 07:41:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v7 2/6] Add gdbus interface for checkstop gpio
Date: Thu, 16 Jun 2016 09:40:52 -0500
Message-Id: <20160616144056.17931-3-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 14:41:13 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add a gdbus interface to handle the checkstop gpio.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 gdbus/xml/openbmc_intf.xml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/gdbus/xml/openbmc_intf.xml b/gdbus/xml/openbmc_intf.xml
index ead899c..d296291 100644
--- a/gdbus/xml/openbmc_intf.xml
+++ b/gdbus/xml/openbmc_intf.xml
@@ -132,6 +132,8 @@
 		<property name="state" type="i" access="read"/>
 		<property name="pgood_timeout" type="i" access="readwrite"/>
 	</interface>
+	<interface name="org.openbmc.control.Checkstop">
+	</interface>
 	<interface name="org.openbmc.Watchdog">
 		<method name="start"/>
 		<method name="poke"/>
-- 
2.8.4
