Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DD2091A0F1E
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:39:30 +1100 (AEDT)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Tue, 8 Dec 2015 15:39:29 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 8 Dec 2015 15:39:26 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 1F4502CE8054
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:39:26 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB85d0Rw36962346
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:39:08 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB85crkD004564
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:38:53 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB85crki003531
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:38:53 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7D669A015A
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:38:29 +1100 (AEDT)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] drivers/net/aspeednic: Fix unreliable networking
Date: Tue,  8 Dec 2015 16:38:05 +1100
Message-Id: <1449553085-14727-3-git-send-email-cyril.bur@au1.ibm.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449553085-14727-1-git-send-email-cyril.bur@au1.ibm.com>
References: <1449553085-14727-1-git-send-email-cyril.bur@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120805-0017-0000-0000-0000025B8C5F
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
X-List-Received-Date: Tue, 08 Dec 2015 05:39:31 -0000

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
index e7b0b95..9dae927 100644
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
