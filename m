Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B9F8F1A0313
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 18:00:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456988429997433.83464168137675;
 Wed, 2 Mar 2016 23:00:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts 1/2] fix: proxy file was not created
 correctly fix: don't create a user and group if already exist
Date: Thu,  3 Mar 2016 01:00:27 -0600
Message-Id: <1456988428-5863-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456988428-5863-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456988428-5863-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 07:00:34 -0000

From: Chris Smart <distroguy@gmail.com>

---
 build-setup.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/build-setup.sh b/build-setup.sh
index 5009114..86891a9 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -52,7 +52,8 @@ RUN dnf --refresh upgrade -y
 RUN dnf install -y git subversion gcc gcc-c++ make perl-Thread-Queue perl-Data-Dumper diffstat texinfo \
 chrpath wget SDL-devel patch bzip2 tar cpio findutils socat which python-devel perl-bignum
 
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
 ENV HOME ${HOME}
@@ -76,7 +77,9 @@ RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git subversion diffstat texinfo \
   chrpath wget libthread-queue-any-perl libdata-dumper-simple-perl python libsdl1.2-dev gawk socat debianutils
 
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+
 
 USER ${USER}
 ENV HOME ${HOME}
@@ -115,7 +118,7 @@ mkdir -p ${WORKSPACE}/bin
 # Configure proxies for bitbake
 if [[ -n "${http_proxy}" ]]; then
 
-  cat > ${WORKSPACE}/bin/git-proxy << EOF_GIT
+  cat > ${WORKSPACE}/bin/git-proxy << \EOF_GIT
 #!/bin/bash
 # \$1 = hostname, \$2 = port
 PROXY=${PROXY_HOST}
-- 
2.7.1
