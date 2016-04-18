Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpQgJ0KQWzDq60
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 21:20:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460978440710262.5955648436427;
 Mon, 18 Apr 2016 04:20:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/2] Adding Boot Policy
Date: Mon, 18 Apr 2016 06:20:37 -0500
Message-Id: <1460978439-16510-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2016 11:20:44 -0000

Adding the boot policy support for get/Set system boot option.Policy can be onetime which is applicable to next boot only or 
Permanent which is applicable for all the future boots.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/83)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/83

ratagupt (2):
  Adding Boot Policy
  Review Comment added for 146621

 chassishandler.C | 64 +++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 12 deletions(-)

-- 
2.7.1
