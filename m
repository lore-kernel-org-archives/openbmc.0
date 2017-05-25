Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYKd75sknzDqcG
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 16:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xu19ucfc"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id m17so158358208pfg.3
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5LM0NS9JjelmpAg4YFY8607MAvTrztIk2rZQ1KvgqmU=;
 b=Xu19ucfcHBelshAC08GHUy80EpNpBSsw3/Wux5w5ZT8RCab5Et3o1OXhQ+ocE4mBm1
 +UwQYJ6wvM9KhigHZhTMJc1x2lDHYPHCZr+oQP3kdHo7Uszzx7o6Hzh2sVWgrbX/6QDe
 C6oP+Szy3zm35kVX3Wu1icGhNjziWt4ynW7ogmpI9Yi7qYd3hUCKxcUxt4BT7H4UPjzQ
 Pq1Smst/bYSl8Z4dUMVuUdS1CyrxZ1nO5M3dl4AO6IznaTJ34tUBSplfzzd07PScAZt6
 ps8KO/c54dS2ffFMb56q9Xp3D4n64hhN+KWrLWRuU7ImmN9ox5s8WQyHW6bPITTq+Vb3
 Jviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5LM0NS9JjelmpAg4YFY8607MAvTrztIk2rZQ1KvgqmU=;
 b=JqamjBY/T38y5y8aCfooej84o9OrRAWV0+8G65if15S9GLZ2UeMUwgZgJd+fbk3n6D
 poEpxk+sMBx1Ll4njTWAayJjZcMPP2+ORpFlCmWFnQoELrD/jWVfmu2rkbbzuPKr5G4n
 p6aWuo+6wER4ZFEhmT1g1M3Rt/O6LZXn18jR36Rc73hCsTtT9ze+z7tXaAiIc+k5v+No
 MhZyf7ATS/Dh6iB4ssocY5hCDEz+4/aHHMovhDLhb42U11ZNB6FXLs+FO0bUOxwfOo39
 oac4lS7TLkBAIzau5/sPhi4gp/RwOxFVweelcI7L5qIvW3AVrX2/qckvNZRHZRH9Ue4I
 2wCw==
X-Gm-Message-State: AODbwcAzRDdf/wyl5BQJ/dCB0IiiH91125T/vaoDFzcvBLlMtSDDWF+G
 MYCFNYDQXgbQ1fzN
X-Received: by 10.98.37.68 with SMTP id l65mr43657889pfl.175.1495694985182;
 Wed, 24 May 2017 23:49:45 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g63sm10995700pgc.59.2017.05.24.23.49.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 May 2017 23:49:44 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v8 0/5] i2c: aspeed: added driver for Aspeed I2C
Date: Wed, 24 May 2017 23:49:20 -0700
Message-Id: <20170525064925.16867-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.219.gdb65acc882-goog
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
X-List-Received-Date: Thu, 25 May 2017 06:49:48 -0000

Addressed comments from:
  - Ben in: http://www.spinics.net/lists/devicetree/msg174576.html
    and: https://www.spinics.net/lists/kernel/msg2496151.html
  - Wolfram in: https://www.spinics.net/lists/kernel/msg2504011.html
  - Cedric in: https://www.spinics.net/lists/kernel/msg2506531.html

Changes since previous update:
  - ACK IRQ status bits before doing anything else
  - Added multi-master device tree property
  - Do not send STOP commands after interrupt errors
  - Fix SMBUS_QUICK emulation handling
  - Removed highspeed clock code (I will do it in a later patch set)
  - Use the platform_device name for the adapter name
  - Reset for all failed recoveries
  - Removed the "__" prefix from all of the non-thread safe functions

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
