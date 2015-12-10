Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A8FF1A0B56
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:40:09 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449722407259524.5991977495769;
 Wed, 9 Dec 2015 20:40:07 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v3 0/4] Add timestamps to output messages
Date: Wed,  9 Dec 2015 22:40:02 -0600
Message-Id: <1449722406-13608-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 10 Dec 2015 04:40:10 -0000

There have been some problems with timeouts. This should help narrow down where some of the time is going.

https://github.com/openbmc/btbridge/pull/9

Cyril Bur (4):
  Update usage message
  Actually set the verbose flag with --debug
  Improve debugging output, timestamps and syslog
  Replace --verbose with --v and --debug with --vv

 btbridged.c | 79 +++++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 26 deletions(-)

-- 
2.6.3
