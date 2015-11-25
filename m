Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6516C1A0340
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 16:40:22 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448430019812240.5046417004611;
 Tue, 24 Nov 2015 21:40:19 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] Updating base build with sprint 3 candidate 3
Date: Wed, 25 Nov 2015 00:40:17 -0500
Message-Id: <1448430019-6573-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 05:40:23 -0000

https://github.com/openbmc/openbmc/pull/102

Chris Austen (2):
  Updating base build with sprint 3 candidate 3
  Updates for Skeleton

 .../common/recipes-phosphor/dbus/obmc-rest.bb          |  2 +-
 .../common/recipes-phosphor/host-ipmid/btbridged.bb    |  4 ++--
 .../host-ipmid/btbridged/makefile.patch                | 18 ------------------
 .../recipes-phosphor/host-ipmid/host-ipmid-fru.bb      | 11 +++++++----
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb   |  2 +-
 .../obmc-phosphor-event/obmc-phosphor-event.bb         |  2 +-
 .../common/recipes-phosphor/skeleton/skeleton.bb       |  2 +-
 7 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

-- 
2.6.3
