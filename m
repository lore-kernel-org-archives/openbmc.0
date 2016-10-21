Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0SzN4NNrzDt62
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 12:40:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GTl2ceTX; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id e203so8922013itc.1
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 18:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=014YZ3jgNM8ctYxt6HR9U17marj+q5snTTYqQS8idUo=;
 b=GTl2ceTXeYxLvKkGZf6rSk8QHChwyqGEOTm6kZalrT6Q0ayLLxL7KopH8UrRLadOKq
 Io2G3JPbvWTxzc52dnpkDkBbqTnE5qxNJN10TVo4iIXwmw0oI1O3RDtjUrDTh3EEfsCK
 5PjuOsMpFtopt7u21VATE9DGsOY+goI+VtF3D+Uch4wXHeY/jcxxZK5tcqj7wjItp5Tq
 8/EWKwMWbEyo48OfnXzpZUTiboU4L7Six4qulK34eVj4WnwL+qpsmFxqr85jl3DbmQ9J
 cVO06VVn+P1+r53YL73jwweRJVF0YCSES/iL1Jq0ONcDis6pHm9JiZIDTXjAemX8dmTO
 I3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=014YZ3jgNM8ctYxt6HR9U17marj+q5snTTYqQS8idUo=;
 b=hEJ+Zh596IwnkOLYMVE+6bXu5VthICA5zUPiwG5vHdgdKfSaIqPDK440WzEQWn9S2R
 dSI6q0Ep41K91v6hlZHzRp7t9L5VoFwespWranoSzveFmdtari+n5Lyz0M+zzNgDlzvO
 SsrzRm/Z2rn7WfqP2l4xoMhAJ+Jil5V2c7+bcByz/Kdp7o+QH3EruQ79xbfScYqRfJLT
 PUfrI5NtI7EN7jJQrPS8MD0ut4w11TF167NbtBLxsQa9hXPgizV3c/sFYBetHtphEBLS
 XCrlUfvDnMKFPev9sHDAK7qW1wRTsEhTJnE7/51K/vZsPZs8DrFapSFEimhNONicDyeu
 W2VQ==
X-Gm-Message-State: AA6/9Rn6rtZIlpwtMDm5Eb893E3CDzc3XDDdaF8ALVNNs34t1mpF6usjfYAP2XKV5jNwP94ctNGAWp0trButwQ==
X-Received: by 10.202.72.151 with SMTP id v145mr8855502oia.125.1477013998312; 
 Thu, 20 Oct 2016 18:39:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 18:39:37 -0700 (PDT)
In-Reply-To: <1477010866-15126-10-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1477010866-15126-10-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 12:09:37 +1030
X-Google-Sender-Auth: gRqQ2elVZ6a7-uwKWVKaQE_M4DU
Message-ID: <CACPK8XdSn5CZQWGs-CFjcM4Hi2MmO5tbQ52AE6deAy5xnZG17A@mail.gmail.com>
Subject: Re: [PATCH 4.4 9/9] net/ncsi: Improve HNCDSC AEN handler
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 21 Oct 2016 01:40:01 -0000

Hi Gavin,

On Fri, Oct 21, 2016 at 11:17 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This improves AEN handler for Host Network Controller Driver Status
> Change (HNCDSC):
>
>    * The channel's lock should be hold when accessing its state.
>    * Do failover when host driver isn't ready.
>    * Configure channel when host driver becomes ready.
>
> NOTE: The first one isn't applied to the code in dev-4.4.

Can you clarify what you mean here?

Cheers,

Joel

>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/ncsi-aen.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
> index 5bc0873..26ac93d 100644
> --- a/net/ncsi/ncsi-aen.c
> +++ b/net/ncsi/ncsi-aen.c
> @@ -142,8 +142,7 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
>         ncm = &nc->nc_modes[NCSI_MODE_LINK];
>         hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
>         ncm->ncm_data[3] = ntohl(hncdsc->status);
> -       if (ndp->ndp_active_channel != nc ||
> -           ncm->ncm_data[3] & 0x1)
> +       if (ndp->ndp_active_channel != nc)
>                 return 0;
>
>         /* If this channel is the active one and the link doesn't
> @@ -151,7 +150,8 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
>          * The logic here is exactly similar to what we do when link
>          * is down on the active channel.
>          */
> -       ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
> +       if (!(ncm->ncm_data[3] & 0x1))
> +               ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
>         ncsi_suspend_dev(nd);
>
>         return 0;
> --
> 2.1.0
>
