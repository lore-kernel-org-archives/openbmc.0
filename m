Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 58F6A1A02AD
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:50:10 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448272207978405.73464409084465;
 Mon, 23 Nov 2015 01:50:07 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 0/7] Warning fixes
Date: Mon, 23 Nov 2015 04:50:00 -0500
Message-Id: <1448272207-10877-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 09:50:11 -0000

These were found when building with `-Wall`. The makefile will now build with warnings enabled.

https://github.com/openbmc/btbridge/pull/6

Joel Stanley (7):
  Sort headers
  Add missing include for ioctl
  Remove unused variables
  Fix printf format warnings
  method_send_sms_atn: Log the ioctl number
  bt_host_write: fix invalid check
  Makefile: fix linking and enable -Wall

 Makefile    |  4 ++--
 btbridged.c | 49 +++++++++++++++++++++++--------------------------
 2 files changed, 25 insertions(+), 28 deletions(-)

-- 
2.6.3
