Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfjTw3tZfzDqwG
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 23:01:07 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467205261601135.46297981552186;
 Wed, 29 Jun 2016 06:01:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/2] GCC 5 build fixes
Date: Wed, 29 Jun 2016 08:00:58 -0500
Message-Id: <20160629130100.25673-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 29 Jun 2016 13:01:09 -0000

I came across two issues when attempting to build our system with GCC 5.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/118)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/118

Joel Stanley (2):
  libopenbmc_intf: Fix non-arm devmem implementation
  hostcheckstop: Fix missing header

 hostcheckstop/host_checkstop_obj.c | 2 ++
 libopenbmc_intf/openbmc.h          | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.9.0
