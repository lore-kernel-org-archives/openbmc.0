Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2205C1A07E0
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 14:00:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447470028057551.3618964743667;
 Fri, 13 Nov 2015 19:00:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server 0/3] port rest server to bottle wsgi
 framework
Date: Fri, 13 Nov 2015 22:00:24 -0500
Message-Id: <1447470027-22113-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 14 Nov 2015 03:00:34 -0000

https://github.com/openbmc/phosphor-rest-server/pull/6

Brad Bishop (3):
  Rest server rewrite using Bottle microframework
  Remove old rest server
  setuptools name update

 obmc-rest     | 593 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 phosphor-rest | 370 ------------------------------------
 setup.py      |   2 +-
 3 files changed, 594 insertions(+), 371 deletions(-)
 create mode 100644 obmc-rest
 delete mode 100644 phosphor-rest

-- 
2.6.3
