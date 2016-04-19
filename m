Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qq5xx65kNzDq5y
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 23:50:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461073839995955.2710505860068;
 Tue, 19 Apr 2016 06:50:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4] Adding Boot Policy
Date: Tue, 19 Apr 2016 08:50:37 -0500
Message-Id: <1461073838-10689-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 19 Apr 2016 13:50:46 -0000

Adding the boot policy support for get/Set system boot option.Policy can be onetime which is applicable to next boot only or 
Permanent which is applicable for all the future boots.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/83)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/83

ratagupt (1):
  Adding Boot Policy

 chassishandler.C | 72 +++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 14 deletions(-)

-- 
2.7.1
