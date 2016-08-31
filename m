Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sPZWx0RT9zDrn5
 for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2016 05:02:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=HsGIf0+B; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id p64so22297272pfb.1
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 12:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=cGsH+bWghTrrcV125cYTjGJk7PQRt0Bke+fAHtawynE=;
 b=HsGIf0+BOV1i1qAQOQNNTtWHiKqZZoTAxaQQ3f75+0sG7acNey8lUOO5/dB/WpGsU6
 Z4c7tjLUqLRvP38ZcxDQaQIbNooSwpzHMdQXyUt4KfChkT2Eg3yS1ndsOlGsKV3nNKBB
 TA9ya64OooKfpCJeyJYfXiow2kj3EK3PJ2kuWCDDlgWn+2INrBSWYt0YdZOgIXI9/YRv
 ExsHpB6k8/IXfh3cNDaPGvrl0iB3n44MMZ+acK4ApWM2/K8UO6igGqW5cy+tCAVmW4dL
 DTasfnIitj3ZWLY1ZfKGX8bZZ3MPPHgp1LGfntHpCum+ce+ZgqUz5jhwjfvSgTGWSS5M
 fodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=cGsH+bWghTrrcV125cYTjGJk7PQRt0Bke+fAHtawynE=;
 b=WgJiMT7rFJWDdaL1pE0mLT04t6m4nPwWAmgO3H+LXGO84c/8QtWbr0QenJ//aZlMrJ
 P3mkCi/Gj1K9N0cme9TnqgyaLRruMCP0cYKtxHRIQRBVnsCLsFmkAt7uEVd2TU+ybKCU
 Hl0Z+Io3YmetM1dGTAD8BqRaGlvu+xNb43UiCBfFxqv808wc+X6oqEKxmw9MYz71yAC3
 lw/Tg0o7r5/DY4c1w93fs/cuBw46B1v5ng1Gdrc9U7VoTGjmG7ZaYYEZJmkk/66NnSEp
 0MgU+JDx/MSIL5HE8fV/OSd9/Uch7AKc/mIo90KhhFV4HV0mHp2rFyNR8j95FHuO18kp
 9rJw==
X-Gm-Message-State: AE9vXwPA0tFzzrEuxtVM+qOnnSyfBLOe2ENhhPqfw7iSD8n2YaSEh+DK3k8PYcu+ukbCsjeq
X-Received: by 10.98.48.65 with SMTP id w62mr19644997pfw.18.1472670153618;
 Wed, 31 Aug 2016 12:02:33 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id 191sm1452574pfx.68.2016.08.31.12.02.32
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Aug 2016 12:02:32 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] i2c: aspeed: added driver for Aspeed I2C
Date: Wed, 31 Aug 2016 12:02:25 -0700
Message-Id: <1472670147-8888-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Wed, 31 Aug 2016 19:02:37 -0000


Added Aspeed I2C driver and device tree bindings documentation. This is patch
set is based on upstream and SHOULD NOT be applied against the OpenBMC repo.

Joel, you mentioned in the previous thread

> Add the binding in a separate commit, coming before the addition of the
> driver.

I am not sure what you mean by this as the binding is part of the driver, are
you referring to the documentation?

Other than that, I think everything is good to go.

Cheers,
Brendan
