Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1C7311A026D
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 00:19:12 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446037363563845.419847041929;
 Wed, 28 Oct 2015 06:02:43 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Handle event messages
Date: Wed, 28 Oct 2015 08:02:40 -0500
Message-Id: <1446037361-5786-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Wed, 28 Oct 2015 13:19:13 -0000

https://github.com/openbmc/phosphor-event/pull/1

Chris Austen (1):
  Handle event messages

 Makefile         |  26 ++++++
 event_messaged.c | 279 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 event_messaged.h |   6 ++
 3 files changed, 311 insertions(+)
 create mode 100644 Makefile
 create mode 100644 event_messaged.c
 create mode 100644 event_messaged.h

-- 
2.6.0
