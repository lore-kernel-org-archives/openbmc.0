Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9WfJ5DmlzDqBK
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 23:11:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463663458636859.0297858759109;
 Thu, 19 May 2016 06:10:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v4] Enable and Handle Checkstop gpio sensor.
Date: Thu, 19 May 2016 08:10:56 -0500
Message-Id: <1463663457-28446-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 13:11:05 -0000

In sensor_manager2.py :: class SensorManager :: method *register* expects a *sensor class name* to be instantiated. This will work only for sensors implemented in python. There must be a binding agnostic method to register sensors.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/74)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/74

Hariharasubramanian R (1):
  Enable and Handle Checkstop gpio sensor.

 Makefile                   |  24 ++++----
 bin/Barreleye.py           |   7 +++
 bin/Openbmc.py             |   3 +-
 bin/Sensors.py             |   9 +++
 bin/chassis_control.py     |  26 +++++---
 includes/gpio-init-gdbus.c |  98 ++++++++++++++++++++++++++++++
 includes/gpio-init-sdbus.c |  93 ++++++++++++++++++++++++++++
 includes/gpio.c            |  94 +----------------------------
 includes/gpio.h            |   9 +--
 objects/host_xstop_obj.c   | 147 +++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 391 insertions(+), 119 deletions(-)
 create mode 100644 includes/gpio-init-gdbus.c
 create mode 100644 includes/gpio-init-sdbus.c
 create mode 100644 objects/host_xstop_obj.c

-- 
2.8.2
