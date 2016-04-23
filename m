Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qsJDX23N0zDq60
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2016 13:41:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461382855833415.2065214057702;
 Fri, 22 Apr 2016 20:40:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3] skeleton: Add dbus objects for adm1278 hwmon
 sensors
Date: Fri, 22 Apr 2016 22:40:53 -0500
Message-Id: <1461382854-31385-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 23 Apr 2016 03:41:00 -0000

Add dbus object for adm1278 Vout and Iout sensors.
The object name will subject to change after review.

Signed-off-by: Yi Li <adamliyi@msn.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/57)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/57

Yi Li (1):
  skeleton: Add dbus objects for adm1278 hwmon sensors

 bin/Barreleye.py | 22 ++++++++++++++++++++++
 bin/Sensors.py   |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.8.1
