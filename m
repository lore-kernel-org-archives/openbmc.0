Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 126421A0B97
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2015 03:46:44 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446655144175461.6560318721487;
 Wed, 4 Nov 2015 08:39:04 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server 0/5] Support for
 org.openbmc.Object.Enumerate
Date: Wed,  4 Nov 2015 10:38:57 -0600
Message-Id: <1446655142-5884-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 Nov 2015 16:46:46 -0000

And a couple other fixes.

https://github.com/openbmc/phosphor-rest-server/pull/3

Brad Bishop (5):
  Remove unused system bus connection
  Whitespace fixes
  React to mapper API changes.
  Check for path component length
  Make use of org.openbmc.Object.Enumerate

 phosphor-rest | 86 +++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 29 deletions(-)

-- 
2.6.0
