Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L2xW5kS1zF1Pn
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 11:11:11 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w641B0iZ012630;
 Tue, 3 Jul 2018 20:11:02 -0500
Message-ID: <cdaa71efbb25d96c1d5e0018880bf3554ce243c1.camel@kernel.crashing.org>
Subject: Re: [PATCH] fsi: sbefifo: Add missing mutex_unlock
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Wed, 04 Jul 2018 11:11:00 +1000
In-Reply-To: <1530652889-26497-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1530652889-26497-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 01:11:12 -0000

On Tue, 2018-07-03 at 16:21 -0500, Eddie James wrote:
> There was no unlock of the FFDC mutex.
> 
> Fixes: 9f4a8a2d7f9d ("fsi/sbefifo: Add driver for the SBE FIFO")
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Thanks. 

Cheers,
Ben.

> ---
>  drivers/fsi/fsi-sbefifo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 4f076fd..a34ff99 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -194,6 +194,7 @@ static void sbefifo_dump_ffdc(struct device *dev, const __be32 *ffdc,
>  		}
>  		dev_warn(dev, "+-------------------------------------------+\n");
>  	}
> +	mutex_unlock(&sbefifo_ffdc_mutex);
>  }
>  
>  int sbefifo_parse_status(struct device *dev, u16 cmd, __be32 *response,
