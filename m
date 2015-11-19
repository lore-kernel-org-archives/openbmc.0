Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 72BD81A0A0C
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 14:00:17 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447902011686849.6336267013547;
 Wed, 18 Nov 2015 19:00:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Initial conversion to autotools
Date: Wed, 18 Nov 2015 22:00:10 -0500
Message-Id: <1447902011-2668-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 03:00:18 -0000

Depends on https://github.com/openbmc/phosphor-host-ipmid/pull/39

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>

https://github.com/openbmc/ipmi-fru-parser/pull/7

Stewart Smith (1):
  Initial conversion to autotools

 COPYING                        | 675 +++++++++++++++++++++++++++++++++++++++++
 LICENSE                        | 675 -----------------------------------------
 Makefile                       |  62 ----
 Makefile.am                    |   5 +
 configure.ac                   |  23 ++
 m4/ax_cxx_compile_stdcxx_14.m4 | 135 +++++++++
 6 files changed, 838 insertions(+), 737 deletions(-)
 create mode 100644 COPYING
 delete mode 100644 LICENSE
 delete mode 100644 Makefile
 create mode 100644 Makefile.am
 create mode 100644 configure.ac
 create mode 100644 m4/ax_cxx_compile_stdcxx_14.m4

-- 
2.6.3
