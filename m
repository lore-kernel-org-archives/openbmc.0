Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFXRj4HfzzDqDH
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 12:00:49 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464228046189822.914813181854;
 Wed, 25 May 2016 19:00:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v2] Fix endianness issue5
Date: Wed, 25 May 2016 21:00:43 -0500
Message-Id: <20160526020044.1213-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 02:00:50 -0000

Make it safe in both little-endian and big-endian bmc chip.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openpower-host-ipmi-oem/13)
<!-- Reviewable:end -->


https://github.com/openbmc/openpower-host-ipmi-oem/pull/13

Nan Li (1):
  Fix endianness issue5

 oemhandler.C | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.8.3
