Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2F66C1A0A01
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:36 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293352934468.8258942649496;
 Mon, 19 Oct 2015 15:22:32 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] Add Barreleye
Date: Mon, 19 Oct 2015 17:22:28 -0500
Message-Id: <1445293351-658-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:36 -0000

https://github.com/openbmc/openbmc/pull/23

Brad Bishop (3):
  Move palmetto configuration to openpower layer
  Add palmetto recipes-bsp description
  Add stubbed barreleye/foxconn layers

 .../conf/machine/include/openpower.inc             |  19 ++
 .../meta-openpower/meta-foxconn/conf/layer.conf    |   5 +
 .../meta-foxconn/conf/machine/include/foxconn.inc  |   1 +
 .../meta-barreleye/conf/bblayers.conf.sample       |  27 +++
 .../meta-barreleye/conf/conf-notes.txt             |   2 +
 .../meta-foxconn/meta-barreleye/conf/layer.conf    |   5 +
 .../meta-barreleye/conf/local.conf.sample          | 245 +++++++++++++++++++++
 .../meta-barreleye/conf/machine/barreleye.conf     |  12 +
 .../meta-ibm/conf/machine/include/ibm.inc          |   1 +
 .../meta-palmetto/conf/machine/palmetto.conf       |  21 +-
 .../meta-ibm/meta-palmetto/recipes.txt             |   1 +
 11 files changed, 319 insertions(+), 20 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/conf/machine/include/openpower.inc
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/conf/machine/include/foxconn.inc
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/conf/machine/include/ibm.inc

-- 
2.6.0
