Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C95281A03C5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 08:54:07 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144494604312284.25355720294306;
 Thu, 15 Oct 2015 14:54:03 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/4] Refresh host-ipmid and install headers
Date: Thu, 15 Oct 2015 16:53:57 -0500
Message-Id: <1444946041-22756-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 21:54:08 -0000

https://github.com/openbmc/openbmc/pull/17

Patrick Williams (4):
  Refactor sdbus-service.bbclass
  -systemd.bbclass incorrect for nativesdk packages
  phosphor-host-ipmid: refresh SRCREV
  rest-dbus: Remove redundant SYSTEMD variable

 meta-phosphor/classes/obmc-phosphor-sdbus-service.bbclass  |  1 -
 meta-phosphor/classes/obmc-phosphor-systemd.bbclass        |  6 +++---
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb       | 14 +++++++++-----
 .../obmc-phosphor-example-sdbus.bb                         |  1 +
 .../obmc-phosphor-fan/obmc-phosphor-fand.bb                |  1 +
 .../common/recipes-phosphor/rest-dbus/rest-dbus.bb         |  2 --
 6 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.6.0
