Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbQF0fvvzDq5d
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:31:00 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467329457418282.8971339988067;
 Thu, 30 Jun 2016 16:30:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 0/3] Flash bmc updates
Date: Thu, 30 Jun 2016 18:30:52 -0500
Message-Id: <20160630233055.16526-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:31:01 -0000

These are the initial two patches to the BMC flash update REST code that will increase reliability and make utility of the update process.  These are in preparation to address openbmc/openbmc#293.

1. The u-boot environment was copying the raw flash for update, which would interfere with actually applying a mac address via rest and with setting or clearing the one-time boot overrides.

2. Prepare for the whitelist to be split, and do not error if the whitelist was previously removed.  The old behavior would cause an error state if the whitelist had been removed by a previous update application in the current boot.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/111)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/111

Milton Miller (3):
  bmc_update: save runtime modified u-boot environment
  bmc_update: allow whitelist to be files in a directory
  flash_bmc: Add Apply method to flash updates from runtime

 pyflashbmc/bmc_update.py | 189 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 177 insertions(+), 12 deletions(-)

-- 
2.9.0
