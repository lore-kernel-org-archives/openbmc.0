Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 5842D1A0409
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 01:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Co7yTbfP; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 7CE50458081;
 Tue, 23 Feb 2016 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 Pp7EvUMp3SBPrEcRc/J3LpkqYuo=; b=Co7yTbfP8zmTD3myVjLJnuuuoejmPL3a
 hMRBqv6V+UQtREjeJEF/1SaXe4/yeHDG2oEYH0RQFoGNOosJMrDNeBbRKq5WqFrA
 oJ0Ik6dliGW/W08gqIVv8VUzEm8J7M3qox2XHnzoT9kmB0eZqzScItMJlYDM9nLd
 LZgHMb2POf4=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 826CD45807C;
 Tue, 23 Feb 2016 06:45:16 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 2/6] obmc-init.sh: Fix FS type in mount failure message
Date: Wed, 24 Feb 2016 01:14:59 +1030
Message-Id: <1456238703-11117-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 23 Feb 2016 14:45:18 -0000

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
