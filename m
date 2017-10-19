Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::232; helo=mail-it0-x232.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GLzKqoIW"; 
 dkim-atps=neutral
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJ40N1V5tzDqJ6
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 09:50:59 +1100 (AEDT)
Received: by mail-it0-x232.google.com with SMTP id r127so11551238itb.5
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 15:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yO6gpkhSh0SN0XZen52QWfifuJTFtuPwoDdWNFKNaF8=;
 b=GLzKqoIWSILRlRWR+F4OvNJTZHVK/9h6x0HLv4fjzxDxbEnVVef2CNf2yfECn1rlIW
 N7c/7Es3oIzwiZP2BUofoSNwtp23U8QLZikl5xM4Qju+G4RWKLGgOEZWRq7L/tu6mh2P
 3MQZWjnmpoqkMYbFQu1zSYMAflYNTggYDsUxA3g9uWNsY0aiIsS2x4nI+4DUBmJU+J0R
 wp26cdwb3uWyTImn+EdcndAUZwPSpudv+P/I0C+2LTuOHcYNWQDVSDmORKE3OmNY36AR
 dmgB1+O5Ryr/8d0j/5LJdv6TeG1f8YlL7fF6jMMHbYG8jaXWlC2FAQP8KPg1T7cWRQvj
 WOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yO6gpkhSh0SN0XZen52QWfifuJTFtuPwoDdWNFKNaF8=;
 b=dm94xaccmUdXpbcmqHFBalAtCVsUndY+QyrhxS2Dw72YxiK8k+fVLLUBuVftZ5dxFd
 8GkQoMyf2cDbSd7xDlWqnwJMuzp9Aqtvhbuo2UsccHeFQVTuce8cLnW6TQwMKXBCYHvP
 y6DhOIEtZHkMIc9swJRPR2kYtHj2dvn/42iV5E68oAyqSLrxqvU8fW7SXXbT4xkOVWVx
 UC7EyofGb/78R6fpTaSKC4SK1Ey1xvh7iRVf5BbS0z+fpJQZ2yxaZ+hNZ1uBjMa0WqPE
 N0+rQUjLk+AkyMWunvNnfIsGdzp5Kn7/03zv6yJisXJDmBO47jeCs21jvGGzw9ME7gEL
 /+tA==
X-Gm-Message-State: AMCzsaVeLRoVrBYTCurf8Zzrgf8J8duC4v8DY67l58iEGZSHNP24E8jm
 YdELgW6TKf+TvyXK9jrFoD/w/Q==
X-Google-Smtp-Source: ABhQp+TaWk0o+JiSz+x5E5mYlCVbY22ahPwGGFtnv6NPsmxUY+b6h2GyQwAnCZ8gk/0eRhKXjZUwzw==
X-Received: by 10.36.73.99 with SMTP id z96mr45188ita.36.1508453456790;
 Thu, 19 Oct 2017 15:50:56 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f193sm521979ita.27.2017.10.19.15.50.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 19 Oct 2017 15:50:56 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH v7 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Thu, 19 Oct 2017 15:50:47 -0700
Message-Id: <20171019225050.25410-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.15.0.rc0.271.g36b669edcc-goog
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
X-List-Received-Date: Thu, 19 Oct 2017 22:51:00 -0000
X-List-Received-Date: Thu, 19 Oct 2017 22:51:00 -0000
X-List-Received-Date: Thu, 19 Oct 2017 22:51:00 -0000

Addressed comments from:
  - Rob: http://www.spinics.net/lists/devicetree/msg196376.html

Changes since previous update:
  - Moved all memory mapped nodes to busses.
  - Map ranges starting at 0
  - Moved external clocks to root
  - No changes to mach-npcm since v5
  - No changes to MAINTAINERS since v5

Changes have been tested on the NPCM750 evaluation board.
