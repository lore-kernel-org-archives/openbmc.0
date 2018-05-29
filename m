Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=7qdu=iq=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="exCQ03jF"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wDdH2lKRzDr4d
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 23:11:31 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E90520880;
 Tue, 29 May 2018 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1527599489;
 bh=xVsgwsocI0Ky6Tyo99vJYIaJhVuUB28zGdD9y0VP5RI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exCQ03jFSu4Al7T2TrK+SUCMtPPQxoemHWRSOtBg/eFabe6zxxwJ2HGo4oyYvsH4S
 VG8GKtl9MUwYo5FDlM+PXC7SPMGMhLSr804Zx121yTbLp4mjRuPStnnTHldiGXQYK3
 CvgUzKI1/935Vy//LxooAGzUGlSOwXxejXhx6qIM=
Date: Tue, 29 May 2018 15:11:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org
Subject: Re: [patch v23 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
Message-ID: <20180529131109.GD30119@kroah.com>
References: <1527594545-19870-1-git-send-email-oleksandrs@mellanox.com>
 <1527594545-19870-3-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527594545-19870-3-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Tue, 29 May 2018 13:11:31 -0000

On Tue, May 29, 2018 at 02:49:03PM +0300, Oleksandr Shamray wrote:
> +static int aspeed_jtag_idle(struct jtag *jtag,
> +			    struct jtag_run_test_idle *runtest)
> +{
> +	struct aspeed_jtag *aspeed_jtag = jtag_priv(jtag);
> +
> +	dev_dbg(aspeed_jtag->dev, "runtest, status:%d, mode:%s, state:%s, reset:%d, tck:%d\n",
> +		aspeed_jtag->status,
> +		aspeed_jtag->mode & JTAG_XFER_HW_MODE ? "HW" : "SW",
> +		end_status_str[runtest->endstate], runtest->reset,
> +		runtest->tck);

You have dev_dbg() lines all over the place.  They can all be removed
now, right?  ftrace works well, and if you really want to do this
properly, use tracepoints in the jtag core code so that you can get the
information for all devices as needed.

But don't put them all over the driver, now that it's all working,
there's no need, right?

> +static void aspeed_jtag_xfer_push_data_last(struct aspeed_jtag *aspeed_jtag,
> +					    enum jtag_xfer_type type,
> +					    u32 shift_bits,
> +					    enum jtag_endstate endstate)
> +{
> +	if (endstate == JTAG_STATE_IDLE) {
> +		if (type == JTAG_SIR_XFER) {
> +			dev_dbg(aspeed_jtag->dev, "IR Keep Pause\n");

Like this, doesn't provide much info, does it?

thanks,

greg k-h
