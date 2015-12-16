Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9904A1A1171
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 23:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14502702264771010.8198634126722;
 Wed, 16 Dec 2015 04:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3 0/6] IPMID boot options changes
Date: Wed, 16 Dec 2015 06:50:19 -0600
Message-Id: <1450270225-2497-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 16 Dec 2015 12:50:31 -0000

1) Implemented ipmid_boot_option_set/get with respect to petitboot requirements.
2) Boot options are handled via dbus property "host_settings".
3) Conversion between dbus property and ipmid command is carefully handled.
4) Service name is got via object mapper.

https://github.com/openbmc/phosphor-host-ipmid/pull/51

Chris Austen (1):
  Support host reboot

shgoupf (5):
  Add get/set ipmid command support with correct DBUS property handling.
  Revert "Add get/set ipmid command support with correct DBUS property
    handling."
  Redo: Add get/set ipmid boot option command support with correct DBUS
    property handling.
  Cleanup codes for ipmid boot option changes.
  Get service name via object mapper

 chassishandler.C | 290 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 chassishandler.h |   8 ++
 2 files changed, 289 insertions(+), 9 deletions(-)

-- 
2.6.3
