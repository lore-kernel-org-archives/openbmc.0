Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7rBZ6t2BzDq5Y
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 08:31:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ANFwY9GI"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id k14so36257686pgr.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=iJBd/qOHDrPCXTTTtGrTMKTk9e0koAL46GWh1YKMhrY=;
 b=ANFwY9GIJKuWkxezpL7nxo2s2Z/EMFLHVCtfW36mIZEZpt0lpnIl2Fl9vrRVYyD1Ic
 hMP6POjkyWgOm8tWA1LWO+0Na2nJBrDUUhpNjIZN2rQ6fipajx5shTPzLgI5U3Qiebha
 O93/TdcW9+n8AEiC9ocehwOVtvhmk/xov3w9/kSeUQ1w6dJGUPvN6t+zIcExU06Ep9eu
 IuTLSOcXWpXY+kjDxCKbMINK1YWlBn9xFxgC3J/ynXU06CzaMAcyOxHRWkOfgVhCKo04
 cxOUlabFRlJRe/ch1993S9jW4sHlsCxMRFoYzWfpS+4rTuucm0QNghuFIZVFvYjCt5vj
 +XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iJBd/qOHDrPCXTTTtGrTMKTk9e0koAL46GWh1YKMhrY=;
 b=XCm7wMKhbd7gUhw1A67KHpV/svsRE3/qKZxUUBUvy9UTKmPmiWQcw004cbmlf5DCo8
 PEw3mT1aa0f3bNEAJSuKLP3RgwrQzLYjxH1Kk0oCFA18LqmDfcONbs1ILJDyINawr5jC
 hNiIpLLWzb++hf81c5SdZQz+yri4Z189VIB+N6THLRxWg4xHY+XlHs227jFE9Px80FVy
 964pIGefvgDofadpGZQJBBfCQk1W0GYtmRT4rrRylhnxn+aLWD9xzBbtj1pLhzm145Tg
 R+SabwhtCLjfEmSKBOmuCDFDwltVh3ycXsosdRqj4Ag3upH+oiXW4RTwH5qmr9d3Gphv
 jIPA==
X-Gm-Message-State: AIVw113fja3cbNkIJgLo70+0MFr+3+DIwWe3QT3knrYD8GfkNof0RC2q
 EWff/1Qu5kXw3txC
X-Received: by 10.98.147.69 with SMTP id b66mr1877315pfe.148.1499985060280;
 Thu, 13 Jul 2017 15:31:00 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e13sm11992536pfh.96.2017.07.13.15.30.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Jul 2017 15:30:59 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	benh@kernel.crashing.org,
	joel@jms.id.au
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] i2c: aspeed: add proper support for 24xx clock params
Date: Thu, 13 Jul 2017 15:30:51 -0700
Message-Id: <20170713223052.8387-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.2.932.g7449e964c-goog
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
X-List-Received-Date: Thu, 13 Jul 2017 22:31:03 -0000

Joel, Ben, our g5 device tree has I2C bus compatibility strings for the 24xx;
this will need to be changed because the clock is no longer programmed the same
way for the 24xx and the 25xx. I have a patch that fixes this; I will send it to
the OpenBMC list once this patch gets accepted.

Tested on an Aspeed 2400 and an Aspeed 2500.
