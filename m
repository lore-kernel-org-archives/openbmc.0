Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7BFDA1A0026
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:19:55 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444262681013940.6829595923244;
 Wed, 7 Oct 2015 17:04:41 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH rest-dbus] Add supporting files
Date: Wed,  7 Oct 2015 19:04:38 -0500
Message-Id: <1444262679-18773-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 00:19:56 -0000

Add makefile, systemd service file.
Hardcode resources dir filesystem path.

https://github.com/openbmc/rest-dbus/pull/1

Brad Bishop (1):
  Add supporting files

 Makefile          | 21 +++++++++++++++++++++
 rest-dbus         |  2 +-
 rest-dbus.service |  8 ++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 Makefile
 create mode 100644 rest-dbus.service

-- 
2.6.0
