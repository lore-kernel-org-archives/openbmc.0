Return-Path: <jaghu@google.com>
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com
 [IPv6:2607:f8b0:400e:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqWqF37NRzDq95
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 05:17:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lIw9cHU1"; 
 dkim-atps=neutral
Received: by mail-pg0-x234.google.com with SMTP id 21so4829408pgg.1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AUI9NnemBSI3LrtcUhxJCOv5eEDsl0y1+d+o1PJW1rA=;
 b=lIw9cHU1GrQcrW3A77nKjcpAU3gQBjHAlpKgMzrGNK6HnP3hMj8M7k/myhHfRJmP65
 1wR4pgMRuFr46g0tLFRGVz5LadQlzJxh88DtnSxkIAa/zUzDOT5eHXJOXnlMjA9MXo3C
 3Q6MyNZHVVkaW57s8h2OZ/fJniUIShuqLyGGbLEWmysOCFQvqowG+mELnwmMnmUsp6tb
 jG0euQj3GFqNbeuFRxqaFgKW08d0zgy3pDD+lAM2qDVftDQ/Fp5J5hIlQEPyijGtEUvl
 AgmDMFuALoGX5jKlf4XRLohDm4HnrmA3XsnpWUttWa0ddc/j+M3eNw6TK5GmogWCfduH
 nZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AUI9NnemBSI3LrtcUhxJCOv5eEDsl0y1+d+o1PJW1rA=;
 b=sEW4Ri2bIQRcMcQP3R4DI8hubdRP6UUHviy0ZlqiGvlVNttfgPr5ddZ8nhDyv6z6zG
 rzmNngpp330Iql54xSWqvpE6fOKGgoPhZKJZul5eoShedBJVDlI9co3QxC9LiOC8U8ZW
 t9R7m8aNIt1fy6CODGIBXNnd0vwgH5KI1llcucBy2sD7gpd9DuMCGuSnqVxMAE0T1ScP
 MC2p0539UQnGvPy4LLupvV8Vho0JII34p/9StfjV7ijQkTmVzUwpRAFGR3D0SjT79V/7
 YY35Q2vQOz6/c7FqdCFzxRP+ZmwMaV5qJXrtfOhw8O9O1B+A+GrUgIUA7RjqXY6xqNVw
 SFFg==
X-Gm-Message-State: AFeK/H03dSlLRdWETo492f/74Vlh+QUGvoLqdtDx4RPbikcnHfIKS1WN4GEz/nvD5kRlFWlr
X-Received: by 10.84.128.75 with SMTP id 69mr12420382pla.111.1490379446503;
 Fri, 24 Mar 2017 11:17:26 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id f21sm6021367pfj.44.2017.03.24.11.17.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 24 Mar 2017 11:17:25 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan
 Tach driver
Date: Fri, 24 Mar 2017 11:17:21 -0700
Message-Id: <20170324181723.29379-1-jaghu@google.com>
X-Mailer: git-send-email 2.12.1.578.ge9c3154ca4-goog
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
X-List-Received-Date: Fri, 24 Mar 2017 18:17:30 -0000

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
 drivers/hwmon/Kconfig                              |  13 +-
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   | 854 +++++++++++++++++++++
 5 files changed, 956 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.12.1.578.ge9c3154ca4-goog
