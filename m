Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 377E21A0D02
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2015 14:59:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446867635198417.0095899744259;
 Fri, 6 Nov 2015 19:40:35 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable robottest for ssh
Date: Fri,  6 Nov 2015 21:40:29 -0600
Message-Id: <1446867630-18102-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 07 Nov 2015 03:59:07 -0000

Dropbear last year added a change that breaks the SSHLibrary for
robot test framework.

Details about the problem...
https://github.com/robotframework/SSHLibrary/issues/128

The actual commit that caused the problem
https://github.com/mkj/dropbear/commit/ca86726f9f943b2b18e5694b442d3d2e1c0fa903

https://github.com/openbmc/openbmc/pull/70

Chris Austen (1):
  Enable robottest for ssh

 yocto-poky/meta/recipes-core/dropbear/dropbear.inc |  1 +
 ...0-stop-robot-test-SSHLibrary-from-hanging.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch

-- 
2.6.0
