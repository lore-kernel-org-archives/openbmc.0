Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CEDAE1A099E
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 23:22:04 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446380520354578.8234303018738;
 Sun, 1 Nov 2015 04:22:00 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] keeping fru files forever
Date: Sun,  1 Nov 2015 06:21:57 -0600
Message-Id: <1446380518-18602-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 12:22:06 -0000

added correct ipmi response buffer
cleaned up a incorrect rc

https://github.com/openbmc/ipmi-fru-parser/pull/4

Chris Austen (1):
  keeping fru files forever

 frup.h         |  7 ++++++-
 writefrudata.C | 45 ++++++++++++++++++++-------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.6.0
