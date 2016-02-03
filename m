Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461F41A0167
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 14:40:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454470822156169.47913745657218;
 Tue, 2 Feb 2016 19:40:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add support for gevent package.
Date: Tue,  2 Feb 2016 21:40:20 -0600
Message-Id: <1454470821-15611-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Wed, 03 Feb 2016 03:40:26 -0000

Gevent package is required by latest obmc-rest for streaming.

https://github.com/openbmc/openbmc/pull/161

shgoupf (1):
  Add support for gevent package.

 .../python/python-backports-ssl_3.4.0.2.bb         | 23 ++++++++++++++
 .../python/python-certifi_14.05.14.bb              | 20 ++++++++++++
 .../python/python-gevent/libev-conf.patch          | 19 ++++++++++++
 .../python/python-gevent_1.1rc3.bb                 | 36 ++++++++++++++++++++++
 .../python/python-greenlet_0.4.1.bb                | 14 +++++++++
 .../recipes-devtools/python/python-tblib_1.2.0.bb  | 18 +++++++++++
 .../common/recipes-phosphor/dbus/obmc-rest.bb      |  6 ++++
 .../common/recipes-support/libevent_1.4.14b.bb     | 15 +++++++++
 8 files changed, 151 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-certifi_14.05.14.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-gevent/libev-conf.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-gevent_1.1rc3.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-greenlet_0.4.1.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-tblib_1.2.0.bb
 create mode 100644 meta-phosphor/common/recipes-support/libevent_1.4.14b.bb

-- 
2.6.4
