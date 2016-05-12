Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4vKG6K7PzDqD8
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 10:40:17 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463013613727563.2028895725068;
 Wed, 11 May 2016 17:40:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2 2/2] Makefile: Remove xelatex build log on clean
Date: Wed, 11 May 2016 19:40:10 -0500
Message-Id: <1463013610-11928-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463013610-11928-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463013610-11928-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 00:40:19 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Previously the log files from xelatex were being left behind. Also, as
xelatex now builds the generated userguide.tex, the arguments to rm can
be matched by the userguide.* wildcard along with *.tex to remove the
remaining pandoc output.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c00b79c..261867b 100644
--- a/Makefile
+++ b/Makefile
@@ -18,4 +18,4 @@ userguide/userguide.tex: rest-api.tex host-management.tex console.tex code-updat
 	pandoc -o $@ $^
 
 clean:
-	rm -f *.aux *.tex *.out *.pdf
+	rm -f *.tex userguide.*
-- 
2.8.1
