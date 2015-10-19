Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 367391A0730
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:38 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293355965772.7220705923335;
 Mon, 19 Oct 2015 15:22:35 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/3] Add palmetto recipes-bsp description
Date: Mon, 19 Oct 2015 17:22:30 -0500
Message-Id: <1445293351-658-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445293351-658-1-git-send-email-patches@stwcx.xyz>
References: <1445293351-658-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:38 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
index db84c6f..149509f 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
@@ -1 +1,2 @@
+recipes-bsp          - Anything with links to specific hardware or hardware configuration information
 recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
-- 
2.6.0
