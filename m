Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r00886rMhzDqCG
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 11:00:24 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462323619328523.7513607437601;
 Tue, 3 May 2016 18:00:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 4/5] Initial set of test.
Date: Tue,  3 May 2016 20:00:12 -0500
Message-Id: <1462323613-10640-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 01:00:26 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Very simple tests which can hopefully be extended in the future.

The main purpose of this is to be able to use travis-ci to automatate the
running of the tests and being able to fake /dev/bt-host.

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 Makefile                              |   7 +
 bt-host.c                             | 235 ++++++++++++++++++++++++++++++++++
 ipmi-bouncer.c                        | 131 +++++++++++++++++++
 travis/build.sh                       |   9 ++
 travis/org.openbmc.HostIpmi.conf.test |  20 +++
 travis/run_tests.sh                   |  15 +++
 6 files changed, 417 insertions(+)
 create mode 100644 bt-host.c
 create mode 100644 ipmi-bouncer.c
 create mode 100644 travis/org.openbmc.HostIpmi.conf.test
 create mode 100755 travis/run_tests.sh

diff --git a/Makefile b/Makefile
index 7ffbc01..1cf1a21 100644
--- a/Makefile
+++ b/Makefile
@@ -9,5 +9,12 @@ EXE = btbridged
 
 all: $(EXE)
 
+.PHONY += test
+test: $(EXE) ipmi-bouncer bt-host
+
+bt-host: bt-host.c
+	gcc -shared -fPIC -ldl $(CFLAGS) $^ -o $@.so
+
 clean:
 	rm -rf *.o $(EXE)
