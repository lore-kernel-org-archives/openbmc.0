Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZ8Vy5SqWzDqjH
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 13:01:14 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466564470213320.5327996416837;
 Tue, 21 Jun 2016 20:01:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/4] remove org.openbmc.Object.Enumerate interface
Date: Tue, 21 Jun 2016 22:01:05 -0500
Message-Id: <20160622030109.17283-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 03:01:15 -0000

This patchset completes the deprecation of this interface in favor of the freedesktop ObjectManager interface.  This addresses https://github.com/openbmc/openbmc/issues/218

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/110)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/110

Brad Bishop (4):
  Remove unused python modules from obmcutil
  obmcutil: Use freedesktop ObjectManager
  Remove org.openbmc.Object.Enumerate interface
  Run gdbus codegen for removed ObjectAdded signal

 gdbus/interfaces/openbmc_intf.c | 1102 ++++-----------------------------------
 gdbus/interfaces/openbmc_intf.h |  138 +----
 gdbus/xml/openbmc_intf.xml      |    6 -
 pytools/obmcutil                |   30 +-
 4 files changed, 119 insertions(+), 1157 deletions(-)

-- 
2.9.0
