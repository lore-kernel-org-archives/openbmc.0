Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::22f; helo=mail-pf0-x22f.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="no8Yyqqt"; 
 dkim-atps=neutral
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xprlm5bn5zDrbn
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 07:57:38 +1000 (AEST)
Received: by mail-pf0-x22f.google.com with SMTP id e199so6367028pfh.3
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 14:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHd1Fk2qRLobsoOjezGKK9A30TNm8aLUFCivWSbTtFc=;
 b=no8Yyqqt6nqqAxSe2qYktHJuKNK6/iFTshrI3dMyD9kAVWxASb/Hu3lyI3jqyKrL8Q
 0Kld8Hp49N1TTh5Pfg9Qm9XRSNiUnSMx1ZgkCqIYYroL+afoUWbFSLS/oKDfUSBjiYiN
 10gCM9mlIAVRFXmQ059+ZzCu/9W5US3UmWXn63bfjNYzyfqo6vWmthQgS0gPPP4q44jX
 HeZtOiUZS6B5ZYi0Z/DlR8u4ZBBPQD4epKTvN5LyhzHnxQixNQFj1CXv0KYYS4rBWVKC
 Txolz4NyNrpTZtOJHMcc7qoonI7KAgDIPY6M7SUS1HC/UWrwkYPNrEoXRy6JfXp+i9n4
 e8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHd1Fk2qRLobsoOjezGKK9A30TNm8aLUFCivWSbTtFc=;
 b=tZ+lgls3/g5XBqgRR02Pw0Oo4siX6bO/7YjtrCV3GYA7Gg0SOl6LPZ46Hd7+5T+EGe
 2iECv6INKv2CMt+Luidb70n+xz7aepnwReiFLTICgr1wLs2UTvsECXiECrDSumUkXS+J
 3qrT234nXROcRQh+iV+7etuCfFn0SFz9ezUfc48ugEl104eXYqpb/gC0rTSlmt00Am5v
 kpD14y47OlB/kLk3pGbn3G7pkTwYtIMggJUlqmnZVmLUurlfCnqcPOd82MBE/9wbtC85
 vphNlVaJmqWOFcclNHCTsAurCKGBdqISN4sW8T7akwonBKCxPRgO8jbENcOG832z98tS
 pjGA==
X-Gm-Message-State: AHPjjUi+aKJH8C+d9EPWkIu0wdbw6caRY4YuBocrudnkbc3YmrhSEcV3
 uaXgrfRlweM+NnNvsEUj1A==
X-Google-Smtp-Source: ADKCNb4h4A6EIKmeLGy9uI//8Prv+ulQQBXrLNrmpFIE2CQv5pY55hf3cBbWn/KE9oc4yy9pGNsteg==
X-Received: by 10.98.103.89 with SMTP id b86mr4381130pfc.319.1504907855771;
 Fri, 08 Sep 2017 14:57:35 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d21sm5393300pfe.68.2017.09.08.14.57.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 14:57:34 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/5] Update device tree for Zaius DVT
Date: Fri,  8 Sep 2017 14:57:23 -0700
Message-Id: <20170908215728.115818-1-xow@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 08 Sep 2017 21:57:41 -0000
X-List-Received-Date: Fri, 08 Sep 2017 21:57:41 -0000

Robert Lippert (2):
  ARM: dts: aspeed: add LPC snoop device bindings for ASPEED G5
  ARM: dts: aspeed: zaius: enable port 80h snoop

Xo Wang (3):
  ARM: dts: aspeed: zaius: Use LM5066I driver for hotswap
  ARM: dts: aspeed: zaius: Update hotswap controller address for EVT3
  ARM: dts: aspeed: zaius: Add PWM/tach peripheral

 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 41 +++++++++++++++++++++++++++---
 arch/arm/boot/dts/aspeed-g5.dtsi           |  7 +++++
 2 files changed, 45 insertions(+), 3 deletions(-)

-- 
2.14.1.581.gf28d330327-goog
