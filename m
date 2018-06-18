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
 by lists.ozlabs.org (Postfix) with ESMTPS id 418J774bs0zDrcd
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 14:30:43 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5I4UVkg010941;
 Sun, 17 Jun 2018 23:30:33 -0500
Message-ID: <7d009e56255e21341b750b0c72c248f9eb24f07b.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/5] fsi-occ: Fix size_t printf
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Eddie James
 <eajames@linux.vnet.ibm.com>
Date: Mon, 18 Jun 2018 14:30:31 +1000
In-Reply-To: <20180618034335.9732-2-joel@jms.id.au>
References: <20180618034335.9732-1-joel@jms.id.au>
 <20180618034335.9732-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 18 Jun 2018 04:30:44 -0000

On Mon, 2018-06-18 at 13:13 +0930, Joel Stanley wrote:
>    drivers/fsi/fsi-occ.c:414:16: warning: format '%d' expects argument
>    of type 'int', but argument 4 has type 'size_t {aka long unsigned
>    int}' [-Wformat=]
>       dev_dbg(dev, "Bad resplen %d\n", *resp_len);
>                    ^                   ~~

Thanks, I've already pushed an equivalent fix in my branch, I'll let
Eddie pick it up for the next upstream submission.

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/fsi-occ.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index e4ebda646453..f02f72d379d0 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -411,7 +411,7 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
>  	if (!occ)
>  		return -ENODEV;
>  	if (*resp_len < 7) {
> -		dev_dbg(dev, "Bad resplen %d\n", *resp_len);
> +		dev_dbg(dev, "Bad resplen %zd\n", *resp_len);
>  		return -EINVAL;
>  	}
>  
