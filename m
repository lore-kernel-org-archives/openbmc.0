Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40bFSy14tNzF2RB
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 07:50:22 +1000 (AEST)
Received: from localhost (unknown [104.132.1.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5132236F6;
 Tue,  1 May 2018 21:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Tali Perry <tali.perry1@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, openbmc@lists.ozlabs.org,
 linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
Message-ID: <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH -next] clk: npcm7xx: fix return value check in
 npcm7xx_clk_init()
Date: Tue, 01 May 2018 14:50:20 -0700
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2018 21:50:26 -0000

Quoting Wei Yongjun (2018-04-26 04:21:08)
> In case of error, the function ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> =

> Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Have you made this into a scripts/coccinelle/ script I can run?

Applied to clk-next
