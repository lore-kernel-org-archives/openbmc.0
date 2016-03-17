Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQdWf5vsPzDqWs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 17:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458195627819106.40854420321034;
 Wed, 16 Mar 2016 23:20:27 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Add support for limiting the size of the event
 log DB
Date: Thu, 17 Mar 2016 01:20:26 -0500
Message-Id: <1458195627-21825-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Thu, 17 Mar 2016 06:20:31 -0000

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

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-event/15)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-event/pull/15

Chris Austen (1):
  Add support for limiting the size of the event log DB

 event_messaged.C | 30 +++++++++++++++++--
 message.C        | 87 +++++++++++++++++++++++++++++++++++++++++++++-----------
 message.H        |  5 +++-
 test.C           | 30 +++++++++++++++----
 4 files changed, 128 insertions(+), 24 deletions(-)

-- 
2.7.1
