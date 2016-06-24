Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbnxH6TmZzDqlY
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:11:15 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146679547053864.68474098215256;
 Fri, 24 Jun 2016 12:11:10 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton 0/3] dbus.Double and revert sensor cache
Date: Fri, 24 Jun 2016 14:11:06 -0500
Message-Id: <20160624191109.26490-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:11:18 -0000

The sensor cache does not work.  The revert addresses https://github.com/openbmc/skeleton/issues/113.
The python json encoder has trouble converting dbus.Double to a float.  Floating point sensors were added with https://github.com/openbmc/skeleton/commit/a8260c83d6566fc46832c627ae32c996cfb76ea4.  Resolves https://github.com/openbmc/skeleton/issues/112.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/114)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/114

Brad Bishop (3):
  Revert "Fix broken attempt at hwmon caching"
  Revert "Don't make pointless sensor update method calls"
  Cast dbus.Double for python-json

 pyhwmon/hwmon.py | 24 +++++-------------------
 pytools/obmcutil |  3 +++
 2 files changed, 8 insertions(+), 19 deletions(-)

-- 
2.9.0