+	rm -rf bt-host.so ipmi-bouncer
diff --git a/bt-host.c b/bt-host.c
new file mode 100644
index 0000000..65bf6bb
--- /dev/null
+++ b/bt-host.c
@@ -0,0 +1,235 @@
+#define _GNU_SOURCE
+#include <dlfcn.h>
+#include <errno.h>
+#include <poll.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/types.h>          /* See NOTES */
+#include <sys/socket.h>
+
+#include <linux/bt-host.h>
+
+struct bttest_data {
+	int status;
+	const char msg[64];
+};
+
+static int bt_host_fd;
+static int timer_fd;
+
+static int stop;
+static int sent_id = -1;
+static int recv_id;
+
+/*
+ * btbridged doesn't care about the message EXCEPT the first byte must be
+ * correct.
+ * The first byte is the size not including the length byte its self.
+ * A len less than 4 will constitute an invalid message according to the BT
+ * protocol, btbridged will care.
+ */
+static struct bttest_data data[] = {
+	/*
+	 * Note, the 4th byte is cmd, the ipmi-bouncer will put cmd in cc so
+	 * in this array always duplicate the command
+	 *
+	 * Make the first message look like:
+	 * seq = 1, netfn = 2, lun = 3 and cmd= 4
+	 * (thats how btbridged will print it)
+	 */
+	{ 0, { 4, 0xb, 1, 4, 4 }},
+	{ 0, { 4, 0xff, 0xee, 0xdd, 0xdd, 0xbb }},
+	/*
+	 * A bug was found in bt_q_drop(), write a test!
+	 * Simply send the same seq number a bunch of times
+	 */
+	{ 0, { 4, 0xaa, 0xde, 0xaa, 0xaa }},
+	{ 0, { 4, 0xab, 0xde, 0xab, 0xab }},
+	{ 0, { 4, 0xac, 0xde, 0xac, 0xac }},
+	{ 0, { 4, 0xad, 0xde, 0xad, 0xad }},
+	{ 0, { 4, 0xae, 0xde, 0xae, 0xae }},
+	{ 0, { 4, 0xaf, 0xde, 0xaf, 0xaf }},
+	{ 0, { 4, 0xa0, 0xde, 0xa0, 0xa0 }},
+	{ 0, { 4, 0xa1, 0xde, 0xa1, 0xa1 }},
+	{ 0, { 4, 0xa2, 0xde, 0xa2, 0xa2 }},
+	{ 0, { 4, 0xa3, 0xde, 0xa3, 0xa3 }},
+	{ 0, { 4, 0xa4, 0xde, 0xa4, 0xa4 }},
+	{ 0, { 4, 0xa5, 0xde, 0xa5, 0xa5 }},
+	{ 0, { 4, 0xa6, 0xde, 0xa6, 0xa6 }},
+	{ 0, { 4, 0xa7, 0xde, 0xa7, 0xa7 }},
+	{ 0, { 4, 0xa8, 0xde, 0xa8, 0xa8 }},
+	{ 0, { 4, 0xa9, 0xde, 0xa9, 0xa9 }},
+	{ 0, { 4, 0xaa, 0x88, 0xaa, 0xaa }},
+	{ 0, { 4, 0xab, 0x88, 0xab, 0xab }},
+	{ 0, { 4, 0xac, 0x88, 0xac, 0xac }},
+	{ 0, { 4, 0xad, 0x88, 0xad, 0xad }},
+	{ 0, { 4, 0xae, 0x88, 0xae, 0xae }},
+	{ 0, { 4, 0xaf, 0x88, 0xaf, 0xaf }},
+	{ 0, { 4, 0xa0, 0x88, 0xa0, 0xa0 }},
+	{ 0, { 4, 0xa1, 0x88, 0xa1, 0xa1 }},
+	{ 0, { 4, 0xa2, 0x88, 0xa2, 0xa2 }},
+	{ 0, { 4, 0xa3, 0x88, 0xa3, 0xa3 }},
+	{ 0, { 4, 0xa4, 0x88, 0xa4, 0xa4 }},
+	{ 0, { 4, 0xa5, 0x88, 0xa5, 0xa5 }},
+	{ 0, { 4, 0xa6, 0x88, 0xa6, 0xa6 }},
+	{ 0, { 4, 0xa7, 0x88, 0xa7, 0xa7 }},
+	{ 0, { 4, 0xa8, 0x88, 0xa8, 0xa8 }},
+	{ 0, { 4, 0xa9, 0x88, 0xa9, 0xa9 }},
+};
+#define BTTEST_NUM (sizeof(data)/sizeof(struct bttest_data))
+#define PREFIX "[BTHOST] "
+
+#define MSG_OUT(f_, ...) do { printf(PREFIX); printf((f_), ##__VA_ARGS__); } while(0)
+#define MSG_ERR(f_, ...) do { fprintf(stderr,PREFIX); fprintf(stderr, (f_), ##__VA_ARGS__); } while(0)
+
+typedef int (*orig_open_t)(const char *pathname, int flags);
+typedef int (*orig_poll_t)(struct pollfd *fds, nfds_t nfds, int timeout);
+typedef int (*orig_read_t)(int fd, void *buf, size_t count);
+typedef ssize_t (*orig_write_t)(int fd, const void *buf, size_t count);
+typedef int (*orig_ioctl_t)(int fd, unsigned long request, char *p);
+typedef int (*orig_timerfd_create_t)(int clockid, int flags);
+
+int ioctl(int fd, unsigned long request, char *p)
+{
+	if (fd == bt_host_fd) {
+		MSG_OUT("ioctl(%d, %lu, %p)\n", fd, request, p);
+		/* TODO Check the request number */
+		return 0;
+	}
+
+	orig_ioctl_t orig_ioctl;
+	orig_ioctl = (orig_ioctl_t)dlsym(RTLD_NEXT, "ioctl");
+	return orig_ioctl(fd, request, p);
+}
+
+int poll(struct pollfd *fds, nfds_t nfds, int timeout)
+{
+	int i, j;
+	int ret = 0;
+	int dropped = 0;
+	struct pollfd *new_fds = calloc(nfds, sizeof(struct pollfd));
+	j = 0;
+	for (i = 0; i  < nfds; i++) {
+		if (fds[i].fd == bt_host_fd) {
+			short revents = fds[i].events;
+
+			MSG_OUT("poll() on bt_host fd\n");
+
+			if (stop)
+				revents &= ~POLLIN;
+			if (sent_id == -1)
+				revents &= ~POLLOUT;
+			fds[i].revents = revents;
+			ret++;
+			dropped++;
+		} else if(fds[i].fd == timer_fd) {
+			MSG_OUT("poll() on timerfd fd, dropping request\n");
+
+			fds[i].revents = 0;
+			dropped++;
+		} else {
+			new_fds[j].fd = fds[i].fd;
+			new_fds[j].events = fds[i].events;
+			/* Copy this to be sure */
+			new_fds[j].revents = fds[i].revents;
+			j++;
+		}
+	}
+	orig_poll_t orig_poll;
+	orig_poll = (orig_poll_t)dlsym(RTLD_NEXT, "poll");
+	ret += orig_poll(new_fds, nfds - dropped, timeout);
+	j = 0;
+	for (i = 0; i < nfds; i++) {
+		if (fds[i].fd != bt_host_fd && fds[i].fd != timer_fd) {
+			fds[i].fd = new_fds[j].fd;
+			fds[i].revents = new_fds[j].revents;
+			j++;
+		}
+	}
+	free(new_fds);
+	return ret;
+}
+
+int open(const char *pathname, int flags)
+{
+	if (strcmp("/dev/bt-host", pathname) == 0) {
+		MSG_OUT("open(%s, %x)\n", pathname, flags);
+		bt_host_fd = socket(AF_UNIX, SOCK_STREAM, 0);
+		return bt_host_fd;
+	}
+	orig_open_t orig_open;
+	orig_open = (orig_open_t)dlsym(RTLD_NEXT, "open");
+	return orig_open(pathname, flags);
+}
+
+int read(int fd, void *buf, size_t count)
+{
+	if (fd == bt_host_fd) {
+		MSG_OUT("read(%d, %p, %ld)\n", fd, buf, count);
+
+		if (sent_id == -1)
+			sent_id = 0;
+		else
+			sent_id++;
+
+		MSG_OUT("Send msg id %d\n", sent_id);
+
+		if (count < data[sent_id].msg[0] + 1) {
+			/*
+			 * TODO handle this, not urgent, the real driver also gets it
+			 * wrong
+			 */
+			MSG_ERR("Read size was too small\n");
+			errno = ENOMEM;
+			return -1;
+		}
+		if (sent_id == BTTEST_NUM - 1)
+			stop = 1;
+
+		memcpy(buf, data[sent_id].msg, data[sent_id].msg[0] + 1);
+		return data[sent_id].msg[0] + 1;
+	}
+
+	orig_read_t orig_read;
+	orig_read = (orig_read_t)dlsym(RTLD_NEXT, "read");
+	return orig_read(fd, buf, count);
+}
+
+int write(int fd, const void *buf, size_t count)
+{
+	if (fd == bt_host_fd) {
+		MSG_OUT("write(%d, %p, %ld)\n", fd, buf, count);
+		if (count == 5 && ((char *)buf)[4] == 0xce) {
+			MSG_ERR("CAUGHT A TIMEOUT!!!! 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n",  ((char *)buf)[0], ((char *)buf)[1], ((char *)buf)[2], ((char *)buf)[3], ((char *)buf)[4]);
+			exit(1);
+		}
+		if (memcmp(buf + 1, data[recv_id].msg + 1, count - 2) != 0) {
+			int j;
+
+			MSG_ERR("Bad response/inconsistent message index: %d\n", recv_id);
+			for (j = 0; j < count - 2; j++)
+				MSG_ERR("0x%02x vs 0x%02x\n", data[recv_id].msg[j + 1], ((char *)buf)[1 + j]);
+		} else {
+			MSG_OUT("Good response to message index: %d\n", recv_id);
+			data[recv_id].status = 2;
+		}
+		if (recv_id == BTTEST_NUM - 1) {
+			MSG_OUT("recieved a response to all messages, tentative success\n");
+			exit(0);
+		}
+		recv_id++;
+		return count;
+	}
+	orig_write_t orig_write;
+	orig_write = (orig_write_t)dlsym(RTLD_NEXT, "write");
+	return orig_write(fd, buf, count);
+}
+
+int timerfd_create(int clockid, int flags)
+{
+	orig_timerfd_create_t orig_timerfd_create;
+	orig_timerfd_create = (orig_timerfd_create_t)dlsym(RTLD_NEXT, "timerfd_create");
+	timer_fd = orig_timerfd_create(clockid, flags);
+	return timer_fd;
+}
diff --git a/ipmi-bouncer.c b/ipmi-bouncer.c
new file mode 100644
index 0000000..030cffb
--- /dev/null
+++ b/ipmi-bouncer.c
@@ -0,0 +1,131 @@
+#include <errno.h>
+#include <stdio.h>
+
+#include <systemd/sd-bus.h>
+
+#define PREFIX "[IPMI] "
+
+#define MSG_OUT(f_, ...) do { printf(PREFIX); printf((f_), ##__VA_ARGS__); } while(0)
+#define MSG_ERR(f_, ...) do { fprintf(stderr,PREFIX); fprintf(stderr, (f_), ##__VA_ARGS__); } while(0)
+
+sd_bus *bus;
+
+static int bttest_ipmi(sd_bus_message *req,
+		void *user_data, sd_bus_error *ret_error)
+{
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+    const char *dest, *path;
+    int r, pty;
+	unsigned char seq, netfn, lun, cmd;
+	uint8_t buf[1];
+
+	MSG_OUT("Got DBUS message\n");
+
+	r = sd_bus_message_read(req, "yyyy",  &seq, &netfn, &lun, &cmd);
+	if (r < 0) {
+		MSG_ERR("FAIL ");
+		errno = -r;
+		perror("Couldn't read DBUS message");
+		return -1;
+	}
+
+	dest = sd_bus_message_get_sender(req);
+	path = sd_bus_message_get_path(req);
+
+	r = sd_bus_message_new_method_call(bus, &m, dest, path,
+			"org.openbmc.HostIpmi", "sendMessage");
+	if (r < 0) {
+		MSG_ERR("FAIL ");
+		errno = -r;
+		perror("Failed to add the method object");
+		return -1;
+	}
+
+	/* Send CMD twice */
+	r = sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cmd);
+	if (r < 0) {
+		MSG_ERR("FAIL ");
+		errno = -r;
+		perror("Failed add the netfn and others");
+		return -1;
+	}
+
+	r = sd_bus_message_append_array(m, 'y', buf, 1);
+	if (r < 0) {
+		MSG_ERR("FAIL ");
+		errno = -r;
+		perror("Failed to add the string of response bytes");
+		return -1;
+	}
+
+	r = sd_bus_call(bus, m, 0, &error, &reply);
+	if (r < 0) {
+		MSG_ERR("FAIL ");
+		errno = -r;
+		perror("Failed to call the method");
+		return -1;
+	}
+
+	r = sd_bus_message_read(reply, "x", &pty);
+	if (r < 0) {
+		MSG_ERR("FAIL ");
+		errno = -r;
+		perror("Failed to get a rc from the method");
+	}
+
+	sd_bus_error_free(&error);
+	sd_bus_message_unref(m);
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	sd_bus_slot *slot;
+	int r;
+
+	/* Connect to system bus */
+	r = sd_bus_open_system(&bus);
+	if (r < 0) {
+		MSG_ERR("FAIL");
+		errno = -r;
+		perror("Failed to connect to system bus");
+		return 1;
+	}
+
+	r = sd_bus_add_match(bus, &slot, "type='signal',"
+			"interface='org.openbmc.HostIpmi',"
+			"member='ReceivedMessage'", bttest_ipmi, NULL);
+	if (r < 0) {
+		MSG_ERR("FAIL");
+		errno = -r;
+		perror("Failed: sd_bus_add_match");
+		goto finish;
+	}
+
+
+	for (;;) {
+		r = sd_bus_process(bus, NULL);
+		if (r < 0) {
+			MSG_ERR("FAIL");
+			errno = -r;
+			perror("Failed to process bus");
+			goto finish;
+		}
+
+		r = sd_bus_wait(bus, (uint64_t) - 1);
+		if (r < 0) {
+			MSG_ERR("FAIL");
+			errno = -r;
+			perror("Failed to wait on bus");
+			goto finish;
+		}
+	}
+
+finish:
+	sd_bus_slot_unref(slot);
+	sd_bus_unref(bus);
+
+	return 0;
+}
diff --git a/travis/build.sh b/travis/build.sh
index 79b0b5c..e330afd 100755
--- a/travis/build.sh
+++ b/travis/build.sh
@@ -1,9 +1,11 @@
 #!/bin/bash
