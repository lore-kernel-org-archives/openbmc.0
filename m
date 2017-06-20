Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsgc62yHGzDqhn
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 07:15:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nXzIkya1"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id 132so34298454pgb.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OjF05gATRXt83Pr0g2J9H7MlnSKpawP5g0kqq45GU4I=;
 b=nXzIkya1oiWBLbksmS+rvs9rWasXhM+47o0hvpzn1s81Oz3BVdJuTM9Jc+Emdwne1P
 yod16pduiQQ/21xrO/VeOBnzy3H9uoPf+8OTq2Z47FFaV9edaJNoJaDY8IMtTUMAMigT
 Qlekt+hvM03+YKNqwiZl+lahHsAXHKDXie5rwS2Yv6Dmh5ClG0XZSCCmFES6KFstLJ1o
 2Viig4Iw/C8ghqpHxmVjDUaNEHHw4FC+/jx1Q8X40n5nmtCWEiTJOjC9XRdMExZ0mMHt
 s58YFULJ+u3ugFz4NPf9tLE1pcDNrDCxkH3NKz96eoojE8Wyv7evGDcTDRDS//wt/fUO
 xAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OjF05gATRXt83Pr0g2J9H7MlnSKpawP5g0kqq45GU4I=;
 b=F4yWeD0y/iZpGK7/6fulbV9CJQu3+bl50iwno++fZ4TVXYHFUHDhvlkMc08MjhFU/r
 nFgM7SfDxJAfoWEvI9troFc+PlnnRhwwtWfsBiGeLySen9SNp329m6YlBosLqGYz+dIj
 sdL2qfitJGcx+WqMZgOM3sZmM0xbNtHBjmo3Cm2BVnYmb/o1u4REpB0XhX/6oskIDUfS
 Dy3ZbB47tRgFyZESbqYD51YUWZ9fOJKv3aqix08qB855tFhIGFNkeB/IeY8uybAZk8zM
 HDn7PTbhTRkMFUtm7eZspzL7VUlQYuKrLkX30F1V028+vEXfnM8NW2MvE6TPXx88+e/q
 S1Hg==
X-Gm-Message-State: AKS2vOxdJFGBxEEJO1gx3qf8evgSQG3QvSqysoqwnvesSzp5HFgyWwND
 6dMj+dxpEjl378gu
X-Received: by 10.98.129.131 with SMTP id t125mr33155687pfd.173.1497993331026; 
 Tue, 20 Jun 2017 14:15:31 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id a69sm29012015pfg.91.2017.06.20.14.15.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 20 Jun 2017 14:15:30 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org,
 joel@jms.id.au, martin.petersen@oracle.com, benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v11 0/4] i2c: aspeed: added driver for Aspeed I2C
Date: Tue, 20 Jun 2017 14:15:12 -0700
Message-Id: <20170620211516.13095-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.1.611.g7e3b11ae1-goog
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
X-List-Received-Date: Tue, 20 Jun 2017 21:15:35 -0000
X-List-Received-Date: Tue, 20 Jun 2017 21:15:35 -0000

Addressed comments from:
  - Wolfram in: http://www.spinics.net/lists/devicetree/msg182142.html
    and http://www.spinics.net/lists/devicetree/msg182144.html

Changes since previous update:
  - MAINTAINERS: Added MAINTAINERS entry for Aspeed I2C driver and friends
  - I2C driver: Added support for COMPILE_TEST
  - I2C driver: Fixed i2c fault codes in interrupt handler
  - I2C driver: Use i2c_{get|set}_adapdata instead of adapter->algo_data
  - I2C driver: Fixed some other stylistic issues

As the Aspeed I2C interrupt controller changes were already accepted by the
irqchip maintainers, this patchset no longer contains them.

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
