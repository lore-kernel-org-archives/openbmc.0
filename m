Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szqM20pn6zDvQB
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 11:24:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3szqM13Ty1z9s65;
 Thu, 20 Oct 2016 11:24:45 +1100 (AEDT)
Subject: Re: [PATCH linux v5 14/18] drivers/fsi: Set slave SMODE to init
 communications
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-15-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <6fa5dd79-cd67-3662-9224-f5d088b90dc9@ozlabs.org>
Date: Thu, 20 Oct 2016 08:24:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476918586-13475-15-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2016 00:24:46 -0000

Hi Chris,

> Set CFAM to appropriate ID so that the controlling master
> can manage link memory ranges.  Add slave engine register
> definitions.

Looks good, one minor thing:

> @@ -329,6 +400,17 @@ static int fsi_master_scan(struct fsi_master *master)
>  				"Break to link:%d failed with:%d\n", link, rc);
>  			continue;
>  		}
> +		/* Verify can read slave at default ID location. If fails */
> +		/* then there must be nothing on other end of link */

Best to do this in a single comment. However, don't do a v6 just for
this, as it's really insignificant. Only re-roll this patch if there are
other changes required.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
