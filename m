Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxZBl441XzDqGv
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 00:25:19 +1000 (AEST)
Received: by mail-oi0-f65.google.com with SMTP id s11so3699389oie.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 07:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nHiQF4nPS6yZOe4hAM+SFxz8b/6pOTUmVn1Pdb6PbHY=;
 b=DF0qG1Y7fB5DVnoRuKI8GKLuZC/D5jn8ZdMHsuYa4FBPwSDIQBMBotoMAjpQY4HMaG
 pTCuvV07scI9szOn++ak1g2PRSS/s0IvU+IIuKRhy3HNOuP3Rmj7nrKyyPuX3j3UBZGh
 k2eV4SlDP9q6tjui0RjwTguJkhZnfiZeqkqnHYR4R+TxQM4uwfcGswavfI/MbPm+VygP
 0q47ELjhh+KizDtRJKT2SJ4oN2RfblBQ6NOI1RgWI8Z8TSbXZAF7CwA3EA16/XVeNNSs
 78x8BmM/KhObr8yNln4QKVU0jcUKyiMRnKiOEK1xccPgfCYGL6lGyMCMKpI0Pu2QcInH
 TF5A==
X-Gm-Message-State: AFeK/H0xMT14QHUtWT6mfIDXGCkfvfsgp4yHS594Y6TxtFWhYiP88m3eWwCdblgfIENV9A==
X-Received: by 10.202.189.3 with SMTP id n3mr4214566oif.55.1491229517748;
 Mon, 03 Apr 2017 07:25:17 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id b17sm3418587ote.58.2017.04.03.07.25.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Apr 2017 07:25:17 -0700 (PDT)
Date: Mon, 3 Apr 2017 09:25:16 -0500
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Mark Rutland <mark.rutland@arm.com>,
 Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drivers/serial: Add driver for Aspeed virtual UART
Message-ID: <20170403142516.5rqv7yznkapryteu@rob-hp-laptop>
References: <20170328054458.29341-1-joel@jms.id.au>
 <20170328054458.29341-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170328054458.29341-3-joel@jms.id.au>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Mon, 03 Apr 2017 14:25:20 -0000

On Tue, Mar 28, 2017 at 04:14:58PM +1030, Joel Stanley wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> This change adds a driver for the 16550-based Aspeed virtual UART
> device. We use a similar process to the of_serial driver for device
> probe, but expose some VUART-specific functions through sysfs too.
> 
> OpenPOWER host firmware doesn't like it when the host-side of the
> VUART's FIFO is not drained. This driver only disables host TX discard
> mode when the port is in use. We set the VUART enabled bit when we bind
> to the device, and clear it on unbind.
> 
> We don't want to do this on open/release, as the host may be using this
> bit to configure serial output modes, which is independent of whether
> the devices has been opened by BMC userspace.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt |   2 +

For the binding:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/tty/serial/Kconfig                        |  10 +
>  drivers/tty/serial/Makefile                       |   1 +
>  drivers/tty/serial/aspeed-vuart.c                 | 335 ++++++++++++++++++++++
>  4 files changed, 348 insertions(+)
>  create mode 100644 drivers/tty/serial/aspeed-vuart.c
