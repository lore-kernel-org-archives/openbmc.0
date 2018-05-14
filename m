Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cpCIDP/z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ajMUq3ic"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lGmV5jj4zF3RH
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 09:16:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 88E4721C0A;
 Mon, 14 May 2018 19:16:40 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 14 May 2018 19:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=5Uj++IjcU94zRDxH/LizqLOisu9Nl
 QcCXXMEaEZnBFo=; b=cpCIDP/zZvWu9lrbgyMK4Xns7oRz0ovIWUzsZcNlZ+oJl
 1HKjoT8rUh0/wO5XO5jpxAqgN+sXwlbMmC8qlCEMq/tgXvFc2fnngYKMkL7z7NAp
 2dVwh6ldTMK3t+DaHD473dgbiM+7PrTsPIm+dH2GjR3OHYjXiZSwpxxntaAsg6Z0
 zipf3CCWt41COl9iMx6sCQRj58DPC8By9Z58slv2zP63g0XarI+YZEasMzBJ83Mo
 djKFsMK6qc1mTx459ZT//t5atRGU6sKnlaV1m7fhG0NehPf/OAme6Af0Fl5v1TYO
 emsT+BREmbumXxTt+uMNXmYJ1j3OyO+Vx41AyZ/8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5Uj++I
 jcU94zRDxH/LizqLOisu9NlQcCXXMEaEZnBFo=; b=ajMUq3icL5Pq3E18/K9F+u
 UyBV3fNee/ILxmZlvrchPbVz24a3gwZsVfBSBCgTI/PNtt0phVI2t4bsCTD8ZvXt
 hBnfPh5gjUlHpLUaJ7+nJr2JKEpkPPeMoY6F522TFXjJPZQuzYOGonQdaLR55Pxu
 yMhcT1ika0iA5esE/UYgyOZJ90dXtlgslHq2lXvr7FLtR4eJALNC3gJis7Nh++FK
 y87CBRTKgQ5wYxmryPL+87+ZVFM+KOjCGwtFLeaaQwsLakL1Ce2oH2OekwzEI1lP
 /zya6vPRO07LiZNnf9ovXGpDxJeWSGBhnZcxIkPdiJgzl9uraMAuq/xxhhK3knqQ
 ==
X-ME-Sender: <xms:2Bj6WjOivaac9syaSe1_d_UHHIA7xePAxhur7lv_tk-8snqEaoKhpg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 69E3C422D; Mon, 14 May 2018 19:16:40 -0400 (EDT)
Message-Id: <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Andres Oportus <andresoportus@google.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
In-Reply-To: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
Date: Tue, 15 May 2018 08:46:40 +0930
Subject: Re: Question on States monitoring
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
X-List-Received-Date: Mon, 14 May 2018 23:16:43 -0000

Hi Andres,

On Tue, 15 May 2018, at 01:16, Andres Oportus wrote:
> Are there any ongoing efforts on expanding States (say provided by GPIOs)
> monitoring/management?  I see that phosphor-state-manager has
> Chassis/Host/BMC states that are placed onto DBUS but not a more generic
> mechanism.  On the GPIO specific side, I see that phosphor-gpio-monitor
> allows for interrupt driven GPIO monitoring (seemly only used under a
> gpio-keys driver with /dev/input for Power's checkstop monitoring?), but no
> generic GPIO setting/getting for those not allowing interrupt type
> monitoring (say output GPIOs).

It's not clear to me what you're looking for here. Are you hoping for something to expose the GPIOs on DBus? I don't think we have anything like that, which is more of a design philosophy thing (we should probably provide a higher-level capability on DBus, not just directly expose GPIOs).

Alternatively if you're looking to handle GPIOs from your application, I would recommend libgpiod: 

https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/

Cheers,

Andrew
