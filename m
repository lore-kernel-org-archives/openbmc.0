Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTt8R4YF9zDqh8
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 14:00:23 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465963217202535.1106663988288;
 Tue, 14 Jun 2016 21:00:17 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] cheatsheet.md: Re-write QEMU invocation example
Date: Tue, 14 Jun 2016 23:00:13 -0500
Message-Id: <20160615040014.5450-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 04:00:24 -0000

The commandline provided had several issues:

* The -dtb option was redundant as we boot with the cuImage, and caused
  some kernel configuration to be skipped which in turn ended in a
  kernel panic
* -append argument was redundant with respect to the devicetree
* The file paths used typically required the user to change up out of
  the build directory after bitbaking obmc-phosphor-image

The patch addresses all of the above.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/docs/27)
<!-- Reviewable:end -->


https://github.com/openbmc/docs/pull/27

Andrew Jeffery (1):
  cheatsheet.md: Re-write QEMU invocation example

 cheatsheet.md | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.8.4
