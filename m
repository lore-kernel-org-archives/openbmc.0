Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxLMR5ggGzDqB4
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:30:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461951056743489.87793668016855;
 Fri, 29 Apr 2016 10:30:56 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Add BMC Flash dbus object to Palmetto
Date: Fri, 29 Apr 2016 12:30:54 -0500
Message-Id: <1461951055-23123-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Apr 2016 17:31:00 -0000

Add the BMC Flash dbus object to Palmetto.py to expose interfaces
to flash the BMC. Without it, there are no interfaces to flash BMC
from REST. This change is already in Barreleye, just porting to Palmetto.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/69)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/69

Adriana Kobylak (1):
  Add BMC Flash dbus object to Palmetto

 bin/Palmetto.py | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.8.1
