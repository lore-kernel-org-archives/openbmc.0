Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sshWy08WvzDrPL
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 11:56:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sshWx4mGqz9s2Q;
 Mon, 10 Oct 2016 11:56:13 +1100 (AEDT)
Subject: Re: [PATCH linux v2 17/17] drivers/fsi: Add GPIO master functionality
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-18-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <92b7a5c0-71ae-7af7-8090-45f4375a39d5@ozlabs.org>
Date: Mon, 10 Oct 2016 08:56:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475948333-55960-18-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 10 Oct 2016 00:56:14 -0000

Hi Chris,

> Add setup of the GPIO pins for FSI master function.
> Set up I/O directions, define all pins needed and
> set up their initial values.  Define serial out
> operation.
> 
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

Awesome! I assume this is still in development though, right?

>  struct fsi_master_gpio {
>  	struct fsi_master	master;
>  	struct gpio_desc	*gpio_clk;
>  	struct gpio_desc	*gpio_data;
> +	struct gpio_desc	*gpio_trans;		/* Voltage translator */
> +	struct gpio_desc	*gpio_enable;		/* FSI enable */
> +	struct gpio_desc	*gpio_mux;		/* Mux control */
>  };

OK, you should update the device-tree binding to include these extra
GPIOs (and put their descriptions in there). Are they required for all
implementations? (is it possible that some would only have clock and
data?)

Cheers,


Jeremy
