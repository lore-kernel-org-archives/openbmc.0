Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQdWj5qqbzDqWs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 17:20:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458195628764993.477422088797;
 Wed, 16 Mar 2016 23:20:28 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Add support for limiting the size of the event
 log DB
Date: Thu, 17 Mar 2016 01:20:27 -0500
Message-Id: <1458195627-21825-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458195627-21825-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458195627-21825-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 17 Mar 2016 06:20:34 -0000

From: Chris Austen <austenc@us.ibm.com>

embedded systems only have so much space.  This feature enables the event deamon to
limit the number of bytes used for logs via an input parameter

Limit the DB to 1k...
    /usr/sbin/phosphor-eventd -s 1000

Without the parameter the db size is unlimited.

When the db hits the limit, the event is NOT logged to the db.  It is however
added (without debug data) to the syslog still AND an error message is posted
in the syslog...

     event logger reached maximum capacity, event not logged

Interfaces exist already to clear the entire db and individual events.
---
 event_messaged.C | 30 +++++++++++++++++--
 message.C        | 87 +++++++++++++++++++++++++++++++++++++++++++++-----------
 message.H        |  5 +++-
 test.C           | 30 +++++++++++++++----
 4 files changed, 128 insertions(+), 24 deletions(-)

diff --git a/event_messaged.C b/event_messaged.C
index 9addd3f..f7249fc 100644
--- a/event_messaged.C
+++ b/event_messaged.C
@@ -1,6 +1,8 @@
 #include <iostream>
 #include "message.H"
 #include "event_messaged_sdbus.h"
+#include <string>
+#include <unistd.h>
 
 const char *path_to_messages = "/var/lib/obmc/events";
 
@@ -44,10 +46,34 @@ int load_existing_events(event_manager *em)
 	return 0;
 }
 
