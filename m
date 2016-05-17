Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r85lc2nkBzDq64
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 15:40:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463463640845175.4373193111503;
 Mon, 16 May 2016 22:40:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Create a possible limit to the number of logs
 recorded
Date: Tue, 17 May 2016 00:40:38 -0500
Message-Id: <1463463638-4870-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463463638-4870-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463463638-4870-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 05:40:44 -0000

From: Chris Austen <austenc@us.ibm.com>

https://github.com/openbmc/openbmc/issues/268

There was a technique that created over 1000 event logs.  This taxed
the REST interface a lot.  It caused connections to time out.  I am
adding a way to limit the number of physical logs irregardless of the
size.  Like the size limiter, logs are not deleted automatically.

That may actually be a debate (save new logs, delete old logs) vs
(delete new logs, save old logs).  I welcome the suggestions.
---
 event_messaged.C | 10 +++++++---
 message.C        | 14 ++++++++++++--
 message.H        |  3 ++-
 test.C           | 59 +++++++++++++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 73 insertions(+), 13 deletions(-)

diff --git a/event_messaged.C b/event_messaged.C
index 75cd022..eacfd76 100644
--- a/event_messaged.C
+++ b/event_messaged.C
@@ -54,20 +54,24 @@ int load_existing_events(event_manager *em)
 void print_usage(void)
 {
 	cout << "[-s <x>] : Maximum bytes to use for event logger"  << endl;
+	cout << "[-t <x>] : Limit total number of logs (will ignore newer)"  << endl;	
 	return;
 }
 
 
 int main(int argc, char *argv[])
 {
-	unsigned long maxsize=0;
+	unsigned long maxsize=0, maxlogs=0;
 	int rc, c;
 
-	while ((c = getopt (argc, argv, "s:")) != -1)
+	while ((c = getopt (argc, argv, "s:t:")) != -1)
 		switch (c) {
 			case 's':
 				maxsize =  strtoul(optarg, NULL, 10);
 				break;
+			case 't':
+				maxlogs =  strtoul(optarg, NULL, 10);
+				break;
 			case 'h':
 			case '?':
 				print_usage();
@@ -76,7 +80,7 @@ int main(int argc, char *argv[])
 
 
 	cout << maxsize <<endl;
-	event_manager em(path_to_messages, maxsize);
+	event_manager em(path_to_messages, maxsize, maxlogs);
 
 
 	rc = build_bus(&em);
diff --git a/message.C b/message.C
index 87fb856..6f77f8c 100644
--- a/message.C
+++ b/message.C
@@ -33,7 +33,7 @@ struct logheader_t {
 size_t get_file_size(string fn);
 
 
-event_manager::event_manager(string path, size_t reqmaxsize)
+event_manager::event_manager(string path, size_t reqmaxsize, uint16_t reqmaxlogs)
 {
 	uint16_t x;
 	eventpath = path;
@@ -41,11 +41,15 @@ event_manager::event_manager(string path, size_t reqmaxsize)
 	dirp = NULL;
 	logcount = 0;
 	maxsize = -1;
+	maxlogs = -1;
 	currentsize = 0;
 
 	if (reqmaxsize)
 		maxsize = reqmaxsize;
 
+	if (reqmaxlogs)
+		maxlogs = reqmaxlogs;
+
 	// examine the files being managed and advance latestid to that value
 	while ( (x = next_log()) ) {
 		logcount++;
@@ -258,6 +262,10 @@ uint16_t event_manager::create_log_event(event_record_t *rec)
 		syslog(LOG_ERR, "event logger reached maximum capacity, event not logged");
 		rec->logid = 0;
 
+	} else if (logcount >= maxlogs) {
+		syslog(LOG_ERR, "event logger reached maximum log events, event not logged");
+		rec->logid = 0;
+
 	} else {
 		currentsize += event_size;
 		myfile.open(buffer.str() , ios::out|ios::binary);
@@ -332,7 +340,6 @@ void event_manager::close(event_record_t *rec)
 	delete[] rec->p;
 	delete rec;
 
-	logcount--;
 	return ;
 }
 
@@ -357,5 +364,8 @@ int event_manager::remove(uint16_t logid)
 	else
 		currentsize -= event_size;
 
+	if (logcount > 0)
+		logcount--;
+
 	return 0;
 }
diff --git a/message.H b/message.H
index d3a0a26..3ea5c1a 100644
--- a/message.H
+++ b/message.H
@@ -41,11 +41,12 @@ class event_manager {
 	string   eventpath;
 	DIR      *dirp;
 	uint16_t logcount;
+	uint16_t maxlogs;
 	size_t   maxsize;
 	size_t   currentsize;
 
 public:
-	event_manager(string path, size_t reqmaxsize);
+	event_manager(string path, size_t reqmaxsize, uint16_t reqmaxlogs);
 	~event_manager();
 
 	uint16_t next_log(void);
diff --git a/test.C b/test.C
index ee69b1c..4234543 100644
--- a/test.C
+++ b/test.C
@@ -54,7 +54,7 @@ int main(int argc, char *argv[])
 
 	setup();
 
-	event_manager m(eventspath, 0);
+	event_manager m(eventspath, 0, 0);
 
 	assert(m.get_managed_size() == 0);
 
@@ -101,40 +101,85 @@ int main(int argc, char *argv[])
 	m.remove(1);
 	assert(m.get_managed_size() == 75);
 
-	event_manager q(eventspath, 0);
+	event_manager q(eventspath, 0, 0);
 	assert(q.latest_log_id() == 2);
 	assert(q.log_count() == 1);
 	m.next_log_refresh();
 
 	// Travese log list stuff
 	system("exec rm -r ./events/* 2> /dev/null");
-	event_manager a(eventspath, 0);
+	event_manager a(eventspath, 0, 0);
 	assert(a.next_log() == 0);
 
 	build_event_record(&rec,"Testing list", "Info", "Association", "Test", p, 4);
 	a.create(&rec);
 	a.create(&rec);
 
-	event_manager b(eventspath, 0);
+	event_manager b(eventspath, 0, 0);
 	assert(b.next_log() == 1);
 
 
 	/* Testing the max limits for event logs */
 	setup();
-	event_manager d(eventspath, 75);
+	event_manager d(eventspath, 75, 0);
 	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
 	assert(d.create(&rec) == 0);
 
-	event_manager e(eventspath, 76);
+	event_manager e(eventspath, 76, 0);
 	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
 	assert(e.create(&rec) == 1);
 
 	setup();
-	event_manager f(eventspath, 149);
+	event_manager f(eventspath, 149, 0);
 	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
 	assert(f.create(&rec) == 1);
 	assert(f.create(&rec) == 0);
 
 
+	/* Testing the max limits for event logs */
+	setup();
+	event_manager g(eventspath, 300, 1);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(g.create(&rec) == 1);
+	assert(g.create(&rec) == 0);
+	assert(g.log_count() == 1);
+
+	setup();
+	event_manager h(eventspath, 600, 3);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(h.create(&rec) == 1);
+	assert(h.create(&rec) == 2);
+	assert(h.create(&rec) == 3);
+	assert(h.create(&rec) == 0);
+	assert(h.log_count() == 3);
+
+	/* Create an abundence of logs, then restart with a limited set  */
+	/* You should not be able to create new logs until the log count */
+	/* dips below the request number                                 */
+	setup();
+	event_manager i(eventspath, 600, 3);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(i.create(&rec) == 1);
+	assert(i.create(&rec) == 2);
+	assert(i.create(&rec) == 3);
+	assert(i.create(&rec) == 0);
+	assert(i.log_count() == 3);
+	event_manager j(eventspath, 600, 1);
+	assert(j.log_count() == 3);
+	assert(j.create(&rec) == 0);
+	assert(j.log_count() == 3);
+
+	/* Delete logs to dip below the requested limit */
+	assert(j.remove(3) == 0);
+	assert(j.log_count() == 2);
+	assert(j.create(&rec) == 0);
+	assert(j.remove(2) == 0);
+	assert(j.log_count() == 1);
+	assert(j.create(&rec) == 0);
+	assert(j.remove(1) == 0);
+	assert(j.log_count() == 0);
+	assert(j.create(&rec) == 7);
+
+
 	return 0;
 }
\ No newline at end of file
-- 
2.8.2
