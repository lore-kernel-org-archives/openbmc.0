Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfyLZ0zTDzDqmN
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 08:40:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467240033296289.65630806995614;
 Wed, 29 Jun 2016 15:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc] Force OLDEST_KERNEL to 4.4.0
Date: Wed, 29 Jun 2016 17:40:31 -0500
Message-Id: <20160629224032.22118-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Wed, 29 Jun 2016 22:40:38 -0000

This is the oldest kernel currently used by openbmc, so there is no
point in compiling glibc support older kernels.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/425)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/425

Patrick Williams (1):
  Force OLDEST_KERNEL to 4.4.0

 meta-phosphor/conf/distro/openbmc-phosphor.conf | 1 +
 1 file changed, 1 insertion(+)

-- 
2.9.0
