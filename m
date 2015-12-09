Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AF92C1A0FE3
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2015 17:10:10 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449641407177414.99060655112896;
 Tue, 8 Dec 2015 22:10:07 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v2 0/3] Add timestamps to output messages
Date: Wed,  9 Dec 2015 00:10:03 -0600
Message-Id: <1449641406-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 09 Dec 2015 06:10:12 -0000

There have been some problems with timeouts. This should help narrow down where some of the time is going.

https://github.com/openbmc/btbridge/pull/9

Cyril Bur (3):
  Update usage message
  Actually set the verbose flag with --debug
  Improve debugging output, timestamps and syslog

 btbridged.c | 59 +++++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 14 deletions(-)

-- 
2.6.3
