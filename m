Return-Path: <jaghu@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxpHq731SzDqC4
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 09:30:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RMjNtMtg"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id 21so134663666pgg.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 16:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Vgg8OGmSZVUEDjucUNsidRDPUyyeqi36znIxUfEwqKI=;
 b=RMjNtMtgdj7Y066I3Ql60/o+oAKxuxLbT5UTGhoi54ybsU7lchkzdTL6G91KM/2O24
 hZ1wjg+CnplhLCrAnr6eLYmNAmJMyytJEJwZk9l3XLicw3PocZOxgYiQEPvwU6JcY9wA
 XqaPgflEjZrXCrnrHvH9X656muxDeiq2AQ+9i+8EeGKOSIENBZpQj55PGliNMVQ0tzhQ
 Iyh8DhxFXSEKGfY2mABA6OcJW1aadNcGAlQaf5wverjjsPyYwzem4QX4Q0HsD1GOMgEv
 2XHdsaQheEP9ReuyDF6CE90kNHIlShmlhL1wiW6HVxkrakRt238WdopbdJwu2sdAYWm8
 Qn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Vgg8OGmSZVUEDjucUNsidRDPUyyeqi36znIxUfEwqKI=;
 b=og7GXqcyAod2Vpm0H6MUEgWb7+aaZHz4S/kBYCQ/xM0tjlJky48TnViicLP4ZAYFvu
 jdxuYZvJJND14l6myeqmacxu+jxB8bAq4W3NVOBorvcLzFBogPBmHCVJ5ACjclzQb8Fk
 f6MT2pKBB0Tg2bvPG7FjeOtRUeJP6cwbY/9Pm+OiVaYFhbJP+tiLGEysHsCfhPyh6FEx
 VHia/o2x+mxHxgJzK0vnU457fHtqlrr82Ai1VR999zZ+s/yMGXRvPd/2UTtgXdL6jrx4
 qu973qnw2VxUE4tfZy8sQwsHJa1sl0C87XStr7OHK05MxaLp08ScJkcDHlZ5PNYlpdV/
 RPXg==
X-Gm-Message-State: AFeK/H0tzjxc9CaAo5r+uMrsJmzLYRho/nVSvHhf7PiZN90OhZXEqzg7/otR/R5UskHaeEsI
X-Received: by 10.84.194.195 with SMTP id h61mr25196843pld.182.1491262229229; 
 Mon, 03 Apr 2017 16:30:29 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id 140sm27788643pfa.58.2017.04.03.16.30.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Apr 2017 16:30:28 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v6 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan
 Tach driver
Date: Mon,  3 Apr 2017 16:30:23 -0700
Message-Id: <20170403233025.26952-1-jaghu@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
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
X-List-Received-Date: Mon, 03 Apr 2017 23:30:32 -0000

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

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  68 ++
 Documentation/hwmon/aspeed-pwm-tacho               |  22 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   | 846 +++++++++++++++++++++
 5 files changed, 946 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.12.2.715.g7642488e1d-goog
