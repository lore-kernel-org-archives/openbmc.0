Return-Path: <jaghu@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyS4K6mCGzDqHG
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 10:52:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="URVDGkwq"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id 197so14724628pfv.1
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 17:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jwj2YLyBICWRVrCC5oNQe8qCki6sa1JoQrhs51F5860=;
 b=URVDGkwqZPSEzFKLtzpg38t9TSL2XqnVdmH0Zt01qJT5zb9ei67ZmG7Q9cTzTqaMHy
 I95RgdVMY8UbxZLfmP1rm54XQ5do0Kg8/lUofQUdckdwLV4bn5xAyq4pwQT/wOc+90cN
 swmLttMiORSWUSlj9nSDCyMSXXpedgxk2fIj8PhKGaMf3ynthE7ogqwcY0E82I89gvm5
 ANe3Pq3TXkj89wyS2SxDqqnICQhgDYclUAJCfy2npM0GMxyqXjd5d/5NqUenusxACl1g
 hunGBnSxd/0YP0uUBQrJg6SW14IlpRWB54xbkEY1P4dYKmOtx44MVcErw3pJCw0hSSfx
 DXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jwj2YLyBICWRVrCC5oNQe8qCki6sa1JoQrhs51F5860=;
 b=iD7regLM2uU5cSK3wId57QarrW2gXGnxvuyknlg5NI1SUK8zVkfn64oV/szNf+U3qa
 U+jGAs2R7sZGe0iugT6aO3LDPL7tjZ7qNI8tvYFq+tqk4+WTqGTnvM+uxcWPbdZhHcam
 esLZpAEqc1+uikeadH0VfZ/xttj81XPfucWXk8TcsvKf0B8vyuoJjMBUxMZtI650gEvK
 UszoQvRfukr5+QB2I0Niqm/zihVo/4+cOSYRuEGdcqYYCMd9pQjz/t4q00ZSEce8E4Ja
 Q8WkPhj9KrDRlZH23LEprqXLFjP96ykZ1Kh/yd+L+ONjC96uwVSzMRcx77X5qrgU2d+o
 vgrg==
X-Gm-Message-State: AFeK/H2jkd73YnVWmt4EkuJAVEeiTSPSB/VByaGooIi4cJiz7KQzqapF9A7XJusCs1+GnnOX
X-Received: by 10.84.230.135 with SMTP id e7mr32972337plk.20.1491353564345;
 Tue, 04 Apr 2017 17:52:44 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y186sm33746960pfg.52.2017.04.04.17.52.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Apr 2017 17:52:43 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v7 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan
 Tach driver
Date: Tue,  4 Apr 2017 17:52:39 -0700
Message-Id: <20170405005241.8794-1-jaghu@google.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 00:52:50 -0000

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
 drivers/hwmon/aspeed-pwm-tacho.c                   | 835 +++++++++++++++++++++
 5 files changed, 935 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.12.2.715.g7642488e1d-goog
