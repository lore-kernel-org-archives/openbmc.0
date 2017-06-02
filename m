Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHqn0SFlzDqLR
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:46:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="imMQCtjW"; 
 dkim-atps=neutral
Received: by mail-oi0-x235.google.com with SMTP id h4so83835970oib.3
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xyuwwZ3bx2jdrl01mmKYKxayzk4LTCVPnJxfURQj88Q=;
 b=imMQCtjWBAB86mpaylhq3wL30QO2MylNyCJOvfClQFMOcIvsYqsVSoG5+xJH1g8O4q
 ayuZDqdwKJpZIVsMt+LH1Z2djswhrjyl0LHOaJZFShcmGUy0lL4MtHl9MmPyc/zg/zpp
 Sp08Eg8MPsHd27/r6ZMoKR9C8UrVl2FLtFn3dhpVXrQxzjLXbIopf9HRVZxKFsiu4HVx
 sSFjuzrtbHs6u//cG4wgSr/mIvdyv49eKF7RF4OugTokVD/iTRgseORJWdWdqgkeghM8
 0W9n+UEYWd4dN12nodzQ+J8MmbUgWsqGt0mepJCsmqyQqhDK2tZJ6DimJvOsHjWdqXDs
 lGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xyuwwZ3bx2jdrl01mmKYKxayzk4LTCVPnJxfURQj88Q=;
 b=LtUnQEClbbOv49wZwbvYz94NSJPjIqvwvC205OAagMFwbFYNLkIkkI6X1lG6xeOFJb
 3UVbqgyrWV/Js6EZoh3CvrMxvloi2ta1fNbQuNLnQPNICvUJaTBmeAqR3/KCxI10cBTB
 TgKmIdRqdX2grb77glab7gDbLmUcXDz+He5V5LBI+aP2BEaSJVPybK77AUzchmkxH6xL
 xOQ9GMmfcWZ6IoYuiycbopVZ0nmlzS51arqC8KL96IFpQBQ1ZIN4yNDX5fmPv3Sk38fv
 05ceKxnJMO7yYsvXv9vP5j+vbLpze8nAU2OHlsDyRxejJk348RVOoPAni1GYcx/F5UYk
 2m0A==
X-Gm-Message-State: AODbwcAqupeyf7B5h6Sjr1konvd6DgTvdBZ1dgVp9kbew6Z7gRB+I0Nz
 XI9KooHA3LuT1ImU
X-Received: by 10.84.248.73 with SMTP id e9mr101550712pln.76.1496393170607;
 Fri, 02 Jun 2017 01:46:10 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id o76sm48911007pfi.119.2017.06.02.01.46.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Jun 2017 01:46:09 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 joel@jms.id.au, vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 benh@kernel.crashing.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v9 0/5] i2c: aspeed: added driver for Aspeed I2C
Date: Fri,  2 Jun 2017 01:45:58 -0700
Message-Id: <20170602084603.30811-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.0.506.g27d5fe0cd-goog
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
X-List-Received-Date: Fri, 02 Jun 2017 08:46:13 -0000

Addressed comments from:
  - Ben in: http://www.spinics.net/lists/devicetree/msg179006.html

Changes since previous update:
  - Fairly minimal changes in master support patch, all else is the same

As before, tested on Aspeed 2500 evaluation board and a real platform with an
Aspeed 2520.
