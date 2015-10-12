Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 32AA21A0743
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:16:45 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659402373697.2131277495824;
 Mon, 12 Oct 2015 07:16:42 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/7] bitbake and package files for host-ipmid
Date: Mon, 12 Oct 2015 09:16:33 -0500
Message-Id: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:16:46 -0000

https://github.com/openbmc/openbmc/pull/14

Brad Bishop (6):
  Add kernel-cuimage class
  Allow login on ttyS4
  Add recipes-connectivity recipes.txt description
  Add linux-obmc kernel recipe
  Move Palmetto specific metadata to Palmetto layer
  Move Palmetto specific metadata to Palmetto layer

vishwabmc (1):
  bitbake and package files for host-ipmid

 .../host-ipmid/files/host-ipmid.service              |  8 ++++++++
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb | 20 ++++++++++++++++++++
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb

-- 
2.6.0
