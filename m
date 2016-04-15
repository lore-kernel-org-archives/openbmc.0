Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmcph6pM3zDq6B
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 22:50:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460724648518727.4690210221296;
 Fri, 15 Apr 2016 05:50:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH pyphosphor 0/4] Pull
Date: Fri, 15 Apr 2016 07:50:43 -0500
Message-Id: <1460724647-4184-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Fri, 15 Apr 2016 12:50:53 -0000

https://github.com/openbmc/pyphosphor/pull/1

Brad Bishop (4):
  Introducing pyobmc
  Add dictionary export to PathTree
  Added python to dts encoder
  Move common code from REST server

 .gitignore                    |  87 +++++++++++++++++++
 obmc/__init__.py              |   0
 obmc/dbuslib/__init__.py      |   0
 obmc/dbuslib/bindings.py      | 172 ++++++++++++++++++++++++++++++++++++
 obmc/dbuslib/enums.py         |  29 +++++++
 obmc/dbuslib/introspection.py | 136 +++++++++++++++++++++++++++++
 obmc/enums.py                 |  17 ++++
 obmc/mapper.py                | 163 ++++++++++++++++++++++++++++++++++
 obmc/utils/__init__.py        |   0
 obmc/utils/dtree.py           |  63 ++++++++++++++
 obmc/utils/misc.py            |  63 ++++++++++++++
 obmc/utils/pathtree.py        | 197 ++++++++++++++++++++++++++++++++++++++++++
 setup.py                      |   5 ++
 13 files changed, 932 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 obmc/__init__.py
 create mode 100644 obmc/dbuslib/__init__.py
 create mode 100644 obmc/dbuslib/bindings.py
 create mode 100644 obmc/dbuslib/enums.py
 create mode 100644 obmc/dbuslib/introspection.py
 create mode 100644 obmc/enums.py
 create mode 100644 obmc/mapper.py
 create mode 100644 obmc/utils/__init__.py
 create mode 100644 obmc/utils/dtree.py
 create mode 100644 obmc/utils/misc.py
 create mode 100644 obmc/utils/pathtree.py
 create mode 100644 setup.py

-- 
2.7.1
