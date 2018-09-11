Return-Path: <3JEiYWwcKB_cudmstqdfnnfkd.bnlnodmalbkhrsr.nykZar.nqf@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3jeiywwckb_cudmstqdfnnfkd.bnlnodmalbkhrsr.nykzar.nqf@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Gz6GJY+p"; 
 dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4290f16KnlzDq5k
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 08:56:38 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id v1-v6so13085252ybk.22
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 15:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=nIVzj8vLIevKw27+IX4HLod5KBJg4dlwXT/e9v6B4v4=;
 b=Gz6GJY+pNQlMhygLj4LnsG2nqUCs2kUNOpAxKKbhBEKmZo0v6ycmmaXeYGiaGVp5yY
 rBk1fKIAIv8gB3Q8MLi0BpBNt27xX1iQNFjfHm2/iq8NOhR/ICAdqWaRykbefJXzGOKf
 SVOWiu7wm+k1oAc57JdkIT//bKfLrT8RZ2AbehNMQK0SpX3Qk27I+vlf10p1nIp2toAm
 +0k9xvdqeEagHTVDzlhklTJEtkKSbkY3J0JUV4wZwV2Ho8dSMeOiMl4JHl9pjvzMaRco
 ylUwZ6U5BRuwxXc9L/N/VyDBGJkhPYmrAriQg2jVGK8/ZS6I6A1S0CSE3tS8szJGE1OD
 TNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=nIVzj8vLIevKw27+IX4HLod5KBJg4dlwXT/e9v6B4v4=;
 b=lzw06j61TmggS352sKQ/NPZiY6X/cHzLdwMSNbm0qr3draFEsFBS9vsHzV/Ngz5csR
 bjzQpTP5SzKCL9cWfN+tEybgYcDbCSH6AwJC2edOtMh4+g7r580jQ13zOqAoUcv5u4SL
 5adeMt+TSIWYjx02q8uQ3wcxx1MAF+SqfoSbgPVjj5K9a8PxFBRHt9L24hFNBw88Z3xg
 z5xGl2EVeHle59RFMQJIZCx/k+YhkaiIQIYedFP7jySuP/bR4m3UJ3cplb7R1/ZqGaqI
 0FuKYMMJzONk/KR+qeoXtYlewxmd5lji7IEU9Tk+ojT/hRsWQfBZGOFGrQdQvNwYbDKY
 gGbw==
X-Gm-Message-State: APzg51AruGqCWyN+t5K7Q6lHzh/4SjgWsR03cn8kd4TUT+e97pRAVUo2
 Zanqkg3n1Rz1frU4oEdDeJ8f8d84azhC
X-Google-Smtp-Source: ANB0VdYAWgH1q/eSRvThpfjcTOPiJYNLWxlIuXxolbS5agN8VqFmVULipE8/9DPxopN6b3AxNSC0R+eeV8SB
X-Received: by 2002:a81:1789:: with SMTP id
 131-v6mr7921111ywx.218.1536706596194; 
 Tue, 11 Sep 2018 15:56:36 -0700 (PDT)
Date: Tue, 11 Sep 2018 15:56:30 -0700
Message-Id: <20180911225630.124502-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
Subject: [PATCH v2] ipmi: looped device detection
From: Patrick Venture <venture@google.com>
To: venture@google.com, minyard@acm.org, arnd@arndb.de, 
 gregkh@linuxfoundation.org
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 22:56:42 -0000

Try to get the device ID repeatedly during initialization before giving up.
The BMC isn't always responsive, and this allows it to be slightly flaky
during early boot.

Tested: Installed on a system with the BMC software disabled
such that it was non-responsive.  The driver correctly detected this
and gave up as expected.  Then I re-enabled the BMC software unloaded
and reloaded the driver and it was detected properly.

Signed-off-by: Patrick Venture <venture@google.com>
---
v2:
 - removed extra variable that was set but not used.
---
 drivers/char/ipmi/ipmi_si_intf.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 90ec010bffbd..5fed96897fe8 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -1918,11 +1918,13 @@ int ipmi_si_add_smi(struct si_sm_io *io)
  * held, primarily to keep smi_num consistent, we only one to do these
  * one at a time.
  */
+#define GET_DEVICE_ID_ATTEMPTS	5
 static int try_smi_init(struct smi_info *new_smi)
 {
 	int rv = 0;
 	int i;
 	char *init_name = NULL;
+	unsigned long sleep_rm;
 
 	pr_info(PFX "Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
 		ipmi_addr_src_to_str(new_smi->io.addr_source),
@@ -2003,7 +2005,26 @@ static int try_smi_init(struct smi_info *new_smi)
 	 * Attempt a get device id command.  If it fails, we probably
 	 * don't have a BMC here.
 	 */
-	rv = try_get_dev_id(new_smi);
+	for (i = 0; i < GET_DEVICE_ID_ATTEMPTS; i++) {
+		pr_info(PFX "Attempting to read BMC device ID\n");
+		rv = try_get_dev_id(new_smi);
+		/* If it succeeded, stop trying */
+		if (!rv)
+			break;
+
+		/* Sleep for ~0.25s before trying again instead of hammering
+		 * the BMC.
+		 */
+		sleep_rm = msleep_interruptible(250);
+		if (sleep_rm != 0) {
+			pr_info(PFX "Find BMC interrupted\n");
+			rv = -EINTR;
+			goto out_err;
+		}
+	}
+
+	/* If we exited the loop above and rv is non-zero we ran out of tries.
+	 */
 	if (rv) {
 		if (new_smi->io.addr_source)
 			dev_err(new_smi->io.dev,
-- 
2.19.0.rc2.392.g5ba43deb5a-goog
