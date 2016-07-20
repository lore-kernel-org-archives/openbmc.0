Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rvs7H3rlJzDqfS
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 08:30:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469053831454748.3792261477889;
 Wed, 20 Jul 2016 15:30:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 2/3] contributing: Add astyle call for C
Date: Wed, 20 Jul 2016 17:30:15 -0500
Message-Id: <20160720223016.9424-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160720223016.9424-1-openbmc-patches@stwcx.xyz>
References: <20160720223016.9424-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Wed, 20 Jul 2016 22:30:36 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 contributing.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contributing.md b/contributing.md
index 674dcee..5d64b32 100644
--- a/contributing.md
+++ b/contributing.md
@@ -67,6 +67,9 @@ In short:
 
   - Opening braces on the end of a line, except for functions
 
+This style can mostly be verified with 'astyle' as follows:
+
+    astyle --style=linux --indent=tab=8 --indent=force-tab=8
 
 Submitting changes
 ------------------
-- 
2.9.0
