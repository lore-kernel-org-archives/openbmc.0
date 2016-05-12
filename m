Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5MyC2lyJzDqDq
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 05:10:27 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463080221155673.5897756159111;
 Thu, 12 May 2016 12:10:21 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Increase size of buffer length variable
Date: Thu, 12 May 2016 14:10:18 -0500
Message-Id: <1463080219-26647-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Thu, 12 May 2016 19:10:28 -0000

The latest Barreleye vpd contains additional custom fields in one
of the board sections, pushing the size of the section to over 0x100.

The current variable that stores the buffer size is set to be
uint8_t which doesn't fit the extended size. Changing it to uint32_t.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/ipmi-fru-parser/15)
<!-- Reviewable:end -->


https://github.com/openbmc/ipmi-fru-parser/pull/15

Adriana Kobylak (1):
  Increase size of buffer length variable

 fru-area.H | 4 ++--
 frup.c     | 2 +-
 frup.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.8.1
