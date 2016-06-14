Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTg3t1D0jzDqgw
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 05:40:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465933235887576.4008496139745;
 Tue, 14 Jun 2016 12:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Ignore any build directory, not just 'build'
Date: Tue, 14 Jun 2016 14:40:33 -0500
Message-Id: <20160614194033.17188-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614194033.17188-1-openbmc-patches@stwcx.xyz>
References: <20160614194033.17188-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 19:40:43 -0000

From: Rick Altherr <raltherr@google.com>

Change-Id: I958fb5d0d5cff35829b22b5d3e15e2d94356e62c
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index ccd8f51..48652c2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,3 @@
-build/*
+build*/*
 customrc
 *.sw?
-- 
2.8.4
