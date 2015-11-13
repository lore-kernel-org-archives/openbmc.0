Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2E6941A0908
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 01:30:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447425021077940.948893314172;
 Fri, 13 Nov 2015 06:30:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/5] prepare for rocket wsgi server
Date: Fri, 13 Nov 2015 09:30:15 -0500
Message-Id: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 14:30:25 -0000
X-List-Received-Date: Fri, 13 Nov 2015 14:30:25 -0000

https://github.com/openbmc/openbmc/pull/80

Brad Bishop (5):
  Add python-email-utils-standalone recipe
  Add python-wsgiref-standalone
  Add python-rocket recipe
  Refactor bottle recipe
  Pull in rocket and bottle

 .../common/recipes-devtools/python/bottle.inc      |  18 --
 .../common/recipes-devtools/python/bottle/LICENSE  |  19 --
 .../python/bottle/json-format.patch                |  31 ----
 .../recipes-devtools/python/bottle_0.12.9.bb       |   4 -
 .../recipes-devtools/python/python-bottle.inc      |  26 +++
 .../recipes-devtools/python/python-bottle/LICENSE  |  19 ++
 .../python/python-bottle/json-format.patch         |  31 ++++
 .../python/python-bottle_0.12.9.bb                 |   5 +
 .../python/python-email-utils-standalone.inc       |  29 ++++
 .../python/python-email-utils-standalone/LICENSE   | 192 +++++++++++++++++++++
 .../python-email-utils-standalone/setup.patch      |  74 ++++++++
 .../python/python-email-utils-standalone_4.0.2.bb  |   5 +
 .../recipes-devtools/python/python-rocket.inc      |  23 +++
 .../recipes-devtools/python/python-rocket/LICENSE  |  21 +++
 .../python/python-rocket/setup.patch               |  13 ++
 .../recipes-devtools/python/python-rocket_1.2.4.bb |   5 +
 .../python/python-wsgiref-standalone.inc           |  46 +++++
 .../python/python-wsgiref-standalone/LICENSE       | 192 +++++++++++++++++++++
 .../python/python-wsgiref-standalone_0.1.2.bb      |   5 +
 .../common/recipes-phosphor/dbus/obmc-rest.bb      |   2 +
 20 files changed, 688 insertions(+), 72 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle/LICENSE
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle/json-format.patch
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/bottle_0.12.9.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle/json-format.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-bottle_0.12.9.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket/setup.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-rocket_1.2.4.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone_0.1.2.bb

-- 
2.6.3
