Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1F72E1A070B
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:26 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144536882505960.96603366703141;
 Tue, 20 Oct 2015 12:20:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 11/20] Add palmetto recipes-bsp description
Date: Tue, 20 Oct 2015 14:19:49 -0500
Message-Id: <1445368798-31274-12-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:27 -0000

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
