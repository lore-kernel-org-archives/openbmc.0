Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfLNn02BqzDqpc
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 08:40:23 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467153616272896.9743919005525;
 Tue, 28 Jun 2016 15:40:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH ipmi-fru-parser] Handle IOBoard VPD for Barreleye
Date: Tue, 28 Jun 2016 17:40:14 -0500
Message-Id: <20160628224015.14654-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Tue, 28 Jun 2016 22:40:25 -0000

Due to changes to the IOBoard VPD for Barreleye to include the MAC
address, the fru parser needs hardening to handle these changes.
First do not try to read data if the area length is 0. Second
adjust the area length as the checksum is now at a 4 byte
boundary instead of 8. The IOBOARD_WORKAROUND macro will be
added in the barreleye recipe.
Fixes openbmc/ipmi-fru-parser#19

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/ipmi-fru-parser/22)
<!-- Reviewable:end -->


https://github.com/openbmc/ipmi-fru-parser/pull/22

Adriana Kobylak (1):
  Handle IOBoard VPD for Barreleye

 writefrudata.C | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.9.0
