Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EF5791A0464
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 16:40:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455774028488624.996274379542;
 Wed, 17 Feb 2016 21:40:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event 0/2] Add build script and gitignore
Date: Wed, 17 Feb 2016 23:40:25 -0600
Message-Id: <1455774027-20972-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Thu, 18 Feb 2016 05:40:35 -0000

This adds a build script for compiling the software under docker.
It will be used for continuous integration on our Jenkins instance,
and can be used by developers.

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/phosphor-event/pull/9

Joel Stanley (2):
  Add a script to build inside Docker
  Add gitignore

 .build.sh  | 22 ++++++++++++++++++++++
 .gitignore |  3 +++
 2 files changed, 25 insertions(+)
 create mode 100755 .build.sh
 create mode 100644 .gitignore

-- 
2.7.1
