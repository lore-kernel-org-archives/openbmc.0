Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ACC201A0C93
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 11:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14527326263791015.7035347961613;
 Wed, 13 Jan 2016 16:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH linux] rtc: aspeed month is off-by-one
Date: Wed, 13 Jan 2016 18:50:24 -0600
Message-Id: <1452732624-17345-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452732624-17345-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452732624-17345-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 14 Jan 2016 00:50:31 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Norm reported hwclock set the date one hour different from what it
read back.

The mktime64 call takes the month as the 1-based counted month not
the 0-based months since January like struct rtc_tm and struct tm.
No adjustment from the harware is needed.  Also mask off a few 0 bits.

Reported-by: Norman James <nkskjames@gmail.com>
Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 drivers/rtc/rtc-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index cfb5ee0..1a5bbd1 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -48,8 +48,7 @@ static int aspeed_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	sec  = (reg1 >>  0) & 0x3f;
 	cent = (reg2 >> 16) & 0x1f;
 	year = (reg2 >>  8) & 0x7f;
-	/* struct rtc_time counts from 0 to 11, but hardware is 1 to 12 */
-	mon  = ((reg2 >>  0) & 0x3f) - 1;
+	mon  = (reg2 >>  0) & 0xf;	/* mktime64 and hardware use 1 = Jan */
 
 	rtc_time64_to_tm(mktime64(cent*100 + year, mon, day, hour, min, sec),
 			 tm);
-- 
2.6.4
