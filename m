Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVyWc6SwjzDqs8
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 08:20:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466115639518244.24988203821988;
 Thu, 16 Jun 2016 15:20:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] event log limit not considering preexisting
 logs
Date: Thu, 16 Jun 2016 17:20:37 -0500
Message-Id: <20160616222037.2863-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616222037.2863-1-openbmc-patches@stwcx.xyz>
References: <20160616222037.2863-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 22:20:45 -0000

From: Chris Austen <austenc@us.ibm.com>

Turns out the code that checks for event log size limitations forgot
to take in to account the total size of logs that already existed.  So
it would let you create the max size of new logs rather then new+old.

I fixed this by initializing the variable when the process starts.  I
also added a test case that catches the problem.
---
 message.C |  2 +-
 test.C    | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/message.C b/message.C
index 6f77f8c..974b295 100644
--- a/message.C
+++ b/message.C
@@ -42,7 +42,7 @@ event_manager::event_manager(string path, size_t reqmaxsize, uint16_t reqmaxlogs
 	logcount = 0;
 	maxsize = -1;
 	maxlogs = -1;
-	currentsize = 0;
+	currentsize = get_managed_size();
 
 	if (reqmaxsize)
 		maxsize = reqmaxsize;
diff --git a/test.C b/test.C
index 4234543..47d4c7c 100644
--- a/test.C
+++ b/test.C
@@ -180,6 +180,20 @@ int main(int argc, char *argv[])
 	assert(j.log_count() == 0);
 	assert(j.create(&rec) == 7);
 
+	/* Create an abundence of logs, then restart with a limited set  */
+	/* You should not be able to create new logs until the log size  */
+	/* dips below the request number                                 */
+	setup();
+	event_manager k(eventspath, 600, 100);
+	build_event_record(&rec,"Testing Message1", "Info", "Association", "Test", p, 4);
+	assert(k.create(&rec) == 1);
+	assert(k.create(&rec) == 2);
+	/* Now we have consumed 150 bytes */
+	event_manager l(eventspath, 151, 100);
+	assert(l.create(&rec) == 0);
+	assert(l.remove(2) == 0);
+	assert(l.create(&rec) == 4);
+
 
 	return 0;
 }
\ No newline at end of file
-- 
2.8.4
