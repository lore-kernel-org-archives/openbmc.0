Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B501F1A05C9
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2016 02:00:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454166020709581.8218940512373;
 Sat, 30 Jan 2016 07:00:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add settings dbus object to openbmc image
Date: Sat, 30 Jan 2016 09:00:18 -0600
Message-Id: <1454166019-11927-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Jan 2016 15:00:25 -0000

Create settings recipe and service files
Add dependency to settings to the ipmid recipe
since the upcoming ipmi boot flags use this
settings dbus object

https://github.com/openbmc/openbmc/pull/151

Adriana Kobylak (1):
  Add settings dbus object to openbmc image

 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  3 +--
 .../common/recipes-phosphor/settings/settings.bb   | 22 ++++++++++++++++++++++
 .../settings/settings/settings.service             | 10 ++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/settings/settings.bb
 create mode 100755 meta-phosphor/common/recipes-phosphor/settings/settings/settings.service

-- 
2.6.4
