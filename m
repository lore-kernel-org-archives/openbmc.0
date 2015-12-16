Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 392FC1A0CF4
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 10:20:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450308037019554.4528817303334;
 Wed, 16 Dec 2015 15:20:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH u-boot 2/2] drivers/net/aspeednic: Fix unreliable networking
Date: Wed, 16 Dec 2015 17:20:34 -0600
Message-Id: <1450308034-19042-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 16 Dec 2015 23:20:44 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Hardware must be told to move data from its RX FIFO to system memory where
the driver can then consume it.  There are two mechanisms for this, a 'do
this automatically' register which can be set on device init or simply a
'copy data now' polling style which is what this patch does.

Both options were investigated and as the entire network stack of u-boot is
polling and we're only polling when we expect to receive a message it make
sense to continue this down to the hardware level as well, doing the
automatic copy actually causes more noise and unnecessary work.

It should be noted that the NIC was largely functional before this patch.
It appears that the reason it was working was that the hardware would quite
happily DMA into the receive ring as long as there was was spare space.
During heavy loads or on busy networks the receiving ring can fill up which
causes the hardware to stop (and never resume) its DMA activities unless
explicitly told to.

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 drivers/net/aspeednic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index e7b0b95..d70c7ab 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -1334,6 +1334,12 @@ static int aspeednic_recv(struct eth_device* dev)
        * to the adapter.
        */
       rx_ring[rx_new].status &= cpu_to_le32(0x7FFFFFFF);
+
+      /*
+       * Ask the hardware for any other packets now that we have a known
+       * spare slot
+       */
+      OUTL(dev, POLL_DEMAND, RXPD_REG);
 //      rx_ring[rx_new].status = cpu_to_le32(RXPKT_RDY);
     }
 
@@ -1342,6 +1348,12 @@ static int aspeednic_recv(struct eth_device* dev)
     rx_new = (rx_new + 1) % rxRingSize;
   }
 
+  /*
+   * Ask the hardware for more packets so that they'll be DMAed by the time
+   * we return to this loop
+   */
+  OUTL(dev, POLL_DEMAND, RXPD_REG);
+
   return length;
 }
 
-- 
2.6.3
