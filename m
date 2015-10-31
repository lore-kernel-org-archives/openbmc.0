Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 53AF61A0CCA
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 12:36:30 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446255386591384.3637812504645;
 Fri, 30 Oct 2015 18:36:26 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20openbmc=5D=20moved=20to=20btbridge=20version=20that=20supports=20the=20correct=20seq/net/lun/cmd=20o=E2=80=A6?=
Date: Fri, 30 Oct 2015 20:36:15 -0500
Message-Id: <1446255376-17351-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Sat, 31 Oct 2015 01:36:32 -0000

…rder

fixed makefile.patch because it couldn't auto patch with version of btbridge

https://github.com/openbmc/openbmc/pull/54

Chris Austen (1):
  moved to btbridge version that supports the correct seq/net/lun/cmd
    order     fixed makefile.patch because it couldn't auto patch with
    version of btbridge

 .../common/recipes-phosphor/host-ipmid/btbridged.bb        |  2 +-
 .../recipes-phosphor/host-ipmid/btbridged/makefile.patch   | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.6.0
