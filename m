Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r85lZ4YrJzDq64
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 15:40:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463463639838379.593658008774;
 Mon, 16 May 2016 22:40:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Create a possible limit to the number of logs
 recorded
Date: Tue, 17 May 2016 00:40:37 -0500
Message-Id: <1463463638-4870-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Tue, 17 May 2016 05:40:43 -0000

https://github.com/openbmc/openbmc/issues/268

There was a technique that created over 1000 event logs.  This taxed
the REST interface a lot.  It caused connections to time out.  I am
adding a way to limit the number of physical logs irregardless of the
size.  Like the size limiter, logs are not deleted automatically.

That may actually be a debate (save new logs, delete old logs) vs
(delete new logs, save old logs).  I welcome the suggestions.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-event/18)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-event/pull/18

Chris Austen (1):
  Create a possible limit to the number of logs recorded

 event_messaged.C | 10 +++++++---
 message.C        | 14 ++++++++++++--
 message.H        |  3 ++-
 test.C           | 59 +++++++++++++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 73 insertions(+), 13 deletions(-)

-- 
2.8.2
