Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwQB40hQYzDq62
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 15:19:40 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3qwQB36f3fz9t3l; Thu, 28 Apr 2016 15:19:39 +1000 (AEST)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] server: Allow handlers to fail init
Date: Thu, 28 Apr 2016 13:19:28 +0800
Message-Id: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
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

If a handler fails its init, we don't want to invoke its callbacks.

This change adds a flag to struct handlers, to indicate whether a
handler is active (ie, init() has returned success). Only active
handlers are used.

We also change the handler list output to indicate which are active.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 console-server.c | 17 ++++++++++++-----
 console-server.h |  2 ++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/console-server.c b/console-server.c
index f8feb52..45dd07a 100644
--- a/console-server.c
+++ b/console-server.c
@@ -257,7 +257,7 @@ static void handlers_init(struct console *console, struct config *config)
 {
 	extern struct handler *__start_handlers, *__stop_handlers;
 	struct handler *handler;
-	int i;
+	int i, rc;
 
 	console->n_handlers = &__stop_handlers - &__start_handlers;
 	console->handlers = &__start_handlers;
@@ -268,10 +268,14 @@ static void handlers_init(struct console *console, struct config *config)
 	for (i = 0; i < console->n_handlers; i++) {
 		handler = console->handlers[i];
 
-		printf("  %s\n", handler->name);
-
+		rc = 0;
 		if (handler->init)
-			handler->init(handler, console, config);
+			rc = handler->init(handler, console, config);
+
+		handler->active = rc == 0;
+
+		printf("  %s [%sactive]\n", handler->name,
+				handler->active ? "" : "in");
 	}
 }
 
@@ -282,7 +286,7 @@ static void handlers_fini(struct console *console)
 
 	for (i = 0; i < console->n_handlers; i++) {
 		handler = console->handlers[i];
-		if (handler->fini)
+		if (handler->fini && handler->active)
 			handler->fini(handler);
 	}
 }
@@ -297,6 +301,9 @@ static int handlers_data_in(struct console *console, uint8_t *buf, size_t len)
 	for (i = 0; i < console->n_handlers; i++) {
 		handler = console->handlers[i];
 
+		if (!handler->active)
+			continue;
+
 		if (!handler->data_in)
 			continue;
 
diff --git a/console-server.h b/console-server.h
index 1a9e813..2658e89 100644
--- a/console-server.h
+++ b/console-server.h
@@ -16,6 +16,7 @@
 
 #include <poll.h>
 #include <stdint.h>
+#include <stdbool.h>
 
 struct console;
 struct config;
@@ -34,6 +35,7 @@ struct handler {
 	int		(*data_in)(struct handler *handler,
 				uint8_t *buf, size_t len);
 	void		(*fini)(struct handler *handler);
+	bool		active;
 };
 
 #define __handler_name(n) __handler_  ## n
-- 
2.5.0
