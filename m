Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 777B61A004B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 10:10:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455232233169251.82583855519522;
 Thu, 11 Feb 2016 15:10:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event 0/2] Removing linked list requirements
Date: Thu, 11 Feb 2016 17:10:30 -0600
Message-Id: <1455232232-15412-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 11 Feb 2016 23:10:37 -0000

Two commits, 
one gets ride of me using a linked list the other is for adhering to coding guidelines.  


https://github.com/openbmc/phosphor-event/pull/7

Chris Austen (2):
  Remove dependency on linked lists
  Tabs, spaces and columns

 Makefile               |   2 +-
 event_messaged.C       |  78 +++++-----
 event_messaged_sdbus.c | 258 +++++++++++++++++---------------
 event_messaged_sdbus.h |   4 +-
 list.c                 |  75 ----------
 list.h                 |  23 ---
 message.C              | 394 +++++++++++++++++++++++++------------------------
 message.H              |  85 +++++------
 8 files changed, 425 insertions(+), 494 deletions(-)
 delete mode 100644 list.c
 delete mode 100644 list.h

-- 
2.7.1
