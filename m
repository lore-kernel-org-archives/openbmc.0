Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 530351A046D
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 17:00:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455775231055702.8722404532826;
 Wed, 17 Feb 2016 22:00:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v2 0/3] Add build script and gitignore
Date: Thu, 18 Feb 2016 00:00:27 -0600
Message-Id: <1455775230-21657-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 18 Feb 2016 06:00:34 -0000

This adds a build script for compiling the software under docker.
It will be used for continuous integration on our Jenkins instance,
and can be used by developers.

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/phosphor-event/pull/9

Joel Stanley (3):
  Add a script to build inside Docker
  Add gitignore
  build: Run make check

 .build.sh  | 24 ++++++++++++++++++++++++
 .gitignore |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100755 .build.sh
 create mode 100644 .gitignore

-- 
2.7.1
