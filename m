Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ACF881A0E80
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:03:36 +1100 (AEDT)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Tue, 8 Dec 2015 10:03:34 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 8 Dec 2015 10:03:32 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 8EBF23578047
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:03:32 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB803GFv9568448
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:24 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB803060004591
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:00 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB80302R004007
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:00 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE019A0147
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:02:35 +1100 (AEDT)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] Fix: RX buffer size
Date: Tue,  8 Dec 2015 11:02:11 +1100
Message-Id: <1449532932-5350-2-git-send-email-cyril.bur@au1.ibm.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449532932-5350-1-git-send-email-cyril.bur@au1.ibm.com>
References: <1449532932-5350-1-git-send-email-cyril.bur@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120800-0021-0000-0000-0000024A5384
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

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 drivers/net/aspeednic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
index d75ef67..0bfc8c1 100644
--- a/drivers/net/aspeednic.c
+++ b/drivers/net/aspeednic.c
@@ -227,7 +227,7 @@ static u8 g_phy_addr = 0;
 
 #define NUM_RX_DESC PKTBUFSRX
 #define NUM_TX_DESC 1     /* Number of TX descriptors   */
-#define RX_BUFF_SZ  PKTSIZE_ALIGN
+#define RX_BUFF_SZ  1600 /* Hardware defaults to this */
 #define TX_BUFF_SZ  1514
 
 #define TOUT_LOOP   1000000
-- 
2.6.3
