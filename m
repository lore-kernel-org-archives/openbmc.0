Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTWlC2m31zDqdy
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 00:10:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465913439299711.968499714521;
 Tue, 14 Jun 2016 07:10:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/2] Add virtual workbook / config-in-skeleton
 classes
Date: Tue, 14 Jun 2016 09:10:33 -0500
Message-Id: <20160614141035.5170-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 14:10:48 -0000

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

 .../conf/machine/include/openpower.inc             |  2 ++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  1 -
 .../skeleton/skeleton/firestone.patch              | 11 ---------
 .../recipes-phosphor/workbook/firestone-config.bb  |  8 +++++++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  1 -
 .../skeleton/skeleton/garrison.patch               | 11 ---------
 .../recipes-phosphor/workbook/garrison-config.bb   |  8 +++++++
 .../recipes-phosphor/workbook/palmetto-config.bb   |  8 +++++++
 .../recipes-phosphor/skeleton/skeleton.bbappend    |  2 --
 .../skeleton/skeleton/skeleton.patch               | 12 ----------
 .../recipes-phosphor/workbook/barreleye-config.bb  |  8 +++++++
 meta-phosphor/classes/config-in-skeleton.bbclass   | 28 ++++++++++++++++++++++
 .../dbus/obmc-mapper/obmc-mapper.service           |  2 +-
 .../common/recipes-phosphor/skeleton/pyphosphor.bb |  4 ++--
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 25 ++++++++-----------
 .../skeleton/skeleton/skeleton.service             |  2 +-
 16 files changed, 76 insertions(+), 57 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/workbook/firestone-config.bb
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/workbook/garrison-config.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-phosphor/workbook/palmetto-config.bb
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton.bbappend
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/skeleton/skeleton/skeleton.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-phosphor/workbook/barreleye-config.bb
 create mode 100644 meta-phosphor/classes/config-in-skeleton.bbclass

-- 
2.8.4
