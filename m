Return-Path: <bsingharora@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=bsingharora@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PG3772UN"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybC7j1NdrzDq78
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 01:04:48 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id 4so3833132pge.1
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=L7GB5vfQrORId1avs6m+WFRsw3jcWY76SKYO0XQltzE=;
 b=PG3772UNqfU3My1+1Ndd+nhiFoEdvv4maZu8ROyzEA3uMuwcnCgcMXBqKSz7fKpH6V
 blXDv8yhMdSOgArRCskjdAPwR0/tD5nFqxN8dPsl/GlAkK6S9N0Un9DeKxwsWNFIl110
 wi+oSlyN/wdQlsVIeWoUAtr+jkm7F07I/d6Bsg0nBHot9/Tt+K8El5gzjSpb+9eVIyVs
 mWhAazJqdncMEnNWWU2Q8nvhvvRg5u8TOaXhzp98T4M7hyD0zyQwlQJHp4e+FjA9jOti
 ArCzX5Bu34T+lu5OTSMZOOg0OAcIcWKBS/5x8I9g+gyN9sxBk3vnTVD6Aemz+iGkV69w
 Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L7GB5vfQrORId1avs6m+WFRsw3jcWY76SKYO0XQltzE=;
 b=oUYAKi0wnlMII0JUOKzqKSwxVnrLjAwINQexkED1LvYApwuSgwSRi71A/jWxqH1xSl
 h5UpK23lSEYEGuzhQkgzS6xa3xwshC3ga2Hl9QqJBksDRquxwx6tIEXhmvsDfKhzeAHY
 LDuAXVaoWj962z1tnEbHRtqDZ2y/j+tOQhXDCiCiOg2iUOqNQ7Or6wWfRszm1qznCgOA
 1oxyczHr83iJUm7kTwlu03NfjlhlJPg8opIC5EMFL1047tOK/puH78JQiB85amqg/0ve
 MAt9YOdIPC5TPmFq2NJiJUg5G77eWEDjR3Z5cedygAbho1AmzWXGWssMJKFenZjPQcny
 XSvQ==
X-Gm-Message-State: AJaThX7GkdGHJeHqvf77Use+b1gqFQOwUlWOTxModRHFsZMI6AVRlYUK
 AjpiRDSMmeyp9M5W9Uy9QvkKo+D500w=
X-Google-Smtp-Source: AGs4zMZQ4d/DtyuN675r9b8ftge1+uZzLv3nQ2keMoi3ToM8uPyNzBADN6KAhcn+IiaeDCiWXevC2w==
X-Received: by 10.98.224.7 with SMTP id f7mr3062961pfh.177.1510581886245;
 Mon, 13 Nov 2017 06:04:46 -0800 (PST)
Received: from localhost.au.ibm.com (14-202-194-140.static.tpgi.com.au.
 [14.202.194.140])
 by smtp.googlemail.com with ESMTPSA id x87sm35617571pfi.10.2017.11.13.06.04.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Nov 2017 06:04:45 -0800 (PST)
From: Balbir Singh <bsingharora@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: jk@ozlabs.org, andrew@aj.id.au, joel@jms.id.au, npiggin@gmail.com,
 Balbir Singh <bsingharora@gmail.com>
Subject: [PATCH] drivers/tty/serial/8250 : Add throttling capability to aspeed
 serial
Date: Tue, 14 Nov 2017 01:04:36 +1100
Message-Id: <20171113140436.6754-1-bsingharora@gmail.com>
X-Mailer: git-send-email 2.13.6
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 14:04:49 -0000

This patch implements a throttle mechanism to the vuart aspeed serial
driver. The logic is contained in the file itself and should probably
move to 8250_port.c, so that it provides the necessary API to disable
IER and move to a timer. Right now we have some built in constants
that decide how many interrupts are too many, what the time period
for the backup timer and interrupt check is.

The logic then uses a kernel thread to trigger disabling IER as needed
and move to the timer. When the code detects that the interrupt storm
has slowed down, it restores interrupts.

Without a throttle mechanism, the system itself can spend a whole lot
of time handling interrupts from the serial port and this can affect
responsiveness and usability of the openbmc system itself.

Signed-off-by: Balbir Singh <bsingharora@gmail.com>
---

 NOTES: There's probably an alternative way to solve this problem
 see https://github.com/jk-ozlabs/linux/commit/b1cec3eafb60c7e815932cd674cc082c1acaa01e
 I am posting this approach, in my tests I found that the throughput
 was higher (measured externally from the system). The tty throttle
 was a little more aggressive. In fact some of the IER enable/disable
 logic is common.

 Nick Piggin recommended that we poll until port->handle_irq returned 0.
 I'll probably do a follow up patch for that, doing that now requires
 a global variable to communicate the state of handle_irq between the
 thread and timer context. I can do that in timer_list's data member,
 but I'll follow up with changes

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 93 +++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 822be49..5a67887 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -15,6 +15,10 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/clk.h>
+#include <linux/kthread.h>
+#include <linux/kernel_stat.h>
+#include <linux/freezer.h>
+#include <linux/timer.h>
 
 #include "8250.h"
 
