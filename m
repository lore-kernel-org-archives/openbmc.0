Return-Path: <arnd@arndb.de>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 359 seconds by postgrey-1.36 at bilbo;
 Sat, 15 Dec 2018 09:18:05 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43GlL61gjdzDrPJ;
 Sat, 15 Dec 2018 09:18:05 +1100 (AEDT)
Received: from wuerfel.lan ([109.192.41.194]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MC2k1-1gi49T0OBZ-00CULw; Fri, 14 Dec 2018 23:10:30 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@aj.id.au>, Andy Gross <andy.gross@linaro.org>,
 bp@alien8.de, Daniel Drake <dsd@laptop.org>,
 David Brown <david.brown@linaro.org>, dou_liyang@163.com,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 Jens Frederich <jfrederich@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Rutland <mark.rutland@arm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org
Subject: [PATCH 0/7] v4.19-stable randconfig fixes
Date: Fri, 14 Dec 2018 23:10:05 +0100
Message-Id: <20181214221023.3878670-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BKx/+9tKlDqKBm3yFlKyDrtyhjifcH89zpw/TA+BR1GI/IXjxE6
 KW3z0cr3XpETC3xoJ++EI0JW/9H2NRFMq8Y3aElZvA6zHQ1dimmqunWZOdZRf2FdvenY89X
 epnrSbbPZtbAO/NqN+srg4Ed+NnCDdUj8NUJ692QEDM4t+lEjW01nHd+x+771FBFOo8eXhB
 cw3vt1ukEotp9faZny6Hw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PdME1AqrfPg=:p+lDL5tain3crQ+5p238mU
 KnJ+W2yVQDKFQtZA1TQxIiN8CPfT6GhJljOv8xdylJoEWBkQcSlWMx/44CLV76+bfFQOMS0F/
 18OAykvpQc70/ykOFyIoRZxVUcsj2HvwtPA1U+esb6943SCZZJOXdN06sBtC2SpRWIsdlz0FQ
 b/OZ/cTrztxHr8ybzvsF1aHtXGNubkdXoSIh0s6CFRQf5vRJvqoja6RBwy8Gzma54sbvorY9k
 nOl9PnyQQgy5U2fu2+V/pRn9/Jxg5+ePpJaLv1UQGH+vDup+I7HGwNUOAbAtVO8A7UgZFSZ0y
 g5VfS41Bjp106kxZJwv2322+vdvkfvtvsail8LfKjriOjRlOQvJi43srPjQ3AB1L5ccRFEcuR
 GR4HssS5cKl7aPWF1VyR3w+gFxK7eRXfM5zVIS3c0/vMbD9PUNDnZFklHjXKqTL1pncMX0G7w
 HNojij5PBdyOIWmnlF+3lwKtr9VPq9pU7Xn8N5QBJs6CmQJejHzaShYwESRmXPelzAwU9lZTU
 XZTbNJchXCaaFEQF9crqJu2Eudo3NtYsf9jgXO4rJb89vGkJCwdU6guqj6Htt1okXIdjYGg/j
 yrE15AfC7Sgp4CVxMZwqfwSwKCiIwAAyKA2davkZnwyKI6GNPjOIUsFpyBYELm8iefKel24Ok
 qCyc1m0L8zGfcFASyPy0YxdXTFWjiBCLk6G4hpyMdQIhT2uScq71Kk0HjmOrUR8rD8LuuqyzR
 A87tOb8JQ7hyHUq7PmOlaRa4IGqn3PzUzd0ftS7FhzZ+LQQ4ZbQt0MRgyTij8XK0rhDOiSLn9
 ZRzYhitj37O23o/HQnCQ8Jv/LH47tZALkQ2AbA0GIlndSHYOTVPwcR9d7E1EgMwHQPD3/mOuM
 9fMKtBAMXjG+tMklMHCHGuou1CHy+TF7g30EIpI4TftLW6ktLQJAvWaEf9P3IF
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 22:18:07 -0000

Hi Greg,

I did some randconfig testing on linux-4.19 arm/arm64/x86. So far I needed
27 patches, most of which are also still needed in mainline Linux. I
had submitted some before, and others were not submitted previously
for some reason. I'll try to get those fixed in mainline and then
make sure we get them into 4.19 as well.

This series for now contains four patches that did make it into mainline:

2e6ae11dd0d1 ("slimbus: ngd: mark PM functions as __maybe_unused")
33f49571d750 ("staging: olpc_dcon: add a missing dependency")
0eeec01488da ("scsi: raid_attrs: fix unused variable warning")
11d4afd4ff66 ("sched/pelt: Fix warning and clean up IRQ PELT config")

Feel free to either cherry-pick those from mainline or apply the
patch from this series, whichever works best for you.

The other three patches are for warnings in code that got removed in
mainline kernels:

3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
972910948fb6 ("ARM: dts: qcom: Remove Arrow SD600 eval board")
effec874792f ("drm/msm/dpu: Remove dpu_dbg")

My feeling was that it's safer to just address the warning by fixing
the code correctly in each of these cases, but if you disagree,
applying the mainline change should work equally well, so decide
for yourself.

      Arnd

Arnd Bergmann (5):
  scsi: raid_attrs: fix unused variable warning
  slimbus: ngd: mark PM functions as __maybe_unused
  [stable-4.19] i2c: aspeed: fix build warning
  [stable-4.19] ARM: dts: qcom-apq8064-arrow-sd-600eval fix
    graph_endpoint warning
  [stable-4.19] drm/msm:  fix address space warning

Lubomir Rintel (1):
  staging: olpc_dcon: add a missing dependency

Vincent Guittot (1):
  sched/pelt: Fix warning and clean up IRQ PELT config

 arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 5 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c             | 8 ++++----
 drivers/i2c/busses/i2c-aspeed.c                     | 4 +++-
 drivers/scsi/raid_class.c                           | 4 +---
 drivers/slimbus/qcom-ngd-ctrl.c                     | 6 ++----
 drivers/staging/olpc_dcon/Kconfig                   | 1 +
 init/Kconfig                                        | 5 +++++
 kernel/sched/core.c                                 | 7 +++----
 kernel/sched/fair.c                                 | 2 +-
 kernel/sched/pelt.c                                 | 2 +-
 kernel/sched/pelt.h                                 | 2 +-
 kernel/sched/sched.h                                | 5 ++---
 12 files changed, 29 insertions(+), 22 deletions(-)

Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andy Gross <andy.gross@linaro.org>
Cc: bp@alien8.de
Cc: Daniel Drake <dsd@laptop.org>
Cc: David Brown <david.brown@linaro.org>
Cc: dou_liyang@163.com
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: Jens Frederich <jfrederich@gmail.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-scsi@vger.kernel.org


-- 
2.20.0
