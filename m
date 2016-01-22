Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C3DA91A07C7
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 23:20:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453465243056887.7311040994866;
 Fri, 22 Jan 2016 04:20:43 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2] Refactored LED control dbus methods
Date: Fri, 22 Jan 2016 06:20:41 -0600
Message-Id: <1453465242-8067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 12:20:47 -0000

https://github.com/openbmc/skeleton/pull/32

vishwa (1):
  Refactored LED control dbus methods

 Makefile                     |   5 +-
 objects/led_controller_new.c | 448 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 452 insertions(+), 1 deletion(-)
 create mode 100755 objects/led_controller_new.c

-- 
2.6.4
