Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B736B1A0244
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 06:30:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452627025499712.603770157626;
 Tue, 12 Jan 2016 11:30:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Upgrade to Dropbear 71
Date: Tue, 12 Jan 2016 13:30:23 -0600
Message-Id: <1452627024-28414-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Tue, 12 Jan 2016 19:30:30 -0000

The issue I asked to be fixed is in the new version of dropbear.
The problem was causing robot test code from running remote
commands like ipmitool.  I had to work around the issue building
my own private 'requests' robot code.  Now that it is fixed
you do not need any special code for Robot test automation
Additional details can be found here...
https://github.com/robotframework/SSHLibrary/issues/128

https://github.com/openbmc/openbmc/pull/131

Chris Austen (1):
  Upgrade to Dropbear 71

 yocto-poky/meta/recipes-core/dropbear/dropbear.inc |  1 -
 ...0-stop-robot-test-SSHLibrary-from-hanging.patch | 28 ----------------------
 .../meta/recipes-core/dropbear/dropbear_2015.68.bb |  4 ----
 .../meta/recipes-core/dropbear/dropbear_2015.71.bb |  4 ++++
 4 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch
 delete mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear_2015.71.bb

-- 
2.6.4
