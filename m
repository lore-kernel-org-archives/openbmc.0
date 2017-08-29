Return-Path: <xow@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhhQk6vs2zDqR8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 07:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JRs9xfCB"; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id r62so13654584pfj.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 14:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1xSu1kSUrXRIwwoBceNjq7taei/r1OWEsMSddX9RgJw=;
 b=JRs9xfCBX9iThGy7AR2kz0SnOmaRAuCh1tYLZKTSXxHhk3uJtPlXuFB09xkcE04O8O
 BIRulHBg8r9Vdd4mTrXpoREiNj+Wkioo2JvXZegZlZwvdlbH4aoqelQIOR6kLpp93Llx
 3PrVxjlbQlzmOrgpaytFwqlejVJZqvYDFsaSX4hk0zsDKXbhdDFVpH1AfiGrpeoGI65s
 j9lyR7xboHGCOADO3UuGgVyLa+bihbAL9/8omoPtgJaTlJEbxplTqiUL94ByHZys59SK
 4qRtuXcJ6+0BlPIhjBXQotWNEg0lXhSBzIAkJwijUij4pJJsLcbOd04sYrqyC/hmvrMq
 Gcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1xSu1kSUrXRIwwoBceNjq7taei/r1OWEsMSddX9RgJw=;
 b=Go/Ur8jAOiAWwLBaAHSm2aSQuR7kBDtlTX4AFkoEa1JFNLUlh7Xl0Q2PwSy1X4FIyR
 pIVb31oNsdS/KIXDTc+NzWl4WnXhBIgos7PCrNvReVL4qaXJc1wWrkPf2X8o7uuQHvGS
 3Ja7H4JvipI8H6ZSpHSzhbNlkXP94UPjWPj0zYhDTrACzRBz/SWgjm8R25Tt/2pTq9RQ
 zEbp8duWjA1ts91PlBphh+iaMLQqYog3I+ASeZZ/Qx9T3eVmKIRAkT2vclgQpnMNr2Rh
 uQt064PTCApgubJur51LTcgG32XZv/kZgrUWEe7wTO9l8P52v1lytJZ6a7tie1d4xG2A
 qq9Q==
X-Gm-Message-State: AHYfb5gpeMeYFTMkCrJSdaBWQ38hFTeXqjMDRzfGP+GhgHkmCDlc4dI8
 Z31lrtgXta1iVjvo
X-Google-Smtp-Source: ADKCNb5PiVHF7nc/AzTuZSMwn24FshHd0ws9HeSqgKvYj986C5ZGUbAReNT3VV/oEztEKMl2l0zNOQ==
X-Received: by 10.84.217.21 with SMTP id o21mr2037911pli.95.1504041692579;
 Tue, 29 Aug 2017 14:21:32 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id s77sm5558445pfa.163.2017.08.29.14.21.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Aug 2017 14:21:31 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Xo Wang <xow@google.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] Add hwmon support for TI LM5066I hotswap controller
Date: Tue, 29 Aug 2017 14:21:15 -0700
Message-Id: <20170829212117.143441-1-xow@google.com>
X-Mailer: git-send-email 2.14.1.342.g6490525c54-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:35 -0000

Tested with hardware on Aspeed AST2500 connected to LM5066I on a custom board.

Xo Wang (2):
  hwmon: (pmbus/lm25066) Offset coefficient depends on CL
  hwmon: (pmbus/lm25066) Add support for TI LM5066I

 Documentation/hwmon/lm25066   |  9 +++++++--
 drivers/hwmon/pmbus/lm25066.c | 47 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.14.1.342.g6490525c54-goog
