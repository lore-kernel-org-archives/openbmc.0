Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8CF5F1A0E27
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 04:30:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145408863989595.8770889440242;
 Fri, 29 Jan 2016 09:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3] Refactored LED control dbus methods
Date: Fri, 29 Jan 2016 11:30:38 -0600
Message-Id: <1454088639-9831-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 29 Jan 2016 17:30:43 -0000

https://github.com/openbmc/skeleton/pull/32

vishwa (1):
  Refactored LED control dbus methods

 Makefile                     |   5 +-
 objects/led_controller_new.c | 488 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 492 insertions(+), 1 deletion(-)
 create mode 100755 objects/led_controller_new.c

-- 
2.6.4
