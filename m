Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C43911A065A
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 20:50:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453456211647405.56856106174155;
 Fri, 22 Jan 2016 01:50:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v5] Set Fault and Present status while
 handling fru
Date: Fri, 22 Jan 2016 03:50:10 -0600
Message-Id: <1453456211-3044-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 22 Jan 2016 09:50:15 -0000

https://github.com/openbmc/ipmi-fru-parser/pull/10

vishwa (1):
  Set Fault and Present status while handling fru

 fru-area.H      | 154 ++++++++++++
 readeeprom.C    |  10 +-
 strgfnhandler.C |  25 +-
 writefrudata.C  | 770 +++++++++++++++++++++++++++++++++++---------------------
 writefrudata.H  |  11 +-
 5 files changed, 652 insertions(+), 318 deletions(-)
 create mode 100644 fru-area.H

-- 
2.6.4
