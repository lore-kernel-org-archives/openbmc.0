Return-Path: <jaghu@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ty8Fp6SwGzDqHs
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 08:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ozi71LQ8"; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id f144so24653272pfa.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 13:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+4v/rj8gVvev4rHZb2kwL9jlprn2pDBoRNE6HnFs9B8=;
 b=ozi71LQ8LGKeGUdg1l34qDIUZWrGczV5hqL6B4dC6wfcTd26FwGXMWdvv0dbVj9BFS
 zgh7/rGH1UhvKBRNK7Da7RRZWV9uKUZGrvlC26zpddXvGijRJjuzAXfsRETDZfLVmdZY
 oDsQ2RpJJrOhFvqUUnd763zuw/Bk5I+24KiUiyDIvE3HtIVUlkAUIKWNrcR7szBaaIGH
 VZtZtJyAJF7KLeu088Dh7cu6XxZvO6WwUBEDxjdeGS4p0X8v84ueFk9hp+HTnu2lGZ7c
 QAA3cVl6gQVpD9VoAMWDjXtqvCjhTC5CzeV/n4XaPE4vr6axPEBQxQ/SrMD20EIecpLc
 Ggeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+4v/rj8gVvev4rHZb2kwL9jlprn2pDBoRNE6HnFs9B8=;
 b=Npn5BDcoZTyprf0gJSsHRRMgFdnoDc7dEiRCKx4VuzjZLwiJcKHkd5Asc+/lmSaGOk
 XHfJym7F0ROpc48yn/ODnFHbwc0GDukpcAInfAVu3XpwJ1EFFZcmCG16Cay4pzrq1Z5/
 ftDJCf70fzuBvtBL/AdAoRmy4YOx1YmyTba6Z9IUySrwmUQ+28AWsWfln54/QFmt0Szs
 vnjVl+bpXqrSc+DXpWc/+XH+qvnnPK3jHU5Wpd0GYjPLJRdXPCLvKZ9p2EWMmolYSKCM
 oDXWogEZZthFLAgJiC/Fsu9joOBmBVTPZ6ODavtsusJqGDnWLacsBJtDikkoYq8+fPOW
 jtNA==
X-Gm-Message-State: AIkVDXLqsGEWutGSDcNpfsyKe/UbzSgAgeDNpINISEwccJIdrKHBxdEd6cdqDO2nrNmaPt2M
X-Received: by 10.84.241.203 with SMTP id t11mr198344112plm.18.1483999180224; 
 Mon, 09 Jan 2017 13:59:40 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id p67sm181823046pfb.2.2017.01.09.13.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Jan 2017 13:59:39 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, jdelvare@suse.com,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan
 Tach driver
Date: Mon,  9 Jan 2017 13:59:33 -0800
Message-Id: <20170109215935.30067-1-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
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
X-List-Received-Date: Mon, 09 Jan 2017 21:59:43 -0000

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver.
The AST2400/AST2500 PWM controller can support 8 PWM output ports.
The AST2400/AST2500 Fan Tach controller can support 16 tachometer inputs.
There can be three different PWM clock types (Type M, N and O); Those three
types just to have three independent PWM sources.
The driver provides sysfs entries through which the user can configure the
duty cycle for the particular PWM output port and read the fan rpm value for
the particular tachometer input.
Added devicetree binding documentation for AST2400/AST2500 PWM and Fan Tach
support.

Tested on Zaius board (which has AST2500 chip) and observed that when
duty cycle is lowered then the fan speed is lowered and lower fan rpm value(
corresponding to the duty cycle) is reported and when the duty cycle is
increased then the fan speed increases and higher fan rpm value(corresponding
to the duty cycle) is reported.

Tested on AST2500 EVB board and observed the PWM output pulses come
correctly based on the given settings using Logic Saleae Analyzer.

Jaghathiswari Rankappagounder Natarajan (2):
  Documentation: dt-bindings: Document bindings for aspeed pwm and fan
    tach controller device driver
  drivers: hwmon: hwmon driver for ASPEED AST2400/2500 PWM and Fan tach
    controller

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153 ++++
 Documentation/hwmon/aspeed-pwm-tacho               |  22 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   | 884 +++++++++++++++++++++
 5 files changed, 1069 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.11.0.390.gc69c2f50cf-goog
