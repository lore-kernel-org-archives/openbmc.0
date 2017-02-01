Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 560 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Feb 2017 20:41:24 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="0niqYfTI"; dkim-atps=neutral
Received: from forwardcorp1m.cmail.yandex.net (forwardcorp1m.cmail.yandex.net
 [5.255.216.198])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCynJ6lDvzDqDy
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 20:41:24 +1100 (AEDT)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1m.cmail.yandex.net (Yandex) with ESMTP id 1846020690;
 Wed,  1 Feb 2017 12:31:51 +0300 (MSK)
Received: from webcorp02f.yandex-team.ru (webcorp02f.yandex-team.ru
 [77.88.31.46])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 McTbpYcEpi-Vow8PJeu; Wed, 01 Feb 2017 12:31:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1485941510; bh=MQrSVcdomohBVHhy3irCRB97UoXGmtaWh7vQyvR6Qw0=;
 h=From:To:In-Reply-To:References:Subject:Message-Id:Date;
 b=0niqYfTIh3jAhzWgcRnYiUtLKw4jemf0+4FbHYpRxoOKcIwjm+jToRE0kQlEkDAv/
 0gOKfQs3Vv8ww8O/D/Lqr5NBAQTrQh8mqMZ3g0w9QmGh9CusJIgo9t4dXBuSmZE+tC
 15EbkFsgspCxuOH6wkDY/X9DqU54L1xA9smyl9MY=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp02f.yandex-team.ru with HTTP;
 Wed, 01 Feb 2017 12:31:50 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Rick Altherr <raltherr@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <20170201014414.31868-1-raltherr@google.com>
References: <20170201014414.31868-1-raltherr@google.com>
Subject: Re: [PATCH linux v4] dts: Minimal device tree for Quanta Q71L BMC
MIME-Version: 1.0
Message-Id: <4621485941510@webcorp02f.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 01 Feb 2017 12:31:50 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Wed, 01 Feb 2017 09:41:26 -0000

Hello, Rick.

01.02.2017, 04:44, "Rick Altherr via openbmc" <openbmc@lists.ozlabs.org>:
> Supports:
>   - BMC console UART
>   - BMC boot flash
>   - host boot flash
>   - host virtual UART (host console)
>

Have you plans to add support for KVM and Virtual Media through the Aspeed?
