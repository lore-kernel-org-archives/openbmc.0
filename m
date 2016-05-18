Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8sFn4RRkzDqCJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 21:21:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463570455096929.7235955009286;
 Wed, 18 May 2016 04:20:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v3 0/3] Enable and Handle Checkstop gpio sensor.
Date: Wed, 18 May 2016 06:20:50 -0500
Message-Id: <1463570453-15404-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 May 2016 11:21:02 -0000

In sensor_manager2.py :: class SensorManager :: method *register* expects a *sensor class name* to be instantiated. This will work only for sensors implemented in python. There must be a binding agnostic method to register sensors.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/74)
<!-- Reviewable:end -->


https://github.com/openbmc/skeleton/pull/74

Hariharasubramanian R (3):
  Enable and Handle Checkstop gpio sensor.
  Host xstop sensor: Add sensor process to be started up, Emit signal on
    xstop, wait 30secs before rebooting host and a python binding
    object.
  Fix code review comments from Chris Austen.

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
