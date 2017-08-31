Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjyNt3zpjzDqGZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 08:54:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k/bIjV6v"; 
 dkim-atps=neutral
Received: by mail-pg0-x22a.google.com with SMTP id b8so2868370pgn.5
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 15:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yw5WQIcs1Kh22FOYBj898Hyza9T6qlv5gMMvcWAAm2E=;
 b=k/bIjV6vF7elIJha2ct1r6zznVtZ/3+jI1bIur2/OrqfcLVkX+iyev5e/Re+vOaWPi
 /xm/j5xibAnw4N0XbxA+4wuYqQue5FZWJHvC+RMOSOHeGkh0fqx4TgZayo+Ni6/oGQys
 sjiwTNLG19aDxEf+pGnTbnHPK0fTt+5Pm5P6BF5FaSAEiU8uNEAQPLNPl+EAHbFwMxbq
 t6g4yytcfKtNvs0M7ka7qG3cIH1RvyHsMr7lkBQI0SHp9DoKnxYePHQI9lh9GiQk/BH5
 MtSON+UjzrG7/SBUNOXzPHsAi+m2sBs+G09467dQQEJpZfAnr/nXw21fKConI1Uxz2uJ
 A/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yw5WQIcs1Kh22FOYBj898Hyza9T6qlv5gMMvcWAAm2E=;
 b=D0a1aD06Q0oYXOb3tNERJGDsiLW13RXVbIBoUtSkhJyMr6zSJGurdlC9Xcqy1ydtBU
 VIPk0qCmXm3COoMN93S2gArSIaRLAgP7Ij3log3tQP5vTdFAylVdffluQOnkreJ243Gt
 0EaZQApqHB7SnV82u/QscJ8gek55ZrLtG3ucQ9VrTfp5sD/dcns8FfWXkGlESGN0Qf6n
 m6h+wxlqCVD5m8L3qVoy1spGBGaRdg5GNlWJtnbhE7QMDF0L14lqMH3aZAOgCy2yVSd7
 w0dMC64UPkYc+TBHlhaln1q8N6j6KaPsR1GuXzDk4rTmRVHWPHpS+acli6jxeTKwTfKJ
 5AEw==
X-Gm-Message-State: AHPjjUioexNM/dekSf5z1J803MfLP17U6OLQQuO/AzfRYjIqqIldPAIA
 pnrs4aIqZevIcZDc
X-Google-Smtp-Source: ADKCNb5cbPyzmZfhKjwYO5e8BRyXprqoVcpcRdrZwjhcDtCYMplNiTeqg2JJTF0MWyn6uxmWVFLmgA==
X-Received: by 10.99.115.92 with SMTP id d28mr12859pgn.339.1504220058725;
 Thu, 31 Aug 2017 15:54:18 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id m66sm888461pfc.22.2017.08.31.15.54.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 31 Aug 2017 15:54:18 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 31 Aug 2017 15:53:57 -0700
Message-Id: <20170831225400.19756-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
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
X-List-Received-Date: Thu, 31 Aug 2017 22:54:23 -0000
X-List-Received-Date: Thu, 31 Aug 2017 22:54:23 -0000
X-List-Received-Date: Thu, 31 Aug 2017 22:54:23 -0000


Addressed comments from:
  - Rob: http://www.spinics.net/lists/devicetree/msg192130.html
  - kbuild test robot: http://www.spinics.net/lists/devicetree/msg191902.html
  - kbuild test robot: http://www.spinics.net/lists/devicetree/msg191902.html

Changes since previous update:
  - Added dependency for !CPU_V6 and !CPU_V6K since headsmp.S depends on v7
    instructions
  - Dropped errata that depend on !ARCH_MULTIPLATFORM
  - Removed custom smp_init_cpus from smp_operations
  - Numerous changes to device tree support

Changes have been tested on the NPCM750 evaluation board.
