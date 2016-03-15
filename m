Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPqq80nTRzDq6V
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 10:01:07 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458082864231334.8509563578249;
 Tue, 15 Mar 2016 16:01:04 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2 2/5] net: aspeednic: Do not start hardware in
 initialize
Date: Tue, 15 Mar 2016 18:00:58 -0500
Message-Id: <1458082861-23542-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458082861-23542-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 23:01:08 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Delete the call to aspeenic_init from the aspeenic_initialize
function.  Instead rely on the framework to call the write_hwaddr
method to set the MAC address for the operating system to use.

The aspeednic driver was calling init before registering the
hardware, causing the dma engine to be left running writing
incoming ethernet packets to memory when handing control to the
operating system.

The initialize function is specifically documented to not touch
the hardware or probe in doc/README.drivers.net.

Also, the init method can take a significant amount of time
especially when NC-SI and retries are involved.  In addition
extra work is being performed to find the MAC address which the
framework will do again later.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/net/aspeednic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index b8ce24c..90c0f0d 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -574,8 +574,6 @@ int aspeednic_initialize(bd_t *bis)
     udelay(10 * 1000);
   }
 
-  dev->init(dev, bis);
-
   eth_register(dev);
 
 #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
-- 
2.7.1
