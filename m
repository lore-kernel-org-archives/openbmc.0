Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 048131A0338
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 11:10:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455495023476589.7155911651114;
 Sun, 14 Feb 2016 16:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts v2] build-setup: Ensure we fail the
 build when a step fails
Date: Sun, 14 Feb 2016 18:10:21 -0600
Message-Id: <1455495021-25108-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455495021-25108-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455495021-25108-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 15 Feb 2016 00:10:28 -0000

From: Joel Stanley <joel@jms.id.au>

Currently the build step can fail inside docker but we don't propogate
that error up, so the Jenkins build will not be marked as failed.

We set the following options:

 set -xeuo pipefail

 - bash trace output (-x)
 - failing when a step fails (-e)
 - failing on undefined variables (-u)
 - failing when a command in a pipe fails (-o pipefail) - the default
 behaviour is to use the exit code of the final command in the pipe.

http://redsymbol.net/articles/unofficial-bash-strict-mode/

Thanks to Daniel Axtens <dja@axtens.net> for the extra suggestions.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 build-setup.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/build-setup.sh b/build-setup.sh
index a96ed44..9c156f7 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -7,8 +7,8 @@
 #   distro = fedora|ubuntu
 #   WORKSPACE = 
 
-# Trace bash processing
-set -x
+# Trace bash processing. Set -e so when a step fails, we fail the build
+set -xeuo pipefail
 
 # Default variables
 target=${target:-qemu}
@@ -85,10 +85,6 @@ fi
 
 # Build the docker container
 docker build -t openbmc/${distro} - <<< "${Dockerfile}"
-if [[ "$?" -ne 0 ]]; then
-  echo "Failed to build docker container."
-  exit 1
-fi
 
 # Create the docker run script
 export PROXY_HOST=${http_proxy/#http*:\/\/}
@@ -100,7 +96,7 @@ mkdir -p ${WORKSPACE}
 cat > "${WORKSPACE}"/build.sh << EOF_SCRIPT
 #!/bin/bash
 
-set -x
+set -xeuo pipefail
 
 cd ${WORKSPACE}
 
-- 
2.7.1
