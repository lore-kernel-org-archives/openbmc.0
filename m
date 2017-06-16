Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 338 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Jun 2017 18:05:55 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bHbB9XNz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nWGCa4EJ"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wptGq1HJlzDq88
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 18:05:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2944720881;
 Fri, 16 Jun 2017 04:00:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 16 Jun 2017 04:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=/ArFUUELdn+2eU3dk9P3djlqgnO0DUPIRhO0+0fHc
 5M=; b=bHbB9XNzLHQkZx4eRiOm16feCAqLdpsZP0IMV39irNMMyjaiTiTUbPS3T
 Dt3uy4uOmKzKpIXjpbegBxmDBFS6DhPjhKZClHQ6wjWJDyIcunbK98JN+jo5p/vC
 YOZPGPAegQCdnHpc3deNCbYyC2sYndKtJfjH4uMYay1OGkspoixAbIHd/ROcP3Vw
 w/k4Oy3RBF+2uX49GO3807HYJHjKTDIAzgYndfl9pX9XF2/YSwRBstjpyiOJIKim
 t8Ob8w1rbJECuztDrcjfKZkLvqp6xuIhlRvlfNLzbgqLX/qeHgKsdy1hfmA8GH1O
 D8FoHL196+/f4zaSprAxIannGcLdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=/ArFUUELdn+2eU3dk9
 P3djlqgnO0DUPIRhO0+0fHc5M=; b=nWGCa4EJdoYla/daRWhZ072o9M4Pi8YdBH
 i3gr6qt7y9XWeMf7JNy1r2K0l7zn5hrd0l5WwLWmyUFXAH4ktFl8kyOqy8Me40ax
 kRcxU5yMtOmNfH9durKPgU5vv92pbCzhT+QVXNNJGnxT8hqeeE4s5/tYqwDFVatN
 dE+X3RxuUcabk2+x1P366hRoI+im9sj6qgBeuJtA7OhNNvaAudkKXa1Xh8R9FOtg
 TYiAgUIx16i6QldBPgA4lKDWLn5vA358ldiW+ts6dHfhUc+leUUjCgpuqYHz5k1q
 43hoac0U9gWwIWgUDR6Yw8z/7tO0GROhSWNGhpJiRB7+MMYWNvEg==
X-ME-Sender: <xms:D5BDWYn_jXTlXeF-yoeyIDqED5YShKjR3GZixbjffp-7RKJkADYpGw>
X-Sasl-enc: jRkdtS0MOHJ1stOekUMe9DUumciCGT7fDb7PbvL2MGZm 1497600014
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C5746249CF;
 Fri, 16 Jun 2017 04:00:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 eajames@linux.vnet.ibm.com
Subject: [PATCH linux dev-4.10] hwmon: occ: Fix uninitialised variable warning
Date: Fri, 16 Jun 2017 17:29:17 +0930
Message-Id: <20170616075917.12356-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jun 2017 08:05:56 -0000

Observed the following:

      CC      drivers/hwmon/occ/common.o
    drivers/hwmon/occ/common.c: In function ‘occ_show_status’:
    drivers/hwmon/occ/common.c:262:9: warning: ‘val’ may be used uninitialized in this function [-Wmaybe-uninitialized]
      return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index f34b40062479..d3eb6f83a42c 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -257,6 +257,8 @@ static ssize_t occ_show_status(struct device *dev,
 	case 6:
 		val = header->occ_state;
 		break;
+	default:
+		return -EINVAL;
 	}
 
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
-- 
2.11.0
