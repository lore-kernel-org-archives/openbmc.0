Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgzNN1kwDzDqhC
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 00:30:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467383438512634.1138621645964;
 Fri, 1 Jul 2016 07:30:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Package whitelist.conf in obmc-phosphor-image
Date: Fri,  1 Jul 2016 09:30:36 -0500
Message-Id: <20160701143037.13669-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Jul 2016 14:30:44 -0000

IPMI whitelisted commands are added in whitelist.conf
which would be consumed by ipmid daemon. Only whitelisted
IPMI commands are executed in restricted mode.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/395)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/395

tomjose (1):
  Generate code from conf files from IPMI packages

 .../recipes-phosphor/host-ipmid/host-ipmid.bb      | 45 +++++++++++++++++++++-
 .../host-ipmid/host-ipmid.bbappend                 |  1 +
 .../host-ipmid/files/host-ipmid-fru-whitelist.conf |  2 +
 .../host-ipmid/files/host-ipmid-oem-whitelist.conf |  3 ++
 .../host-ipmid/files/host-ipmid-whitelist.conf     | 23 +++++++++++
 5 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-fru-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-oem-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf

-- 
2.9.0
