Return-Path: <maxims@google.com>
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com
 [IPv6:2607:f8b0:400e:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhct6MNpzDqYb
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oHMoLtZU"; 
 dkim-atps=neutral
Received: by mail-pg0-x22e.google.com with SMTP id n190so31127969pga.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ChunKi0CHJXOnjhRbCGWhLVnqYDG1uvu0c8039L3OUg=;
 b=oHMoLtZUvy5ZqqvxWMymyezvtsCzoGbxmqXf9oGZnJiIGjZeFVgmn1bMoQvEKwPiQW
 0J91zyixC5fT+GREySyr6HvQ5SuMA2n42EA4zLquu1Npxcft/iHhczUQ1L4uisHBNKR3
 aUCQ1G10Qkg0G9hUb8kNj6kzwGux7av6B6GCScbXnHR/OVeYUJuKiqFJYxruZ7/Njcax
 iuG8fLqR6cU1bixyD0rOB+1rNqHKQ2Wh13id7RMyVV3cM+ZXJw4MpM6ABZ+I9spFxjPA
 AugC4kgBocmJWtQ5k0NK9FNSCz13EcCIfIVGMmJra8JIz/YOKJxAFU9xb2cKZAtf0xLy
 YtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ChunKi0CHJXOnjhRbCGWhLVnqYDG1uvu0c8039L3OUg=;
 b=d167LaH7GO+fbkmrmze8iTa+pcP8nRlsHfpo5hKESvAkGvldslHfjq4bt4I7BPrQGa
 VudtkideaRgijcd8R6vGYtVfGVxHJ1Pj6ulH4jCUomxMe349XO3ebzWmSOPYezS1f0jU
 gz0xXJW+gwrcG9p15qbkEtXlJrjdeB4qlQb/K3/ccGyFiAZISWm6kBJV3zeqWq+wXa6Y
 UijdHqXRcat+BfZLrJ5bJO+DN+nMFQxGxH6NYRqVc4nM/EpS3fNFt5eui9OMYqYGYnKV
 dSpzQyFmgcxmlmDuEVS130fSmpCWGGRKqq7mpfGTcB2vL/MUwzuB6ykvwwT/bIDVjm93
 3QSw==
X-Gm-Message-State: AFeK/H2t1alAKSJ/FtCgoyrQGsKe3k7ybk6J3u8adNFfJoMHTy1qIptUIrbxJRNhRC0FRlMO
X-Received: by 10.99.24.88 with SMTP id 24mr12519674pgy.54.1489700204908;
 Thu, 16 Mar 2017 14:36:44 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:44 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH 09/17] aspeed: Enable Pinctrl Driver in AST2500 EVB
Date: Thu, 16 Mar 2017 14:36:16 -0700
Message-Id: <20170316213624.140344-10-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:47 -0000

Enable Pinctrl Driver in AST2500 Eval Board's defconfig

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

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
2.12.0.367.g23dc2f6d3c-goog
