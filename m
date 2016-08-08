Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s76HD6TXHzDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 16:01:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WZaGv35M; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 109so3965096uat.2
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 23:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8bF0oaLH3pyqer7Pj9ZG58q2Ds/spKN2MRQIxwPvdqc=;
 b=WZaGv35MQs/pP8Fau+KfRPDP83lqPOevt2Dz//PxxUT+PwArNR+ydnofXtHdp7Cqp7
 DVi5tnLu2Td9Q79lfZfLhIeohxzARGlx06eq5JO45MQGGJaVWUvgXAYe+9iMIFxQeXrm
 6EyyXVRAiu+fuyh6j1UIfHXyDj2a3sray3p/mmgEMmW1HbOIam/sA+IO7HzlOKvaY4B9
 ijlnSquqqUl1zv6NuZCczITi7hU3Lv49EkQ3Mhzo+SPtLWmlQ2aPynPyUSLHC1rr/Q5H
 17vBwQxaOyh/hXDYbKQMtGNxBaZ46s5Vuujlm0RiXdljc1VdtVjKPytvbUnMXP+wd5qL
 VeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8bF0oaLH3pyqer7Pj9ZG58q2Ds/spKN2MRQIxwPvdqc=;
 b=Gt6RRSnm+rstt3tmBtkP4YOPqXsTuW9/qRAMPkRbpLoGIYnXSsLUAUoBKX42h8J+O0
 J6K9r9OHAeY5ZX9L0X3BbQoZl1153p4nXSuDompJWzzxuZk+IzcN6B+bM/rOtVFflZTr
 QJ/MWAuoV6Ji8w7Ob+4BOSye36uSjQFfQb/rfeg5206sm8mCz+PU9KxpD5s31Cw62Dak
 lYTj9ypf0Ps/UDuM4rLfG5Vobr6j3N3fQLz7+AvFSRwO4Njy5lbqcXAaveQeQNfj06zJ
 9hx7iDZzcYep+hHTCkme0fp8ZkxNbtjCoN+Bi/IzYya+Zp+lq5rXwq0EwUzA+b9Zj+MV
 LfHg==
X-Gm-Message-State: AEkoous2QWKissxuDm82aQgeZ6kEQGJTuygPQBzMagjqdIGl+IvRb35iMvZaudApEnl4C38U5zvoeWeg+WagQw==
X-Received: by 10.31.141.21 with SMTP id p21mr47944460vkd.152.1470636086459;
 Sun, 07 Aug 2016 23:01:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 7 Aug 2016 23:01:05 -0700 (PDT)
In-Reply-To: <1470271669-20662-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1470271669-20662-1-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 15:31:05 +0930
X-Google-Sender-Auth: 0kPHYHC-AdSdosSPLiJwlE6Cq-4
Message-ID: <CACPK8XdyR5S-dgC+2xe2Eo6suz19EphXU6CS_gEQ3G2q-1r3fw@mail.gmail.com>
Subject: Re: [PATCH dev-4.4] net/ncsi: Enable request timer before sending
 command
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 08 Aug 2016 06:01:29 -0000

On Thu, Aug 4, 2016 at 10:17 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> The response is received upon the sent command before the request's
> timer is enabled under extreme situation. The response packet won't
> be processed as the corresponding request (request packet and timer)
> isn't complete. It leads to NCSI failure - no package detected.
>
> This fixes the issue by enabling the timer before sending the command.
> The comments about the timer has been replaced by that in upstream
> kernel.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Thanks Gavin. This has been applied to dev-4.4 and pushed out as
openbmc-4.4-20160804-1.

I have pulled in your upstream ncsi patches to dev-4.7, so I don't
need to apply this there.

Cheers,

Joel

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
>                 eh->h_source[i] = 0xff;
>         }
>
> +        /* Start the timer for the request that might not have
> +         * corresponding response. Given NCSI is an internal
> +         * connection a 1 second delay should be sufficient.
> +         */
> +       mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
> +       nr->nr_timer_enabled = true;
> +
>         /* Send NCSI packet */
>         skb_get(nr->nr_cmd);
>         ret = dev_queue_xmit(nr->nr_cmd);
>         if (ret)
>                 goto out;
>
> -       /* Start the timer for the request that might not have
> -        * corresponding response. I'm not sure 1 second delay
> -        * here is enough. Anyway, NCSI is internal network, so
> -        * the responsiveness should be as fast as enough.
> -        */
> -       nr->nr_timer_enabled = true;
> -       mod_timer(&nr->nr_timer, jiffies + 1 * HZ);
> -
>         return 0;
>  out:
>         ncsi_free_req(nr, false, false);
> --
> 2.1.0
>
