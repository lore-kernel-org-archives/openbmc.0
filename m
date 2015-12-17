Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4862F1A0327
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 12:20:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450315225924576.2013484283714;
 Wed, 16 Dec 2015 17:20:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4 0/2] IPMID boot options changes
Date: Wed, 16 Dec 2015 19:20:23 -0600
Message-Id: <1450315225-22284-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 17 Dec 2015 01:20:30 -0000

1) Implemented ipmid_boot_option_set/get with respect to petitboot requirements.
2) Boot options are handled via dbus property "host_settings".
3) Conversion between dbus property and ipmid command is carefully handled.
4) Service name is got via object mapper.

https://github.com/openbmc/phosphor-host-ipmid/pull/51

Chris Austen (1):
  Support host reboot

shgoupf (1):
  Add get/set ipmid command support with correct DBUS property handling.

 chassishandler.C | 290 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 chassishandler.h |   8 ++
 2 files changed, 289 insertions(+), 9 deletions(-)

-- 
2.6.3
