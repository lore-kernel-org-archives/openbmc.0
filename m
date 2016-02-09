Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D74721A0191
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 14:10:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454987425352800.8866170535965;
 Mon, 8 Feb 2016 19:10:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v2] Event Logs to survive a reboot
Date: Mon,  8 Feb 2016 21:10:23 -0600
Message-Id: <1454987424-17512-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Tue, 09 Feb 2016 03:10:29 -0000

The event service stores the events from the host.  Before this commit all the code was in memory.  That meant once a reboot occured you lost the logs.  With this commit I am storing all logs to the file system.  This refactoring also enables a test suite.  The suite can be invoked by 'make test; ./test'.

1) /var/sys/obmc/events/x
2) logs are stored in binary and saved
3) Each log now has a timestamp of when the log reached the service
4) I added a caching mechanism to reduce the io traffic if the the method is simply being called to capture the next parameter
5) You will notice a mixture of c/c++.  This is because I want the test infrastructure to take advantage of c++ features

Useful REST calls
~~~~~~~~~~~~~~~~~
Note, dont forget to login first

List all events
curl -k https://bmc/org/openbmc/records/events/

Create an event log for testing purposes
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/records/events/action/acceptTestMessage

Delete an event
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/records/events/1/action/delete

Delete all events
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/records/events/action/clear

https://github.com/openbmc/phosphor-event/pull/6

Chris Austen (1):
  Event Logs to survive a reboot

 Makefile               |  30 ++--
 event_messaged.C       |  58 +++++++
 event_messaged.c       | 341 --------------------------------------
 event_messaged_sdbus.c | 442 +++++++++++++++++++++++++++++++++++++++++++++++++
 event_messaged_sdbus.h |  14 ++
 message.C              | 291 ++++++++++++++++++++++++++++++++
 message.H              |  89 ++++++++++
 test.C                 | 114 +++++++++++++
 8 files changed, 1027 insertions(+), 352 deletions(-)
 create mode 100644 event_messaged.C
 delete mode 100644 event_messaged.c
 create mode 100644 event_messaged_sdbus.c
 create mode 100644 event_messaged_sdbus.h
 create mode 100644 message.C
 create mode 100644 message.H
 create mode 100644 test.C

-- 
2.6.4
