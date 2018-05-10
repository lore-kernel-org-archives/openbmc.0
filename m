Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hSSF3lpvzF2TM
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 19:22:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="HDa+X848"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 40hSSF2c5lz9s47; Thu, 10 May 2018 19:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1525944173; bh=jMUFNb+G3FXGEn2ApBmdsPMD7Tig0X9yYMteCtxAGPA=;
 h=From:To:Cc:Subject:Date:From;
 b=HDa+X848ppKrAZbKXkcSz8mUw17t+9V8YHSVSazXA4NUiyOoFsyP4VLjudzfuO19M
 w9IJFejis0RWNeG20yXkryMYavvTr3j0EMhWXU0pbLsoylCzeaIdKhQCv1DH1n7L2H
 339AS29u8rNJ9AVNF0s7uISgdcVSG1lP9/NXKQaVvqBcsbTVX+wg6gtQMY0O3yK2q1
 ZHIMD0rLVYhylEz0IHbEdPs29J48yUePR3i36+atCVyD6VTcBvwSF+FR942TGopzCG
 Gfg5VUMo5icBfiGYHxaknzS6fRA4hDQhf7tUftNIEgpJgIRitL1g7xstWGnkYE7q77
 uwnSWje1GRjRA==
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.13 1/2] fsi/gpio: Include command build in
 locked section
Date: Thu, 10 May 2018 17:22:04 +0800
Message-Id: <20180510092205.32245-1-jk@ozlabs.org>
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
X-List-Received-Date: Thu, 10 May 2018 09:22:53 -0000

For implementing relative addressing mode, we'll need to build a command
that is coherent with CFAM state. To do that, include the
build_command_* functions in the locked section of read/write/term.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-master-gpio.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 029b0a5b6d89..1723fe4284b0 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -457,14 +457,10 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
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
 
@@ -473,12 +469,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
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
@@ -486,12 +487,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
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
@@ -499,12 +505,17 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
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
