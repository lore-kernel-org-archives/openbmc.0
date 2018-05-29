Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=7qdu=iq=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mJl1EUzP"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wDbk1bjbzDr4h
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 23:10:10 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF41320883;
 Tue, 29 May 2018 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1527599408;
 bh=/eW3J3f6Vv9asOG9JE09CJvnzJ9BmtDOdmJL/NUDZaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJl1EUzPntspP1zJusKDXNxKvLW+UF6tqhswwkOxb6PVa2DCwnUavN2pgQAV7w67z
 tEkbijo4F2PH35dcDGg+ea7946djiFo8ZjVt+woMO3lSgw03cQbWMaUYmfihfPem2a
 0/5AIL7JaGaO+Y04y3+b14XQFkmrfM/LyLbunpBE=
Date: Tue, 29 May 2018 15:09:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org
Subject: Re: [patch v23 1/4] drivers: jtag: Add JTAG core driver
Message-ID: <20180529130948.GC30119@kroah.com>
References: <1527594545-19870-1-git-send-email-oleksandrs@mellanox.com>
 <1527594545-19870-2-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527594545-19870-2-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
X-List-Received-Date: Tue, 29 May 2018 13:10:10 -0000

On Tue, May 29, 2018 at 02:49:02PM +0300, Oleksandr Shamray wrote:
> +static int jtag_release(struct inode *inode, struct file *file)
> +{
> +	return 0;
> +}

If you do not do anything, then there is no need to have this callback
at all, right?

> +/**
> + * enum jtag_endstate:
> + *
> + * @JTAG_STATE_IDLE: JTAG state machine IDLE state
> + * @JTAG_STATE_PAUSEIR: JTAG state machine PAUSE_IR state
> + * @JTAG_STATE_PAUSEDR: JTAG state machine PAUSE_DR state
> + */
> +enum jtag_endstate {
> +	JTAG_STATE_IDLE,
> +	JTAG_STATE_PAUSEIR,
> +	JTAG_STATE_PAUSEDR,

Be specific with these enums, set them to a value so you know all is
good.  Userspace C compilers can be funny at times.

Otherwise, looks really good, nice work.

greg k-h
