Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 433 seconds by postgrey-1.35 at bilbo;
 Thu, 11 Aug 2016 21:35:21 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b=cuVACb6i; dkim-atps=neutral
Received: from forwardcorp1h.cmail.yandex.net (forwardcorp1h.cmail.yandex.net
 [87.250.230.216])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s95Y54mGJzDqhH
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 21:35:21 +1000 (AEST)
Received: from mxbackcorp1h.mail.yandex.net (mxbackcorp1h.mail.yandex.net
 [IPv6:2a02:6b8:0:f05::301])
 by forwardcorp1h.cmail.yandex.net (Yandex) with ESMTP id 3C72520698
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 14:27:55 +0300 (MSK)
Received: from webcorp01g.yandex-team.ru (webcorp01g.yandex-team.ru
 [87.250.230.44])
 by mxbackcorp1h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 uhLo1SVsq7-Rtf0aMxg; Thu, 11 Aug 2016 14:27:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1470914875; bh=+U6tDBYx1PSFo79sNj7A6dyLtVdNL1a6s5DSb0Id52Y=;
 h=From:To:Subject:Message-Id:Date;
 b=cuVACb6iuRngGcc81knTNUggkMjHkeG++9AfXOQBuCp4SOmG1HeaFnPfMIC0+mgMr
 o/VjsK6/Kn0EzSeG7p5PI4eBq/8ZY3Xf7jkdF/XzigBXLS/elie6iiTkW3naNsYn0p
 w1FQsingsQHwYgurFEg9WxfSlXojVkDpajAXvB8I=
Authentication-Results: mxbackcorp1h.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01g.yandex-team.ru with HTTP;
 Thu, 11 Aug 2016 14:27:55 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Platform setup via DTS
MIME-Version: 1.0
Message-Id: <279731470914875@webcorp01g.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 11 Aug 2016 14:27:55 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
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
X-List-Received-Date: Thu, 11 Aug 2016 11:35:25 -0000

I would like to start a little discussion around board setup process in arch/arm/mach-aspeed/aspeed.c.
For most cases this process is "flat": just modifying regs one-by-one. Sometimes with applying mask.
I have an idea to add an array of "instructions" to the Device Tree in the following manner
(I hope dtc's preprocess via cpp resolve ORed macro in the correct way):

==========
#include <dt-bindings/soc/aspeed.h>

/ {
    model = "Our HW";
    compatible = "aspeed,ast2400";
    board-setup = <WR, AST_BASE_LPC | 0x9c, 0x02010023, 0>,
                           <WR, AST_BASE_SCU, SCU_PASSWORD, 0>,
                           <WR, AST_BASE_SCU | 0x80, 0xcb000000, 0>,
                           ...
                            /* write(read() | 0x1000) */
                           <OR, AST_BASE_SCU | 0x2c, 0x00001000, 0>,

                           /* write((read() &~ 0x2000) | 0x1000) */
                           <OR, AST_BASE_SCU | 0x2c, 0x00001000, 0x2000>;
==========

or in less talkative way:

==========
                            /* write((read() &~ 0) | 0xcb000000) */
                           <AST_BASE_SCU | 0x80, 0xcb000000, 0>,
                           ...
                            /* write((read() &~ 0x1000) | 0x1000) */
                           <AST_BASE_SCU | 0x2c, 0x00001000, 0x1000>,
==========

to completely eliminate board-specific init functions.


-- 
Anton D. Kachalov
