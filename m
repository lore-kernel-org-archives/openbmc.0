Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6F7FD1A0341
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2016 05:40:59 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457721649799524.2308766209769;
 Fri, 11 Mar 2016 10:40:49 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 5/5] net: aspeednic: Do not fill in a random MAC address
Date: Fri, 11 Mar 2016 12:40:44 -0600
Message-Id: <1457721644-29871-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 11 Mar 2016 18:41:00 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Do not check the u-boot environemnt or fill in a random address
in the write_hwaddr hook, instead rely on the framework to do so.

The doc/README.ethaddr specifically states that random addresses
are only to be assigned as part of a emergency such as a netboot
recovery command.

The upstream commit created a config variable to assign a
random mac when none is set leaving it zero and that has now
been backported.

Note: The hardware address is reset to 0 as part of the ethernet
reset performed at boot.  If no valid MAC address is found in
the environment the hardware will contain zeros and the operating
system will assign a valid random MAC address if u-boot is
configured not to.

The net effect is an attempt to use the network will result in
the ethernet address not set warning being printed if the ethaddr
variable is not set, and a warning iwth the random mac address
if the config is set.  If a valid ethernet address is set
in the environment it will be programmed in the hardware and
used by the operating system.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/net/aspeednic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index 841df8b..e80561f 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -1363,10 +1363,6 @@ static void aspeednic_halt(struct eth_device* dev)
 
 static int aspeednic_write_hwaddr(struct eth_device* dev)
 {
-  if (!eth_getenv_enetaddr_by_index("eth", 0, dev->enetaddr)) {
-    eth_random_enetaddr(dev->enetaddr);
-  }
-
   OUTL(dev, ((dev->enetaddr[2] << 24) | (dev->enetaddr[3] << 16)
              | (dev->enetaddr[4] << 8) | dev->enetaddr[5]), MAC_LADR_REG);
   OUTL(dev, ((dev->enetaddr[0] << 8) | dev->enetaddr[1]), MAC_MADR_REG);
-- 
2.7.1
