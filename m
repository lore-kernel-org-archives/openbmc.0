Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D9B11A0BF3
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 04:39:42 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446140380534861.7009968706172;
 Thu, 29 Oct 2015 10:39:40 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH rest-dbus 0/3] Handle sdbus services better
Date: Thu, 29 Oct 2015 12:39:34 -0500
Message-Id: <1446140377-7626-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 17:39:43 -0000

https://github.com/openbmc/rest-dbus/pull/4

Brad Bishop (3):
  Remove session bus from bus list
  Add setuptools install script
  Address sdbus service discovery issue

 rest-dbus | 37 ++++++-------------------------------
 setup.cfg |  2 ++
 setup.py  |  9 +++++++++
 3 files changed, 17 insertions(+), 31 deletions(-)
 mode change 100755 => 100644 rest-dbus
 create mode 100644 setup.cfg
 create mode 100644 setup.py

-- 
2.6.0
