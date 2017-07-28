Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xK18X5QqfzDqmV
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 06:46:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hEjoRoTt"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id u185so9564301pgb.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=StfNdUdffgsN+fIkKahc9yypHWyebxVJCilZL6F/Sf8=;
 b=hEjoRoTt9keNwuopbSxLQkhuGfmifHxl6nuG3dq0BvQSv95zGsU/fHqjuCaQ8JCQaw
 K/9PnTZ1Wv56ifKBdXqzNj3S/kuRPB8SQbcF9v46sgpAf3R9+ODK6plmqMjUAPpmWfia
 FqoiaFYiV3tiXAH20uz2x1gbkggP2BLLtBKILkSkKYIavDroHU90VqarutIDwW0QWcj5
 B/Uuoar8LgfjiEr9tgXIUd0MzsZoVN+uUWADoLDFmTFnVvr7iECmw14Y6+VdmwK76HB3
 ndczLT9RcxvgQg/6MMfhoEOmSqdSCd1sXknxtcUh7qO1SjPSatkf50939kXGtC8qkVJz
 /Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=StfNdUdffgsN+fIkKahc9yypHWyebxVJCilZL6F/Sf8=;
 b=PL01a7H7xhNeF73p14i/D8LzbphC+im2Sc/DRHyWStJGF5q3rWEV7pspbEyBL0fgfJ
 GMPfal3rkho/i4h9tB2FATNlPpNqXDuOtv1IVGXnaijbFmKHOda7HptCY4AmBvWq0KTn
 9TRCp6Fe80eThfMo54SvSr6oQBAp/qliuFUkJq9MyJ44RORtNN3pDnQmKB3xjkY9rQK0
 bu3mM+Sbt/oXlDEvgPq48RIxiX36hdkPQnHhwJxRxxJ9XLADsyBUw8s8AdbOKE/OMqyF
 uB/W4yzUElhR0UF0yWtkAoEebImSdhk4eWpBl47VthhjV1QDYLIabzBxaNcjjbBzDLQT
 X8WQ==
X-Gm-Message-State: AIVw110dpwpZiYbE4irZHFQ3Lyr3x2zqVgGiKFFouP8QPZ5ctt+qa3fq
 lFmz5JeUzjidapcx
X-Received: by 10.99.117.19 with SMTP id q19mr8457489pgc.442.1501274762970;
 Fri, 28 Jul 2017 13:46:02 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id y16sm4527836pfa.120.2017.07.28.13.46.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Jul 2017 13:46:02 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, benh@kernel.crashing.org, joel@jms.id.au,
 rburanyi@google.com
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] i2c: aspeed: add proper support fo 24xx clock params
Date: Fri, 28 Jul 2017 13:45:57 -0700
Message-Id: <20170728204558.6455-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc0.400.g1c36432dff-goog
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
X-List-Received-Date: Fri, 28 Jul 2017 20:46:05 -0000

This fixes a minor issue pointed out by Robi <rburanyi@google.com> and also adds
a couple improvements that he suggested outside of the mailing list.

Tested on the Aspeed 2500.
