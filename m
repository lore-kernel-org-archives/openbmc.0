Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1CB3C1A06A7
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 03:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448295020697982.6325322309536;
 Mon, 23 Nov 2015 08:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/3] switch back to in-tree device trees
Date: Mon, 23 Nov 2015 11:10:17 -0500
Message-Id: <1448295020-21218-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 16:10:25 -0000

https://github.com/openbmc/openbmc/pull/89

Brad Bishop (3):
  Switch back to using in-tree Palmetto device tree
  Switch back to using in-tree Barreleye device tree
  Update kernel version

 .../meta-palmetto/conf/machine/palmetto.conf       |   2 +-
 .../recipes-kernel/linux/linux-obmc/palmetto.dts   | 326 +--------------------
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +-
 .../meta-barreleye/conf/machine/barreleye.conf     |   2 +-
 .../recipes-kernel/linux/linux-obmc/barreleye.dts  | 326 +--------------------
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   1 -
 .../common/recipes-kernel/linux/linux-obmc_4.2.bb  |  30 --
 .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |  30 ++
 8 files changed, 35 insertions(+), 684 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb

-- 
2.6.3
