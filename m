Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s07F70mDrzDrMM
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 07:20:25 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1469654419052915.4864344123357;
 Wed, 27 Jul 2016 14:20:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs v2] Enhancing instructions on QEMU
Date: Wed, 27 Jul 2016 16:20:10 -0500
Message-Id: <20160727212011.3521-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Wed, 27 Jul 2016 21:20:28 -0000

Added step by step details on using QEMU in both a virtual
bridge and tap environment.  Latest features of QEMU palmetto
integration now allow for uboot flash support and ftgmac100
device support.  That means you can start the qemu session
from uboot and run the real ftgmac ethernet device.

Signed-off-by: Chris Austen <austenc@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/docs/33)
<!-- Reviewable:end -->


https://github.com/openbmc/docs/pull/33

Chris Austen (1):
  Enhancing instructions on QEMU

 cheatsheet.md | 55 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 10 deletions(-)

-- 
2.9.0
