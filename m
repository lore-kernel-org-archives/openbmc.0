Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 661541A027B
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:37:33 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446654750403284.54752408542174;
 Wed, 4 Nov 2015 08:32:30 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] linux-ombc: Fixes for i2c bus & device drivers
Date: Wed,  4 Nov 2015 10:32:20 -0600
Message-Id: <1446654741-4367-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Wed, 04 Nov 2015 16:37:34 -0000

We have an update for the kernel, containing fixes for the i2c subsystem.
This includes a defconfig update.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

https://github.com/openbmc/openbmc/pull/67

Jeremy Kerr (1):
  linux-ombc: Fixes for i2c bus & device drivers

 .../meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig           | 5 ++---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb          | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.6.0
