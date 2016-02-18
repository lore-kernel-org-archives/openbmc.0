Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1C01A04D4
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 17:10:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455775832276530.4746251784143;
 Wed, 17 Feb 2016 22:10:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v3 5/5] build: Print the gcc in the container,
 not the host
Date: Thu, 18 Feb 2016 00:10:27 -0600
Message-Id: <1455775827-22005-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455775827-22005-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455775827-22005-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 18 Feb 2016 06:10:34 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .build.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.build.sh b/.build.sh
index 83a155b..bfe2e45 100755
--- a/.build.sh
+++ b/.build.sh
@@ -16,9 +16,10 @@ EOF
 docker pull ubuntu:15.10
 docker build -t openbmc/phosphor-event - <<< "${Dockerfile}"
 
-gcc --version
 
 docker run --rm=true --user="${USER}" \
+ -w "${PWD}" -v "${HOME}":"${HOME}" openbmc/phosphor-event gcc --version
+docker run --rm=true --user="${USER}" \
  -w "${PWD}" -v "${HOME}":"${HOME}" openbmc/phosphor-event make
 docker run --rm=true --user="${USER}" \
  -w "${PWD}" -v "${HOME}":"${HOME}" openbmc/phosphor-event make check
-- 
2.7.1
