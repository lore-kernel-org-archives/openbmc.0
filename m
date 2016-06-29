Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfqhY0qhBzDqvs
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 03:40:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467222033915351.2751824496328;
 Wed, 29 Jun 2016 10:40:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Andreas Oberritter <obi@opendreambox.org>,
 Ross Burton <ross.burton@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH openbmc] rpm: explicitly disable tomcrypt
Date: Wed, 29 Jun 2016 12:40:32 -0500
Message-Id: <20160629174033.6877-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 17:40:46 -0000

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

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/424)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/424

Andreas Oberritter (1):
  rpm: explicitly disable tomcrypt

 yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
2.9.0
