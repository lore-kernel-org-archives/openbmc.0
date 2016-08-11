Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 306 seconds by postgrey-1.35 at bilbo;
 Thu, 11 Aug 2016 21:45:06 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b=zAIZJJKM; dkim-atps=neutral
Received: from forwardcorp1j.cmail.yandex.net (forwardcorp1j.cmail.yandex.net
 [5.255.227.106])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s95mL4yQYzDqhH
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 21:45:06 +1000 (AEST)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1j.cmail.yandex.net (Yandex) with ESMTP id 06A20206A3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 14:39:56 +0300 (MSK)
Received: from webcorp01d.yandex-team.ru (webcorp01d.yandex-team.ru
 [5.255.216.158])
 by mxbackcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 TjQOrTSccD-dtDCoMW1; Thu, 11 Aug 2016 14:39:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1470915595; bh=BlUQLcwD4maET8cbPDPABQOzyY6eLcpsMSrPd/9jUDA=;
 h=From:To:In-Reply-To:References:Subject:Message-Id:Date;
 b=zAIZJJKMc7jqbJmG64LaV1bJlGA1DMWeZp5QKppfcb78UBogiW1JYoDdrukMiqCuK
 DLwZV76Hx7LlhdXFZPYOAvQGof7C7PKlXWJcjRVO60jJlSkpv2velWN9Z2VOwj8Jky
 DoIgyy0mkF5GQA2hxByGOJkVOKoj8soMZNNSUUZI=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01d.yandex-team.ru with HTTP;
 Thu, 11 Aug 2016 14:39:55 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <279731470914875@webcorp01g.yandex-team.ru>
References: <279731470914875@webcorp01g.yandex-team.ru>
Subject: Re: Platform setup via DTS
MIME-Version: 1.0
Message-Id: <274901470915595@webcorp01d.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 11 Aug 2016 14:39:55 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 11 Aug 2016 11:45:07 -0000

Instead of:

>                             /* write((read() &~ 0) | 0xcb000000) */
>                            <AST_BASE_SCU | 0x80, 0xcb000000, 0>,

have to be:

                             /* write((read() &~ 0xffffffff) | 0xcb000000) */
                            <AST_BASE_SCU | 0x80, 0xcb000000, 0xffffffff>,
