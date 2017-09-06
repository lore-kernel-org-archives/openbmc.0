Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22f; helo=mail-pg0-x22f.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iiBMtoXT"; 
 dkim-atps=neutral
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn4HQ36t5zDrFT
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 10:30:25 +1000 (AEST)
Received: by mail-pg0-x22f.google.com with SMTP id 188so9058121pgb.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8kTwwneCccbhZoNtOWxnzRtN1Mfux9LtbHJqhElQSGs=;
 b=iiBMtoXTV+oRnY7uB2iqlgePuF6+//nOJ7abTg3WqjBPPvRDj/OrEcTSa/cYX89VsC
 Gwh6WYoIEXxVlQ1cnlE6lYC2zZJPbajT1u7Aduf1EnEW1u/Wk4KezwX8fK0f/Lm92bvU
 BdgJPUeQMzOUs+YJzjphNqiqKn7NIjT6KRgUq1UWntDH2/G0PRA7JGtlxyb+EVhj98Kj
 6p1joJW0cGJqk1lA6wJzoZX68bMQAfy91p0VtrxzJ5EnIwhgO4/hlhc3Jia3nxGiegfK
 HDMcBC1kyc09+kt28QILl6qvvL3u0Y5Y5J9rzsygKHrwEgxYjA5t30ay2CTlmVoMTsBt
 qYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8kTwwneCccbhZoNtOWxnzRtN1Mfux9LtbHJqhElQSGs=;
 b=XZ9XV++mcEXdE6JggQCdF41B+O9jFYnduwoMo5Y2NsH5qwavzk2m7n/h+idqU65+hX
 o1drH5YFpXEuTBwyHSlzPG45NIAUPv7gyKCWhrMb8KaiqIjkWETHeaQs2VWcuctl4n6c
 /dH+PHoy9KtZOQYeHNeCrfBo61OUjy1a0K7eDPZjU6cGWuR9UlWY7OtBL4qJEGInJ5CX
 n+vY+gSRlEk7REudBKoXzHrH45lLy5h/5YVJvyR9HI3Uh0re5bDkHhLMWrou7mfX1VIo
 W8zjjmL2TODWmAo8B98kk+PhDfnzeDaEVgVsT7PIbmH18RqANFmsSoArXT1deJO2fEk+
 zCTg==
X-Gm-Message-State: AHPjjUjU0zRhDWCadjl5qHx6hfK37zLKgk1RsTvTLJBMuPKVou2JcWUS
 N6ZcF7g33RModnIf
X-Google-Smtp-Source: ADKCNb4OKub3nA7q04FuLG4Y2qhuooiwWYxJENdJOz8XJ0ipRLExnsLgmVeAKlF/xC0sxW5weDWq1A==
X-Received: by 10.99.181.23 with SMTP id y23mr5712895pge.283.1504657823603;
 Tue, 05 Sep 2017 17:30:23 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id v126sm176808pfv.113.2017.09.05.17.30.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 05 Sep 2017 17:30:22 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue,  5 Sep 2017 17:30:13 -0700
Message-Id: <20170906003016.2159-1-brendanhiggins@google.com>
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
X-List-Received-Date: Wed, 06 Sep 2017 00:30:27 -0000
X-List-Received-Date: Wed, 06 Sep 2017 00:30:27 -0000

Addressed comments from:
  - Florian: https://www.spinics.net/lists/arm-kernel/msg604948.html

Changes since previous update:
  - Substanitally simplified the SMP code for NPCM750.
  - No changes to device tree or MAINTAINERS since v2

Changes have been tested on the NPCM750 evaluation board.
