Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2CL6BPlzDw0v
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 12:00:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PjuL+ZRL"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id d2so35134530pfd.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 17:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=lWxwAUENvf1SjGI5MRwJEVMbveF5XcLjWccisqW4g5g=;
 b=PjuL+ZRLqsk8Lgew1BEclWkylsWvvNxGM7nQj+Ciud3JFcRu6bN948voCXHCah6B86
 bUArNV/8SV0A+zWK2tSDDsTG4+AmKRKE5m4JODkPolN66PoiFhGlOpqgnnUQ65h+zZfT
 cQunbD8KrtFXehb62DXl7H50iiXe5vN2ssnWWpkEQ7aU3wermKWPT/gZvoymFG2Qe6V6
 hYE55vpW5I0oqfKtygA4OkMWKhA+A72H+HOGkgR8k9So0d5p+yz2cPwAoERT/mdvwSKB
 FXdzJkydSs+h88In+jR+9rUU129DKpDf/173x2hs88KK8JhQvVaFXnckl9JR0Ki77PCK
 hkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lWxwAUENvf1SjGI5MRwJEVMbveF5XcLjWccisqW4g5g=;
 b=G4ZQTR5itW2YdYje3G812P9pBYt6w4rpkoaGRedwd2VBtSURjj3zWt5AfDA5qIIWhb
 1sEI3SLHxdlPcWdLU1UgrYg1V6tF4bCadThfsQqKiOczSSKfBkSpoNqWpmrt/78GhQiW
 JxU4b9qte6FWtR+qbk7kIS9vJUfCVvkM1AF0jmXTpyMTwAxtT3t2BEt5LMeMdLBH/xss
 dwojvIKqSYJtUZjMVqJkAGzNAgVNxHZU6QVRdT9LpgFm3UEibtF5vE09gwIE0rbX8hK5
 ga/IwtANE1BQZYo6i13JiTKUL5K0dvKU2QQ7nOv1vYOibywFJ//TXPsYxjlMH1XB5rjS
 sByw==
X-Gm-Message-State: AKaTC02J2+ih8jbBh0SIjd3/w+xWTaIBH1YQRWfaUnRaA8eAmKvYRZQqNgj0KG1SUaxG8LYv
X-Received: by 10.84.174.67 with SMTP id q61mr65748808plb.93.1480467628873;
 Tue, 29 Nov 2016 17:00:28 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id j190sm79598297pgd.23.2016.11.29.17.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 17:00:27 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, vz@mleia.com, clg@kaod.org, mouse@mayc.ru,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 0/2] i2c: aspeed: added driver for Aspeed I2C
Date: Tue, 29 Nov 2016 17:00:16 -0800
Message-Id: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Wed, 30 Nov 2016 01:00:31 -0000

Addressed comments from:
  - Cedric in: https://www.spinics.net/lists/devicetree/msg151685.html
  - Kachalov in: https://www.spinics.net/lists/devicetree/msg151819.html
  - Vladimir in: https://www.spinics.net/lists/devicetree/msg152454.html

Changes since previous update:
  - Removed irq_chip used to multiplex IRQ and replaced it with dummy_irq_chip
    along with some other IRQ cleanup.
  - Addressed comments from Cedric, and Vladimir, mostly stylistic things and
    using devm managed resources.
  - Increased max clock frequency before the bus is put in HighSpeed mode, as
    per Kachalov's comment.

Changes have been tested on the Aspeed evaluation board as before.
