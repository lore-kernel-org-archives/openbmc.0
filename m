Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::22f; helo=mail-pf0-x22f.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QnaayqeK"; 
 dkim-atps=neutral
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydngd2tjZzDr6M
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 06:07:56 +1100 (AEDT)
Received: by mail-pf0-x22f.google.com with SMTP id q4so2568224pfg.13
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 11:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=g+57CWcaK7+ZFXJ8A5sGL0vqQlahTZ5KX9eghGqZ1nw=;
 b=QnaayqeKCoIyKyzhnVmcgmFRllhJ4Ga/OVJVDGPmL2MSw4N3WrujOvopemBI4AnP6s
 mfOt1x7TqjfjIDa1JsyulbpZW/D7xVWLRnITRbaM2BEwWZwJr9bKD5EbpecLOvNbrSmC
 jaO0fbGfTO38NVpJX14BZDIeqSKAFitVJnAHgGggws0+tgsm+y+1/c/NVNzk31uK0Gxp
 sZIJEETPeASyWwUX0BaSf5ZtE58jgMvRnUJlmF4pTQ9HT/b7wi40+9pbyU12i3bttJOJ
 eBpptkNhEwERTwQRuJzxX/f1GRu26l19/sjWJXOJ8sitKrTgJY4+6c9QO/3Wp+1qia0B
 I6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=g+57CWcaK7+ZFXJ8A5sGL0vqQlahTZ5KX9eghGqZ1nw=;
 b=UxdhnOIxB78tBoc4EMYxCi/8/kLfENNgplxI9JYnmUs/ndbEL7L6B0dAA0xRgJszwM
 fJkkDhKfnVcxeQpzy8VGD8ZGbu6c6yLzLzSLbR7Y3tZItKk/2Runuqw/HdSGx7zkbBvx
 5Uu+Piw4x5+maSyJjDbBRXZVEguaSatK9SC4aTdSFVeckE+4wBtMP+M2h7qS85+pgqMw
 NlPFjPrebUzT394dwYSgI25qFh4dgJ4TlzpCibxp48T3ObpixOWhkhjLkKq40ZpjYaAC
 +YyfHRoAKmLndyijRy7Ow+6wLlhCj3hgh2XapDcxEN6b0qm7gARA8Zc0xBg5PLwm7yPV
 dsvA==
X-Gm-Message-State: AJaThX68lyhsjFoSM9apxSy4vEZNoR5RXRexQ3aEv6SdMCvT7Vq3arYn
 LMRBS+uru/kPIkeAW+S4+jPakA==
X-Google-Smtp-Source: AGs4zMbvY2m5OSWMN1yQdsseWGtm0ovnYuoRjZ+PLZG4cCJtbnqfkqbZ6erCn+KBMC5VfhZHIph9aw==
X-Received: by 10.98.150.26 with SMTP id c26mr249327pfe.224.1510945674062;
 Fri, 17 Nov 2017 11:07:54 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id z71sm11626964pfi.172.2017.11.17.11.07.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 17 Nov 2017 11:07:53 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com, julien.thierry@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v8 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Fri, 17 Nov 2017 11:07:44 -0800
Message-Id: <20171117190747.21642-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.15.0.448.gf294e3d99a-goog
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
X-List-Received-Date: Fri, 17 Nov 2017 19:07:58 -0000
X-List-Received-Date: Fri, 17 Nov 2017 19:07:58 -0000

Addressed comments from:
  - Rick (offline comments)
  - Julien: https://www.spinics.net/lists/arm-kernel/msg613222.html
  - Russell: https://www.spinics.net/lists/arm-kernel/msg613212.html
  - Tomer: https://www.spinics.net/lists/arm-kernel/msg614059.html
  - Rob: https://www.spinics.net/lists/arm-kernel/msg613355.html
  - Tomer

Summary of changes since previous update:
  - Arch support:
    - Cleaned up L2C aux values
    - Cleaned up memory barries
    - Renamed CPU_NPCM750 to ARCH_NPCM750
    - Other mostly cosmetic changes
  - DTS:
    - Added property to L2 cache
    - More clean up
  - No changes to MAINTAINERS since v5

Changes have been tested on the NPCM750 evaluation board.
