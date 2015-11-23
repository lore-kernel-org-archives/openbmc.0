Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 684531A02B0
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 21:10:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448273407749687.3719574818062;
 Mon, 23 Nov 2015 02:10:07 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v2 0/8] Warning fixes
Date: Mon, 23 Nov 2015 05:09:59 -0500
Message-Id: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 10:10:13 -0000

These were found when building with `-Wall`. The makefile will now build with warnings enabled.

https://github.com/openbmc/btbridge/pull/6

Joel Stanley (8):
  Sort headers
  Add missing include for ioctl
  Remove unused variables
  Fix printf format warnings
  method_send_sms_atn: Log the ioctl number
  bt_host_write: fix invalid check
  Makefile: fix linking and enable -Wall
  Makefile: Allow specifying kenrel header path

 Makefile    |  8 ++++++--
 btbridged.c | 49 +++++++++++++++++++++++--------------------------
 2 files changed, 29 insertions(+), 28 deletions(-)

-- 
2.6.3