+
+void print_usage(void)
+{
+	cout << "[-s <x>] : Maximum bytes to use for event logger"  << endl;
+	return;
+}
+
+
 int main(int argc, char *argv[])
 {
-	int rc = 0;
-	event_manager em(path_to_messages);
+	unsigned long maxsize=0;
+	int rc, c;
+
+	while ((c = getopt (argc, argv, "s:")) != -1)
+		switch (c) {
+			case 's':
+				maxsize =  strtoul(optarg, NULL, 10);
+				break;
+			case 'h':
+			case '?':
+				print_usage();
+				return 1;
+		}
+
+
+	cout << maxsize <<endl;
+	event_manager em(path_to_messages, maxsize);
+
 
 	rc = build_bus(&em);
 	if (rc < 0) {
diff --git a/message.C b/message.C
index 2e52b67..1bf7d8b 100644
--- a/message.C
+++ b/message.C
@@ -12,6 +12,7 @@
 #include <time.h>
 #include <stddef.h>
 #include <cstdio>
+#include <syslog.h>
 
 const uint32_t g_eyecatcher = 0x4F424D43; // OBMC
 const uint16_t g_version    = 1;
@@ -29,14 +30,21 @@ struct logheader_t {
 	uint16_t debugdatalen;
 };
 
+size_t get_file_size(string fn);
 
-event_manager::event_manager(string path)
+
+event_manager::event_manager(string path, size_t reqmaxsize)
 {
 	uint16_t x;
 	eventpath = path;
 	latestid = 0;
 	dirp = NULL;
 	logcount = 0;
+	maxsize = -1;
+	currentsize = 0;
+
+	if (reqmaxsize)
+		maxsize = reqmaxsize;
 
 	// examine the files being managed and advance latestid to that value
 	while ( (x = next_log()) ) {
@@ -56,6 +64,15 @@ event_manager::~event_manager()
 	return;
 }
 
+
+bool event_manager::is_logid_a_log(uint16_t logid)
+{
+	std::ostringstream buffer;
+	buffer  << int(logid);
+	return is_file_a_log(buffer.str());
+}
+
+
 bool event_manager::is_file_a_log(string str)
 {
 	std::ostringstream buffer;
@@ -161,6 +178,18 @@ inline uint16_t getlen(const char *s)
 }
 
 
+size_t get_file_size(string fn)
+{
+	ifstream f;
+	size_t len=0;
+
+	f.open(fn, ios::in|ios::binary|ios::ate);
+	len = f.tellg();
+	f.close();
+	return (len);
+}
+
+
 size_t event_manager::get_managed_size(void)
 {
 	DIR *dirp;
@@ -178,13 +207,9 @@ size_t event_manager::get_managed_size(void)
 			string str(ent->d_name);
 
 			if (is_file_a_log(str)) {
-
 				buffer.str("");
 				buffer << eventpath << "/" << str.c_str();
-
-				f.open(buffer.str() , ios::in|ios::binary|ios::ate);
-				db_size += f.tellg();
-				f.close();
+				db_size += get_file_size(buffer.str());
 			}
 		}
 	}
@@ -199,6 +224,7 @@ uint16_t event_manager::create_log_event(event_record_t *rec)
 	std::ostringstream buffer;
 	ofstream myfile;
 	logheader_t hdr = {0};
+	size_t event_size=0;
 
 	buffer << eventpath << "/" << int(rec->logid) ;
 
@@ -213,17 +239,35 @@ uint16_t event_manager::create_log_event(event_record_t *rec)
 	hdr.reportedbylen  = getlen(rec->reportedby);
 	hdr.debugdatalen   = rec->n;
 
-	myfile.open(buffer.str() , ios::out|ios::binary);
-	myfile.write((char*) &hdr, sizeof(hdr));
-	myfile.write((char*) rec->message, hdr.messagelen);
-	myfile.write((char*) rec->severity, hdr.severitylen);
-	myfile.write((char*) rec->association, hdr.associationlen);
-	myfile.write((char*) rec->reportedby, hdr.reportedbylen);
-	myfile.write((char*) rec->p, hdr.debugdatalen);
-	myfile.flush();
-	myfile.close();
+	event_size = sizeof(logheader_t) + \
+			hdr.messagelen     + \
+			hdr.severitylen    + \
+			hdr.associationlen + \
+			hdr.reportedbylen  + \
+			hdr.debugdatalen;
 
-	logcount++;
+	if((event_size + currentsize)  >= maxsize) {
+		syslog(LOG_ERR, "event logger reached maximum capacity, event not logged");
+		rec->logid = 0;
+
+	} else {
+		currentsize += event_size;
+		myfile.open(buffer.str() , ios::out|ios::binary);
+		myfile.write((char*) &hdr, sizeof(hdr));
+		myfile.write((char*) rec->message, hdr.messagelen);
+		myfile.write((char*) rec->severity, hdr.severitylen);
+		myfile.write((char*) rec->association, hdr.associationlen);
+		myfile.write((char*) rec->reportedby, hdr.reportedbylen);
+		myfile.write((char*) rec->p, hdr.debugdatalen);
+		myfile.close();
+
+		if (is_logid_a_log(rec->logid)) {
+			logcount++;
+		} else {
+			cout << "Warning: Event not logged, failed to store data" << endl;
+			rec->logid = 0;
+		}
+	}
 
 	return rec->logid;
 }
@@ -288,11 +332,22 @@ int event_manager::remove(uint16_t logid)
 {
 	std::stringstream buffer;
 	string s;
+	size_t event_size;
 
 	buffer << eventpath << "/" << int(logid);
 
 	s = buffer.str();
+
+	event_size = get_file_size(s);
 	std::remove(s.c_str());
 
+	/* If everything is working correctly deleting all the logs would */ 
+	/* result in currentsize being zero.  But  since size_t is unsigned */
+	/* it's kind of dangerous to  assume life happens perfectly */
+	if (currentsize < event_size)
+		currentsize = 0;
+	else
+		currentsize -= event_size;
+
 	return 0;
 }
diff --git a/message.H b/message.H
index 5cc3484..d3a0a26 100644
--- a/message.H
+++ b/message.H
@@ -41,9 +41,11 @@ class event_manager {
 	string   eventpath;
 	DIR      *dirp;
 	uint16_t logcount;
+	size_t   maxsize;
+	size_t   currentsize;
 
 public:
-	event_manager(string path);
+	event_manager(string path, size_t reqmaxsize);
 	~event_manager();
 
 	uint16_t next_log(void);
@@ -63,6 +65,7 @@ private:
 	bool is_file_a_log(string str);
 	uint16_t create_log_event(event_record_t *rec);
 	uint16_t new_log_id(void);
+	bool     is_logid_a_log(uint16_t logid);
 };
 #else
 typedef struct event_manager event_manager;
diff --git a/test.C b/test.C
index 1e00221..ee69b1c 100644
--- a/test.C
+++ b/test.C
@@ -4,7 +4,7 @@
 #include <stdint.h>
 #include <string>
 #include <assert.h>
-
+#include <unistd.h>
 #include "message.H"
 
 using namespace std;
@@ -44,15 +44,17 @@ void setup(void)
 	return;
 }
 
+
 int main(int argc, char *argv[])
 {
 	uint8_t p[] = {0x3, 0x32, 0x34, 0x36};
 	event_record_t rec, *prec;
 	string s;
 
+
 	setup();
 
-	event_manager m(eventspath);
+	event_manager m(eventspath, 0);
 
 	assert(m.get_managed_size() == 0);
 
@@ -99,22 +101,40 @@ int main(int argc, char *argv[])
 	m.remove(1);
 	assert(m.get_managed_size() == 75);
 
-	event_manager q(eventspath);
+	event_manager q(eventspath, 0);
 	assert(q.latest_log_id() == 2);
 	assert(q.log_count() == 1);
 	m.next_log_refresh();
 
 	// Travese log list stuff
 	system("exec rm -r ./events/* 2> /dev/null");
-	event_manager a(eventspath);
+	event_manager a(eventspath, 0);
 	assert(a.next_log() == 0);
 
 	build_event_record(&rec,"Testing list", "Info", "Association", "Test", p, 4);
 	a.create(&rec);
 	a.create(&rec);
 
-	event_manager b(eventspath);
+	event_manager b(eventspath, 0);
 	assert(b.next_log() == 1);
 
+
+	/* Testing the max limits for event logs */
+	setup();
+	event_manager d(eventspath, 75);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(d.create(&rec) == 0);
+
+	event_manager e(eventspath, 76);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(e.create(&rec) == 1);
+
+	setup();
+	event_manager f(eventspath, 149);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(f.create(&rec) == 1);
+	assert(f.create(&rec) == 0);
+
+
 	return 0;
 }
\ No newline at end of file
-- 
2.7.1
