Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hRxn6nWXzF2TM
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 18:59:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="sARmPrmi"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 40hRxn3mBGz9s3q; Thu, 10 May 2018 18:59:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1525942797; bh=XCzYMHvHAuyqmMKM+BJm7NCtfBwCjIdNl9c1AthUDSE=;
 h=From:To:Cc:Subject:Date:From;
 b=sARmPrmi4ZLB+j0cm68KXuNEnDy+9QzQrTlhPUsPPkSrkTNaWWcXEeVdp+u7XYPrh
 K8+KzkIBchepXXVAC0wkber6Fy7rblZB6lhqowUbv8V2wemK77Lb+vfi/GeuJiIj2F
 KhJNViL8kPbY2Bxv+yCFCxc1jnr9zNAPCgi5pDsF41/lbALEBScEQNuTowGFeddNJB
 d1f2U4kYNGMcuL+50nxlQss4UnEbfBcZuYLtko14kiE1jkj8FJRYJjPELXKB7ENkoU
 R0Yuop36PaMOl7TGZ7JspephyrxVEtWOD4rHmCrAmb/rj6Muc2swoS2gJTcCFxqG8H
 e9ZjXAbM/D4aw==
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 1/2] fsi/gpio: Include command build in locked
 section
Date: Thu, 10 May 2018 16:59:37 +0800
Message-Id: <20180510085938.27137-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 08:59:58 -0000

For implementing relative addressing mode, we'll need to build a command
that is coherent with CFAM state. To do that, include the
build_command_* functions in the locked section of read/write/term.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-master-gpio.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 4295a46780cb..d8895dffe754 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -450,14 +450,10 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
 {
 	int rc;
 
-	mutex_lock(&master->cmd_lock);
-
 	rc = send_request(master, cmd);
 	if (!rc)
 		rc = poll_for_response(master, slave, resp_len, resp);
 
-	mutex_unlock(&master->cmd_lock);
-
 	return rc;
 }
 
@@ -466,12 +462,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 	struct fsi_gpio_msg cmd;
+	int rc;
 
 	if (link != 0)
 		return -ENODEV;
 
+	mutex_lock(&master->cmd_lock);
 	build_abs_ar_command(&cmd, id, addr, size, NULL);
-	return fsi_master_gpio_xfer(master, id, &cmd, size, val);
+	rc = fsi_master_gpio_xfer(master, id, &cmd, size, val);
+	mutex_unlock(&master->cmd_lock);
+
+	return rc;
 }
 
 static int fsi_master_gpio_write(struct fsi_master *_master, int link,
@@ -479,12 +480,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 	struct fsi_gpio_msg cmd;
+	int rc;
 
 	if (link != 0)
 		return -ENODEV;
 
+	mutex_lock(&master->cmd_lock);
 	build_abs_ar_command(&cmd, id, addr, size, val);
-	return fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	mutex_unlock(&master->cmd_lock);
+
+	return rc;
 }
 
 static int fsi_master_gpio_term(struct fsi_master *_master,
@@ -492,12 +498,17 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 	struct fsi_gpio_msg cmd;
+	int rc;
 
 	if (link != 0)
 		return -ENODEV;
 
+	mutex_lock(&master->cmd_lock);
 	build_term_command(&cmd, id);
-	return fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	rc = fsi_master_gpio_xfer(master, id, &cmd, 0, NULL);
+	mutex_unlock(&master->cmd_lock);
+
+	return rc;
 }
 
 static int fsi_master_gpio_break(struct fsi_master *_master, int link)
-- 
2.14.1
