Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFXRf4Q0dzDqNq
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 12:00:42 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464228038033922.0605471051758;
 Wed, 25 May 2016 19:00:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Fix i2c-tools SRCURI syntax
Date: Wed, 25 May 2016 21:00:36 -0500
Message-Id: <20160526020037.1136-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
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
X-List-Received-Date: Thu, 26 May 2016 02:00:47 -0000

Override syntax (FOO_append, FOO_prepend) doesn't insert spaces to
separate the append from the original value.  This caused the two URIs
to be incorrectly merged into one and caused a download failure.  It
happens that the fallback in that case is to use the Yocto mirror so it
kept working other than emitting a warning.  Using =+ prepend syntax
correctly adds the separating space.

Signed-off-by: Rick Altherr <raltherr@google.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/305)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/305

Rick Altherr (1):
  Fix i2c-tools SRCURI syntax

 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.8.3
