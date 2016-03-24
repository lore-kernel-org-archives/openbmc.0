Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qWK9l3Wk7zDq80
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2016 08:21:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458854469530916.79707442154;
 Thu, 24 Mar 2016 14:21:09 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] mtd: spi-nor: aspeed-smc: Fix flash struct setup for
 scan
Date: Thu, 24 Mar 2016 16:21:07 -0500
Message-Id: <1458854468-27054-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 24 Mar 2016 21:21:16 -0000

Two updates to the spi-nor drivers between 4.3 and 4.4 were missed
in the aspeed-smc rebase.

The mtd->priv field is now filled out by the common layer so that
can be dropped.  And the new flash_node driver was added and needs
to be set to the child flash node.

Not having this set changed the behavior of spi_nor_scan to follow
the not-in-device-tree path and defaulting to FAST_READ support.
The flash chip was programmed for FAST_READ but the driver was not
expecting it, and the additonal 8 bits of data caused all flash
data reads to be shifted 1 byte.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
Fixes #66

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/linux/67)
<!-- Reviewable:end -->


https://github.com/openbmc/linux/pull/67

Milton D. Miller II (1):
  mtd: spi-nor: aspeed-smc: Fix flash struct setup for scan

 drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.1
