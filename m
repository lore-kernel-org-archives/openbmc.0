Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BE1BF1A2A91
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:00:20 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448287217152765.1410109539868;
 Mon, 23 Nov 2015 06:00:17 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 9/9] travis: Add Travis CI support
Date: Mon, 23 Nov 2015 09:00:08 -0500
Message-Id: <1448287208-17607-10-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 14:00:21 -0000

From: Joel Stanley <joel@jms.id.au>

Currently builds for Ubuntu 15.10 amd64 with gcc 5 under docker.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .build.sh   | 23 +++++++++++++++++++++++
 .travis.yml |  9 +++++++++
 Makefile    |  2 +-
 btbridged.c | 51 ++++++++++++++++++++++++++-------------------------
 4 files changed, 59 insertions(+), 26 deletions(-)
 create mode 100755 .build.sh
 create mode 100644 .travis.yml

diff --git a/.build.sh b/.build.sh
new file mode 100755
index 0000000..79b0b5c
--- /dev/null
+++ b/.build.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+Dockerfile=$(cat << EOF
+FROM ubuntu:15.10
+RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
+RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
+RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+USER ${USER}
+ENV HOME ${HOME}
+RUN /bin/bash
+EOF
+)
+
+docker pull ubuntu:15.10
+docker build -t temp - <<< "${Dockerfile}"
+
+gcc --version
+
+mkdir -p linux
+wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include/uapi/linux/bt-host.h -O linux/bt-host.h
+
+docker run --cap-add=sys_admin --net=host --rm=true --user="${USER}" \
+ -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=$PWD
diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 0000000..faaa918
--- /dev/null
+++ b/.travis.yml
@@ -0,0 +1,9 @@
+sudo: required
+
+services:
+    - docker
+
+language: c
+
+script:
+    - ./.build.sh
diff --git a/Makefile b/Makefile
index 733511c..7ffbc01 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-CFLAGS	= $(shell pkg-config --cflags libsystemd) -Wall -O2
+CFLAGS	= $(shell pkg-config --cflags libsystemd) -Wall -O2 -g
 LDLIBS	= $(shell pkg-config --libs libsystemd)
 
 ifdef KERNEL_HEADERS
