Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ADCB91A0EE1
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:03:36 +1100 (AEDT)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Tue, 8 Dec 2015 10:03:35 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 8 Dec 2015 10:03:33 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 2B84B2CE8050
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:03:33 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB803HKB28180636
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:25 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB8030ZY004610
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:00 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB8030U2004037
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:00 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A2598A015A
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:02:36 +1100 (AEDT)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] WIP: Fix unreliable networking
Date: Tue,  8 Dec 2015 11:02:12 +1100
Message-Id: <1449532932-5350-3-git-send-email-cyril.bur@au1.ibm.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449532932-5350-1-git-send-email-cyril.bur@au1.ibm.com>
References: <1449532932-5350-1-git-send-email-cyril.bur@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120800-0021-0000-0000-0000024A5386
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
X-List-Received-Date: Tue, 08 Dec 2015 00:03:36 -0000

This is not the final version of this patch as the fix only serves to raise
the "how did this ever work" question which I have yet to answer.

The reason this DOES work is that the hardware must be told to move data
from its RX FIFO to system memory where the driver can then consume it.
There are two mechanisms for this, a 'do this automatically' register which
can be set on device init or simply a 'copy data now' polling style which
is what this patch does.

Both options were investigated and as the entire network stack of u-boot is
polling and we're only polling when we expect to receive a message it make
sense to continue this down to the hardware level as well, doing the
automatic copy actually causes more noise and unnecessary work.

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 drivers/net/aspeednic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index 0bfc8c1..dca4ecc 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -1301,6 +1301,7 @@ static int aspeednic_recv(struct eth_device* dev)
 
   for ( ; ; )
   {
+    OUTL(dev, POLL_DEMAND, RXPD_REG);
     status = (s32)le32_to_cpu(rx_ring[rx_new].status);
 
     if ((status & RXPKT_STATUS) == 0) {
-- 
2.6.3
