Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy8My0w93zDt8w
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 18:04:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sy8Mx4z7Kz9s8x;
 Mon, 17 Oct 2016 18:04:45 +1100 (AEDT)
Subject: Re: [PATCH linux v4 17/20] drivers/fsi: Set slave SMODE to init
 communications
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-18-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <d1b72625-09be-269a-754f-3fe87856523d@ozlabs.org>
Date: Mon, 17 Oct 2016 15:04:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476483282-85971-18-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 07:04:46 -0000

Hi Chris,

> @@ -301,15 +376,26 @@ static int fsi_master_link_enable(struct fsi_master *master, int link)
>  static int fsi_master_break(struct fsi_master *master, int link)
>  {
>  	int rc;
> +	uint32_t smode;
>  
>  	if (!master->send_break)
>  		return -EINVAL;
>  
> -	rc =  master->send_break(master, link);
> -	if (rc)
> +	rc = master->send_break(master, link);
> +	if (rc) {
>  		dev_info(master->dev, "break failed with:%d\n", rc);
> +		return rc;
> +	}
> +	/* Verify can read slave at default ID location */
> +	rc = master->read(master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
> +			&smode, sizeof(smode));
>  
> -	return rc;
> +	/* If read fails then nothing on other end of link */
> +	if (rc)
> +		return -ENODEV;
> +
> +	dev_dbg(master->dev, "smode at ID 3 after break:%08x\n", smode);
> +	return 0;
>  }

Should this smode read logic be in fsi_master_break() at all?

I'd be inclined to keep the slave detection separate. If it's necessary
to check for slave presence, we can do that in the caller.

Cheers,


Jeremy
