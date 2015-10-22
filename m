Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6F01A051F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:31:39 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481097226457.20405254653053;
 Wed, 21 Oct 2015 19:31:37 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Remove example applications from palmetto build.
Date: Wed, 21 Oct 2015 21:31:33 -0500
Message-Id: <1445481095-29630-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:31:39 -0000

https://github.com/openbmc/openbmc/pull/32

Brad Bishop (2):
  Remove example applications from build.
  Remove example applications from build.

 .../meta-openpower/conf/machine/include/openpower.inc     | 15 +++++++++++----
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb      |  1 -
 .../common/recipes-phosphor/skeleton/skeleton.bb          |  7 +++++++
 meta-phosphor/conf/machine/include/sample.inc             |  7 +++++++
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.6.0
