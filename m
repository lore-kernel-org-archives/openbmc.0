Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8K4R0HHpzDqCC
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:11:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146349425182433.466482368748416;
 Tue, 17 May 2016 07:10:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH pyphosphor] Move sensors.py and propertycacher.py frm skeleton
Date: Tue, 17 May 2016 09:10:49 -0500
Message-Id: <1463494250-27021-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Tue, 17 May 2016 14:11:03 -0000

These skeleton module are somewhat general purpose so move them
here.
This is just a straight copy plus a pep8 run.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

https://github.com/openbmc/pyphosphor/pull/4

Brad Bishop (1):
  Move sensors.py and propertycacher.py frm skeleton

 obmc/dbuslib/propertycacher.py |  64 ++++++++++
 obmc/sensors.py                | 281 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 345 insertions(+)
 create mode 100644 obmc/dbuslib/propertycacher.py
 create mode 100644 obmc/sensors.py

-- 
2.8.2
