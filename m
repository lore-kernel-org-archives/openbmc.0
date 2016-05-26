Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFVbC5Rq5zDqJ1
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 10:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=X023gM6T; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id g64so24933230pfb.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 17:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=CJeamHOC7EvpfJDOaD5Pi/9e6tf1bSGlSc82kRwLyxg=;
 b=X023gM6T3Dlt7ZFl3Uj95gMkeDhNrn6Pc/LeOoz0przY/vq5Q/vW6P59+UoqfBEuJl
 MfWEUD10FOHI+pPejV3qAaaIBZd08dZmHO7yHPBoFANAt6kz0pn+7tKbl5gKPW0KMZmX
 4HdhIUQ6Ocq1RiEUpgB/J9JRaVMBdiegQ0D1lhfyyWY9G5t/+Zjf8vFhMu+rZJHOG2uB
 MDuvT4Je+n4n8UOxQOJSrkrb4ZMfukREopnbWMHGPBa9Veo42RPJqFHBxpFPqSF+obSG
 8XXm5vvSIV6OJvCQeOmeUXSZk/wZiRKRq309bjLxCr4EUNpuOuhx8S07SPt6713XVsNR
 IOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=CJeamHOC7EvpfJDOaD5Pi/9e6tf1bSGlSc82kRwLyxg=;
 b=QJNvS1iW1RqzmxgHNwr+6/BeVBQnHBR/VIRalowfP+HsYvh+M0Vpjb0BZ06H0E7hGt
 hC2xzGIsusUAX+R+12B/Y7R1o/d1R1W/NOt414D4vvaqXe/GCpJQy2NF1myK08h/DXAv
 gJQroPXGjCH2Rb+/IBma28Ic3PcRfyw5go9pn3acp9CE63qViwEG4/NNRbtoP/CbesqW
 jOYoZRHqyUhA5Bkp42iy6DG+HoEhioiBwODQ8udMnjzAaXT0z15Bto7LD1/yjlROtyFq
 NdlzAHjHTByggcJNlo7jTfepRGMbX/W7ig1Du9kD6SUcHoPZz9CFhXEIVVDR/HWruouO
 IxHA==
X-Gm-Message-State: ALyK8tL2KfOCGrGve8FFTfKx9rPqKAErBdjicmVWE5hh/qRsfF+sN58PZIcx3mJWROvhrvyQ
X-Received: by 10.98.3.135 with SMTP id 129mr9909952pfd.42.1464223029260;
 Wed, 25 May 2016 17:37:09 -0700 (PDT)
Received: from raltherr-linux.mtv.corp.google.com ([172.18.64.20])
 by smtp.gmail.com with ESMTPSA id lq8sm15397440pab.40.2016.05.25.17.37.08
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 25 May 2016 17:37:08 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] Fix i2c-tools SRCURI syntax
Date: Wed, 25 May 2016 17:37:06 -0700
Message-Id: <1464223026-8881-1-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Thu, 26 May 2016 00:37:12 -0000

Override syntax (FOO_append, FOO_prepend) doesn't insert spaces to
separate the append from the original value.  This caused the two URIs
to be incorrectly merged into one and caused a download failure.  It
happens that the fallback in that case is to use the Yocto mirror so it
kept working other than emitting a warning.  Using =+ prepend syntax
correctly adds the separating space.

Change-Id: I36f48cb53aa29ea9a4bde738c975784f6ce24250
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
index bdbdc67..599394d 100644
--- a/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
+++ b/meta-phosphor/common/recipes-devtools/i2c-tools/i2c-tools_%.bbappend
@@ -1,4 +1,5 @@
+# Prefer the Yocto mirror over the direct lm-sensors download.
 SRC_URI_remove = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2"
-SRC_URI_prepend = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2"
+SRC_URI =+ "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2"
 
 RDEPENDS_${PN}_remove = "${PN}-misc"
-- 
2.8.0.rc3.226.g39d4020
