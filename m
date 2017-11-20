Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bDIni7Ms"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZvIB00s6"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygGL537SdzDqjf
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 15:42:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C4A2C207A2;
 Sun, 19 Nov 2017 23:42:48 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 19 Nov 2017 23:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=TCvqGT84qypslGB0G6rsuP2zxwZF44YHApnhGjSp+
 JY=; b=bDIni7MssJt4PFw3oTAmDcZGcLpNuZDhwKcDwLJAUsUE2n5bX/LxawkW2
 MRyQ/Gmmac9q1Vdmf80ko8uzrVSECT6lLK0PZnSaC2qXfAUMc9ta0dZxfjjQ2w2+
 Qd6ouHxfuvdkWQvBJcaokkmWPVRo+POC9e5f4zApIoCK5JJG1YVaYGBOAA/Fru3C
 7U0pWxxS9BkbAkODprsmbgYq85wBbstPdufhEiKCZVjukr25zL7PVM401JuHHheW
 b1Nj7TcbyqO3sVBwr5Dx8jDuL6SIDkOvOkQodM0OZBk2tXYLHNxwEUWry8aNq7Y1
 BlvRP4V+8x+T80XdAkjPSZ1uO/Kjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TCvqGT84qypslGB0G
 6rsuP2zxwZF44YHApnhGjSp+JY=; b=ZvIB00s6u/HqV0n6qYJvxpHUiWQM4lHWA
 PF5oEYKG/BcvQbM5czP9uEfr6oyXAZwBgKEoGEHgZUu5yZP/iD1bSVMW8W+WJTs1
 He0Fo7k+KQ5t67sPCBDDOxlagFYw2TLloBu3//5YtLDphY9zOhvvcR7CmXR8uOLk
 PLXMPjX7kf5JXaUu4teGr1EcbORbm9MVIMd6rt+okGJdU9c2VE0vWllzJw3W6TA0
 S9rlLs8583jvraLgvmrN4ninnL9ST0SPItnuh+9eMsgqoAnwEjdlQiciR4BUO+fA
 PYqBdi2ANSdiLZo4hExAg9rPNSgKMMY0gbGii/1VEkdXyM+y8Mpig==
X-ME-Sender: <xms:SF0SWtH1WLSpZ25MSePrhVdXv_Zd-o9m5SPZKaoFVdJN6l5RdePcYA>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE9EC24C3D;
 Sun, 19 Nov 2017 23:42:44 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, jdelvare@suse.com,
 corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v6 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Mon, 20 Nov 2017 15:12:02 +1030
Message-Id: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Nov 2017 04:42:55 -0000
X-List-Received-Date: Mon, 20 Nov 2017 04:42:55 -0000
X-List-Received-Date: Mon, 20 Nov 2017 04:42:55 -0000

Hello,

This series introduces support for the MAX31785 intelligent fan controller, a
PMBus device providing closed-loop fan control among a number of other
features. Along the way the series adds support to control fans and create
virtual pages to the PMBus core, the latter to support some of the more
annoying design decisions found in the 'A' variant of the chip.

This is the sixth spin of the series. v5 can be found here:

    https://lkml.org/lkml/2017/11/17/910

v6 fixes an error-handling bug I introduced in pmbus_set_page() with PATCH 3/4,
as pointed out by Guenter on v5[1]. The rework implements his suggested
solution.

A few other other minor fixes are included:

* PATCH 1/4:
  * Avoid potential NULL dereference in pmbus_get_fan_rate(). It
    amounts to being an error path that should never happen in practice, but
    lets make sure we don't die if we do hit it.
  * Drop a redundant test for the presence of FAN_COMMAND_x in
    pmbus_add_fan_ctrl(); document that its presence is a precondition to
    calling it (this was already tested at the one call-site).

* PATCH 2/4: Avoid scaling an error code in pmbus_pwm_enable(). Rather, test
  the result of pmbus_get_fan_rate_cached() before performing the scaling when
  switching to PWM mode.

[1] https://lkml.org/lkml/2017/11/19/280

Please review!

Andrew

Andrew Jeffery (4):
  pmbus (core): Add fan control support
  pmbus (max31785): Add fan control
  pmbus (core): Add virtual page config bit
  pmbus (max31785): Add dual tachometer support

 Documentation/hwmon/max31785     |  15 +-
 drivers/hwmon/pmbus/max31785.c   | 285 +++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |  41 ++++-
 drivers/hwmon/pmbus/pmbus_core.c | 265 +++++++++++++++++++++++++++---
 4 files changed, 575 insertions(+), 31 deletions(-)

base-commit: ded0eb83449e8fcba22fd2736826336e101ffbcb
-- 
git-series 0.9.1
