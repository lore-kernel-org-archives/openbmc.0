Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BB12F1A0060
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 11:20:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454545220411871.7241986442015;
 Wed, 3 Feb 2016 16:20:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3] Update recipes and remove dhcp file
Date: Wed,  3 Feb 2016 18:20:18 -0600
Message-Id: <1454545219-20880-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Feb 2016 00:20:24 -0000

Backout kernel level since tag 20160202 has vuart support that bmc
currently does not support
Pickup IPMI and REST functions to update the MAC address
Remove dhcp file from network recipe that seems to cause issues
Update skeleton with syntax fix

https://github.com/openbmc/openbmc/pull/163

Adriana Kobylak (1):
  Update recipes and remove dhcp file

 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb       | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb    | 2 +-
 meta-phosphor/common/recipes-phosphor/network/network.bb          | 8 ++------
 .../common/recipes-phosphor/network/network/80-dhcp.network       | 5 -----
 4 files changed, 4 insertions(+), 13 deletions(-)
 delete mode 100755 meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network

-- 
2.6.4
