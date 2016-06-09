Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ5Yn26vlzDqNn
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:20:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465431637250975.044453444233;
 Wed, 8 Jun 2016 17:20:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2 02/11] Add recipes-bsp to recipes.txt
Date: Wed,  8 Jun 2016 19:20:23 -0500
Message-Id: <20160609002032.984-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 09 Jun 2016 00:20:46 -0000
X-List-Received-Date: Thu, 09 Jun 2016 00:20:46 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This was missed when the u-boot recipe was added.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
index ccd19b2..1a8adc7 100644
--- a/meta-phosphor/common/recipes.txt
+++ b/meta-phosphor/common/recipes.txt
@@ -1,3 +1,4 @@
+recipes-bsp          - Anything with links to specific hardware or hardware configuration information
 recipes-connectivity - Libraries and applications related to communication with other devices 
 recipes-core         - What's needed to build a basic working Linux image including commonly used dependencies
 recipes-devtools     - Tools primarily used by the build system (but can also be used on targets)
-- 
2.8.3
