Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 30EA71A078B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 14:00:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449111626884833.6515343626625;
 Wed, 2 Dec 2015 19:00:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] Alignment and double error
Date: Wed,  2 Dec 2015 22:00:25 -0500
Message-Id: <1449111626-20805-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Thu, 03 Dec 2015 03:00:43 -0000

Fixed a pointer pointer issue where no one had the storage for a uint16_t
Fixed the double error log on palmetto systems needed a reconfig loop

https://github.com/openbmc/phosphor-host-ipmid/pull/47

Chris Austen (1):
  Alignment failure fixes

 ipmid.C         | 11 ++++++-----
 storageaddsel.C | 40 ++++++++++------------------------------
 2 files changed, 16 insertions(+), 35 deletions(-)

-- 
2.6.3
