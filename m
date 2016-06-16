Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW0WR1MZkzDqkk
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 09:50:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466121035731987.2742471411143;
 Thu, 16 Jun 2016 16:50:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2 1/2] Add config-in-skeleton variables
 OBMC_SKELETON_REPO
Date: Thu, 16 Jun 2016 18:50:32 -0500
Message-Id: <20160616235033.5759-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616235033.5759-1-openbmc-patches@stwcx.xyz>
References: <20160616235033.5759-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 23:50:44 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Add OBMC_SKELETON_REPO and OBMC_SKELETON_MACHINE.

This makes it easy to point at an alternate repository when hacking
on new systems, before support for the new system is mainlined.

OBMC_SKELETON_REPO: an alternate skeleton repository or branch.
    - The default is "github:openbmc/skeleton"
OBMC_SKELETON_MACHINE: an alternate machine to use within skeleton.
    - The default is "${MACHINE}"

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/classes/config-in-skeleton.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/classes/config-in-skeleton.bbclass b/meta-phosphor/classes/config-in-skeleton.bbclass
index 33266be..5a290da 100644
--- a/meta-phosphor/classes/config-in-skeleton.bbclass
+++ b/meta-phosphor/classes/config-in-skeleton.bbclass
@@ -4,11 +4,14 @@
 inherit allarch
 inherit setuptools
 
-SRC_URI += "git://github.com/openbmc/skeleton;subpath=configs"
+OBMC_SKELETON_REPO ?= "git://github.com/openbmc/skeleton"
+OBMC_SKELETON_MACHINE ?= "${MACHINE}"
+
+SRC_URI += "${OBMC_SKELETON_REPO};subpath=configs"
 S = "${WORKDIR}/configs"
 
 python() {
-	machine = d.getVar('MACHINE', True).capitalize() + '.py'
+	machine = d.getVar('OBMC_SKELETON_MACHINE', True).capitalize() + '.py'
 	d.setVar('_config_in_skeleton', machine)
 }
 
-- 
2.8.4
