Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR0bX3NykzDqB0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 21:40:23 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465558816761720.7864629732169;
 Fri, 10 Jun 2016 04:40:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Fixes openbmc/ipmi-fru-parser#3
Date: Fri, 10 Jun 2016 06:40:14 -0500
Message-Id: <20160610114015.15199-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Fri, 10 Jun 2016 11:40:25 -0000

IPMI FRU record has BINARY and ASCII+Latin encoding. The BINARY version was not correctly getting reported to the fru inventory. This patch converts the BINARY into the string and updates the inventory.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/ipmi-fru-parser/18)
<!-- Reviewable:end -->


https://github.com/openbmc/ipmi-fru-parser/pull/18

vishwa (1):
  Fixes openbmc/ipmi-fru-parser#3

 frup.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 5 deletions(-)

-- 
2.8.3
