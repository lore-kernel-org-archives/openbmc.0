Return-Path: <joel@jms.id.au>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rf31T4YZJzDqnv
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 21:07:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=VVZ5OEsl; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id hf6so1472266pac.2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:subject:date:message-id;
 bh=mhMcuwLYas5Hc1/NEC/rijClXH8ppQ8hmQrWagjO8WY=;
 b=VVZ5OEslaDBbbHSVYQEmpiql5nnnVQ0YwG6iUgxdOHXUdRTnKq/rvvsYxKbXJ6f3eT
 o3lsU+A7gMBBmFQuZucMkxxXVahPgAXXnmClSuFL1HBlkBkI4KvPVBeFCXyddhw2Jsc+
 dacemoIV6vRz0awdmIcIWwNwTEP7FTweepE0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=mhMcuwLYas5Hc1/NEC/rijClXH8ppQ8hmQrWagjO8WY=;
 b=elXEuRarkiZ669sm5IF2AqMEGgO7KV2LAH+hAYtbHoF9gSBrB9AJfgoWGX6Vh0HSwz
 UKkqdgI4LR9uEvZCDLRwZHNk7ZLhjXGcqD6pauebciDUEUUI8xuc3z8slBLqg+OUeFyV
 TOTxi6rGbl7/cQnt6coUbo74k0lt4KA+foYVruZ1sHH0V5pLebtok716HObI8PA6PIVe
 zlE5i597H+KIFtSs5Rk6NlWyA1qUrrRm068Q7L0YzJvTHim/c+UzZIOrp5tPoKr+Co4g
 NRuf6A29Bv5QUMBcy5+3CImMwyxdSJQmv05Y8SRf4GUKkXd0+7w/+TYprKQRsI2ruLeZ
 I+4Q==
X-Gm-Message-State: ALyK8tIiavyRLlLFZrJbHECAxilaY0M+2Ha0gp9JUNgtkehhcv927OJgX1YrBdx6K+CvOA==
X-Received: by 10.67.3.227 with SMTP id bz3mr710138pad.67.1467112059433;
 Tue, 28 Jun 2016 04:07:39 -0700 (PDT)
Received: from aurora.ibm.com ([2403:480:11:8000:8034:e688:3ac3:2075])
 by smtp.gmail.com with ESMTPSA id v62sm6760798pfv.50.2016.06.28.04.07.36
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 Jun 2016 04:07:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [openbmc PATCH] poky/rpm: explicitly disable tomcrypt
Date: Tue, 28 Jun 2016 20:37:25 +0930
Message-Id: <1467112045-27652-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Tue, 28 Jun 2016 11:07:43 -0000

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
[upstream commit 71979b2ff7a0f78892435558e27bf0779367de55)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---

This is required for building our current tree if your system has libtomcrypt
installed.

I sent a patch as I wasn't sure where we were with the Gerrit migration.


 yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/yocto-poky/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index cbdca88eaa8a..f2c12d2de1a6 100644
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
2.8.1
