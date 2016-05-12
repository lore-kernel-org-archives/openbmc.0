Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4xmZ0Wc1zDqBg
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:30:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463020233595764.6173480242096;
 Wed, 11 May 2016 19:30:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] meta-phosphor: Move to openbmc-20160511-1
Date: Wed, 11 May 2016 21:30:31 -0500
Message-Id: <1463020232-16507-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 May 2016 02:30:38 -0000

 - Enables network cable link detection
 - Adds support for VOUT sampling to the adm1275 driver

Fixes https://github.com/openbmc/linux/issues/71 and https://github.com/openbmc/linux/issues/61

Signed-off-by: Joel Stanley <joel@jms.id.au>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/270)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/270

Joel Stanley (1):
  meta-phosphor: Move to openbmc-20160511-1

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.1
