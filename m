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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FknW1BXPzF1Dt;
 Wed, 27 Jun 2018 10:49:18 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5QNQ6qc022979;
 Tue, 26 Jun 2018 18:26:41 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 05/14] fsi: master-gpio: Add support for link_config
Date: Wed, 27 Jun 2018 09:25:56 +1000
Message-Id: <20180626232605.13420-6-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180626232605.13420-1-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Wed, 27 Jun 2018 00:49:19 -0000

To configure the send and echo delays

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 836587701ceb..48e0e65b2982 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -64,6 +64,8 @@ struct fsi_master_gpio {
 	bool			external_mode;
 	bool			no_delays;
 	uint32_t		last_addr;
+	uint8_t			t_send_delay;
+	uint8_t			t_echo_delay;
 };
 
 #define CREATE_TRACE_POINTS
@@ -338,7 +340,7 @@ static void build_epoll_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
 static void echo_delay(struct fsi_master_gpio *master)
 {
 	set_sda_output(master, 1);
-	clock_toggle(master, FSI_ECHO_DELAY_CLOCKS);
+	clock_toggle(master, master->t_echo_delay);
 }
 
 static void build_term_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
@@ -540,7 +542,7 @@ static int poll_for_response(struct fsi_master_gpio *master,
 	 * from receive of response back to send of data.
 	 */
 	local_irq_save(flags);
-	clock_zeros(master, FSI_SEND_DELAY_CLOCKS);
+	clock_zeros(master, master->t_send_delay);
 	local_irq_restore(flags);
 
 	return rc;
@@ -728,6 +730,22 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 	return rc;
 }
 
+static int fsi_master_gpio_link_config(struct fsi_master *_master, int link,
+				       u8 t_send_delay, u8 t_echo_delay)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	mutex_lock(&master->cmd_lock);
+	master->t_send_delay = t_send_delay;
+	master->t_echo_delay = t_echo_delay;
+	mutex_unlock(&master->cmd_lock);
+
+	return 0;
+}
+
 static ssize_t external_mode_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -832,6 +850,10 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	 */
 	master->no_delays = device_property_present(&pdev->dev, "no-gpio-delays");
 
+	/* Default FSI command delays */
+	master->t_send_delay = FSI_SEND_DELAY_CLOCKS;
+	master->t_echo_delay = FSI_ECHO_DELAY_CLOCKS;
+
 	master->master.n_links = 1;
 	master->master.flags = FSI_MASTER_FLAG_SWCLOCK;
 	master->master.read = fsi_master_gpio_read;
@@ -839,6 +861,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->master.term = fsi_master_gpio_term;
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
+	master->master.link_config = fsi_master_gpio_link_config;
 	platform_set_drvdata(pdev, master);
 	mutex_init(&master->cmd_lock);
 
-- 
2.17.1
