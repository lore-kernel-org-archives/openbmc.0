Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rX8fN4MFfzDqjC
 for <openbmc@lists.ozlabs.org>; Sun, 19 Jun 2016 07:00:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466283635196513.9558776146544;
 Sat, 18 Jun 2016 14:00:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc] Bump versions for skeleton, rest, inarp, event
Date: Sat, 18 Jun 2016 16:00:33 -0500
Message-Id: <20160618210034.27707-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 18 Jun 2016 21:00:46 -0000

Bump recipe versions and add python dependencies.
The rest-dbus recipe was adding pythong packages needed
by other processes, so when rest-dbus was removed from the
Barreleye image, these processes (skeleton and obmc-rest)
would fail, so adding the python dependencies to those recipes.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/393)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/393

Adriana Kobylak (1):
  Bump versions for skeleton, rest, inarp, event

 .../meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb        | 2 +-
 .../meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb      | 2 +-
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb               | 1 +
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb    | 2 +-
 meta-phosphor/common/recipes-phosphor/inarp/inarp.bb                  | 2 +-
 .../recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb       | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb            | 4 ++--
 7 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.8.4
