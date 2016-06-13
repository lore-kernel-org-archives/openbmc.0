Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT4D52ddpzDqcg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 06:30:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465849836486572.3286213403029;
 Mon, 13 Jun 2016 13:30:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Add virtual workbook / config-in-skeleton classes
Date: Mon, 13 Jun 2016 15:30:32 -0500
Message-Id: <20160613203034.26033-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 20:30:46 -0000

This patch introduces a new abstraction 'obmc-phosphor-workbook'
for representing a system configuration.  At present it is
pulled in by the skeleton recipe so the requirement on what is
implemented by a package providing obmc-phosphor-workbook is something
compatible with the existing System.py python modules in skeleton.

Additionally this patch adds a new recipe for each system using
a configuration file from skeleton today, and a class for common
configuration.

This enables a couple of things:
 - No need to patch skeleton.service for each system.
 - New systems don't have to put their configuration in the skeleton repository.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/324)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/324

Brad Bishop (2):
  Bump pyphosphor version
  Add virtual workbook / config-in-skeleton classes

 .../recipes-phosphor/skeleton/skeleton.bbappend    |  1 -
 .../skeleton/skeleton/firestone.patch              | 11 --------
 .../recipes-phosphor/workbook/firestone-config.bb  |  8 ++++++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  1 -
 .../skeleton/skeleton/garrison.patch               | 11 --------
 .../recipes-phosphor/workbook/garrison-config.bb   |  8 ++++++
 .../recipes-phosphor/workbook/palmetto-config.bb   |  8 ++++++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  2 --
 .../skeleton/skeleton/skeleton.patch               | 12 ---------
 .../recipes-phosphor/workbook/barreleye-config.bb  |  8 ++++++
 meta-phosphor/classes/config-in-skeleton.bbclass   | 29 ++++++++++++++++++++++
 .../classes/obmc-phosphor-workbook.bbclass         |  5 ++++
 .../dbus/obmc-mapper/obmc-mapper.service           |  2 +-
 .../common/recipes-phosphor/skeleton/pyphosphor.bb |  4 +--
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 23 ++++++-----------
 .../skeleton/skeleton/skeleton.service             |  2 +-
 16 files changed, 78 insertions(+), 57 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
 create mode 100644 meta-phosphor/classes/config-in-skeleton.bbclass
 create mode 100644 meta-phosphor/classes/obmc-phosphor-workbook.bbclass

-- 
2.8.4
