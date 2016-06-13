Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT3605k6tzDqcY
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 05:40:23 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465846816670669.4716842314583;
 Mon, 13 Jun 2016 12:40:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser 0/3]  Add shared library versioning
Date: Mon, 13 Jun 2016 14:40:12 -0500
Message-Id: <20160613194015.23561-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Mon, 13 Jun 2016 19:40:26 -0000

In general this is probably a good idea, and the default OE packaging scripts work the best when this is the case.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/ipmi-fru-parser/20)
<!-- Reviewable:end -->


https://github.com/openbmc/ipmi-fru-parser/pull/20

Brad Bishop (3):
  Added gitignore
  Makefile whitespace fixes
  Add shared library versioning

 .gitignore |  5 +++++
 Makefile   | 23 ++++++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 .gitignore

-- 
2.8.4
