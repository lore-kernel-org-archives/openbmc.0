Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHW1K0Hd3zDq5W
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 15:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n1IlfCv8"; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id f144so29391496pfa.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2017 20:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y5oGjbr2LHXBfRTTYm8MqZC5lnDAjfHGFiuGVmweJr8=;
 b=n1IlfCv8KNJxO8aQir+nTJ7LETZQZL+nQZZLcQ/Qf6ke5IzaP9lggJtSB2iL+A0lAJ
 Um/YDdsO148fVaYePCNoNB4es8qWXcy/DUd+Qawj1HQV5OAFRQHb3cQKWnrm2Sile0hZ
 emsuiI+eAeTqO+non2k64evT6grlllwHsE68Db+wqginPKGsg6wlbPOa4libCOQ524kS
 eEf85iZZ47ZQbOfIGhwR6WMDEnOXbS/n2yqdddZcdPeEsNfWq/ot6CqPqEhieiyrUUpj
 8fegAevDEf1MjgdwVh19RKMetq+oIEbPDT+vvNiIc0e0SCey35Zjd0lXsFy/L651ZZR0
 Oe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y5oGjbr2LHXBfRTTYm8MqZC5lnDAjfHGFiuGVmweJr8=;
 b=kiZnCZSbIOzSEGZfWWNicAZ/KKaxvwMvKljtqpw5MPeKsd5hQuxDujJTUOCC85NZ32
 XnWWKgDMNIn6nvZ3fy/g2vMZDOm5egK61dxyoeR6wKBc+cCQeye7upq3znUyAoVw2GpX
 CtkvZUSnm/cw6PbGRv/A2JWoA4IkTq190Tl8c8UIe97iS2G/ZpOCy/xlYZYJByegWkeB
 PIEFq7AKkEPbHAyUSoCTcX+6RC+nnkD8+PyJSo+ZQCnh7ybG4gZJcmLIUhwoj8j5eoBJ
 0T71FKj5s2zoodOkn3tFOwYVUKz7vGf3M/rN/6wNm20SD3VhAmiMfv372CmSg3/jUqUp
 2Dtg==
X-Gm-Message-State: AIkVDXJpei1qltbTyoiQi9PVCWDxcXfQ4rA2VogekAOULP4hkqM0YlEldlLmyDmVZMLyzbY7
X-Received: by 10.84.210.8 with SMTP id z8mr22541252plh.94.1486440240374;
 Mon, 06 Feb 2017 20:04:00 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id p25sm6289384pfd.0.2017.02.06.20.03.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 Feb 2017 20:03:59 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 0/4] Seven segment display support
Date: Mon,  6 Feb 2017 20:03:52 -0800
Message-Id: <20170207040356.9891-1-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Tue, 07 Feb 2017 04:04:05 -0000

Hi Joel,
Nancy mentioned this patch can be included into openbmc linux tree now.
Some other member will take up the work of addressing the comments from
upstream reviewers and send the patch upstream.

This patchset includes:

Documentation for the binding which provides an interface for adding clock,
data and clear signal GPIO lines to control seven segment display.

The platform device driver provides an API for displaying on two 7-segment
displays, and implements the required bit-banging. The hardware assumed is
74HC164 wired to two 7-segment displays.

The character device driver implements the user-space API for letting a user
write to two 7-segment displays including any conversion methods necessary
to map the user input to two 7-segment displays.

Adding clock, data and clear signal GPIO lines in the devicetree to control
seven segment display on zaius platform.

The platform driver matches on the device tree node; the platform driver also
initializes the character device.

Tested that the seven segment display works properly by writing to the
character device file on a EVB AST2500 board which also has 74HC164 wired
to two 7-segment displays.

Jaghathiswari Rankappagounder Natarajan (4):
  Documentation: dt-bindings: Document bindings for seven segment
    display support
  drivers: misc: Character device driver for seven segment display
  drivers: misc: Platform driver for seven segment display support
  arm: dts: Add dt-binding to support seven segment display on zaius

 .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
 drivers/misc/Kconfig                               |  16 ++
 drivers/misc/Makefile                              |   2 +
 drivers/misc/seven_seg_disp.c                      | 201 ++++++++++++++++++++
 drivers/misc/seven_seg_disp.h                      |  34 ++++
 drivers/misc/seven_seg_gpio.c                      | 206 +++++++++++++++++++++
 7 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
 create mode 100644 drivers/misc/seven_seg_disp.c
 create mode 100644 drivers/misc/seven_seg_disp.h
 create mode 100644 drivers/misc/seven_seg_gpio.c

--
2.11.0.483.g087da7b7c-goog
