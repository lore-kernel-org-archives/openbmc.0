Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 139841A0A15
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 13:02:19 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144530653515713.353198039168092;
 Mon, 19 Oct 2015 19:02:15 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] bump skeleton version
Date: Mon, 19 Oct 2015 21:02:10 -0500
Message-Id: <1445306532-30574-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 02:02:20 -0000

https://github.com/openbmc/openbmc/pull/24

Brad Bishop (2):
  Move host-ipmi-bt from palmetto to common include
  Bump skeleton revision

 .../conf/machine/include/openpower.inc             |   2 +
 .../meta-palmetto/conf/machine/palmetto.conf       |   2 -
 .../common/recipes-phosphor/skeleton/skeleton.bb   |   3 +-
 .../recipes-phosphor/skeleton/skeleton/make.patch  | 120 ---------------------
 4 files changed, 3 insertions(+), 124 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/skeleton/skeleton/make.patch

-- 
2.6.0
