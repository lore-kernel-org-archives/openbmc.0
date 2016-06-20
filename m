Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYC0y1GmNzDq60
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jun 2016 23:50:25 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466430617642236.82114069037095;
 Mon, 20 Jun 2016 06:50:17 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH docs] Add Gerrit server info to contributing doc
Date: Mon, 20 Jun 2016 08:50:13 -0500
Message-Id: <20160620135013.21797-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160620135013.21797-1-openbmc-patches@stwcx.xyz>
References: <20160620135013.21797-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 13:50:27 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add steps to setup and push changes to the openbmc gerrit server.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 contributing.md | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/contributing.md b/contributing.md
index db485a0..fb24acd 100644
--- a/contributing.md
+++ b/contributing.md
@@ -84,6 +84,36 @@ The guidelines in the Linux kernel are very useful:
 
 Your contribution will generally need to be reviewed before being accepted.
 
+
+Submitting changes via Gerrit server
+------------------------------------
+
+The openbmc gerrit server is https://gerrit.openbmc-project.xyz/#/q/status:open
+
+If you're going to be working with gerrit often, it's useful to create an SSH
+host block in ~/.ssh/config. Ex:
+```
+Host openbmc.gerrit
+        Hostname gerrit.openbmc-project.xyz
+        Port 29418
+        User your_github_id
+```
+
+From your openbmc git repository, add a remote to the gerrit server, where
+<openbmc_repo> is the current git repository you're working on, such as
+phosphor-rest-server:
+`remote add gerrit ssh://your_github_id@openbmc.gerrit/openbmc/openbmc_repo`
+
+Obtain the git hook commit-msg to automatically add a Change-Id to the commit
+message, which is needed by Gerrit:
+`gitdir=$(git rev-parse --git-dir)`
+`scp -p -P 29418 your_github_id@gerrit.openbmc-project.xyz:hooks/commit-msg ${gitdir}/hooks`
+
+To submit a change set, push to the gerrit server, where <gerrit> is the name
+of the remote added with the remote add command:
+`git push gerrit HEAD:refs/for/master`
+
+
 Avoid references to non-public resources
 ----------------------------------------
 
-- 
2.8.4
