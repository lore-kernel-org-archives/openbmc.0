Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DE79E1A0C11
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 13:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448331023725612.5647207754811;
 Mon, 23 Nov 2015 18:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v3 0/3] Add delete for error logs
Date: Mon, 23 Nov 2015 21:10:19 -0500
Message-Id: <1448331022-8770-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Tue, 24 Nov 2015 02:10:28 -0000

This supports both deleting individual logs
and all logs

https://github.com/openbmc/phosphor-event/pull/2

Chris Austen (3):
  Add delete for error logs
  Add signal support add/remove
  Move to size_t for logid

 Makefile         |   1 +
 event_messaged.c | 207 ++++++++++++++++++++++++++++++++++++-------------------
 list.c           |  75 ++++++++++++++++++++
 list.h           |  23 +++++++
 4 files changed, 234 insertions(+), 72 deletions(-)
 create mode 100644 list.c
 create mode 100644 list.h

-- 
2.6.3
