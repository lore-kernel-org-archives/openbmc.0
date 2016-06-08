Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPfVh0KdGzDq68
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 17:01:31 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465369285852132.2658318986464;
 Wed, 8 Jun 2016 00:01:25 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Fix the sensor scandirectory recovery bug when poll
 or readattribute fail
Date: Wed,  8 Jun 2016 02:01:22 -0500
Message-Id: <20160608070123.28896-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 08 Jun 2016 07:01:33 -0000

Add except avoid readAttribute error interrupt.
Add self.sensors.pop so the next addobject can recreate the object.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/99)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/99

Ken (1):
  Fix the sensor scandirectory recovery bug when poll or readattribute
    fail

 bin/hwmon.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.8.3
