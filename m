Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZfF028K5zDqRd
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 08:20:51 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466634047781388.8090189799933;
 Wed, 22 Jun 2016 15:20:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2] Fix minor fw revision to be BCD encoded
Date: Wed, 22 Jun 2016 17:20:45 -0500
Message-Id: <20160622222046.30114-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 22:20:53 -0000

The IPMI spec requires the minor version revision to be BCD encoded.
Currently the hex value was returned.
Fixes https://github.com/openbmc/phosphor-host-ipmid

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/94)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/94

Adriana Kobylak (1):
  Fix minor fw revision to be BCD encoded

 apphandler.C | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.9.0
