Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBZND5Kf2zDq66
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 04:18:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BuMSOXF5"; 
 dkim-atps=neutral
Received: by mail-pf0-x229.google.com with SMTP id 194so16032374pfv.3
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 11:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FNjs1T2gbTM10TlJR+eRvRBRIAJhACIJ/h9vmsqiMcE=;
 b=BuMSOXF5a0Seykrjtk7JQ3pzjHLOsnZ6gVTFifUzmo+9e3xqZQMcHIlaFptBdqsoNT
 JGj0xmJUXuvotNkf0esF5bUr+SXtDDibfDHWyf3+TxMl7EGVlmzPm0y5G0ElWNIpy2eD
 tCFDCoGFQrKV5eO9Q/7dCtuu8P1aHz/Fn/wfrEzMguP4wsTbmsFzLWB+Hm1p5EY6zrdD
 95DBY+XBDiNxMpWpLtAupEUJEMapT/HGLklBMF+pHSDXt8e6FXPhNevJslJAAffms1Pl
 IAFcDk45M5ldWCdM0B9J2F5cVnELMoUwXntspHjmMThm9dDpTr9CG96pfRojzlaV+xKW
 udPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FNjs1T2gbTM10TlJR+eRvRBRIAJhACIJ/h9vmsqiMcE=;
 b=SlAUf/xgt/h4OZ0MlkLUOAeB8UBHU5998K2khFIKAmZmtGjdbWV4oFSma8Ll2LA7oz
 6JjV5kP4uLwnMVmRBbzXbjuiNE3T2l/8pH5/6axc9JUDqcpSa9fM0HeJ/EXnfOZfYP8+
 px6XWVEszuXlzZfvm9/Jr4Y8mlXM3vf+EhugSH/3pfkedN9q2WsaQUijE0Cu4sY3q2hu
 sfVSpv/1HBFHGGiUHSz33a5irFAI6COgfuitV/PpmlA+ifnT9Tg1pIKVlRmrY76pqV9x
 CymIngDqMEbIh+ZlmtdUeNgMX4OQcS1PACcRRLo0EZg5b2qI3trBAnO0az6Ec7TFva1G
 qFNg==
X-Gm-Message-State: AN3rC/6+vrLdZMAUStNaYg85agR8wCUl9mV4OJN20cVloa1PSd4ecVl/
 +BeOGCYfrPKze+wD
X-Received: by 10.98.66.82 with SMTP id p79mr26353402pfa.146.1493057913670;
 Mon, 24 Apr 2017 11:18:33 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 65sm32220630pgc.1.2017.04.24.11.18.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Apr 2017 11:18:33 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v7 0/5] i2c: aspeed: added driver for Aspeed I2C
Date: Mon, 24 Apr 2017 11:18:13 -0700
Message-Id: <20170424181818.2754-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.12.2.816.g2cccc81164-goog
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
X-List-Received-Date: Mon, 24 Apr 2017 18:18:37 -0000
X-List-Received-Date: Mon, 24 Apr 2017 18:18:37 -0000
X-List-Received-Date: Mon, 24 Apr 2017 18:18:37 -0000

Addressed comments from:
  - Ben in: http://www.spinics.net/lists/devicetree/msg170491.html
    and: http://www.spinics.net/lists/devicetree/msg171232.html
  - Rob: http://www.spinics.net/lists/devicetree/msg171593.html
  - Joel in: http://www.spinics.net/lists/devicetree/msg171204.html

Changes since previous update:
  - Renamed irq domain for consistency
  - Changed clock-frequency to bus-frequency in device tree
  - Made some fixes to clock divider code
  - Added hardware reset function
  - Marked functions that need to be called with the lock held as "unlocked"
  - Did a bunch of clean up

Looks like there still might be some more work to do with multi-master support
and the clock divider stuff, but I will leave that up for others to decide.

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
