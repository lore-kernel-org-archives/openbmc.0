Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::232; helo=mail-pf0-x232.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ms8v+608"; 
 dkim-atps=neutral
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpxzf3nghzDrnT
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 11:53:17 +1000 (AEST)
Received: by mail-pf0-x232.google.com with SMTP id e1so6915854pfk.1
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 18:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=n1o+CgbFwDGix2p3XIkRM0JYkFfFvtk2dhZlpZeL+Ag=;
 b=ms8v+608FGyBTKpkdyOigBOsyzVAz3uVczdommWSFXkuh5JbsDIDPP75iVjjLVsVSe
 LndZsNJndm/v/iJ/eSKNu91ixANFjVE9OLyOgQyG6/F8YpPWmj4WoqrledabT3Y7Gj9g
 Jd799HYaB97vPR1t18osetoTq+A8EPqQqUU2I+mZ0PiJFqr4dwytacNSnb1Lk7wlgxvr
 sT0hMNeWT/ZfUMjtwr90OVieeuTT+1xcTMRUF0DLbvaWJIAJwb7k09tH2EFb1BGW/Wo0
 xYqzCnifI/QE/qabfQBFPvouy2OU5KuUzTfnq2jo+/NIZDCjfbBl704VXvHYHe4UySxY
 UqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=n1o+CgbFwDGix2p3XIkRM0JYkFfFvtk2dhZlpZeL+Ag=;
 b=ayVsc+49udnBVyGeIJgHqg6U+MGhaTeUCR6XqwVqa36q7O1C70kJomADdOXQRFfOha
 mD6sMG0bSOM5BAZsTOvew9zHT6J+2TBWlZD/mFX2+7TGBm2L+Zsspq0+JRnxQJkCnonP
 FPwNLeSgeo0IzQZEQju9nmPSWO3OUMjw9oenrgwu59Bc4o+Iry9rom0AbVoCaztPYVn1
 rGz9Pi7GnFpUKVxFYSdSuayAOQpcAYzFlYL7xBwBVNWF8GOZIL6X6OLfztmgnrwkWfB4
 uULtSUEeqTn4PzsaOJfMY/1rv/AFO3w0ZfKDBBul6+IKIpxFbePvl4d+6GWc1NaJl3Q8
 Ypgg==
X-Gm-Message-State: AHPjjUjIgAZIakbdfDxVMgbP9kJ6+9l+VKn9dHx9GDEa8B3V9UoQ3CUo
 pNsaqv9Wbm5v3yZa
X-Google-Smtp-Source: ADKCNb6YKhSyeSaRa72alshFXVj8jlE5KuW9TW1yZapjuESpXbNvb8ZHfFaFeFGV00jy8fNtA444fg==
X-Received: by 10.84.210.107 with SMTP id z98mr5524172plh.182.1504921995899;
 Fri, 08 Sep 2017 18:53:15 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id z15sm5090132pgs.41.2017.09.08.18.53.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 18:53:14 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v5 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Fri,  8 Sep 2017 18:53:05 -0700
Message-Id: <20170909015308.30001-1-brendanhiggins@google.com>
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
X-List-Received-Date: Sat, 09 Sep 2017 01:53:19 -0000
X-List-Received-Date: Sat, 09 Sep 2017 01:53:19 -0000

Addressed comments from:
  - kbuild robot: https://www.spinics.net/lists/arm-kernel/msg605356.html
  - kbuild robot: https://www.spinics.net/lists/arm-kernel/msg605325.html

Changes since previous update:
  - Addressed some minor issues caught by build bot, no structural changes.
  - Changes status of NPCM MAINTAINERS entry to Supported since Avi and Tomer
    are paid to do this.
  - No changes to device tree since v4

Changes have been tested on the NPCM750 evaluation board.
