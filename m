Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D36D41A08A3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 02:01:08 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445266864801577.8633645980588;
 Mon, 19 Oct 2015 08:01:04 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add recipe for https://github.com/msoulier/tftpy
Date: Mon, 19 Oct 2015 10:01:02 -0500
Message-Id: <1445266863-29079-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 15:01:10 -0000

A pure python library for TFTP.

https://github.com/openbmc/openbmc/pull/22

Brad Bishop (1):
  Add recipe for https://github.com/msoulier/tftpy

 .../common/recipes-devtools/python/python-tftpy.bb    | 19 +++++++++++++++++++
 meta-phosphor/common/recipes.txt                      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-tftpy.bb

-- 
2.6.0
