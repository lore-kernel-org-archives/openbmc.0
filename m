Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B5D6D1A05FF
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:20:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14482884252535.200280525598714;
 Mon, 23 Nov 2015 06:20:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] travis: Add Travis CI building
Date: Mon, 23 Nov 2015 09:20:23 -0500
Message-Id: <1448288424-18295-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Mon, 23 Nov 2015 14:20:29 -0000

Builds on Ubuntu 15.10 under docker.

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/phosphor-host-ipmid/pull/42

Joel Stanley (1):
  travis: Add Travis CI building

 .build.sh   | 20 ++++++++++++++++++++
 .travis.yml |  9 +++++++++
 2 files changed, 29 insertions(+)
 create mode 100755 .build.sh
 create mode 100644 .travis.yml

-- 
2.6.3
