Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LtvfpTAD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fP8tLSm1"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cjSc4PYGzF13T
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 16:55:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A9B1B2258A;
 Fri,  4 May 2018 02:55:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 May 2018 02:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=bYBLy5PyOxwbzKzfLPr88VnxWOyP0Qs/XdVyUBgRH
 3g=; b=LtvfpTADQQk1zEXPMH/wlA8Rky10MB2iQmnnXgzZtfeKNpBh9lRRQG/Se
 kzRRmSI4/Lr1F28eRYWvG6OnCm49ZR2lB4tvVgflcgQcdT3cjve+QF2TpbLYfQ6v
 YTv648qtg/c2tOefHXZDWSHhEWFZ+nUnDbkI/bOFLYR2EtR2tDvccoE2oYnNcXBK
 MYa8htC3SUPTy4wziGJPg86KxZg4zR9gyxV41au3MWHRvwi5pMLV7PTD9jQ0en5N
 wRthgYPQrctXMrmvgo1pv/NQ6oFe9VE/K1cH24uOTxGnp6CuBymZCUFbev3ReAtw
 n3LmL4i3Noot7EGGsO3uPgMM/7xGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bYBLy5PyOxwbzKzfL
 Pr88VnxWOyP0Qs/XdVyUBgRH3g=; b=fP8tLSm1YaRmU7cgw2gmWB0eerLEUbFk+
 UqxPzXTmeiYx2NgFc260v21L51m8CiqldsHq+a1xUpNVN3SKiqvFs+aTFGL2qagT
 P5XDNXGA+KmNfUQy7s+BAWRGHcsQ4VfRO12Tu527PKuwFS4G6g9FkmM05N5uEwh5
 KT/2CTn7pzmjYe1avUkImM+sFc+HVRIZRu+QBTARKE2lLFaMSxvwKjNP0dobDwup
 fHKt/nXBMrtZ5RS8GmixSi9+qlUr3l8xnvI/0+csKcb8UicYfBJcsWY3fYnkQpzv
 ShOV17mWIQz3oDA9NkmHI38LRH6alhDbukUsYK4vUuFigDoSDHYxw==
X-ME-Sender: <xms:zQPsWsqbLRjn2BoVBDGl65JugRnBT0Pkve4DxNwuFw-WipOEILtHMA>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC6FAE4408;
 Fri,  4 May 2018 02:55:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-devel@lists.openembedded.org
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [meta-python][PATCH 1/3] meta-python: Add python-pyflame recipe
Date: Fri,  4 May 2018 16:24:30 +0930
Message-Id: <20180504065432.10308-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 04 May 2018 06:55:14 -0000

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
