Return-Path: <prvs=3813733137=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3813733137=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="JyEmGbad"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PQlv31hqzF3D0
 for <openbmc@lists.ozlabs.org>; Tue,  2 Oct 2018 14:14:47 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w924DmO5020889
 for <openbmc@lists.ozlabs.org>; Mon, 1 Oct 2018 21:14:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=KhGFRYG2jaLmoijPykpnc7CLDvnfAyslQghCVfVZ/js=;
 b=JyEmGbadWkZQlcvIC+xwefP5OXoF8kBtSRswLvV5945H3mNqGz6v5Ye4Wfh8N9h+K1A8
 UYxkShodNxMEpLeM+tK5yRb5K0xFuugjkh/DrrJ1G1DPTUFavPVxYkq94POk0TW6keUw
 foY8R2/5F4yceU+bcU6q8tDBohElcMePAH0= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2muwd0gk3q-8
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Oct 2018 21:14:45 -0700
Received: from mx-out.facebook.com (192.168.52.123) by mail.thefacebook.com
 (192.168.16.24) with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 1 Oct
 2018 21:14:44 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)	id
 29B73648C915; Mon,  1 Oct 2018 21:14:40 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, Lei YU
 <mine260309@gmail.com>, <openbmc@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH] clocksource/drivers/fttmr010: fix invalid interrupt register
 access
Date: Mon, 1 Oct 2018 21:14:37 -0700
Message-ID: <20181002041437.2493192-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-02_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2018 04:14:52 -0000

TIMER_INTR_MASK register (Base Address of Timer + 0x38) is not designed
for masking interrupts on ast2500 chips, and it's not even listed in
ast2400 datasheet, so it's not safe to access TIMER_INTR_MASK on aspeed
chips.
Similarly, TIMER_INTR_STATE register (Base Address of Timer + 0x34) is
not interrupt status register on ast2400 and ast2500 chips. Although
there is no side effect to reset the register in fttmr010_common_init(),
it's just misleading to do so.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 drivers/clocksource/timer-fttmr010.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index c020038ebfab..daf063c9842e 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -171,16 +171,17 @@ static int fttmr010_timer_set_oneshot(struct clock_event_device *evt)
 
 	/* Setup counter start from 0 or ~0 */
 	writel(0, fttmr010->base + TIMER1_COUNT);
-	if (fttmr010->count_down)
+	if (fttmr010->count_down) {
 		writel(~0, fttmr010->base + TIMER1_LOAD);
-	else
+	} else {
 		writel(0, fttmr010->base + TIMER1_LOAD);
 
-	/* Enable interrupt */
-	cr = readl(fttmr010->base + TIMER_INTR_MASK);
-	cr &= ~(TIMER_1_INT_OVERFLOW | TIMER_1_INT_MATCH2);
-	cr |= TIMER_1_INT_MATCH1;
-	writel(cr, fttmr010->base + TIMER_INTR_MASK);
+		/* Enable interrupt */
+		cr = readl(fttmr010->base + TIMER_INTR_MASK);
+		cr &= ~(TIMER_1_INT_OVERFLOW | TIMER_1_INT_MATCH2);
+		cr |= TIMER_1_INT_MATCH1;
+		writel(cr, fttmr010->base + TIMER_INTR_MASK);
+	}
 
 	return 0;
 }
@@ -287,13 +288,13 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
 		fttmr010->count_down = true;
 	} else {
 		fttmr010->t1_enable_val = TIMER_1_CR_ENABLE | TIMER_1_CR_INT;
-	}
 
-	/*
-	 * Reset the interrupt mask and status
-	 */
-	writel(TIMER_INT_ALL_MASK, fttmr010->base + TIMER_INTR_MASK);
-	writel(0, fttmr010->base + TIMER_INTR_STATE);
+		/*
+		 * Reset the interrupt mask and status
+		 */
+		writel(TIMER_INT_ALL_MASK, fttmr010->base + TIMER_INTR_MASK);
+		writel(0, fttmr010->base + TIMER_INTR_STATE);
+	}
 
 	/*
 	 * Enable timer 1 count up, timer 2 count up, except on Aspeed,
-- 
2.17.1
