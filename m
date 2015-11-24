Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5C2771A004B
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 03:30:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14483826118411002.8250822330363;
 Tue, 24 Nov 2015 08:30:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v3] eeprom read CLI
Date: Tue, 24 Nov 2015 11:30:10 -0500
Message-Id: <1448382611-17450-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 16:30:14 -0000

Moved write fru data registration onto a new .so due to an undefined "register_callback" in writefru.so 
writefrudata.so now can be linked to both function:6 and also this readeeprom.

https://github.com/openbmc/ipmi-fru-parser/pull/5

vishwa (1):
  eeprom read CLI

 Makefile        |  33 +++++++++++-----
 argument.C      |  62 +++++++++++++++++++++++++++++
 argument.H      |  27 +++++++++++++
 readeeprom.C    |  71 +++++++++++++++++++++++++++++++++
 strgfnhandler.C | 102 +++++++++++++++++++++++++++++++++++++++++++++++
 writefrudata.C  | 120 +++++++-------------------------------------------------
 writefrudata.H  |   3 ++
 7 files changed, 303 insertions(+), 115 deletions(-)
 create mode 100644 argument.C
 create mode 100644 argument.H
 create mode 100644 readeeprom.C
 create mode 100644 strgfnhandler.C

-- 
2.6.3
