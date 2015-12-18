Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 166BE1A1A22
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 20:20:13 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450430410539671.5147605818908;
 Fri, 18 Dec 2015 01:20:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v3] Set Fault and Present status while
 handling fru
Date: Fri, 18 Dec 2015 03:20:08 -0600
Message-Id: <1450430409-11751-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 09:20:14 -0000

https://github.com/openbmc/ipmi-fru-parser/pull/10

vishwa (1):
  Set Fault and Present status while handling fru

 fru-area.H      | 153 ++++++++++++
 readeeprom.C    |   9 +-
 strgfnhandler.C |  21 +-
 writefrudata.C  | 759 ++++++++++++++++++++++++++++++++++++--------------------
 writefrudata.H  |  23 +-
 5 files changed, 669 insertions(+), 296 deletions(-)
 create mode 100644 fru-area.H

-- 
2.6.3
