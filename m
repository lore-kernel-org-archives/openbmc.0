Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3BLJ13MgzDq5m
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 15:50:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462773011314252.6362588138643;
 Sun, 8 May 2016 22:50:11 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] userguide: Generate userguide.tex to include \tightlist
 macro
Date: Mon,  9 May 2016 00:50:09 -0500
Message-Id: <1462773010-7208-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Mon, 09 May 2016 05:50:16 -0000

Allow xelatex to build userguide.pdf without errors.

pandoc injects \tightlist macros into its output files which cause
xelatex to choke. By processing the hand-rolled userguide.tex with
pandoc the definition is injected and xelatex can build the PDF.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/docs/23)
<!-- Reviewable:end -->


https://github.com/openbmc/docs/pull/23

Andrew Jeffery (1):
  userguide: Generate userguide.tex to include \tightlist macro

 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.8.1
