Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfk694kRZzDqGr
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 11:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OXJFbOFN"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id 9so58841863pfj.1
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 18:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+HqEFJLvbzdqwiGhSTZZHw4HQ5Lb8Yn+TmWMIXNdD1E=;
 b=OXJFbOFNIRK/CpOq4a6bV3ot//daAJQI1sH43s5cpwCoH8hWLljr3JrHzC+soQpIGS
 Lm+iPyhhNeZdJteQNRg5xtzAVXsjMqMtfBkMfeSQ4FYCzXSpzMr9WqvEQ8JmBlpgmYmk
 s8jaCPSzCrqAPA2koRq8g1/jSkncd3nnYDKW4dYbpYNMMA+Lm0TGZg4iC/7yvg4J+S2x
 MNw1+xhpjlKj/orLPnqk+C88EDrCr3ICnMt0J2ndh6R3pJpoVw9CZS1wy7ZpONvb9BIP
 uAmgXNMqgUfRZE0abo1yrDuY2rEhKM/qlD6iT3rvOta71/2R8CtY9sjow9pZZ3Y1Ens9
 51Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+HqEFJLvbzdqwiGhSTZZHw4HQ5Lb8Yn+TmWMIXNdD1E=;
 b=byPiIWOgLMq0pn/ztcQrTWoO7yivCy7SaSS+q+XQ4663j2Pca9Rcx/YikaMeQywAxJ
 XuIA4Yzxw+BLxN203UqfQg3aqxU+ZUp5dUnoDrrMgWxKoen5YVxVDDkmA125S32sLRSZ
 PnKmV/jd0U0A+PrFRC2S/QliYyFpxiKqLyUQ63uEHK/hU1+JWor6V46LDiocBXprfRth
 K+ebQZWISK0KJ/Rv96t+z/IMbPq0lfnuVKzzGkBC5zkn9psPHyH3ysbcJQOial+B0KWQ
 DVAGz81nU6kWCkiuydDU+aa7D4z3KY6S0pAwtTFQc8rqiAOlX3F65OOEVLai65xLeAEd
 gmvA==
X-Gm-Message-State: AODbwcANfeNsrPRybBFvXAHD/eFGjUICS8Chq+ByOv9JIM/zP/Dkq+ud
 aUCU6oV5oR/ATYHg
X-Received: by 10.99.116.7 with SMTP id p7mr9839252pgc.162.1496453407006;
 Fri, 02 Jun 2017 18:30:07 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm33462651pgf.14.2017.06.02.18.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 18:30:06 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v10 0/5] i2c: aspeed: added driver for Aspeed I2C
Date: Fri,  2 Jun 2017 18:29:47 -0700
Message-Id: <20170603012952.2192-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
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
X-List-Received-Date: Sat, 03 Jun 2017 01:30:10 -0000
X-List-Received-Date: Sat, 03 Jun 2017 01:30:10 -0000
X-List-Received-Date: Sat, 03 Jun 2017 01:30:10 -0000

Addressed comments from:
  - Marc in: http://www.spinics.net/lists/devicetree/msg179432.html
  - Ben in: http://www.spinics.net/lists/devicetree/msg179491.html

Changes since previous update:
  - I2C irqchip: Unallocate resources on init failure
  - I2C driver: Added master_xfer_result field to struct aspeed_i2c_bus

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
