Return-Path: <gustavo@embeddedor.com>
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=embeddedor.com
 (client-ip=192.185.148.212; helo=gateway34.websitewelcome.com;
 envelope-from=gustavo@embeddedor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=embeddedor.com
X-Greylist: delayed 1500 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Aug 2018 09:57:00 AEST
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
 [192.185.148.212])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xLtN0Q1GzDqgZ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 09:56:59 +1000 (AEST)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 7FF2A89FF6F
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 18:07:03 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id sygqfh1xkBcCXsygufCfc8; Thu, 23 Aug 2018 18:07:03 -0500
X-Authority-Reason: nr=8
Received: from [189.250.40.214] (port=42000 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1fsygp-002KW1-Em; Thu, 23 Aug 2018 18:06:55 -0500
Date: Thu, 23 Aug 2018 18:06:54 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] clk: npcm7xx: fix memory allocation
Message-ID: <20180823230654.GA11576@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.40.214
X-Source-L: No
X-Exim-ID: 1fsygp-002KW1-Em
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.40.214]:42000
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Sun, 26 Aug 2018 12:35:49 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 23:57:00 -0000

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
	int stuff;
        void *entry[];
};

instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count,
GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);

Notice that, currently, there is a bug during the allocation:
	
sizeof(npcm7xx_clk_data) should be sizeof(*npcm7xx_clk_data)

Fix this bug by using struct_size() in kzalloc()

This issue was detected with the help of Coccinelle.

Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/clk/clk-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index 740af90..c5edf8f 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -558,8 +558,8 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 	if (!clk_base)
 		goto npcm7xx_init_error;
 
-	npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
-		NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);
+	npcm7xx_clk_data = kzalloc(struct_size(npcm7xx_clk_data, hws,
+				   NPCM7XX_NUM_CLOCKS), GFP_KERNEL);
 	if (!npcm7xx_clk_data)
 		goto npcm7xx_init_np_err;
 
-- 
2.7.4
