Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22d; helo=mail-pg0-x22d.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LOpCXzDo"; 
 dkim-atps=neutral
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxd9k1PMDzDqNh
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 08:40:09 +1000 (AEST)
Received: by mail-pg0-x22d.google.com with SMTP id i195so610711pgd.9
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=q+3F45ZReJpBTA+Jyy4mirGzInQW2MAj+tZBav7H3Vw=;
 b=LOpCXzDor/idIFry/S1uvIOvQNQHjZ0O+0rRpUsuBQCPoTOs61ZgxKAvYKbcqR7ZzP
 ZbGJmmWkNdvM/AmLJk3z7Dt8k0tzDKVVND5Hjcg8MSHQML3of8W+hbJNYp7u8G5rD13T
 wRdrwRuJ6sd+dN8l3FAjlDxkj3fEieG2TFc14CA9hxNdF6mg+DPhzQNpafJrvbrg23nh
 fIwhyEJqJlaMoOK3J0XcV+V5Q8UTu2g2TqgPRX2ENigXWAkxCKia6YjwTIZx2bFb3S/q
 VQH4pvZbWb4PEACxD0udAxSg6u1jasFMXuaOGua41QMow9Xc4dYzTj67Z+B48ZyKxMwo
 k44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=q+3F45ZReJpBTA+Jyy4mirGzInQW2MAj+tZBav7H3Vw=;
 b=cn/jvLWmVaCP7futWRnfrpsswdQwDu/Xt80kx4nbS09u2BGBpoQwaUsxRDlL5tO1kW
 fyrfcYYhnisCLWxWb/0u4mWpDwMw3X7T2eltPwBF4GJ/jn8rNpAw0/GdldYUsF8hUXru
 D5m43VvJAX6MlFECgBsghxJZLmYaeSckAp/kioNpGAcqnbfTfeSH0AK6WC6gEBVMezS1
 Kheuw+09ENuCmV6svsVIoESmkV7aO2D5c2hsORHE+sPS5GSMs9IN4gktjBuZg5kBvDMc
 cn571Irg5+TXci4uJ7/WacpAktvhn12uSNq8RRxqhLHKqcRmskZW3wHIMEbG09xV9IhM
 B24Q==
X-Gm-Message-State: AHPjjUhOOcK3Y3sOCD2HkwbjqkSJ/Rl1TLCQ+gnpLydO89g4LpCsEFir
 RWgEdT6+9Jab7gqzojJx1JSj8A==
X-Google-Smtp-Source: AOwi7QByexEGlZFZ74didoJkui+Uc3+ST+JD4nScWwJSCY2uKb2VPx38NDqlsIUb19/c6ivP0dUm3A==
X-Received: by 10.98.14.29 with SMTP id w29mr120152pfi.229.1505860807189;
 Tue, 19 Sep 2017 15:40:07 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id v31sm4645309pgn.43.2017.09.19.15.40.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 19 Sep 2017 15:40:06 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v6 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Tue, 19 Sep 2017 15:39:58 -0700
Message-Id: <20170919224001.22284-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.690.gbb1197296e-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 22:40:10 -0000
X-List-Received-Date: Tue, 19 Sep 2017 22:40:10 -0000
X-List-Received-Date: Tue, 19 Sep 2017 22:40:10 -0000

Addressed comments from:
  - Rob: https://www.spinics.net/lists/arm-kernel/msg606616.html

Changes since previous update:
  - Addressed some device tree issues pointed out by Rob.
  - No changes to mach-npcm since v5
  - No changes to MAINTAINERS since v5

Changes have been tested on the NPCM750 evaluation board.
