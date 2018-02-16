Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::22e; helo=mail-pl0-x22e.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gjytdbKx"; 
 dkim-atps=neutral
Received: from mail-pl0-x22e.google.com (mail-pl0-x22e.google.com
 [IPv6:2607:f8b0:400e:c01::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjHS54zphzF1JY
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:40:20 +1100 (AEDT)
Received: by mail-pl0-x22e.google.com with SMTP id f4so935337plr.10
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 18:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=S6PFHdf+VqQ3ppM9Dfh1IT1gVnQmYku9fSUfIRBctEA=;
 b=gjytdbKxTI/6HxFCQc6DfjCOCsPcxf8J3Tv/tGXQxPbZjr9hvdi2LmOsyKxM1bP8cx
 ioK2YnAlVByZMJtOOQ13WJprxaE4JatkfrgNgDq7kDgfGZUA+fJBRCZywC94IgtPdyDI
 mLfBCSLifYphY8V5oZ/uUnhMfOym/ZnVuUtn/fY3k0fNkjWZzpaml2jzLi/QMkFAkWl6
 +WCTduZgUxAuHgXWzGC7TiRbQMhOF+X3oOFFL24i17szZcPBApoMGVQYm7aqVLqxHJte
 NudetdpKeIzUYjeBIP+3nIxgtNZip+XPomz+g4Co8r9AqvNgSoENnpcPtTqkjowi8ZHL
 oICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S6PFHdf+VqQ3ppM9Dfh1IT1gVnQmYku9fSUfIRBctEA=;
 b=sMbteICnWiS+zpyyT6Xyp8WiXg4hVQQ6kyl8XthVTARF7AR11Z/02esWd75xyW6I5b
 w7OvSBC+0cQCzFM6jCSju5QRhrHdQWowktLK6LgY2hJnPk5TYuKs934D+/OYdt8Ren+K
 Tl+RQrrOwQDNzTHw/36pFzqZyV8Fw0cUz96y1f90hR5eWzFoFH8Rc/pF5zHIJBrgph5b
 EB9Pi11mxbKrmPjzlXWE6uGW1VecvTYDtDJLc/brf1UTwDf4sgVaZNbkvN2DKhQPfuka
 LevVHeMoeMd2MsTlW1RG5aBrf5Gds7XQxSFWouTTT/TgfhMXtjy8rvSwgDjmULjKhdmj
 mLEQ==
X-Gm-Message-State: APf1xPDNHnYhFX6T5SGge892R80Er6EKeiNf3rkPuWbHGH0ak5lL7xp7
 UbtULJo/ee5jRGlOthLdmeikEw==
X-Google-Smtp-Source: AH8x226H/x7TWV39lRFml1sFJmvG6oN3KmG97JV4nUMuYUVwR77w/uLJpS5iatTnCN1Bn3TIN/7ZDA==
X-Received: by 2002:a17:902:4e25:: with SMTP id
 f34-v6mr4296315ple.68.1518748818121; 
 Thu, 15 Feb 2018 18:40:18 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g16sm9094041pfd.23.2018.02.15.18.40.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 15 Feb 2018 18:40:16 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, julien.thierry@arm.com,
 pombredanne@nexb.com, arnd@arndb.de, olof@lixom.net, khilman@kernel.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 15 Feb 2018 18:40:08 -0800
Message-Id: <20180216024011.189157-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.1.291.g4437f3f132-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 02:40:23 -0000


Addressed comments from:
 - Arnd: https://www.spinics.net/lists/arm-kernel/msg634442.html
 - Joel: https://www.spinics.net/lists/arm-kernel/msg634554.html


Summary of changes since previous update:
 - More device tree and binding doc clean up.

All changes tested on Nuvoton NPCM750 EVB.

I went ahead and decided to submit a pull request to Arnd, Olof, and
Kevin, as requested since I figured that we were about at the end of
feedback and we want to get this in.
