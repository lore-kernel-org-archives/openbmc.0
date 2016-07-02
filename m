Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rhDT52pYMzDqm9
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 10:20:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467418834316770.0379125416008;
 Fri, 1 Jul 2016 17:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc] Bump skeleton version for v1.0-stable
Date: Fri,  1 Jul 2016 19:20:32 -0500
Message-Id: <20160702002033.7356-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 02 Jul 2016 00:20:41 -0000

Pick up fixes and the ability to update at runtime and get the
bmc code update progress.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/454)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/454

Adriana Kobylak (1):
  Bump skeleton version for v1.0-stable

 .../meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.9.0
