Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3CvL1wwwzDqBy
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 17:00:30 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462777216308733.5666427038225;
 Mon, 9 May 2016 00:00:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 1/2] rest-api.md: Fix 'emumerate' typo
Date: Mon,  9 May 2016 02:00:11 -0500
Message-Id: <1462777212-10680-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462777212-10680-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462777212-10680-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 May 2016 07:00:30 -0000

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
