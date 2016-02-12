Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 67C0C1A005A
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 04:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455297025286969.4626448249451;
 Fri, 12 Feb 2016 09:10:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2] Recipe update: User management, systemd patch,
 IPMI net functions
Date: Fri, 12 Feb 2016 11:10:23 -0600
Message-Id: <1455297024-15339-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Fri, 12 Feb 2016 17:10:30 -0000

Create virtual class to include user management in the image
Add the systemd patch for network support to the systemd recipe
Update the IPMI recipe to pickup the support for network configuration

https://github.com/openbmc/openbmc/pull/177

Adriana Kobylak (1):
  Recipe update: User management, systemd patch, IPMI net functions

 .../conf/machine/include/openpower.inc             |  2 ++
 meta-phosphor/classes/obmc-phosphor-image.bbclass  |  3 +++
 .../classes/obmc-phosphor-user-mgmt.bbclass        |  4 ++++
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |  2 +-
 .../files/obmc-phosphor-user.service               |  8 ++++++++
 .../obmc-phosphor-user/obmc-phosphor-user.bb       | 24 ++++++++++++++++++++++
 .../packagegroup-obmc-phosphor-apps.bb             |  7 +++++++
 meta-phosphor/common/recipes-phosphor/user/user.bb | 21 -------------------
 .../common/recipes-phosphor/user/user/user.service | 10 ---------
 meta-phosphor/conf/distro/openbmc-phosphor.conf    |  1 +
 meta-phosphor/conf/machine/include/sample.inc      |  1 +
 .../meta/recipes-core/systemd/systemd_225.bb       |  1 +
 12 files changed, 52 insertions(+), 32 deletions(-)
 create mode 100644 meta-phosphor/classes/obmc-phosphor-user-mgmt.bbclass
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/files/obmc-phosphor-user.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-user/obmc-phosphor-user.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/user/user.bb
 delete mode 100644 meta-phosphor/common/recipes-phosphor/user/user/user.service

-- 
2.7.1
