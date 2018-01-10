Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGlPp2j1HzF0nV
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2018 21:20:14 +1100 (AEDT)
Received: from localhost (unknown [37.170.134.120])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id A93CAE72;
 Wed, 10 Jan 2018 10:20:11 +0000 (UTC)
Date: Wed, 10 Jan 2018 11:20:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
Message-ID: <20180110102011.GC5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 10:20:14 -0000

On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
> +#pragma pack(push, 1)
> +struct peci_xfer_msg {
> +	unsigned char client_addr;
> +	unsigned char tx_len;
> +	unsigned char rx_len;
> +	unsigned char tx_buf[MAX_BUFFER_SIZE];
> +	unsigned char rx_buf[MAX_BUFFER_SIZE];
> +};
> +#pragma pack(pop)

For any structure that crosses the user/kernel boundry, you _HAVE_ to
use the "__" variant.  So for here you would use __u8 instead of
"unsigned char" in order for things to work properly.

I'm guessing you didn't test this all out on a mixed 32/64 bit system?

Please fix up and test to ensure that it all works properly before
resubmitting.

thanks,

greg k-h
