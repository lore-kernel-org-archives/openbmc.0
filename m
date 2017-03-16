Return-Path: <maxims@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcx4PqKzDqYy
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="A0RkxE2H"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id g2so30989746pge.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X8MGfNZnSW5v5NBjj4JstkzfC6jVCe3LQu1hL2BqvMc=;
 b=A0RkxE2HxMY2y1wvnNrTJA1Qy8KwKXbyqfoT6bvO8S+cqKACgj0h8czhJtlago03rS
 xrL5I7u55EJA5QFpFfu53Vv1rMdZVA0YOlpJ4hUQAeQxpZ2rAYC2Q0YJiZh5mXxU/dGZ
 34vUOq65Dirg12t8yTiLZu+baVIHUeR1kC1tf1wLvJO4rjT0R4fcn44Nk28qTdFpoJ8A
 0kwgTv2T8W7oOyPFnLMihLkpnqOFJhx7YLB6FDfbuq1K4ePZxsuwH5w1+l0NbW4PO9yu
 hRs8YPMbufWpfD7K7Oy4DHgCMjkmmNsKcGVe/BnXTjvTheVpgCg9zRID+UqoZCt9jGqk
 BKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X8MGfNZnSW5v5NBjj4JstkzfC6jVCe3LQu1hL2BqvMc=;
 b=tIJSW8jPt/9m1PmapZnAsEvT7NPrJ4ie9fvT4q+nDsMxLIWkXTtazh7Gr0tGF5ggZQ
 tjiGydStUk9XN0JoqLm4Oogz5YsyTvZttCe2exbVh2bpWJfWNmhaC4e4wkOpEpJi62CM
 fi3TSatOGQRQtNFY8ZOdmhgl9nzGrT5B7YEtN928XNDPmCcz55kbiRXSuNxse8tuBqS9
 mFu2G217g6ary9aNkt/4d7FmtUuKF3t9Hn2OOyvNDfaTtbotenFwC3PnqybflNAHUmrb
 18o1Vn17leeoqRvwC7to1dgmjKfrDHgnaP16Cj1kEi2qU8mj2PuLFnG9ZNfdZudhf96U
 RjdA==
X-Gm-Message-State: AFeK/H0pLzh+lhMPdsvuEAJq18Fl8FIAnAmt8FG0fkRt24SivWNcoyIvJLA8qGp5noGzmtpw
X-Received: by 10.99.147.16 with SMTP id b16mr12416011pge.126.1489700207665;
 Thu, 16 Mar 2017 14:36:47 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:47 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH 12/17] aspeed: Enable I2C in EVB defconfig
Date: Thu, 16 Mar 2017 14:36:19 -0700
Message-Id: <20170316213624.140344-13-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:50 -0000

Enable I2C driver in ast2500 Eval Board defconfig.
Also enable i2c command.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 configs/evb-ast2500_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index f8ef9b779c..08b5f85a34 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -18,3 +18,6 @@ CONFIG_TIMER=y
 CONFIG_WDT=y
 CONFIG_DM_RESET=y
 CONFIG_PINCTRL=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_ASPEED=y
+CONFIG_CMD_I2C=y
-- 
2.12.0.367.g23dc2f6d3c-goog
