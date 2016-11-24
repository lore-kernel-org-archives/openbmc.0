Return-Path: <jaghu@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPYkS38WfzDw5s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 20:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OUJTi9D+"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id p66so16790545pga.2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 01:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=z6oPMUs3dUVTsmO2q/qGdQvl1OLb+Fa3YrxZFgDiA8o=;
 b=OUJTi9D+IyISrqUPt1OtOVlT+uMXEw1eAsabOVbsxky42MPvwKl+WBdIEpx2gPy+fI
 9bsa/mqR/nRECYVNjSa3apbjqji1e0oPPZKjpKOyb2TFJk/2D1nAv0S2hWjPzKnm8sqk
 9cvOQm42gwv5obPeVaYf5oAw/oF9ul1sBwY+cz8AfKdULyysbVEcnFmp8pQBfQVLIn9I
 QqAQ6rowiRbt6ah+1jdc0Xvzpg/ayIic0y3U1wto3l0nSYzUum/7Oh4K4vkJMTQ/U3Dr
 piaqlf0kRhsDj5yIpjSI3SUUpAN5ZDeZO8zECEUzN3TnNzYcFNhgCYPbHzqUzD0L3HIZ
 PWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=z6oPMUs3dUVTsmO2q/qGdQvl1OLb+Fa3YrxZFgDiA8o=;
 b=HRiO8HhJ6J3wxc91cu9vNl1BC2ds2iREmTPfIIVLbaruyP2TdmuzXNY2yXwIfzPGG+
 RFoeaXc1kPvjJP5Z3cJ9P/2DCjiwuSsQSCSLzBCht4b4Jk7T5rne7DHKhMqakEYObyZY
 8YdNNs8xmcnD8Y5UYlWxQvi2gklJi4EsLtvqUrAZA5tIgiX0PDwmXXIQ6Qj6kKvfe2M/
 CkE1XqJnB0n5RXBmZjPQtDHmV8U3Zq+rsTma7JYJTTQ8oqwefbCnnECaZ8/lDoJ54UDE
 K4fIOsHZy8vlpWis6mWYmNx/ZKhAEtHNKxrR06nINj2LIc2Treow1B8hSMODq60osdhf
 G07Q==
X-Gm-Message-State: AKaTC03U+kJIfoE2zV3T+PuvSq7DeuSJxBNTJVsFffqGrj3W85JmZ6B/MSwcLOIQTb6nJKUb
X-Received: by 10.99.189.1 with SMTP id a1mr2558400pgf.142.1479979614534;
 Thu, 24 Nov 2016 01:26:54 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id q145sm58705035pfq.22.2016.11.24.01.26.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Nov 2016 01:26:53 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 0/3] Support for ASPEED AST2400/AST2500 PWM driver
Date: Thu, 24 Nov 2016 01:26:47 -0800
Message-Id: <1479979610-2958-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 24 Nov 2016 09:26:56 -0000

Support for ASPEED AST2400/AST2500 PWM driver.
The AST2400/AST2500 PWM controller can support 8 PWM output ports.
There can be three different PWM clock types (Type M, N and O); each PWM
clock type can have different settings. Those three types just to have three
independent PWM sources.
Each PWM output port can have one of the three different PWM clock types.
There is a sysfs file through which the user can configure the duty cycle
for the particular PWM output port.
Added devicetree binding documentation for AST2400/AST2500 PWM support.
Added support in Zaius platform for 4 PWM output ports since it has
four fans.

Tested on Zaius board and observed that when duty cycle is lowered
then the fan speed is lowered and when the duty cycle is increased
then the fan speed increases.

Tested on AST2500 EVB board and observed the PWM output pulses come
correctly based on the given settings using Logic Saleae Analyzer.

Jaghathiswari Rankappagounder Natarajan (3):
  Documentation: dt-bindings: Document binding for ASPEED AST2400/2500
    PWM support
  drivers: hwmon: Hwmon driver for ASPEED AST2400/2500 PWM support
  arm: dts: Add dt-binding to support ASPEED AST2500 PWM output on zaius

 .../devicetree/bindings/hwmon/aspeed-pwm.txt       | 104 ++++
 Documentation/hwmon/aspeed-pwm                     |  18 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  40 ++
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   6 +
 drivers/hwmon/Kconfig                              |  13 +
 drivers/hwmon/Makefile                             |   3 +-
 drivers/hwmon/aspeed-pwm.c                         | 660 +++++++++++++++++++++
 7 files changed, 842 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm
 create mode 100644 drivers/hwmon/aspeed-pwm.c

--
2.8.0.rc3.226.g39d4020
