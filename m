Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV9FV4JC5zDqjl
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 01:20:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466004036561152.62557297792534;
 Wed, 15 Jun 2016 08:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Bump pyphosphor, host-ipmid versions
Date: Wed, 15 Jun 2016 10:20:34 -0500
Message-Id: <20160615152035.30373-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 15:20:47 -0000

This picks up a couple fixes that addresses non-standard DBUS naming
conventions.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/369)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/369

Brad Bishop (1):
  Bump pyphosphor, host-ipmid versions

 .../common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service      | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb        | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/pyphosphor.bb          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.8.4
