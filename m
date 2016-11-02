Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8KCk6jlmzDvPp
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 07:17:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=JIESbqMQ; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id n85so17441766pfi.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=OiVHM/etKYPT7k3XRjsfvKNYqwkEXDepsyoOL4jMj7E=;
 b=JIESbqMQ5MQjQrza/F2MwkGz0yl12VbwG6vYagdq086ppRRCDjiCK/Ijv33aMzAUdk
 TRl1HcJP4pOulAuJkTcV9kvx2UPrdceVtZdt9A+/kWu66VvpUWY5toJfkKgBNtaVR2n9
 QNP7Mzs1wsgu9ljiaOZqxWlHKqlRCZUq71t2ZIRqj7q/xb3c5CEz7H3XT5lREB1PIrZY
 Rmvy0hKDZ7Ke+dNr58I1ONZ2UF7j702OJnqXS4VY0XF/qcUxjMPVuOyHB7z8QqUsnnvD
 qBP5/jp9bOnbfnfUgpNa/hTaKyGNXYuZ9MJniJA+XISM3vgWE2RSs5e5KccXqT21u6Co
 /vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OiVHM/etKYPT7k3XRjsfvKNYqwkEXDepsyoOL4jMj7E=;
 b=mFQustcXqV2AiRztSvKEnHT0ohuXkdJsPFhKm4X6YMTPrx6dv5tlUUjPidAVQiWnru
 RfaDuaQ38abAqDn6Cd7Fc9Y3WjirTxqDiyn/h+1r3SeGT8JHo8z14fqnHqyXiHAmKJUI
 7fVfMxiJxPxQMOrV3UHr7Uxz/PiCajKxs8xIZk38QqlVjlmOBHTaFlMR9Jn7RJtKXtFD
 ooL12j/Qy1B5VxQe5YkwJJ5AoAFeZlDQwc4e04gOJHXeE6H7zUbEk8S7ltY23r9URpFY
 wWkP8BnGaN6Na9MRtZ8vdB4bJouYonIW72KR4E7C12jxudRFKbvWKbMayUJHOvwdvM8P
 dPvQ==
X-Gm-Message-State: ABUngvfhWJ1tnKrOVTLevzRiGxD8I+gE7hYqD8NeRep5bluWD0JlEaghH5lmwy2Cx2FayP+M
X-Received: by 10.99.50.67 with SMTP id y64mr8426487pgy.146.1478117872047;
 Wed, 02 Nov 2016 13:17:52 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v66sm6774318pfa.33.2016.11.02.13.17.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 13:17:51 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v4 0/3] Seven segment display support
Date: Wed,  2 Nov 2016 13:17:42 -0700
Message-Id: <1478117865-32103-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 20:17:55 -0000

This patchset includes:

Character device driver which implements the user-space API for letting a user
write to two 7-segment displays including any conversion methods necessary
to map the user input to two 7-segment displays.

Platform device driver which provides an API for displaying on two 7-segment
displays, and implements the required bit-banging. The hardware assumed is
74HC164 wired to two 7-segment displays.

Adding clock, data and clear signal lines in the devicetree to control
seven segment display on zaius platform.

A changelog between versions is included in the individual patches. Please
provide feedback.

Thanks,
Jagha

Jaghathiswari Rankappagounder Natarajan (3):
  drivers: misc: Character device driver for seven segment display
  drivers: misc: Platform driver for seven segment display support
  devicetree: Add devicetree changes to support seven segment display on
    zaius

 .../bindings/misc/seven_segment_gpio.txt           |  23 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
 drivers/misc/Kconfig                               |  16 ++
 drivers/misc/Makefile                              |   2 +
 drivers/misc/seven_seg_disp.c                      | 198 ++++++++++++++++++
 drivers/misc/seven_seg_disp.h                      |  35 ++++
 drivers/misc/seven_seg_gpio.c                      | 225 +++++++++++++++++++++
 7 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/seven_segment_gpio.txt
 create mode 100644 drivers/misc/seven_seg_disp.c
 create mode 100644 drivers/misc/seven_seg_disp.h
 create mode 100644 drivers/misc/seven_seg_gpio.c

--
2.8.0.rc3.226.g39d4020
