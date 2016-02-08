Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 330511A001D
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 09:00:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454968826018345.6675651196464;
 Mon, 8 Feb 2016 14:00:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] linux: turn on vuart driver
Date: Mon,  8 Feb 2016 16:00:24 -0600
Message-Id: <1454968825-7310-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 22:00:33 -0000

Enable the vuart driver in the defconfig.

Based on the update to aspeed_defconfig in the linux repository.

Won't actually be enabled until the base recipe has the driver
merged again.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>

https://github.com/openbmc/openbmc/pull/167

Milton D. Miller II (1):
  linux: turn on vuart driver

 .../meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.6.4
