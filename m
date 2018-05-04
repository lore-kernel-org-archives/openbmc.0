Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nljLjc3V"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="j2M+ohlq"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cjnQ1BlyzF13n
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 17:09:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 32A68226DD;
 Fri,  4 May 2018 03:09:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 May 2018 03:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=bYBLy5PyOxwbzKzfLPr88VnxWOyP0Qs/XdVyUBgRH
 3g=; b=nljLjc3VnuQXmNqChULcgur1Y68kn7ugcVpINKiw0ybG9JG2pRPnnUoU/
 WYQo2FwWejjN6VrEv1JmNsqcQI8aE2oD4TV46kVxh54RGJx+Bp/zb9rqxuD9cc06
 IUqCg1Bh1dOVXika98kyPqKSzcSYH5nyPyCE/l+LUhzZ1hEYnPql26AaTmLLLZRV
 2ow7uXIFmwzufXmHBBfyemZUW8i367zJV8TR684jY0NoIgMmhzgP8SjEJzm3/Puy
 8u86T2DOQbnAet7VOBaYUs+BSiQ8IvJ23hJxWwNr6+5swjmWLnSIB24M8BKueTpb
 8/LAqli13Sj787SI0ALSD/3sOFIvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bYBLy5PyOxwbzKzfL
 Pr88VnxWOyP0Qs/XdVyUBgRH3g=; b=j2M+ohlq/zWTHgzfzItLoN2QiFVA37WHT
 TtEODBAvI8AdjfNff/Yqti0nNg3O4k7AUYAEQuq4TotCJ/eX6AAy7EMe4touylKn
 nMZkCupyiNbtzwSM4T8Pfbn1W9UIq6jzoqj+41rGgF/95YKotZSpIbNR4mS1Memh
 ok1yavHRgzDLlRIhgHZHzTJiDt0295TK1o5u1aRDttrugHXc1ZiBP88o5TZplaCO
 /Q1MhqgQvzeBNd07U0kGLJvBXVyMklC5Vr0l6uymXEfmfCmGeQroKaRwdh4yZIh7
 qBIW3G4COi8ypiY6cA63SSzFmpuj2fx3sXtwv6vYCUYtBb1B7J6zQ==
X-ME-Sender: <xms:NwfsWgW7w0OIf-RLiw_jj1cxUvufS6jmFLqRbmDbWa7ldiowtJR_uA>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 726BE10256;
 Fri,  4 May 2018 03:09:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [RESEND][meta-python][PATCH 1/3] meta-python: Add python-pyflame
 recipe
Date: Fri,  4 May 2018 16:39:14 +0930
Message-Id: <20180504070916.11024-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2018 07:09:46 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-python/recipes-devtools/python/python-pyflame.inc      | 9 +++++++++
 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb | 5 +++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb

diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/meta-python/recipes-devtools/python/python-pyflame.inc
new file mode 100644
index 000000000000..37ceab888533
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame.inc
@@ -0,0 +1,9 @@
+S = "${WORKDIR}/pyflame-${PV}"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+DEPENDS = "python"
+
+inherit pkgconfig autotools
+
diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
new file mode 100644
index 000000000000..c902e121231b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
@@ -0,0 +1,5 @@
+require python-pyflame.inc
+
+SRC_URI = "https://github.com/uber/pyflame/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "53d5822e5be371303e217a68ea9ea3e5"
+SRC_URI[sha256sum] = "03723509c037a994585e81e4a9c6d8e4fed87b486e23edd8d355a7bcc009bf79"
-- 
2.14.1
