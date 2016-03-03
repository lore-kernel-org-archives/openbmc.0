Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D59081A0B54
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 09:30:18 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457044213876264.31901114171023;
 Thu, 3 Mar 2016 14:30:13 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] RFC: use cmake. (DO NOT MERGE)
Date: Thu,  3 Mar 2016 16:30:12 -0600
Message-Id: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Thu, 03 Mar 2016 22:30:19 -0000

There was a previous proposal to consider autotools (see
openbmc/ipmi-fru-parser#7).  This is an alternative implementation
using cmake.

https://github.com/openbmc/ipmi-fru-parser/pull/11

Patrick Williams (1):
  RFC: use cmake.

 .gitignore        | 12 +++++++++
 CMakeLists.txt    | 30 ++++++++++++++++++++++
 Makefile          | 75 -------------------------------------------------------
 cmake/sdbus.cmake | 16 ++++++++++++
 4 files changed, 58 insertions(+), 75 deletions(-)
 create mode 100644 .gitignore
 create mode 100644 CMakeLists.txt
 delete mode 100644 Makefile
 create mode 100644 cmake/sdbus.cmake

-- 
2.7.1
