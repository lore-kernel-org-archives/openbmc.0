Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwQB429BtzDqB3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 15:19:40 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3qwQB405dGz9syq; Thu, 28 Apr 2016 15:19:39 +1000 (AEST)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] tty: Add handler for local tty mirroring
Date: Thu, 28 Apr 2016 13:19:29 +0800
Message-Id: <1461820769-10414-2-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
References: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 28 Apr 2016 05:19:40 -0000

This change adds a simple handler for mirroring data to local tty
device, like a hardware UART.

This is specified through a new config parameter 'local-tty'.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 Makefile.am              |   1 +
 obmc-console.conf.sample |   3 ++
 tty-handler.c            | 123 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 tty-handler.c

diff --git a/Makefile.am b/Makefile.am
index 5f0a1bb..2df24d8 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -34,6 +34,7 @@ obmc_console_server_SOURCES = \
 	 config.c \
 	 log-handler.c \
 	 socket-handler.c \
+	 tty-handler.c \
 	 console-socket.c
 
 obmc_console_client_SOURCES = \
diff --git a/obmc-console.conf.sample b/obmc-console.conf.sample
index a5b8808..d473af2 100644
--- a/obmc-console.conf.sample
+++ b/obmc-console.conf.sample
@@ -4,3 +4,6 @@ device = ttyUSB0
 # For VUART devices, we can specify the LPC address and SIRQ parameters
 lpc-address = 0x3f8
 sirq = 4
+
+# To mirror to a local tty device (typically a hardware UART), set local-tty
+# local-tty = ttyS0
diff --git a/tty-handler.c b/tty-handler.c
new file mode 100644
index 0000000..00ada7a
--- /dev/null
+++ b/tty-handler.c
@@ -0,0 +1,123 @@
+/**
+ * Copyright © 2016 IBM Corporation
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ *     http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ */
+
+#define _GNU_SOURCE
+
+#include <assert.h>
+#include <err.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "console-server.h"
+
+struct tty_handler {
+	struct handler	handler;
+	struct console	*console;
+	struct poller	*poller;
+	int		fd;
+};
+
+static struct tty_handler *to_tty_handler(struct handler *handler)
+{
+	return container_of(handler, struct tty_handler, handler);
+}
+
+static enum poller_ret tty_poll(struct handler *handler,
+		int events, void __attribute__((unused)) *data)
+{
+	struct tty_handler *th = to_tty_handler(handler);
+	uint8_t buf[4096];
+	ssize_t len;
+
+	if (!(events & POLLIN))
+		return POLLER_OK;
+
+	len = read(th->fd, buf, sizeof(buf));
+	if (len <= 0) {
+		th->poller = NULL;
+		close(th->fd);
+		return POLLER_REMOVE;
+	}
+
+	console_data_out(th->console, buf, len);
+
+	return POLLER_OK;
+}
+
+static int tty_init(struct handler *handler, struct console *console,
+		struct config *config __attribute__((unused)))
+{
+	struct tty_handler *th = to_tty_handler(handler);
+	const char *tty_name;
+	char *tty_path;
+	int rc, flags;
+
+	tty_name = config_get_value(config, "local-tty");
+	if (!tty_name)
+		return -1;
+
+	rc = asprintf(&tty_path, "/dev/%s", tty_name);
+	if (!rc)
+		return -1;
+
+	th->fd = open(tty_path, O_RDWR);
+	if (th->fd < 0) {
+		warn("Can't open %s; disabling local tty", tty_name);
+		free(tty_path);
+		return -1;
+	}
+
+	free(tty_path);
+
+	/* initial tty setup */
+	flags = fcntl(th->fd, F_GETFL, 0);
+	flags |= FNDELAY;
+	fcntl(th->fd, F_SETFL, flags);
+
+	th->poller = console_register_poller(console, handler, tty_poll,
+			th->fd, POLLIN, NULL);
+	th->console = console;
+
+	return 0;
+}
+
+static int tty_data(struct handler *handler, uint8_t *buf, size_t len)
+{
+	struct tty_handler *th = to_tty_handler(handler);
+	return write_buf_to_fd(th->fd, buf, len);
+}
+
+static void tty_fini(struct handler *handler)
+{
+	struct tty_handler *th = to_tty_handler(handler);
+	if (th->poller)
+		console_unregister_poller(th->console, th->poller);
+	close(th->fd);
+}
+
+static struct tty_handler tty_handler = {
+	.handler = {
+		.name		= "tty",
+		.init		= tty_init,
+		.data_in	= tty_data,
+		.fini		= tty_fini,
+	},
+};
+
+console_register_handler(&tty_handler.handler);
+
-- 
2.5.0
