Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qWKrJ4W5wzDq80
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2016 08:51:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458856266950475.81021242517545;
 Thu, 24 Mar 2016 14:51:06 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm: aspeed: Remove include/mach directory
Date: Thu, 24 Mar 2016 16:51:04 -0500
Message-Id: <1458856265-28039-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 24 Mar 2016 21:51:13 -0000

Reduce the upstream diff by eliminating the machine include directory and the arm/Makefile conditional removal.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/linux/68)
<!-- Reviewable:end -->


https://github.com/openbmc/linux/pull/68

Milton D. Miller II (1):
  arm: aspeed: Remove include/machine directory

 arch/arm/Makefile                           |   2 +
 arch/arm/mach-aspeed/aspeed.c               |   2 +-
 arch/arm/mach-aspeed/ast2400.h              | 117 ++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/include/mach/ast2400.h | 117 ----------------------------
 4 files changed, 120 insertions(+), 118 deletions(-)
 create mode 100644 arch/arm/mach-aspeed/ast2400.h
 delete mode 100644 arch/arm/mach-aspeed/include/mach/ast2400.h

-- 
2.7.1
