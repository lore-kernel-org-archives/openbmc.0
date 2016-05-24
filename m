Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDVlG22mWzDqDm
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 19:40:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464082838654939.2165714932673;
 Tue, 24 May 2016 02:40:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 0/2] Fix endianness issue5
Date: Tue, 24 May 2016 04:40:35 -0500
Message-Id: <20160524094037.16462-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 May 2016 09:40:42 -0000

Make it safe in both little-endian and big-endian bmc chip.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openpower-host-ipmi-oem/13)
<!-- Reviewable:end -->


https://github.com/openbmc/openpower-host-ipmi-oem/pull/13

Nan Li (2):
  Handle multiple attempts at ipmi reservation ids
  Fix endianness issue5

 oemhandler.C | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

-- 
2.8.3
