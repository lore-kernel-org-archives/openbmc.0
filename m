Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTgkx2ndMzDqgn
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 06:11:04 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465935059820627.8233250593001;
 Tue, 14 Jun 2016 13:10:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot] aspeed/ast-g5: Simplify default bootargs
Date: Tue, 14 Jun 2016 15:10:57 -0500
Message-Id: <20160614201058.18555-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
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
X-List-Received-Date: Tue, 14 Jun 2016 20:11:06 -0000

New arguments set default console for DEBUG_UART (ttyS4) on the EVB and allow the kernel to choose init path, root/overlay, and memory size.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/u-boot/7)
<!-- Reviewable:end -->


https://github.com/openbmc/u-boot/pull/7

Xo Wang (1):
  aspeed/ast-g5: Simplify default bootargs

 include/configs/ast-g5.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.4
