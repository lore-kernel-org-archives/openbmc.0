Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYCSX36cSzDq80
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 00:10:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466431843706496.38242994248446;
 Mon, 20 Jun 2016 07:10:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Package whitelist.conf in obmc-phosphor-image
Date: Mon, 20 Jun 2016 09:10:41 -0500
Message-Id: <20160620141042.22721-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 14:10:53 -0000

IPMI whitelisted commands are added in whitelist.conf
which would be consumed by ipmid daemon. Only whitelisted
IPMI commands are executed in restricted mode.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/395)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/395

tomjose (1):
  Package whitelist.conf in obmc-phosphor-image

 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  5 ++++-
 .../host-ipmid/host-ipmid.bbappend                 |  1 +
 .../host-ipmid/host-ipmid/files/whitelist.conf     | 26 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/whitelist.conf

-- 
2.8.4
