Return-Path: <jaghu@google.com>
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg6cR6dDdzDqXc
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 12:53:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W22Dsf1Y"; 
 dkim-atps=neutral
Received: by mail-pf0-x229.google.com with SMTP id w189so48097245pfb.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 17:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=26TAHaNA2qOXmMIvNkzjZySQ/ev5/jOukJxCCWO/rfw=;
 b=W22Dsf1YQxjLbIGMIwo4pFQUDtIpS/UrMyurJCzh1DlLBXJaO9GXE1PffBb5ZCEj2g
 75SbPcTd04YRtebUejMjYwHBq5r+OdR3wWSRJy2EPrq3SJLAmRoWyr80DK6iONtC3WR8
 2rHq9jsZ/bhKsxT3mjHgwuhL0C5mMFOgZ6fspnnqFTCbxfJJAp/+5hZC1D1y2U4wSrEM
 JwxM952kmaM/wcxyT8QrZpF0PV4dnO7MeYzJmRy1S1Ufl8eb+ZNwMtGENhyJv4RmzoJQ
 foOIXgZOpEAYXYT6qfWOb/OmdDugVS+1O2bBRLJQ4D/w3BDoU7VzZNWrhwiuQS7MtkTG
 JGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=26TAHaNA2qOXmMIvNkzjZySQ/ev5/jOukJxCCWO/rfw=;
 b=KspLVw5A78wsFtb8pU9yaNDuzQP7sPrN6dNgyOIp0LpZl9PL5ovi+lTZObd6KyxsGw
 Oc7iBAjaiJkwIO/n+RnGBUvfhBaW+U+owhdZBYwwO7J6wSSOQICmKjH2yHoK2/QbWo/S
 Vhbv+2R37SEDc9xZf38i9uJWqvtB4O9oRNZidhkkk1VhI2gDgfNy1e6mRZPWUsRG/twJ
 Nf9hXT9O4EewQf5A87MoEA4YoBD8PiTLkFStIlaNnZg/0J5hPTDKJk6FPmV+Zp7yA9dm
 UKaDItYfuv8wl7vPUhAFycDzAQ/MhOgdU6eMvlp5j1LtWLjQiX+vt+x1rKqmY8YNHEOj
 wJiQ==
X-Gm-Message-State: AMke39nEVp/RfaneCpoPq6qK6wMAK5Qfqywc6QJiIiiMaDfqULHzROgi1IpaQ4mjvxkATrF6
X-Received: by 10.99.126.11 with SMTP id z11mr24013497pgc.51.1489197236253;
 Fri, 10 Mar 2017 17:53:56 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id w131sm20818216pfd.34.2017.03.10.17.53.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 Mar 2017 17:53:55 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v4 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan
 Tach driver
Date: Fri, 10 Mar 2017 17:53:49 -0800
Message-Id: <20170311015351.23092-1-jaghu@google.com>
X-Mailer: git-send-email 2.12.0.246.ga2ecc84866-goog
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
X-List-Received-Date: Sat, 11 Mar 2017 01:54:00 -0000

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver.
Patches based on the upstream tag 4.9. Changes made in Version 4 are indicated
in the individual patches.
The AST2400/AST2500 PWM controller can support 8 PWM output ports.
The AST2400/AST2500 Fan Tach controller can support 16 tachometer inputs.
The hwmon driver provides sysfs entries through which the user can configure the
duty cycle for the particular PWM output port and read the fan rpm value for
the particular tachometer input.
Added devicetree binding documentation for AST2400/AST2500 PWM and Fan Tach
support.

Tested on Zaius board (which has AST2500 chip) and observed that when
duty cycle is lowered then the fan speed is lowered and lower fan rpm value(
corresponding to the duty cycle) is reported and when the duty cycle is
increased then the fan speed increases and higher fan rpm value(corresponding
to the duty cycle) is reported.

Jaghathiswari Rankappagounder Natarajan (2):
  Documentation: dt-bindings: Document bindings for ASPEED
    AST2400/AST2500 PWM and Fan tach controller device driver
  drivers: hwmon: Support for ASPEED PWM/Fan tach

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  86 ++
 Documentation/hwmon/aspeed-pwm-tacho               |  22 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   | 866 +++++++++++++++++++++
 5 files changed, 984 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.12.0.246.ga2ecc84866-goog