+set -evx
 
 Dockerfile=$(cat << EOF
 FROM ubuntu:15.10
 RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
 RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
+RUN mkdir /var/run/dbus
 RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 USER ${USER}
 ENV HOME ${HOME}
@@ -14,6 +16,9 @@ EOF
 docker pull ubuntu:15.10
 docker build -t temp - <<< "${Dockerfile}"
 
+sudo cp ./travis/org.openbmc.HostIpmi.conf.test /etc/dbus-1/system.d/org.openbmc.HostIpmi.conf
+sudo service dbus restart
+
 gcc --version
 
 mkdir -p linux
@@ -21,3 +26,7 @@ wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include/uapi/linux/
 
 docker run --cap-add=sys_admin --net=host --rm=true --user="${USER}" \
  -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=$PWD
+
+docker run --cap-add=sys_admin --net=host -v /var/run/dbus:/var/run/dbus --rm=true --user="${USER}" \
+ -w "${PWD}" -v "${HOME}":"${HOME}" -t temp ./travis/run_tests.sh
+
diff --git a/travis/org.openbmc.HostIpmi.conf.test b/travis/org.openbmc.HostIpmi.conf.test
new file mode 100644
index 0000000..196945f
--- /dev/null
+++ b/travis/org.openbmc.HostIpmi.conf.test
@@ -0,0 +1,20 @@
+<?xml version="1.0"?> <!--*-nxml-*-->
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
+1.0//EN"
+        "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+
+<!--
+	This file is need to run openbmc bt bridge daemon.
+	Place this file in /etc/dbus-1/system.d/
+-->
+
+<busconfig>
+
+        <policy context="default">
+                <allow own="org.openbmc.HostIpmi"/>
+                <allow send_destination="org.openbmc.HostIpmi"/>
+                <allow receive_sender="org.openbmc.HostIpmi"/>
+        </policy>
+
+</busconfig>
+
diff --git a/travis/run_tests.sh b/travis/run_tests.sh
new file mode 100755
index 0000000..a391798
--- /dev/null
+++ b/travis/run_tests.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+set -evx
+make KERNEL_HEADERS=${PWD} test
+LD_PRELOAD=${PWD}/bt-host.so ./btbridged --vv &
+bridge_pid=$!
+
+./ipmi-bouncer &
+ipmi_pid=$!
+
+wait $bridge_pid
+exit_status=$?
+
+kill -9 $ipmi_pid
+
+exit $exit_status
-- 
2.8.1
