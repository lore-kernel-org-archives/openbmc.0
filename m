Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 04D4F1A113A
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 14:00:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447902029856658.9969785420434;
 Wed, 18 Nov 2015 19:00:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Initial autotools support
Date: Wed, 18 Nov 2015 22:00:28 -0500
Message-Id: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Nov 2015 03:00:37 -0000

This switches us over to use autotools rather than custom makefiles.
This brings us into line with the defacto standard for building userspace.

It also adds "make dist" and "make check" targets that build a source
tarball and run the test suite (respectively).

A simple "make distcheck" will build a source tarball, extract it, build
it and run tests to ensure that the distributed source tarball is buildable
and works.

If multiple tests are added "make -j20 distcheck" does exactly as you'd
expect: runs up to 20 concurrent tests.

If building from git "autoreconf -i" will generate configure, if building
from source tarball, it's already there. This is the standard autotools
method of being able to build on systems that don't have the version of
autotools that you support.

NOTE: the current library/binary split is unchanged, it's still odd
NOTE: testaddsel isn't actually built, as it doesn't build in master

Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>

https://github.com/openbmc/phosphor-host-ipmid/pull/39

Stewart Smith (1):
  Initial autotools support

 Makefile                       |  67 --------------------
 Makefile.am                    |  28 +++++++++
 apphandler.C                   |   2 +-
 chassishandler.C               |   2 +-
 configure.ac                   |  28 +++++++++
 dcmihandler.C                  |   4 +-
 host-ipmid/ipmid-api.h         |  98 ++++++++++++++++++++++++++++++
 ipmid-api.h                    |  98 ------------------------------
 ipmid.H                        |   2 +-
 m4/ax_cxx_compile_stdcxx_14.m4 | 135 +++++++++++++++++++++++++++++++++++++++++
 sensorhandler.C                |   2 +-
 storagehandler.C               |   2 +-
 testaddsel.C                   |   3 +-
 testit.C                       |   3 +-
 transporthandler.C             |   2 +-
 15 files changed, 300 insertions(+), 176 deletions(-)
 delete mode 100644 Makefile
 create mode 100644 Makefile.am
 create mode 100644 configure.ac
 create mode 100644 host-ipmid/ipmid-api.h
 delete mode 100644 ipmid-api.h
 create mode 100644 m4/ax_cxx_compile_stdcxx_14.m4

-- 
2.6.3
