Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qvZ3Y6YqKzDq9s
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 06:11:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461701459539228.94890724200582;
 Tue, 26 Apr 2016 13:10:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/3] Basic support for the Garrison system
Date: Tue, 26 Apr 2016 15:10:55 -0500
Message-Id: <1461701458-2173-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 26 Apr 2016 20:11:06 -0000

A couple base ast2400 dtsi fixes for i2c.
Basic device tree for Garrison system.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/linux/76)
<!-- Reviewable:end -->


https://github.com/openbmc/linux/pull/76

Brad Bishop (3):
  Fix a couple incorrect register bases for ast2400
  Removed firestone from dt makefile.
  Initial support for Garrison system.

 arch/arm/boot/dts/Makefile                    |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 80 +++++++++++++++++++++++++++
 arch/arm/boot/dts/ast2400.dtsi                |  8 ++-
 arch/arm/mach-aspeed/aspeed.c                 | 15 +++++
 4 files changed, 102 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts

-- 
2.8.1
