Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yqytQ58XtzDwNN
 for <openbmc@lists.ozlabs.org>; Mon,  4 Dec 2017 19:37:33 +1100 (AEDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2017 00:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,358,1508828400"; d="scan'208";a="10202115"
Received: from bmclab-s2600wtt.sh.intel.com ([10.239.182.71])
 by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2017 00:37:28 -0800
From: Yong Li <yong.b.li@linux.intel.com>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Cc: yong.b.li@linux.intel.com
Subject: [PATCH linux dev-4.10 0/1] pinctrl: aspeed: Allow disabling Port D
 and Port E loopback mode
Date: Mon,  4 Dec 2017 16:30:02 +0800
Message-Id: <1512376203-147224-1-git-send-email-yong.b.li@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Dec 2017 08:37:35 -0000

Backport pinctrl patch from kernel 4.12

This patch is used to control the pass-through functions for GPIOE/GPIOD

It is included in kernel V4.12:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c825676b0823fd43a4d08bf865f81bb188b51db1

Rick Altherr (1):
  pinctrl: aspeed: Allow disabling Port D and Port E loopback mode

 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.7.4