@@ -32,6 +36,9 @@ struct aspeed_vuart {
 	void __iomem		*regs;
 	struct clk		*clk;
 	int			line;
+	int			irq;
+	struct task_struct	*irq_storm_task;
+	struct timer_list	backup_timer;
 };
 
 /*
@@ -183,6 +190,87 @@ static void aspeed_vuart_shutdown(struct uart_port *uart_port)
 	serial8250_do_shutdown(uart_port);
 }
 
+/*
+ * Ideally this belongs to 8250_port.c, but our requirements
+ * might be specifically limited to our driver, not sure if
+ * pushing it to the layer above makes a lot of sense, but
+ * we do end up using routines that ideally should be avoided.
+ */
+static void aspeed_vuart_backup_timeout(unsigned long data)
+{
+	struct aspeed_vuart *vuart = (struct aspeed_vuart *)data;
+	struct uart_8250_port *up = serial8250_get_port(vuart->line);
+
+	up->port.handle_irq(&up->port);
+	mod_timer(&vuart->backup_timer, jiffies + HZ / 10);
+}
+
+static void aspeed_vuart_irqs_to_timeout(struct aspeed_vuart *vuart,
+					 bool disable_irqs)
+{
+	struct uart_8250_port *up = serial8250_get_port(vuart->line);
+	unsigned long flags;
+
+	if (!up)
+		return;
+
+	spin_lock_irqsave(&up->port.lock, flags);
+	if (!disable_irqs) {
+		/*
+		 * Unthrottle interrupts
+		 */
+		up->ier |= (UART_IER_RLSI | UART_IER_RDI);
+		serial_out(up, UART_IER, up->ier);
+		del_timer_sync(&vuart->backup_timer);
+	} else {
+		/*
+		 * Must disable interrupts and move to timer.
+		 */
+		up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
+		serial_out(up, UART_IER, up->ier);
+		init_timer(&vuart->backup_timer);
+		vuart->backup_timer.data = (unsigned long)vuart;
+		vuart->backup_timer.function = aspeed_vuart_backup_timeout;
+		mod_timer(&vuart->backup_timer, jiffies + HZ / 10);
+	}
+	spin_unlock_irqrestore(&up->port.lock, flags);
+}
+
+static int aspeed_vuart_irq_storm_thread(void *data)
+{
+	static unsigned long irq_count; /* ignore overflows for now */
+	static bool irq_registered = true;
+	unsigned long current_irq_count;
+	struct aspeed_vuart *vuart = (struct aspeed_vuart *)data;
+
+	/* This value needs to be tuned as needed */
+	const int max_irqs = 15000;
+
+	set_freezable();
+	do {
+		try_to_freeze();
+
+		current_irq_count = kstat_irqs(vuart->irq);
+
+		if ((current_irq_count - irq_count) > max_irqs) {
+			if (irq_registered) {
+				aspeed_vuart_irqs_to_timeout(vuart, true);
+				irq_registered = false;
+			}
+		} else if (!irq_registered) {
+			aspeed_vuart_irqs_to_timeout(vuart, false);
+			irq_registered = true;
+		}
+
+		irq_count = current_irq_count;
+		set_current_state(TASK_INTERRUPTIBLE);
+		schedule_timeout(15 * HZ);
+		__set_current_state(TASK_RUNNING);
+	} while (!kthread_should_stop());
+
+	return 0;
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port port;
@@ -276,11 +364,14 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 		goto err_clk_disable;
 
 	vuart->line = rc;
+	vuart->irq = port.port.irq;
 
 	aspeed_vuart_set_enabled(vuart, true);
 	aspeed_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
 
+	vuart->irq_storm_task = kthread_run(aspeed_vuart_irq_storm_thread,
+						vuart, "vuart_irq_storm");
 	return 0;
 
 err_clk_disable:
@@ -294,6 +385,8 @@ static int aspeed_vuart_remove(struct platform_device *pdev)
 	struct aspeed_vuart *vuart = platform_get_drvdata(pdev);
 
 	aspeed_vuart_set_enabled(vuart, false);
+	kthread_stop(vuart->irq_storm_task);
+	del_timer_sync(&vuart->backup_timer);
 	serial8250_unregister_port(vuart->line);
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
 	clk_disable_unprepare(vuart->clk);
-- 
2.7.4
