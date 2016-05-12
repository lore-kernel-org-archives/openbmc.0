Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4vmN6dWfzDqHc
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 11:00:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463014816689404.33036820901543;
 Wed, 11 May 2016 18:00:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2 2/3] rest-api: Fix capitalisation of 'Just'
Date: Wed, 11 May 2016 20:00:11 -0500
Message-Id: <1463014812-12831-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463014812-12831-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463014812-12831-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 01:00:21 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 rest-api.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rest-api.md b/rest-api.md
index 1d61eb5..10b01e9 100644
--- a/rest-api.md
+++ b/rest-api.md
@@ -151,7 +151,7 @@ Alternatively specify the json inline with -d:
         -d '{"data": <value>}' \
         https://bmc/org/openbmc/control/flash/bios/attr/flasher_path
 
-When using '-d' Just remember that json requires quoting.
+When using '-d' just remember that json requires quoting.
 
 ## HTTP POST operations
 POST operations are for calling methods, but also for creating new resources
-- 
2.8.1
