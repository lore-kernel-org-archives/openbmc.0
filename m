Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD8nS6pZ2zDvYM
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 13:11:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QSIVrKaM"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id i88so117027825pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 18:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=5THA6lyxWKwuxq6LQJSqkadx3Zvjv7yfaEnHJ3OFucI=;
 b=QSIVrKaMkcb75IQbIHjOmdOl8an2LbJRpvEZKvHaQz+so+Pa6l1WTddyOiposF3ptF
 QIs3sbc1KXKXtR/Uudgq6t21J4c2J/5k7OiXE4PAtN6Kf6ReRtymD8z3Y0L5pTjSDncu
 C6X8OBCuAzDtXp9QKNRbamtVgH8Ja2wa2X0FAE1SopOeKY2Wk2jnUgCJ0/TE/4qLOc42
 gST0N1jwWVaKTkLg7nRu8utxoaHRc1Z4Np0XfI5pWi574uq7Sn8uXNr6TZJ+hok8f/tm
 cp73t847ExLGc4C1tAYdRnUbGxo8GIfJKRfoVFdYMdg9NHg+ObkQkEQ5JjIV7/x0RwAE
 7/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5THA6lyxWKwuxq6LQJSqkadx3Zvjv7yfaEnHJ3OFucI=;
 b=WZhiMXrg805BXy0NZ+zekfsVETdbW48pAXe4nfuB4pF5jmA6VxP0xB+NZTbMIwlwPS
 bXphChU8Z3NSyLlOps85C1J6IuIgSGg1gfdcnsv5oU3ijIXR5174ma0Gb9X64KTgGpq+
 pSRirvJSsBuZ0R0eRfY63eBHSQZZHQWneMh3jlIHhR9eRxA0axEyLr1aM39YRBCw9Nhw
 akKqHE7DvLmgbNbTYkoWsW/xzCJu6PNM1Vd2/0eQSK0CPcsmfVolC7jZ6Srw68Nv4RwQ
 aD9aU/kAbBZsRH3h6Jv/JH3ehymZJgbxT7ONE2q0kw/P8DBk0g6ZYnFHA24pfn+cnLva
 eLdg==
X-Gm-Message-State: ABUngvcaaAKJXIWp36mDVJ0stqn4St/LCpvs9/KyTo4CsvlJgXPh68qcAY2idK33VSVqhexy
X-Received: by 10.99.238.17 with SMTP id e17mr11104090pgi.154.1478657514012;
 Tue, 08 Nov 2016 18:11:54 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id sh9sm51056998pac.41.2016.11.08.18.11.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Nov 2016 18:11:53 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 0/3] ASPEED AST2500 PWM support
Date: Tue,  8 Nov 2016 18:11:42 -0800
Message-Id: <1478657505-23109-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 09 Nov 2016 02:11:57 -0000

Support for ASPEED AST2500 PWM driver.
The AST2500 PWM controller can support 8 PWM output ports.
There can be three different PWM sources (Type M, N and O); each PWM
source can have different settings.
Each PWM output port can have one of the three different PWM sources.
There is a sysfs file through which the user can configure the duty cycle
for the particular PWM output port.
Added devicetree binding documentation for ast2500 pwm support.
Added support in Zaius platform for 4 PWM output ports since it has
four fans.

Tested on Zaius board and observed that when duty cycle is lowered
then the fan speed is lowered and when the duty cycle is increased
then the fan speed increases.

Tested on AST2500 EVB board and observed the PWM output pulses come
correctly based on the given settings using Logic Saleae Analyzer.

Jaghathiswari Rankappagounder Natarajan (3):
  devicetree: binding documentation update for ASPEED AST2500 PWM driver
  drivers: hwmon: ASPEED AST2500 PWM driver
  devicetree : Add support in Zaius platform for 4 PWM output ports

 .../bindings/hwmon/aspeed,ast2500-pwm.txt          | 116 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  43 ++
 drivers/hwmon/Kconfig                              |   5 +
 drivers/hwmon/Makefile                             |   2 +-
 drivers/hwmon/aspeed_ast2500_pwm.c                 | 662 +++++++++++++++++++++
 drivers/hwmon/aspeed_ast2500_pwm.h                 | 128 ++++
 6 files changed, 955 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2500-pwm.txt
 create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.c
 create mode 100644 drivers/hwmon/aspeed_ast2500_pwm.h

--
2.8.0.rc3.226.g39d4020
