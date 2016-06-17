Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWQ2q1wHpzDqR1
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2016 02:00:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466179241676435.6995113868454;
 Fri, 17 Jun 2016 09:00:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc v2 2/2] Remove rest-dbus from Barreleye image
Date: Fri, 17 Jun 2016 11:00:35 -0500
Message-Id: <20160617160035.4873-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160617160035.4873-1-openbmc-patches@stwcx.xyz>
References: <20160617160035.4873-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 16:00:52 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The rest-dbus is a package intended for development debug. Remove it
from the Barreleye image now that Barreleye is entering production.
The rest-dbus packages in part of the development package.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 .../meta-rackspace/meta-barreleye/conf/local.conf.sample              | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/local.conf.sample b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/local.conf.sample
index 8799d8d..00209c1 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/local.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/local.conf.sample
@@ -243,3 +243,7 @@ INHERIT += "extrausers"
 EXTRA_USERS_PARAMS = " \
   usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
   "
+
+# Package exclusions - Exclude packages included by default in the common image
+IMAGE_INSTALL_remove = "packagegroup-obmc-phosphor-apps-extrasdev"
+
-- 
2.8.4
