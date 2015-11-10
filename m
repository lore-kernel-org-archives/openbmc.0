Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A3EB1A027B
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 05:20:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447179610984799.0981850410426;
 Tue, 10 Nov 2015 10:20:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] eeprom read CLI
Date: Tue, 10 Nov 2015 13:20:09 -0500
Message-Id: <1447179610-896-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 Nov 2015 18:20:17 -0000

Moved write fru data registration onto a new .so due to an undefined "register_callback" in writefru.so 
writefrudata.so now can be linked to both function:6 and also this readeeprom.

https://github.com/openbmc/ipmi-fru-parser/pull/5

vishwa (1):
  eeprom read CLI

 Makefile        | 20 ++++++++----
 argument.C      | 59 +++++++++++++++++++++++++++++++++++
 argument.H      | 27 ++++++++++++++++
 readeeprom.C    | 45 ++++++++++++++++++++++++++
 strgfnhandler.C | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 writefrudata.C  | 90 ----------------------------------------------------
 writefrudata.H  |  1 +
 7 files changed, 243 insertions(+), 96 deletions(-)
 create mode 100644 argument.C
 create mode 100644 argument.H
 create mode 100644 readeeprom.C
 create mode 100644 strgfnhandler.C

-- 
2.6.3
