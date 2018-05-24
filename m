Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ryHk2RZTzF1F0
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 15:14:57 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4O5EU5i003638;
 Thu, 24 May 2018 00:14:31 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 01/10] fsi/gpio: Include command build in
 locked section
Date: Thu, 24 May 2018 15:14:20 +1000
Message-Id: <20180524051429.4638-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Thu, 24 May 2018 05:14:59 -0000

From: Jeremy Kerr <jk@ozlabs.org>

For implementing relative addressing mode, we'll need to build a command
that is coherent with CFAM state. To do that, include the
build_command_* functions in the locked section of read/write/term.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index e1bde9e3f855..d50ea4849377 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -463,14 +463,10 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
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
 
@@ -479,12 +475,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
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
@@ -492,12 +493,17 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
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
@@ -505,12 +511,17 @@ static int fsi_master_gpio_term(struct fsi_master *_master,
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
2.17.0
