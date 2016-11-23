Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 647 seconds by postgrey-1.36 at bilbo;
 Wed, 23 Nov 2016 16:12:31 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="zUD01AH8"; dkim-atps=neutral
Received: from forwardcorp1j.cmail.yandex.net (forwardcorp1j.cmail.yandex.net
 [IPv6:2a02:6b8:0:1630::180])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNr7M2Tr9zDvsK
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:12:31 +1100 (AEDT)
Received: from mxbackcorp1m.mail.yandex.net (mxbackcorp1m.mail.yandex.net
 [IPv6:2a02:6b8:0:2519::301])
 by forwardcorp1j.cmail.yandex.net (Yandex) with ESMTP id 440AE20BDF;
 Wed, 23 Nov 2016 08:01:37 +0300 (MSK)
Received: from webcorp02g.yandex-team.ru (webcorp02g.yandex-team.ru
 [87.250.230.45])
 by mxbackcorp1m.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 zuwHCYn2sd-1awCVeMc; Wed, 23 Nov 2016 08:01:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1479877297; bh=TH4Hxf/QdQ2h3XTpVRfbQSZmV4alwln2jGUAmLNmdas=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=zUD01AH87nU5eo7GtoFMtj4zBgmgiy0dxQcn1/Oilyr5yyojMWQNEau3gURGbY8AT
 +ZS24156mCbwj90g1NXWW3Bm1e7PigvT+rLb/5/0EthytB61mVaEs5TZFFye/6iPFU
 KkN68F7YR+3TxvExF8Tavox89Oea2y0Ft4ypoySQ=
Authentication-Results: mxbackcorp1m.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp02g.yandex-team.ru with HTTP;
 Wed, 23 Nov 2016 08:01:36 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <CACPK8Xc+dgohMYhShGoifNf4pxWTHzoas1G1+FiffPGBG-7j7Q@mail.gmail.com>
References: <12131479795846@webcorp02g.yandex-team.ru>
 <CACPK8Xc+dgohMYhShGoifNf4pxWTHzoas1G1+FiffPGBG-7j7Q@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: fixup MAC address set during board bringup
MIME-Version: 1.0
Message-Id: <135601479877296@webcorp02g.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 23 Nov 2016 08:01:36 +0300
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
X-List-Received-Date: Wed, 23 Nov 2016 05:12:33 -0000



23.11.2016, 07:57, "Joel Stanley" <joel@jms.id.au>:
> On Tue, Nov 22, 2016 at 4:54 PM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
>>  Hardware reset leads to clear all registers.
>>  Make the hardware reset first before actual MAC address set in ftgmac100_initialization loop.
>>  Based on datasheet only one bit (SW_RST) have to be set in order to proper MAC reset.
>>
>>  Signed-off-by: Anton D. Kachalov <mouse@yandex-team.ru>
>
> Thanks for the patch!
>
>>  ---
>>   drivers/net/ftgmac100.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>  diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
>>  --- a/drivers/net/ftgmac100.c 2016-11-22 07:07:44.000000000 +0300
>>  +++ b/drivers/net/ftgmac100.c 2016-11-22 07:27:12.131940971 +0300
>>  @@ -457,7 +457,7 @@ static void ftgmac100_reset(struct eth_d
>>          debug("%s()\n", __func__);
>>
>>          //Ryan modify
>>  - __raw_writel(__raw_readl(&ftgmac100->maccr) | FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
>>  + __raw_writel(FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
>
> I assume all of the other values in MACCR will be reset when we do the
> software reset, so that's why you don't need to read-modify-write?

Regarding to the datasheet reset sequence, only one bit (SW_RST) have to be written. Within real hardware (AST2150) read-modify-write doesn't work. Sametime, kernel's driver has a proper init sequence too (only one bit set).

>
>>          while (__raw_readl(&ftgmac100->maccr) & FTGMAC100_MACCR_SW_RST);
>>
>>  @@ -791,11 +791,11 @@ int ftgmac100_initialize(bd_t *bd)
>>                  miiphy_register(dev->name, ftgmac100_reg_read, ftgmac100_reg_write);
>>   #endif
>>
>>  + ftgmac100_reset(dev);
>>  +
>
> This part of the change looks good.
>
> Cheers,
>
> Joel
>
>>                  /* set the ethernet address */
>>                  ftgmac100_set_mac_from_env(dev);
>>
>>  - ftgmac100_reset(dev);
>>  -
>>                  card_number++;
>>          }
>>          return card_number;
>>  _______________________________________________
>>  openbmc mailing list
>>  openbmc@lists.ozlabs.org
>>  https://lists.ozlabs.org/listinfo/openbmc

-- 
Anton D. Kachalov

ITO, Systems Architect
Tel: 7 (495) 739-70-00 ext.7613
