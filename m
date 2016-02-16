Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 825261A0019
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 12:10:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145558502336566.35881638000001;
 Mon, 15 Feb 2016 17:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts] initialise PROXY variable to avoid
 instance where no PROXY env exists and set -e catches ubound variable
Date: Mon, 15 Feb 2016 19:10:21 -0600
Message-Id: <1455585021-11318-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455585021-11318-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455585021-11318-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 16 Feb 2016 01:10:27 -0000

From: Chris Smart <distroguy@gmail.com>

---
 build-setup.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/build-setup.sh b/build-setup.sh
index d0a6fc2..91778f9 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -15,6 +15,7 @@ target=${target:-qemu}
 distro=${distro:-ubuntu}
 WORKSPACE=${WORKSPACE:-${HOME}/${RANDOM}${RANDOM}}
 http_proxy=${http_proxy:-}
+PROXY=""
 
 # Timestamp for job
 echo "Build started, $(date)"
-- 
2.7.1
