Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D5CDF1A0B68
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 03:50:13 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449075011106820.9165545538139;
 Wed, 2 Dec 2015 08:50:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] set present status True after updating
 inventory
Date: Wed,  2 Dec 2015 11:50:09 -0500
Message-Id: <1449075010-7221-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Dec 2015 16:50:14 -0000

https://github.com/openbmc/ipmi-fru-parser/pull/9

vishwa (1):
  set present status True after updating inventory

 readeeprom.C    |  3 +-
 strgfnhandler.C |  6 +++-
 writefrudata.C  | 93 ++++++++++++++++++++++++++++++++++++---------------------
 writefrudata.H  | 14 ++++++++-
 4 files changed, 79 insertions(+), 37 deletions(-)

-- 
2.6.3
