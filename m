Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdVSf01L9zDq5d
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 23:40:49 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467034843752136.6687308677748;
 Mon, 27 Jun 2016 06:40:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Fix two issues in Issue #80
Date: Mon, 27 Jun 2016 08:40:41 -0500
Message-Id: <20160627134042.28142-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 13:40:50 -0000

Corrected the comment for the Get Channel Info command to
reflect the logic in the code. For issue two, corrected the
condition for returning the unspecifed error.

Resolves: #80
See also: #77,#78

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/95)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/95

tomjose (1):
  Fix two issues in Issue #80

 apphandler.C | 4 +++-
 ipmid.C      | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.9.0
