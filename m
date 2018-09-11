Return-Path: <3K0eYWwcKB_wzirxyviksskpi.gsqstirfqgpmwxw.s3pefw.svk@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::94a; helo=mail-ua1-x94a.google.com;
 envelope-from=3k0eywwckb_wzirxyviksskpi.gsqstirfqgpmwxw.s3pefw.svk@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cN1V0eYY"; 
 dkim-atps=neutral
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com
 [IPv6:2607:f8b0:4864:20::94a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4290YJ0qxzzF37V
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 08:52:29 +1000 (AEST)
Received: by mail-ua1-x94a.google.com with SMTP id n10-v6so13221346uao.1
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=YJslXAA/H40j+y4TzxG2dqtkoyTP5i1f1/4M+fKfncw=;
 b=cN1V0eYYRLGRojFtOhsu6T2PJJYIPr5S34Qn9PvJZlA4CThYGqpRVc7xNvRiziBDK/
 O8j2OzIpcw+OV9KebBkdehYR+dGtCEe6KSNF0ZinfI81TfwVHuh55+rzVinJpaUsQteJ
 /O3L7jOrN4XGdHmKYh3eCs/thBk650tHMihGvY6gho830UXJSBGCCIdYz3qaW45J29fw
 Y3NTiB7qNIxbLcbjL8Squ8pfgV+GvMejo/46CjQlwzuQlhq7mjdB/vAayP79EsfkRcg5
 RUem9ZBWOUkLTiAp7awLSH5QZGIikecHI7wKdPcobqze4PVKjPlPp0LfOM7fnMR43wzy
 jyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=YJslXAA/H40j+y4TzxG2dqtkoyTP5i1f1/4M+fKfncw=;
 b=tRXx2eXC7hOODbLkO97sSbG7ra0dqTEUNjU+NusfOh78d8NFCsvkpZ7RhKX7+e/2Qz
 dqaXztlwReV9Z4QNF3a+wP78w4I4RIu8RSrndxwoZBblyD20feZeWOtUO6HDG7r+kNkN
 3B2B/B3SOodIJhzNnciO95hsNPgouVgr7aGxYcSWFjb4wxH/T47ehdyo77HYnlsVnsex
 wPQDFTsFWn3CNHVMfoLh+v03F2hyewKQngCGNhy+HkqKMYxNyonbTi1sQHrorAkB8yYq
 +ZJVfHrYnN1gnRZ2iP5Fzvufobz86zpzmtseD/SIYyhhHEDNej6ofoy1g45d3FH3wJL+
 dJ6Q==
X-Gm-Message-State: APzg51AJEXtom28Ixbuf7dYEqGeWPChCYtqaiKpCNfmdg0Zyxb3xe9jd
 dK/zum/mME9aiDoOCRpeyHnahXX2pa7s
X-Google-Smtp-Source: ANB0VdbCyZ0R89u4exCWakmhc86IvP81sWfWYPlvMkifKRkXX+ZEAa8mObcV7tT7s4Sf6TH7UlAlXrnLrYW/
X-Received: by 2002:ab0:4fde:: with SMTP id
 t30-v6mr5378903uah.35.1536706347117; 
 Tue, 11 Sep 2018 15:52:27 -0700 (PDT)
Date: Tue, 11 Sep 2018 15:52:21 -0700
Message-Id: <20180911225221.54513-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
Subject: [PATCH] ipmi: looped device detection
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
X-List-Received-Date: Tue, 11 Sep 2018 22:52:37 -0000

Try to get the device ID repeatedly during initialization before giving up.
The BMC isn't always responsive, and this allows it to be slightly flaky
during early boot.

Tested: Installed on a system with the BMC software disabled
such that it was non-responsive.  The driver correctly detected this
and gave up as expected.  Then I re-enabled the BMC software unloaded
and reloaded the driver and it was detected properly.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/char/ipmi/ipmi_si_intf.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 90ec010bffbd..a1ca34af7698 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -1918,11 +1918,14 @@ int ipmi_si_add_smi(struct si_sm_io *io)
  * held, primarily to keep smi_num consistent, we only one to do these
  * one at a time.
  */
+#define GET_DEVICE_ID_ATTEMPTS	5
 static int try_smi_init(struct smi_info *new_smi)
 {
 	int rv = 0;
 	int i;
 	char *init_name = NULL;
+	bool platform_device_registered = false;
+	unsigned long sleep_rm;
 
 	pr_info(PFX "Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
 		ipmi_addr_src_to_str(new_smi->io.addr_source),
@@ -2003,7 +2006,26 @@ static int try_smi_init(struct smi_info *new_smi)
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
