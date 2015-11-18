Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EA4051A04EB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 14:50:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447818630407871.8687911254552;
 Tue, 17 Nov 2015 19:50:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] python-dbus dbus.Byte.__str__ produces broken utf8
Date: Tue, 17 Nov 2015 22:50:28 -0500
Message-Id: <1447818629-20624-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 03:50:34 -0000

Byte to string simply copied the byte, which isn't valid
utf8 for non ascii values.  Since dbus.byte is an int subclass,
should just be using int's __str__  implementation anyway.

https://github.com/openbmc/openbmc/pull/85

Brad Bishop (1):
  python-dbus dbus.Byte.__str__ produces broken utf8

 .../python/python-dbus/bytes.patch                 | 37 ++++++++++++++++++++++
 .../python/python-dbus_1.2.0.bbappend              |  2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-dbus/bytes.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-dbus_1.2.0.bbappend

-- 
2.6.3
