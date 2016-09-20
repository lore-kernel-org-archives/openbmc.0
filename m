Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdQk86DyrzDsfd
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 11:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=jrFyuS7i; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 254E6640FF8
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 20:52:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zlGo5wGVdrgK; Mon, 19 Sep 2016 20:52:29 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B5EA56410B9;
 Mon, 19 Sep 2016 20:52:29 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com B5EA56410B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474336349; bh=/PzMD607LMbtzd01jX0bzeP94fS8OR4Bqhi7yZux8Cc=;
 h=From:To:Subject:Date:Message-Id;
 b=jrFyuS7iFct/ARb2p9m1ZM04f00oJ5b/2d13kpwNyEip5Gez0ewgZSbBxZ7/qNK/U
 FqY9Tus2Lpxs96BobMgp6WGf5d9ft0DK2O8mfKxeruv6zJ5/KRlFJgvKbyMy7cs2lP
 3hhpg4GF4i8PVKz9H532EKnfSEA6Qe3mDG1To9PM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4lVWzWoa66Mu; Mon, 19 Sep 2016 20:52:29 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 35E6B640FF8;
 Mon, 19 Sep 2016 20:52:29 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] Add hwmon driver for MAX31875
Date: Mon, 19 Sep 2016 20:52:23 -0500
Message-Id: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Tue, 20 Sep 2016 01:52:33 -0000

This series adds a new hwmon driver for the MAX31875, which is
used for fan control on Firestone.

This patch is a holdover until a PMBus driver is written at some
point.  Upstream has stated they will not accept unless a PMBus
driver is used for this particular device.

Timothy Pearson (1):
  Initial driver for the MAX31785 intelligent fan controller

 Documentation/hwmon/max31785 |   36 +++
 MAINTAINERS                  |    7 +
 drivers/hwmon/Kconfig        |   10 +
 drivers/hwmon/Makefile       |    1 +
 drivers/hwmon/max31785.c     |  714 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 768 insertions(+)
 create mode 100644 Documentation/hwmon/max31785
 create mode 100644 drivers/hwmon/max31785.c

-- 
1.7.9.5
