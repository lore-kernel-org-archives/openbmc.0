Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbrb34RdyzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 07:10:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466802633751568.7628800269616;
 Fri, 24 Jun 2016 14:10:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH openbmc] Bump versions for skeleton, IPMI, obmc-mapper
Date: Fri, 24 Jun 2016 16:10:31 -0500
Message-Id: <20160624211032.30550-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 21:10:40 -0000

Pick changes for:
Encoding firmware version in BCD format
Handle floating point sensor values
Performance improvements
Extend the mapper service startup timeout

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/414)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/414

Adriana Kobylak (1):
  Bump versions for skeleton, IPMI, obmc-mapper

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb               | 2 +-
 .../common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service        | 1 +
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb          | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb              | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.9.0
