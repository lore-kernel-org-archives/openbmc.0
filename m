Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFZRX3QGWzDqRk
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 13:30:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464233437380449.9765906875815;
 Wed, 25 May 2016 20:30:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts] Add docs-build script
Date: Wed, 25 May 2016 22:30:35 -0500
Message-Id: <20160526033035.4263-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160526033035.4263-1-openbmc-patches@stwcx.xyz>
References: <20160526033035.4263-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 03:30:49 -0000

From: Jeremy Kerr <jk@ozlabs.org>

This change adds a script to build the OpenBMC docs repo, which can
produce a User Guide PDF.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 docs-build.sh | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100755 docs-build.sh

diff --git a/docs-build.sh b/docs-build.sh
new file mode 100755
index 0000000..a98fd7c
--- /dev/null
+++ b/docs-build.sh
@@ -0,0 +1,75 @@
+#!/bin/bash
+
+# This build script is for running the Jenkins builds using docker.
+#
+
+# Trace bash processing
+set -x
+
+# Default variables
+WORKSPACE=${WORKSPACE:-${HOME}/${RANDOM}${RANDOM}}
+http_proxy=${http_proxy:-}
+
+# Timestamp for job
+echo "Build started, $(date)"
+
+# Configure docker build
+if [[ -n "${http_proxy}" ]]; then
+PROXY="RUN echo \"Acquire::http::Proxy \\"\"${http_proxy}/\\"\";\" > /etc/apt/apt.conf.d/000apt-cacher-ng-proxy"
+fi
+
+Dockerfile=$(cat << EOF
+FROM ubuntu:16.04
+
+${PROXY}
+
+ENV DEBIAN_FRONTEND noninteractive 
+RUN apt-get update && apt-get install -yy \
+	make \
+	texlive-xetex \
+	pandoc \
+	fonts-inconsolata \
+	fonts-linuxlibertine
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+
+USER ${USER}
+ENV HOME ${HOME}
+RUN /bin/bash
+EOF
+)
+
+# Build the docker container
+docker build -t linux-build/ubuntu - <<< "${Dockerfile}"
+if [[ "$?" -ne 0 ]]; then
+  echo "Failed to build docker container."
+  exit 1
+fi
+
+# Create the docker run script
+export PROXY_HOST=${http_proxy/#http*:\/\/}
+export PROXY_HOST=${PROXY_HOST/%:[0-9]*}
+export PROXY_PORT=${http_proxy/#http*:\/\/*:}
+
+mkdir -p ${WORKSPACE}
+
+cat > "${WORKSPACE}"/build.sh << EOF_SCRIPT
+#!/bin/bash
+
+set -x
+
+cd ${WORKSPACE}
+
+# Go into the linux directory (the script will put us in a build subdir)
+cd docs
+
+make
+
+EOF_SCRIPT
+
+chmod a+x ${WORKSPACE}/build.sh
+
+# Run the docker container, execute the build script we just built
+docker run --cap-add=sys_admin --net=host --rm=true -e WORKSPACE=${WORKSPACE} --user="${USER}" \
+  -w "${HOME}" -v "${HOME}":"${HOME}" -t linux-build/ubuntu ${WORKSPACE}/build.sh
-- 
2.8.3
