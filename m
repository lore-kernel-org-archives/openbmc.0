Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwlN5j9szDqCX
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 04:11:12 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466532662545347.03104139819334;
 Tue, 21 Jun 2016 11:11:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Enable user-overriable CFLAGS
Date: Tue, 21 Jun 2016 13:11:00 -0500
Message-Id: <20160621181101.26402-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 18:11:13 -0000

Put required CFLAGS (ie pkg-config --cflags) in ALL_CFLAGS and append
user specified CFLAGS to that.

Use CFLAGS during link.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/108)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/108

Brad Bishop (1):
  Enable user-overriable CFLAGS

 gdbus.mk                 | 4 ++--
 libopenbmc_intf/Makefile | 4 ++--
 op-flasher/Makefile      | 6 +++---
 rules.mk                 | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.9.0
