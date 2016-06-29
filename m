Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfqhY0qhwzDqvv
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 03:40:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467222035308891.1886495899013;
 Wed, 29 Jun 2016 10:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Andreas Oberritter <obi@opendreambox.org>,
 Ross Burton <ross.burton@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH openbmc] rpm: explicitly disable tomcrypt
Date: Wed, 29 Jun 2016 12:40:33 -0500
Message-Id: <20160629174033.6877-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160629174033.6877-1-openbmc-patches@stwcx.xyz>
References: <20160629174033.6877-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 17:40:46 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Configure autodetects libtomcrypt, but then it adds libtommath to
$LIBS and fails to link subsequent tests if it's unavailable.

| checking for pcre.h... yes
| checking for pcre_compile in -lpcre... no
| checking whether to build with PCRE library... no
| ++ executing failure action
| configure: error: unable to find usable PCRE library

(From OE-Core rev: 54665fb9e27ba1b0e4eddaf170303d4f2db66fae)

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index cbdca88..f2c12d2 100644
--- a/yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -328,6 +328,7 @@ EXTRA_OECONF += "--verbose \
 		--without-ruby \
 		--without-squirrel \
 		--without-sasl2 \
+		--without-tomcrypt \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
-- 
2.9.0
