Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A8BDE1A0A01
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 09:22:45 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445293362548894.4867451345843;
 Mon, 19 Oct 2015 15:22:42 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 0/5] Add recipe for
 https://github.com/msoulier/tftpy
Date: Mon, 19 Oct 2015 17:22:36 -0500
Message-Id: <1445293361-739-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 22:22:46 -0000

A pure python library for TFTP.

https://github.com/openbmc/openbmc/pull/22

Adriana Kobylak (1):
  Add skeleton recipe

Brad Bishop (4):
  Skeleton makefile updates for OE build
  Add skeleton to phosphor image
  Add recipe for https://github.com/msoulier/tftpy
  Remove tftpy from skeleton package

 .../common/recipes-devtools/python/python-tftpy.bb |  19 ++++
 .../packagegroup-obmc-phosphor-apps.bb             |   1 +
 .../common/recipes-phosphor/skeleton/skeleton.bb   |  28 +++++
 .../recipes-phosphor/skeleton/skeleton/make.patch  | 120 +++++++++++++++++++++
 .../skeleton/skeleton/skeleton.service             |   8 ++
 meta-phosphor/common/recipes.txt                   |   1 +
 6 files changed, 177 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-tftpy.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/make.patch
 create mode 100755 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/skeleton.service

-- 
2.6.0
