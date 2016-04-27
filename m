Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwFKz2SxzzDqHY
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 08:40:54 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461796852414517.2312957625807;
 Wed, 27 Apr 2016 15:40:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Remove CHASSIS_2 from Barreleye.py
Date: Wed, 27 Apr 2016 17:40:50 -0500
Message-Id: <1461796851-3417-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Wed, 27 Apr 2016 22:40:57 -0000

FRU_ID 2 corresponds to CPU1 and it doesn't have a CHASSIS section,
so removing CHASSIS_2 since it causes an error on parsing the vpd
data from hostboot and therefore it doesn't get added to the
inventory.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/68)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/68

Adriana Kobylak (1):
  Remove CHASSIS_2 from Barreleye.py

 bin/Barreleye.py | 1 -
 1 file changed, 1 deletion(-)

-- 
2.8.1
