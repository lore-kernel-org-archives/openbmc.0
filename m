Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfJPT4w0NzDqsx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 07:10:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467148247690646.9426823692706;
 Tue, 28 Jun 2016 14:10:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH pyphosphor 0/5] find_dbus_interfaces
Date: Tue, 28 Jun 2016 16:10:41 -0500
Message-Id: <20160628211046.8564-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Tue, 28 Jun 2016 21:10:54 -0000
X-List-Received-Date: Tue, 28 Jun 2016 21:10:54 -0000

This patchset brings the find_dbus_interfaces method over from phosphor-objmgr and makes a couple fixes/improvements to that code as well.

https://github.com/openbmc/pyphosphor/pull/7

Brad Bishop (5):
  Add alias for org.freedesktop.DBus.Error.NoReply
  Add find_dbus_interfaces to introspection utils
  Remove name mangling from find_dbus_interfaces
  Remove unnecessary variable
  Improve short-lived object handling

 obmc/dbuslib/enums.py         |   1 +
 obmc/dbuslib/introspection.py | 107 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 2 deletions(-)

-- 
2.9.0
