Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rSz6d6sTbzDqbg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 02:40:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465836035535119.62690613718246;
 Mon, 13 Jun 2016 09:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2]  Turn on socket activation for rest-dbus
Date: Mon, 13 Jun 2016 11:40:31 -0500
Message-Id: <20160613164033.16638-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 16:40:42 -0000

Defer starting of rest-dbus until a client connects.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/323)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/323

Brad Bishop (2):
  Support multiple systemd service files
  Turn on socket activation for rest-dbus

 .../classes/obmc-phosphor-systemd.bbclass          | 56 ++++++++++++++++++----
 .../host-ipmi-hw-example.service                   |  9 ----
 .../host-ipmi-hw-example/host-ipmi-hw.service      |  9 ++++
 .../rest-dbus/files/rest-dbus.service              |  3 --
 .../rest-dbus/files/rest-dbus.socket               |  8 ++++
 .../common/recipes-phosphor/rest-dbus/rest-dbus.bb |  5 +-
 6 files changed, 67 insertions(+), 23 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/rest-dbus/files/rest-dbus.socket

-- 
2.8.4
