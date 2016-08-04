Return-Path: <clg@kaod.org>
X-Greylist: delayed 600 seconds by postgrey-1.35 at bilbo;
 Thu, 04 Aug 2016 18:30:16 AEST
Received: from 6.mo69.mail-out.ovh.net (6.mo69.mail-out.ovh.net
 [46.105.50.107])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4jmm3ddPzDqQ1
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 18:30:16 +1000 (AEST)
Received: from player696.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id BD891FFA5D7
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 10:13:42 +0200 (CEST)
Received: from [192.168.122.197] (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id 60E2B3C0067;
 Thu,  4 Aug 2016 10:13:41 +0200 (CEST)
Subject: Re: [PATCH dev-4.4] net/ncsi: Enable request timer before sending
 command
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1470271669-20662-1-git-send-email-gwshan@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6d9203fd-7c1a-34f5-af87-7a5f698a1954@kaod.org>
Date: Thu, 4 Aug 2016 10:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470271669-20662-1-git-send-email-gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17957540565414218498
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrkedugddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2016 08:30:16 -0000

On 08/04/2016 02:47 AM, Gavin Shan wrote:
> The response is received upon the sent command before the request's
> timer is enabled under extreme situation. The response packet won't
> be processed as the corresponding request (request packet and timer)
> isn't complete. It leads to NCSI failure - no package detected.

you can reproduce under openbmc/qemu using a slirp backend :

	-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu


> This fixes the issue by enabling the timer before sending the command.
> The comments about the timer has been replaced by that in upstream
> kernel.

Thanks !

C. 

> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
> The issue exists in all branches. 4.7 has the issue at least. I
> suggest applying it to all other branches or 4.7 only.
> ---
>  net/ncsi/ncsi-cmd.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index b8503e1..d634a0e 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -359,20 +359,19 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
>  		eh->h_source[i] = 0xff;
>  	}
>  
> +        /* Start the timer for the request that might not have
> +         * corresponding response. Given NCSI is an internal
> +         * connection a 1 second delay should be sufficient.
> +         */
> +	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
> +	nr->nr_timer_enabled = true;
> +
>  	/* Send NCSI packet */
>  	skb_get(nr->nr_cmd);
>  	ret = dev_queue_xmit(nr->nr_cmd);
>  	if (ret)
>  		goto out;
>  
> -	/* Start the timer for the request that might not have
> -	 * corresponding response. I'm not sure 1 second delay
> -	 * here is enough. Anyway, NCSI is internal network, so
> -	 * the responsiveness should be as fast as enough.
> -	 */
> -	nr->nr_timer_enabled = true;
> -	mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
> -
>  	return 0;
>  out:
>  	ncsi_free_req(nr, false, false);
> 
