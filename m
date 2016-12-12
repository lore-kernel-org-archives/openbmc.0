Return-Path: <mouse@mayc.ru>
X-Greylist: delayed 355 seconds by postgrey-1.36 at bilbo;
 Mon, 12 Dec 2016 22:12:39 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mayc.ru header.i=@mayc.ru header.b="Vj16nya2"; 
 dkim-atps=neutral
Received: from forward5h.cmail.yandex.net (forward5h.cmail.yandex.net
 [87.250.230.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcgD74kVwzDvk9
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 22:12:39 +1100 (AEDT)
Received: from mxback3j.mail.yandex.net (mxback3j.mail.yandex.net
 [5.45.198.17])
 by forward5h.cmail.yandex.net (Yandex) with ESMTP id 93BB120DE5;
 Mon, 12 Dec 2016 14:06:29 +0300 (MSK)
Received: from web11j.yandex.ru (web11j.yandex.ru [5.45.198.52])
 by mxback3j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id narrBHLjkY-6SMSjoEx; 
 Mon, 12 Dec 2016 14:06:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mayc.ru; s=mail;
 t=1481540788; bh=InpdhzS66kx67rNnDZ9q89/0/tTOIqBD8nrFTCclH4Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=Vj16nya2sckaNIS7OAEOgUtW2GT+GMPlE8TkX8GY3EMagooFGbtEQ2eVdQaCFlwQr
 9TOcmUEL/H9RzDqErDMB1jhuzDKMawQGeh7ezTZri1yKWUB0Ng/TueDiGpq8327oYc
 oCH7+WZj9YeRHNaTIdimPZHsB0pSG42erljvZtlo=
Authentication-Results: mxback3j.mail.yandex.net; dkim=pass header.i=@mayc.ru
Received: by web11j.yandex.ru with HTTP;
	Mon, 12 Dec 2016 14:06:28 +0300
From: Kachalov Anton <mouse@mayc.ru>
To: Wolfram Sang <wsa@the-dreams.de>,
 Brendan Higgins <brendanhiggins@google.com>
Cc: "vz@mleia.com" <vz@mleia.com>, "clg@kaod.org" <clg@kaod.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <20161211222622.GK2552@katana>
References: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
 <1480467618-7497-2-git-send-email-brendanhiggins@google.com>
 <20161211222622.GK2552@katana>
Subject: Re: [PATCH v5 1/2] i2c: aspeed: added driver for Aspeed I2C
MIME-Version: 1.0
Message-Id: <825541481540788@web11j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 12 Dec 2016 14:06:28 +0300
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
X-List-Received-Date: Mon, 12 Dec 2016 11:12:43 -0000



12.12.2016, 01:26, "Wolfram Sang" <wsa@the-dreams.de>:
> On Tue, Nov 29, 2016 at 05:00:17PM -0800, Brendan Higgins wrote:
>>  Added initial master and slave support for Aspeed I2C controller.
>>  Supports fourteen busses present in ast24xx and ast25xx BMC SoCs by
>>  Aspeed.
>>
>>  Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> BTW first the bindings patch please, then the driver.
>
> And one seperate question I just stumbled over:
>
>>  + /* Switch from master mode to slave mode. */
>>  + func_ctrl_reg_val = aspeed_i2c_read(bus, ASPEED_I2C_FUN_CTRL_REG);
>>  + func_ctrl_reg_val &= ~ASPEED_I2CD_MASTER_EN;
>>  + func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
>>  + aspeed_i2c_write(bus, func_ctrl_reg_val, ASPEED_I2C_FUN_CTRL_REG);
>
> Can't the hardware work both as master and slave on the same bus?

The hardware can work as master and slave on the same bus. This is how IPMB over i2c works on Aspeed.
