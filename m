Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 080811A0341
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2016 05:40:56 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145772164883337.34826698130678;
 Fri, 11 Mar 2016 10:40:48 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 "Milton D . Miller II" <miltonm@us.ibm.com>
Subject: [PATCH u-boot 4/5] net: Implement random ethaddr fallback in eth.c
Date: Fri, 11 Mar 2016 12:40:43 -0600
Message-Id: <1457721644-29871-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 11 Mar 2016 18:40:57 -0000

From: Joe Hershberger <joe.hershberger@ni.com>

Commit bef1014b31c5b33052bcaa865ba3618d73e906f0 upstream.

Backport changes CONFIG_NET_RANDOM_ETHADDR to CONFIG_RANDOM_MACADDR,
net_random_ethaddr to eth_random_enetaddr, and is_zero_ethaddr to
is_zero_ether_addr, and keeps existing function order.

Upstream log:

Implement the random ethaddr fallback in eth.c so it is in a common
place and not reimplemented in each board or driver that wants this
behavior.

Signed-off-by: Joe Hershberger <joe.hershberger@ni.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

Signed-off-by: Milton D. Miller II <miltonm@us.ibm.com>
---
 README              |  3 ++-
 doc/README.enetaddr |  2 ++
 net/eth.c           | 13 ++++++++++++-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/README b/README
index bcfffc3..e06dc8a 100644
--- a/README
+++ b/README
@@ -4764,7 +4764,8 @@ o If both the SROM and the environment contain a MAC address, and the
   warning is printed.
 
 o If neither SROM nor the environment contain a MAC address, an error
-  is raised.
+  is raised. If CONFIG_NET_RANDOM_ETHADDR is defined, then in this case
+  a random, locally-assigned MAC is used.
 
 If Ethernet drivers implement the 'write_hwaddr' function, valid MAC addresses
 will be programmed into hardware as part of the initialization process.	 This
diff --git a/doc/README.enetaddr b/doc/README.enetaddr
index 1eaeaf9..611d5a4 100644
--- a/doc/README.enetaddr
+++ b/doc/README.enetaddr
@@ -37,6 +37,8 @@ Correct flow of setting up the MAC address (summarized):
    environment variable will be used unchanged.
    If the environment variable is not set, it will be initialized from
    eth_device->enetaddr, and a warning will be printed.
+   If both are invalid and CONFIG_NET_RANDOM_ETHADDR is defined, a random,
+   locally-assigned MAC is written to eth_device->enetaddr.
 4. Program the address into hardware if the following conditions are met:
 	a) The relevant driver has a 'write_addr' function
 	b) The user hasn't set an 'ethmacskip' environment variable
diff --git a/net/eth.c b/net/eth.c
index 321d5b1..22d5adb 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -109,6 +109,7 @@ static int __def_eth_init(bd_t *bis)
 {
 	return -1;
 }
+
 int cpu_eth_init(bd_t *bis) __attribute__((weak, alias("__def_eth_init")));
 int board_eth_init(bd_t *bis) __attribute__((weak, alias("__def_eth_init")));
 
@@ -214,7 +215,17 @@ int eth_write_hwaddr(struct eth_device *dev, const char *base_name,
 		eth_setenv_enetaddr_by_index(base_name, eth_number,
 					     dev->enetaddr);
 		printf("\nWarning: %s using MAC address from net device\n",
-			dev->name);
+		       dev->name);
+	} else if (is_zero_ether_addr(dev->enetaddr)) {
+#ifdef CONFIG_RANDOM_MACADDR
+		eth_random_enetaddr(dev->enetaddr);
+		printf("\nWarning: %s (eth%d) using random MAC address - %pM\n",
+		       dev->name, eth_number, dev->enetaddr);
+#else
+		printf("\nError: %s address not set.\n",
+		       dev->name);
+		return -EINVAL;
+#endif
 	}
 
 	if (dev->write_hwaddr &&
-- 
2.7.1
