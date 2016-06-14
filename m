Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTg4070YFzDqhk
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 05:40:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465933240368957.8839051227301;
 Tue, 14 Jun 2016 12:40:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] AST2500: defconfig changes required for systemd
Date: Tue, 14 Jun 2016 14:40:38 -0500
Message-Id: <20160614194039.17245-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 19:40:50 -0000

Change-Id: I43d8d469bce5c61d48506aebda7cfccf1d99f8b3
Signed-off-by: Rick Altherr <raltherr@google.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/330)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/330

Rick Altherr (1):
  AST2500: defconfig changes required for systemd

 .../meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig  | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.8.4
