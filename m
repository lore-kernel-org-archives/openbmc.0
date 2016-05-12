Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4vmM0nlmzDqDW
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 11:00:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463014814691197.52115686175705;
 Wed, 11 May 2016 18:00:14 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2 1/3] rest-api.md: Fix 'emumerate' typo
Date: Wed, 11 May 2016 20:00:10 -0500
Message-Id: <1463014812-12831-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 01:00:19 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 rest-api.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rest-api.md b/rest-api.md
index d0be259..1d61eb5 100644
--- a/rest-api.md
+++ b/rest-api.md
@@ -102,7 +102,7 @@ They are:
         $ curl -b cjar -k https://palm5-bmc/list
         [output omitted]
 
- - Adding `/emumerate` instead of `/list` will also include the attributes of
+ - Adding `/enumerate` instead of `/list` will also include the attributes of
    the listed objects.
 
 
-- 
2.8.1
