Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9hgs2pyHzDvYZ
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 12:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GX1K/UbB"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id n85so60677403pfi.1
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 18:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=OBV+frJ5VS5pdxn7ZeC3GAsByObVRjD/V63S2TsFJes=;
 b=GX1K/UbBtXGomp0NDUNlZEd465PsqZooWVuRvO3AtaAt2In89YokGEJxU33qdWUVQT
 MkganWGh0n/RbcyugzAgNE6rNj9Nx7c0SWnGiQtxOSCSytVVS5vqOBQ830AipA2s2Drj
 37vtfveBg8z51LWkm9jts8eGgtTCFxi4O7uorbpJldLzUh4Ecpw5A2Rp7E0b8vzesw02
 mbatmLx/SllR4pP7ADr9y10xdSIsX0zbvRy8NMW9jzloN5ATalSx+H/u3ZhEL3xj+6Nc
 s2Enl94ehtg4RX0Sach2NiWeOy9fGt4RuddBZEGnDOfnaZxSxNf3s/5jddvSC1lbuUvn
 HX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OBV+frJ5VS5pdxn7ZeC3GAsByObVRjD/V63S2TsFJes=;
 b=FgkyYTQWcQAscFOGUdBIQxsAqvGJBtzAQ90DugKh0pjO+4Y2Jmpg8LYcSAD3D/O37Q
 iYeWw0I/zl2JIYfL3xgHzfiUJUs9TQ4sc1RdfRMrIUND4Ol896eXHPUtugK0vgOZZkqO
 Rg/BE0dIOwF/ty2epD5E6xKwzN42dmlarisE7em/rIJ+k2L4W0dgCpqDRw5PEnGopTEJ
 dYYWbnMkrg+FOI5cSx427s4cJXGiBBJ41PVMKfrjPAQ/0F3k1dA7sV57xojSEJJk/qNM
 3PPmti36dSjiue5pmFCnYbPDy9Ids6ZFGu0w4QJh7/HcuUMhSc9BaGMEHh5v2df/4kdH
 t0PA==
X-Gm-Message-State: ABUngveH5aQNuyBB+RUFb9i/GBPIOQdvhC0SDNG8e7bX2MzU2NxpDY/JsodxpW1KA2gPy6Fw
X-Received: by 10.98.214.157 with SMTP id a29mr31799845pfl.162.1478311110126; 
 Fri, 04 Nov 2016 18:58:30 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id k89sm23153902pfg.6.2016.11.04.18.58.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Nov 2016 18:58:29 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/2] i2c: aspeed: added driver for Aspeed I2C
Date: Fri,  4 Nov 2016 18:58:17 -0700
Message-Id: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Sat, 05 Nov 2016 01:58:34 -0000

Sorry, been a while since I was able to send an update for this.

As a refresher, I added a master mode and slave mode I2C driver for the Aspeed
24XX/25XX SoC as well as device binding documentation.

Changes since first update:
  - I have removed the bus device tree param as requested here:
    http://www.spinics.net/lists/devicetree/msg143850.html
  - I2C adapter number is now generated dynamically unless an alias is provided
  - I changed the Kconfig for the driver to depend only on ARCH_ASPEED
  - Replaced the two module_platform_driver registrations with single
    module_init

Changes have been tested on the Aspeed evaluation board.
