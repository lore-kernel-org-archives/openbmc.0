Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDpk04g7jzDqNq
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 07:40:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464126034696135.58633659391046;
 Tue, 24 May 2016 14:40:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Bump IPMI, networkd, REST, and skeleton versions
Date: Tue, 24 May 2016 16:40:32 -0500
Message-Id: <20160524214033.8970-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Tue, 24 May 2016 21:40:41 -0000

Pick up:
Fix FRU VPD error messages
Add REST interface to update BMC via local file
Add Barreleye motherboard VPD to the inventory
Handle parallel IPMI SEL reservation requests
Add support to stream the journald log to a remote syslog

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/302)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/302

Adriana Kobylak (1):
  Bump IPMI, networkd, REST, and skeleton versions

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 meta-phosphor/common/recipes-phosphor/network/network.bb           | 2 +-
 meta-phosphor/common/recipes-phosphor/rest-dbus/rest-dbus.bb       | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.8.3
