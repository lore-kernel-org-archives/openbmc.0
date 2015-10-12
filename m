Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 558F61A0730
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:16:54 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659411376646.0313167432445;
 Mon, 12 Oct 2015 07:16:51 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/7] Add recipes-connectivity recipes.txt description
Date: Mon, 12 Oct 2015 09:16:36 -0500
Message-Id: <1444659400-4196-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
References: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:16:56 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/common/recipes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
index 8ebedf8..b6a8cde 100644
--- a/meta-phosphor/common/recipes.txt
+++ b/meta-phosphor/common/recipes.txt
@@ -1,3 +1,4 @@
+recipes-connectivity - Libraries and applications related to communication with other devices 
 recipes-extended     - Applications which whilst not essential add features compared to the alternatives in
                        core. May be needed for full tool functionality or LSB compliance.
 recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.6.0