diff --git a/btbridged.c b/btbridged.c
index c57843d..115ae63 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -597,17 +597,17 @@ static const sd_bus_vtable ipmid_vtable[] = {
 };
 
 int main(int argc, char *argv[]) {
-	struct btbridged_context context;
+	struct btbridged_context *context;
 	const char *name = argv[0];
 	int opt, polled, r;
 
-	static struct option long_options[] = {
+	static const struct option long_options[] = {
 		{ "verbose", no_argument, &verbose, 1 },
 		{ "debug",   no_argument, &debug,   1 },
 		{ 0,         0,           0,        0 }
 	};
 
-	context.bt_q = NULL;
+	context = calloc(1, sizeof(*context));
 
 	while ((opt = getopt_long(argc, argv, "", long_options, NULL)) != -1) {
 		switch (opt) {
@@ -630,62 +630,62 @@ int main(int argc, char *argv[]) {
 	}
 
 	MSG_OUT("Starting\n");
-	r = sd_bus_default_system(&context.bus);
+	r = sd_bus_default_system(&context->bus);
 	if (r < 0) {
 		MSG_ERR("Failed to connect to system bus: %s\n", strerror(-r));
 		goto finish;
 	}
 
 	MSG_OUT("Registering dbus methods/signals\n");
-	r = sd_bus_add_object_vtable(context.bus,
+	r = sd_bus_add_object_vtable(context->bus,
 	                             NULL,
 	                             OBJ_NAME,
 	                             DBUS_NAME,
 	                             ipmid_vtable,
-	                             &context);
+	                             context);
 	if (r < 0) {
 		MSG_ERR("Failed to issue method call: %s\n", strerror(-r));
 		goto finish;
 	}
 
 	MSG_OUT("Requesting dbus name: %s\n", DBUS_NAME);
-	r = sd_bus_request_name(context.bus, DBUS_NAME, SD_BUS_NAME_ALLOW_REPLACEMENT|SD_BUS_NAME_REPLACE_EXISTING);
+	r = sd_bus_request_name(context->bus, DBUS_NAME, SD_BUS_NAME_ALLOW_REPLACEMENT|SD_BUS_NAME_REPLACE_EXISTING);
 	if (r < 0) {
 		MSG_ERR("Failed to acquire service name: %s\n", strerror(-r));
 		goto finish;
 	}
 
 	MSG_OUT("Getting dbus file descriptors\n");
-	context.fds[SD_BUS_FD].fd = sd_bus_get_fd(context.bus);
-	if (context.fds[SD_BUS_FD].fd < 0) {
+	context->fds[SD_BUS_FD].fd = sd_bus_get_fd(context->bus);
+	if (context->fds[SD_BUS_FD].fd < 0) {
 		r = -errno;
 		MSG_OUT("Couldn't get the bus file descriptor: %s\n", strerror(errno));
 		goto finish;
 	}
 
 	MSG_OUT("Opening %s\n", BT_HOST_PATH);
-	context.fds[BT_FD].fd = open(BT_HOST_PATH, O_RDWR | O_NONBLOCK);
-	if (context.fds[BT_FD].fd < 0) {
+	context->fds[BT_FD].fd = open(BT_HOST_PATH, O_RDWR | O_NONBLOCK);
+	if (context->fds[BT_FD].fd < 0) {
 		r = -errno;
 		MSG_ERR("Couldn't open %s with flags O_RDWR: %s\n", BT_HOST_PATH, strerror(errno));
 		goto finish;
 	}
 
 	MSG_OUT("Creating timer fd\n");
-	context.fds[TIMER_FD].fd = timerfd_create(CLOCK_MONOTONIC, 0);
-	if (context.fds[TIMER_FD].fd < 0) {
+	context->fds[TIMER_FD].fd = timerfd_create(CLOCK_MONOTONIC, 0);
+	if (context->fds[TIMER_FD].fd < 0) {
 		r = -errno;
 		MSG_ERR("Couldn't create timer fd: %s\n", strerror(errno));
 		goto finish;
 	}
-	context.fds[SD_BUS_FD].events = POLLIN;
-	context.fds[BT_FD].events = POLLIN;
-	context.fds[TIMER_FD].events = POLLIN;
+	context->fds[SD_BUS_FD].events = POLLIN;
+	context->fds[BT_FD].events = POLLIN;
+	context->fds[TIMER_FD].events = POLLIN;
 
 	MSG_OUT("Entering polling loop\n");
 
 	while (running) {
-		polled = poll(context.fds, TOTAL_FDS, 1000);
+		polled = poll(context->fds, TOTAL_FDS, 1000);
 		if (polled == 0)
 			continue;
 		if (polled < 0) {
@@ -693,17 +693,17 @@ int main(int argc, char *argv[]) {
 			MSG_ERR("Error from poll(): %s\n", strerror(errno));
 			goto finish;
 		}
-		r = dispatch_sd_bus(&context);
+		r = dispatch_sd_bus(context);
 		if (r < 0) {
 			MSG_ERR("Error handling dbus event: %s\n", strerror(-r));
 			goto finish;
 		}
-		r = dispatch_bt(&context);
+		r = dispatch_bt(context);
 		if (r < 0) {
 			MSG_ERR("Error handling BT event: %s\n", strerror(-r));
 			goto finish;
 		}
-		r = dispatch_timer(&context);
+		r = dispatch_timer(context);
 		if (r < 0) {
 			MSG_ERR("Error handling timer event: %s\n", strerror(-r));
 			goto finish;
@@ -711,13 +711,14 @@ int main(int argc, char *argv[]) {
 	}
 
 finish:
-	if (bt_q_get_head(&context)) {
+	if (bt_q_get_head(context)) {
 		MSG_ERR("Unresponded BT Message!\n");
-		while (bt_q_dequeue(&context));
+		while (bt_q_dequeue(context));
 	}
-	close(context.fds[BT_FD].fd);
-	close(context.fds[TIMER_FD].fd);
-	sd_bus_unref(context.bus);
+	close(context->fds[BT_FD].fd);
+	close(context->fds[TIMER_FD].fd);
+	sd_bus_unref(context->bus);
+	free(context);
 
 	return r;
 }
-- 
2.6.3
