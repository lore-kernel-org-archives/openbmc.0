Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CBD661A074A
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 03:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447863021271863.2724440478405;
 Wed, 18 Nov 2015 08:10:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Python cleanup
Date: Wed, 18 Nov 2015 11:10:19 -0500
Message-Id: <1447863020-10106-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 16:10:26 -0000

CherryPy won't be used so remove it.
Use wsgi and email that comes with python.
Remove wsgi and email standalone recipes.
Update bottle and rocket to use new packages.

https://github.com/openbmc/openbmc/pull/87

Brad Bishop (1):
  Python cleanup

 .../common/recipes-devtools/python/CherryPy.inc    |  49 ------
 .../recipes-devtools/python/CherryPy_3.8.0.bb      |   4 -
 .../recipes-devtools/python/python-bottle.inc      |   3 +-
 .../python/python-email-utils-standalone.inc       |  29 ----
 .../python/python-email-utils-standalone/LICENSE   | 192 ---------------------
 .../python-email-utils-standalone/setup.patch      |  74 --------
 .../python/python-email-utils-standalone_4.0.2.bb  |   5 -
 .../recipes-devtools/python/python-rocket.inc      |   6 +-
 .../python/python-wsgiref-standalone.inc           |  46 -----
 .../python/python-wsgiref-standalone/LICENSE       | 192 ---------------------
 .../python/python-wsgiref-standalone_0.1.2.bb      |   5 -
 .../python/python/__init__.email_min.py            |   7 +
 .../recipes-devtools/python/python_2.7.9.bbappend  |  33 ++++
 .../python/wsgiref-2.7-manifest.inc                |  33 ++++
 14 files changed, 77 insertions(+), 601 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/CherryPy.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/CherryPy_3.8.0.bb
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone/LICENSE
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone_0.1.2.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python/__init__.email_min.py
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python_2.7.9.bbappend
 create mode 100644 meta-phosphor/common/recipes-devtools/python/wsgiref-2.7-manifest.inc

-- 
2.6.3
