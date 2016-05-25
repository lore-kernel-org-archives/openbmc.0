Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFHnx3XCTzDqW9
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 02:30:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464193837931530.9883458487725;
 Wed, 25 May 2016 09:30:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update u-boot to pick up memory corruption fix
Date: Wed, 25 May 2016 11:30:35 -0500
Message-Id: <20160525163036.14329-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 May 2016 16:30:46 -0000

This commit updates u-boot to include the long term fix to not leave the ethernet controller running when the network is not used to boot the kernel.

An intermediate fix to u-boot was applied in the v0.6-stable branch in commit 8e5dd42060cd8e293d2b8d45c62a1c5f143ba988 via #213.  The final fixes were later commited to openbmc/u-boot@fecb84ab7f3bddc4039b5de31f57440e1cfff650 but the pull request to update openbmc to use the fix #227 was stalled because of unrelated changes to pick up a new compiler which may still have issues with other code.  The additional fixes in u-boot allow both the old and new compiler to be used but the compiler is not changed in this pull request.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/304)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/304

Joel Stanley (1):
  meta-phosphor/u-boot: Move to newer version

 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.8.3
