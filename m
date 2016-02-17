Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 1E7191A0018
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2016 18:27:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=vgyImd0P; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 4313A2B2070;
 Tue, 16 Feb 2016 23:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 Pp7EvUMp3SBPrEcRc/J3LpkqYuo=; b=vgyImd0PT/a5eoan7zbB8ZM617Zaccz9
 YPOjkF/IdyXtfbQBdb6T+/EZWi3YsPE6AKcPXuMvZUDhI309mrqIxSHRrnzodj7o
 +WkIMATRnz4zxU+Rp8zkB5ddN/xAL/OoyfWVy0Hx4D2vGdHOBjZdf0fOBdu/8+WN
 p191M16t7RI=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 7046F2B206A;
 Tue, 16 Feb 2016 23:27:26 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH v2 1/2] obmc-init.sh: Fix FS type in mount failure message
Date: Wed, 17 Feb 2016 17:57:17 +1030
Message-Id: <1455694038-29771-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455694038-29771-1-git-send-email-andrew@aj.id.au>
References: <1455694038-29771-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 17 Feb 2016 07:27:28 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 6750de3..9674765 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -114,7 +114,7 @@ then
 	msg="$(cat)" << HERE
 
 Mounting read-write $rwdev filesystem failed.  Please fix and run
-	mount $rwdev $rwdir -t $rwfs -o $rwopts
+	mount $rwdev $rwdir -t $rwfst -o $rwopts
 to to continue, or do change nothing to run from RAM for this boot.
 HERE
 	debug_takeover "$msg"
-- 
2.5.0
