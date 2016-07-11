Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rns8K06hlzDqxP
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 14:10:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468210236979953.4179933627272;
 Sun, 10 Jul 2016 21:10:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add some missing dependencies to obmc-flash-bmc
Date: Sun, 10 Jul 2016 23:10:34 -0500
Message-Id: <20160711041034.4586-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711041034.4586-1-openbmc-patches@stwcx.xyz>
References: <20160711041034.4586-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 04:10:41 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

A couple new python modules were added to bmc_update.py.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb
index 80bd1bf..3c41220 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb
@@ -9,6 +9,8 @@ RDEPENDS_${PN} += "\
         python-compression \
         python-shell \
         python-pygobject \
+        python-subprocess \
+        python-io \
         pyphosphor \
         "
 
-- 
2.9.0
