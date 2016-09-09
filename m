Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x234.google.com (mail-pa0-x234.google.com
 [IPv6:2607:f8b0:400e:c03::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sW7HM6dtMzDrq6
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 05:55:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=hb2j630F; 
 dkim-atps=neutral
Received: by mail-pa0-x234.google.com with SMTP id to9so31253159pac.1
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=KsSzOpJxbMiBep5gWoO5HfDJeZ2c7bTc1GokZKcqwl0=;
 b=hb2j630FYzzy5Qf4xLAbGxnkgoADV53UrNBazPApgqiGkqF90GlVXS37lXaGxSr+vb
 PVAo8rWfqd8UyDJ05wBIetc7hw4Qpp3eQOWCd36R2Gl8yMt6EHGj6C+JMnSW11pvM6q7
 wnlPthl9eESCmgf5nrNfPFRUxnNwhJMdLdYJ6NpGawDP51cLm0HjbTI4OtkW8zMw0Zj8
 2NeUXAC/nn+1YemC8yRB2ARAcCsqjHhWVF+ff5gtJglw3YRBKKOplnJnBJ7kNjyJbYdw
 fs4pQzV1KQDCtQaz4a1KMeMe/8ysPGBiir4NoHY0gUm2zrzxBtZgE4cGVHReZAO0+Ncl
 Tsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KsSzOpJxbMiBep5gWoO5HfDJeZ2c7bTc1GokZKcqwl0=;
 b=WsFLqBdYQIPU7snWAIFw/l3WBjVvPgbFHAfbufT+GpPK9La0sMMvMWMe4/pcFc+p9J
 wEz7k6iqoCgX7ZqpqQtH7JGH3Uupfs9FBI+r+3im7H3hWEU82QU3tYd/xMifXRZqjwGu
 aj/tt3VC1ggJDTY8QKCUyzJUx+q8ZTdp1Tvhc4rGb9eoIzhlin1HdxSZv6dLxlzV0f4G
 0+OoJEi/xB1l+ZxN1ncDicEXP1WyE4uHC4vdbGcMmatQn/9E26FaQv4c3v/mtfvwljJn
 cgYumJRcNB0iPcGfYnJEi2xUxDrXFNiyQsPhWzsAjdJGL8QBAKiEIRbsYiYZVOWQVYxR
 SJxA==
X-Gm-Message-State: AE9vXwNLg5UIYD55KwcBmFWN/9m+YrzKWn3GZGaYcWTKlfAuHUFAEw9WoKkBT5nt08qQ5CGj
X-Received: by 10.66.255.42 with SMTP id an10mr9676892pad.57.1473450956919;
 Fri, 09 Sep 2016 12:55:56 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e72sm7166946pfb.49.2016.09.09.12.55.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 09 Sep 2016 12:55:56 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de,
	robh+dt@kernel.org,
	mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jk@ozlabs.org
Subject: [PATCH 0/2] i2c: aspeed: added driver for Aspeed I2C
Date: Fri,  9 Sep 2016 12:54:28 -0700
Message-Id: <1473450870-10333-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 09 Sep 2016 19:56:00 -0000

This patch set adds initial master mode and slave mode support for the Aspeed
24xx and 25xx I2C controllers, as well as device binding documentation for the
new driver.

These changes have been tested on the ast2500 evaluation board from Aspeed.

Work still to be done:
 - The driver supports I2C protocol mangling in the form of sending stops after
   every transaction, the remaining mangling support has not yet been added.
 - SMBus Alert support.

Cheers!
