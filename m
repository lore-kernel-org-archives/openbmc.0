Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rmCjy4mT8zDqlj
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 22:00:38 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146797923427253.395227409327276;
 Fri, 8 Jul 2016 05:00:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3] Package whitelist.conf in obmc-phosphor-image
Date: Fri,  8 Jul 2016 07:00:32 -0500
Message-Id: <20160708120033.2172-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 08 Jul 2016 12:00:39 -0000

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

 .../recipes-phosphor/host-ipmid/host-ipmid.bb      | 18 +++++++++++++++-
 .../host-ipmid/host-ipmid.bbappend                 |  1 +
 .../host-ipmid/files/host-ipmid-whitelist.conf     | 24 ++++++++++++++++++++++
 .../files/ipmi-fru-parser-whitelist.conf           |  2 ++
 .../files/openpower-host-ipmi-oem-whitelist.conf   |  2 ++
 5 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/ipmi-fru-parser-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/openpower-host-ipmi-oem-whitelist.conf

-- 
2.9.0
