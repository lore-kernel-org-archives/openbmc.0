Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4vKG6LXLzDqDV
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 10:40:18 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463013612762855.1669511613873;
 Wed, 11 May 2016 17:40:12 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2 1/2] userguide: Generate userguide.tex to include
 \tightlist macro
Date: Wed, 11 May 2016 19:40:09 -0500
Message-Id: <1463013610-11928-2-git-send-email-openbmc-patches@stwcx.xyz>
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

Allow xelatex to build userguide.pdf without errors.

pandoc injects \tightlist macros into its output files which cause
xelatex to choke. By processing the hand-rolled userguide.tex with
pandoc the definition is injected and xelatex can build the PDF.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 82ec1c3..c00b79c 100644
--- a/Makefile
+++ b/Makefile
@@ -6,9 +6,12 @@ all: userguide.pdf
 
 .PHONY: all clean
 
-userguide.pdf: userguide/userguide.tex
+userguide.pdf: userguide.tex
 	$(tex) $^
 
+userguide.tex: userguide/userguide.tex
+	pandoc -f latex -t latex -s -o $@ $^
+
 userguide/userguide.tex: rest-api.tex host-management.tex console.tex code-update.tex
 
 %.tex: %.md
-- 
2.8.1
