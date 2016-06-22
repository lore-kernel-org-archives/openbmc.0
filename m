Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZ8W56XvMzDqhh
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 13:01:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466564473386791.571790197199;
 Tue, 21 Jun 2016 20:01:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 3/4] Remove org.openbmc.Object.Enumerate interface
Date: Tue, 21 Jun 2016 22:01:08 -0500
Message-Id: <20160622030109.17283-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
References: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 03:01:23 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

All applications are using freedesktop ObjectManager now so this
can be removed.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 gdbus/xml/openbmc_intf.xml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/gdbus/xml/openbmc_intf.xml b/gdbus/xml/openbmc_intf.xml
index d296291..cabe910 100644
--- a/gdbus/xml/openbmc_intf.xml
+++ b/gdbus/xml/openbmc_intf.xml
@@ -1,10 +1,4 @@
 <node>
-	<interface name="org.openbmc.Object.Mapper">
-		<signal name="ObjectAdded">
-			<arg name="object_path" type="s"/>
-			<arg name="interface_name" type="s"/>
-		</signal>
-	</interface>
 	<interface name="org.openbmc.Hwmon">
 		<property name="poll_interval" type="i" access="read"/>
 		<property name="sysfs_path" type="s" access="read"/>
-- 
2.9.0
