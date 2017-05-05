Return-Path: <maxims@google.com>
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpd6SL3zDqG1
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pF/iaNh1"; 
 dkim-atps=neutral
Received: by mail-pg0-x22d.google.com with SMTP id 12so8838058pgc.1
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=USzGfm2NjFFGV6wDymSCY5E0XnbWng+d3OJhbhL42M8=;
 b=pF/iaNh1QLNx698nY2lNNvTQfLFF4IrdGkBS28wgZJPUjBhZNqJmY8jfWR5ICLrrMA
 2JLw/ObLZz2lUrPcukSoQZpx5ZDTP/QBeBG/VoqANKsFjuu02ux4y9TfJopEV8QER5Ta
 uk0lIMONJ3KEOSqgylI7hCQmBa1oKYAnXUFewH4c5ynPmWKKn6wJ6wK3yNbc3Hiz+NOO
 z1Rs1StEcnAljJJ3XF3r2a7XFpFEBpi1YT5kbyCKg+BFtCj8bRZfyi58DrbFDmOVC/SI
 z9PyNTdILQPJsyNDsgLHlZPxYvGFS3DKR84cxqDVVPfZaw4SaElpYhiH6M+NgwO7xBhg
 A9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=USzGfm2NjFFGV6wDymSCY5E0XnbWng+d3OJhbhL42M8=;
 b=B3HdFSF9KHqYHWv9gAb5YibcdRzRtjQCziV9ou/Wy3AA0PJomI0xSOF9lP7gzvDhms
 ZvbfbXmp4nhAheCAI4mZh30iSkJaW23jXAt5B6ncDuORtHbmwLdTjIGEtOiBqKp9daOF
 yf90BgtQLZ8lSe0DwQ8Wv46drScc+8ZJ1nCkdhOLVxRgo9fEOotcIBEj9Zqp2rKkN+Wz
 zUFVcxKzCnmJlVlL6XNAyeS5wPzcujsTnnqi489jj8I8BGF04AluRYHcg+Q7wToU2iWw
 96PEdD7fXlmzBbJJtoxiPydDsIBzblQqmDBdC92FwEZv6o5pIFhpT1NNp8kB3zSVZTlR
 nN9g==
X-Gm-Message-State: AN3rC/7BjQxjIyWb+Xp5/8uDujMJYQXc0ut2QPjvfnlLNfFN4K6voWUe
 BphffVSQfjuKHDvCO4Phmg==
X-Received: by 10.84.233.131 with SMTP id l3mr31083925plk.18.1494021703930;
 Fri, 05 May 2017 15:01:43 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:43 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH v2 09/15] aspeed: Enable Pinctrl Driver in AST2500 EVB
Date: Fri,  5 May 2017 15:01:09 -0700
Message-Id: <20170505220115.143025-10-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:46 -0000

Enable Pinctrl Driver in AST2500 Eval Board's defconfig

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2: None
Changes in v1: None

 configs/evb-ast2500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 74808a71ee..f8ef9b779c 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -17,3 +17,4 @@ CONFIG_SYSRESET=y
 CONFIG_TIMER=y
 CONFIG_WDT=y
 CONFIG_DM_RESET=y
+CONFIG_PINCTRL=y
-- 
2.13.0.rc1.294.g07d810a77f-goog
