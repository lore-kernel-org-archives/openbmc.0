Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rLFdr1q33zDqgj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jun 2016 04:10:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464891050871135.7489023635311;
 Thu, 2 Jun 2016 11:10:50 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd v2] Adding the boot_policy attribute
Date: Thu,  2 Jun 2016 13:10:47 -0500
Message-Id: <20160602181048.19877-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 02 Jun 2016 18:10:57 -0000

Adding the boot policy support for get/Set system boot option.Policy can be ** onetime** which is applicable to next boot only or  **Permanent** which is applicable for all the future boots.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-settingsd/8)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-settingsd/pull/8

ratagupt (1):
  Adding the boot_policy attribute

 settings.yaml    | 7 ++++++-
 settings_file.py | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.8.3
