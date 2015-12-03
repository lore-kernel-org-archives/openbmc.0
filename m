Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 36FCE1A01DF
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 11:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449102027163736.6396956308189;
 Wed, 2 Dec 2015 16:20:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Alignment and double error
Date: Wed,  2 Dec 2015 19:20:25 -0500
Message-Id: <1449102026-16402-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 00:20:32 -0000

Fixed a pointer pointer issue where no one had the storage for a uint16_t
Fixed the double error log on palmetto systems needed a reconfig loop

https://github.com/openbmc/phosphor-host-ipmid/pull/47

Chris Austen (1):
  Alignment and double error

 ipmid.C         | 19 ++++++++++---------
 sensorhandler.C | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 sensorhandler.h |  1 +
 storageaddsel.C | 30 ++++++------------------------
 4 files changed, 65 insertions(+), 33 deletions(-)

-- 
2.6.3
