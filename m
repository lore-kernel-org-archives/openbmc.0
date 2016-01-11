Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 70B2D1A0D13
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 03:51:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452531068513630.9170015688353;
 Mon, 11 Jan 2016 08:51:08 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-test-automation 42/60] fixed errors in tox and
 generate_argumentfile.sh script
Date: Mon, 11 Jan 2016 10:50:08 -0600
Message-Id: <1452531026-13715-43-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jan 2016 16:51:16 -0000

From: Manjunath A Kumatagi <mkumatag@in.ibm.com>

---
 .gitignore                     | 1 +
 tools/generate_argumentfile.sh | 2 +-
 tox.ini                        | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 8aea548..eb901c8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
+*.pyc
 /log.html
 /output.xml
 /report.html
diff --git a/tools/generate_argumentfile.sh b/tools/generate_argumentfile.sh
index 518a48f..4869261 100755
--- a/tools/generate_argumentfile.sh
+++ b/tools/generate_argumentfile.sh
@@ -2,4 +2,4 @@
 
 echo "--variable OPENBMC_HOST:$OPENBMC_HOST" > $ARG_FILE
 echo "--variable OPENBMC_USERNAME:$OPENBMC_USERNAME" >> $ARG_FILE
-echo "--variable OPENBMC_HOST:$OPENBMC_HOST" >> $ARG_FILE
+echo "--variable OPENBMC_PASSWORD:$OPENBMC_PASSWORD" >> $ARG_FILE
diff --git a/tox.ini b/tox.ini
index 75ab527..fa0d198 100644
--- a/tox.ini
+++ b/tox.ini
@@ -8,12 +8,14 @@ whitelist_externals = *
 install_command = pip install -U {opts} {packages}
 deps = -r{toxinidir}/requirements.txt
 commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
     python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
 
 [testenv:full]
 deps = {[testenv]deps}
 setenv = {[testenv]setenv}
 commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
     python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} .
 
 [testenv:tests]
@@ -27,4 +29,5 @@ commands =
 deps = {[testenv]deps}
 setenv = {[testenv]setenv}
 commands =
+    bash {toxinidir}/tools/generate_argumentfile.sh
     python -m robot.run --argumentfile {env:ARG_FILE:/tmp/argument_file.txt} {posargs}
\ No newline at end of file
-- 
2.6.4
