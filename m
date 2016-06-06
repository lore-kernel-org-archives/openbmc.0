Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNLpf3FCqzDqGn
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 14:10:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465186247528809.3965126619955;
 Sun, 5 Jun 2016 21:10:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH phosphor-objmgr] Performance improvements
Date: Sun,  5 Jun 2016 23:10:45 -0500
Message-Id: <20160606041046.18724-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Mon, 06 Jun 2016 04:10:51 -0000

Prior to this patch, an excessive ( more than zero ) number of dbus
calls were made to determine if a signal was something we care about.
This patch adds a well-known to unique connection name translation cache
eliminating all outgoing dbus calls.

Also removed the abstraction layer that obscured this as it isn't used.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

https://github.com/openbmc/phosphor-objmgr/pull/12

Brad Bishop (1):
  Performance improvements

 phosphor-mapper | 102 ++++++++++++++++++++++++++------------------------------
 1 file changed, 47 insertions(+), 55 deletions(-)

-- 
2.8.3
