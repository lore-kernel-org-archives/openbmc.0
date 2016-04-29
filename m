Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qww0c5SV5zDqBF
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 10:43:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=bEWNNjwS; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id y69so40679787pfb.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=xlP9cU1dcam1SKeMfolrCTJdA6SMc9Mh6d45pBoBy0k=;
 b=bEWNNjwSCqR1XB2MN/8/Wr/e4IohKZl6qZi5pgHHbcQMNsQ9BS+OqYB4hgoyFsL84X
 /wYeHoosvDVvmwP/ymB3djKcLHXIfJUdRBCDQAurh/6fGVid0gvakQ35CnjTFlZJrNbz
 XsptknsoWOwbXXNJkiEEbYrjrppUsmnDffLc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=xlP9cU1dcam1SKeMfolrCTJdA6SMc9Mh6d45pBoBy0k=;
 b=OaMyAh1EiVFPdHkXIEQebXLX3WVKDmv/7PuzQeyuyyqqSIHmSL7uLO1TFNpdMyPkMJ
 Z29q5ry+GpyAUUSOWIIO7hdrrzJaejdQNxB1XQO63g7qCXruhvze3E9BRKLJEDddYaFU
 ywyBtwbQZFdSP7l4L7pll+ywh2LXSIFEeJ24Y7chYGQMICf2JHCZjBBG3Qm190i2QQxG
 gm/8HH8oCxEIMYjWcwiitIDMBnxVQMbU7Phr5KaJaHLEuAPxeWSBqHkFZhbLBlIJSsVN
 wwBjVrdZawh2XE7OJzzGyA94JaiKkozTT/fngUNAYDE++9S3px5QLZZ7CFKTcy3UJCrb
 YHGA==
X-Gm-Message-State: AOPr4FXFsG+j8ulg6Q/EaY7Ken5flxXpu99tIGDuzzFwQWufGk7VoFEK7d6WItAz79C3Ag==
X-Received: by 10.98.80.78 with SMTP id e75mr25308861pfb.147.1461890591046;
 Thu, 28 Apr 2016 17:43:11 -0700 (PDT)
Received: from icarus.au.ibm.com ([2403:480:11:8000:dbb:a970:cef7:c600])
 by smtp.gmail.com with ESMTPSA id x184sm18099802pfb.53.2016.04.28.17.43.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 28 Apr 2016 17:43:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [qemu 2/3] hw/misc/aspeed_scu: Add number of regs define
Date: Fri, 29 Apr 2016 10:12:51 +0930
Message-Id: <1461890572-30636-3-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1461890572-30636-1-git-send-email-joel@jms.id.au>
References: <1461890572-30636-1-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Fri, 29 Apr 2016 00:43:13 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/misc/aspeed_scu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 276a464f9adf..66cdb60aae8f 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -16,6 +16,8 @@
 #define TYPE_ASPEED_SCU "aspeed.scu"
 #define ASPEED_SCU(obj) OBJECT_CHECK(AspeedSCUState, (obj), TYPE_ASPEED_SCU)
 
+#define ASPEED_SCU_NR_REGS	0x200
+
 typedef struct AspeedSCUState {
     /*< private >*/
     SysBusDevice parent_obj;
-- 
2.7.4
