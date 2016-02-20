Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B30E21A0975
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 02:20:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455981632311313.6216671662679;
 Sat, 20 Feb 2016 07:20:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Remove forced flush
Date: Sat, 20 Feb 2016 09:20:30 -0600
Message-Id: <1455981630-30518-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455981630-30518-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455981630-30518-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 20 Feb 2016 15:20:38 -0000

From: Chris Austen <austenc@us.ibm.com>

it didn't do what we wanted.
---
 message.C | 1 -
 1 file changed, 1 deletion(-)

diff --git a/message.C b/message.C
index 2e52b67..42921c7 100644
--- a/message.C
+++ b/message.C
@@ -220,7 +220,6 @@ uint16_t event_manager::create_log_event(event_record_t *rec)
 	myfile.write((char*) rec->association, hdr.associationlen);
 	myfile.write((char*) rec->reportedby, hdr.reportedbylen);
 	myfile.write((char*) rec->p, hdr.debugdatalen);
-	myfile.flush();
 	myfile.close();
 
 	logcount++;
-- 
2.7.1
