Return-Path: <prvs=3826bf20df=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3826bf20df=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Zpgyrd5k"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YPXV3swXzDrBy
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 14:47:33 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9F3jIde009390
 for <openbmc@lists.ozlabs.org>; Sun, 14 Oct 2018 20:47:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=4n9tiRJB1a2YXtSjQgdmZlHHsDjBK44D818HD3IulKA=;
 b=Zpgyrd5k7ExQuD1MSIhGiXNFKeIen4ecp9CHetx9YR3oGRP2l1ai9OYngZYehP3l82x+
 a+jseBfflyK124O6eeZTOlROVVFxDyJzFy6lQ5nmyOcYwq08/DwLykmnLJfLUVQ3vNGz
 o+jSmujM6XAMo1PSvyMIImLKMPNQE1xhJA4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n4hpjan62-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 14 Oct 2018 20:47:31 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3;
 Sun, 14 Oct 2018 20:47:17 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id C6BE96A173DD; Sun, 14 Oct 2018 20:47:11 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <openbmc@lists.ozlabs.org>
CC: Tao Ren <taoren@fb.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH linux dev-4.18] clocksource/drivers/fttmr010: Fix
 set_next_event handler
Date: Sun, 14 Oct 2018 20:47:10 -0700
Message-ID: <20181015034710.3090400-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-15_03:, , signatures=0
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
X-List-Received-Date: Mon, 15 Oct 2018 03:47:39 -0000

Currently, the aspeed MATCH1 register is updated to <current_count -
cycles> in set_next_event handler, with the assumption that COUNT
register value is preserved when the timer is disabled and it continues
decrementing after the timer is enabled. But the assumption is wrong:
RELOAD register is loaded into COUNT register when the aspeed timer is
enabled, which means the next event may be delayed because timer
interrupt won't be generated until <0xFFFFFFFF - current_count +
cycles>.

The problem can be fixed by updating RELOAD register to <cycles>, and
COUNT register will be re-loaded when the timer is enabled and interrupt
is generated when COUNT register overflows.

The test result on Facebook Backpack-CMM BMC hardware (AST2500) shows
the issue is fixed: without the patch, usleep(100) suspends the process
for several milliseconds (and sometimes even over 40 milliseconds);
after applying the fix, usleep(100) takes averagely 240 microseconds to
return under the same workload level.

Signed-off-by: Tao Ren <taoren@fb.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-fttmr010.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index c020038ebfab..cf93f6419b51 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -130,13 +130,17 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
 	cr &= ~fttmr010->t1_enable_val;
 	writel(cr, fttmr010->base + TIMER_CR);
 
-	/* Setup the match register forward/backward in time */
-	cr = readl(fttmr010->base + TIMER1_COUNT);
-	if (fttmr010->count_down)
-		cr -= cycles;
-	else
-		cr += cycles;
-	writel(cr, fttmr010->base + TIMER1_MATCH1);
+	if (fttmr010->count_down) {
+		/*
+		 * ASPEED Timer Controller will load TIMER1_LOAD register
+		 * into TIMER1_COUNT register when the timer is re-enabled.
+		 */
+		writel(cycles, fttmr010->base + TIMER1_LOAD);
+	} else {
+		/* Setup the match register forward in time */
+		cr = readl(fttmr010->base + TIMER1_COUNT);
+		writel(cr + cycles, fttmr010->base + TIMER1_MATCH1);
+	}
 
 	/* Start */
 	cr = readl(fttmr010->base + TIMER_CR);
-- 
2.17.1
