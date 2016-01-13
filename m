Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F16681A08A4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 08:00:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452718830982356.2342476400722;
 Wed, 13 Jan 2016 13:00:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Pickup Sprint4 changes for skeleton
Date: Wed, 13 Jan 2016 15:00:29 -0600
Message-Id: <1452718830-9450-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 13 Jan 2016 21:00:35 -0000

c0448f0729f2eea6cf1160d3d6a723e2983a443e  Reset the OS power state when the system
3939e2d5752030e383efd37aa70f28a005fae7a0  Support for W25Q256BV flash chip module
7b8811e8d2d638046a000770ab88d4dfe6dcaee9  Added BMC_THROTTLE gpio and hwmon thermal sensor

https://github.com/openbmc/openbmc/pull/133

Chris Austen (1):
  Pickup Sprint4 changes for skeleton

 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.6.4
