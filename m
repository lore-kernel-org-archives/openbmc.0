Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVzbc585yzDqfw
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 12:10:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMJrtrim"; 
 dkim-atps=neutral
Received: by mail-lf0-x241.google.com with SMTP id 65so5710724lfa.0
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 19:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0owVvJ3TUSg99LMRrh/cLWCrSfWW9pXs6zHdRStg180=;
 b=FMJrtrimka4jf46tvSYhelUlPLt3vrf3BUBy8XFuZd9/SLkAE5cDacOhc5jSQlYfxS
 x1vTDLN7mwcJpwj4HoCAunEgkQfGTJ405jC1bDwu7inKVNqa7FPr80qcZIWB/xvfW6/O
 p85+xz0879m0gvMUcqFE7xgy11QdmOtcjIAaNkP/g4863Gg0qRdQEM9tc1RipDUtG1e8
 fRcSevPIX6WsKZY6tn+8/qK8SEfNEzSCMAcP157icwQeKHu+CB/dhHH4oATIZf2FD2rL
 9I3mZjL4hgcjX7rw3r2e2ZfMKQOWJd6PVSPHkvoVlpq5UIWS7M5cBvEuTlBdZMqSWfju
 7Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0owVvJ3TUSg99LMRrh/cLWCrSfWW9pXs6zHdRStg180=;
 b=M3nZesyt/I/Cpaip+vWd9eh1SD0uoLkB4i2XvG2JTDQif12H1shWGXG4vDBx0P3Rfb
 ggC8ktzCsGaiUwmuQl/gOYCTxUwdEdP+jPoEn78L94D4yQoemqvb55IyfwUuqRSpLxWN
 BZOtLDXxSyAzmrXYym4qCVwIDyM1w3jMJu6P2BksbJi/rVY5TN1AZeYIT5/AktHpLF3K
 RUfF8kYBu3iG44dfqJhhfr3nl3K1foSa+XNtPgluQ9645PaAVEoV4BTZvX7YtwSmnHhr
 /4cYuvdX3NotvQ+/Y5+ayV7Shu6TNiZPvZwN8g96g/QPWcUmq64ga2G+Q5qoAQcMaaNS
 WYng==
X-Gm-Message-State: AHYfb5hAU1Kc/4hZe7AbT2HxCsjRtSL+ymIuOCps3KLiAKI289wXzYTF
 5tEHwKsx87kTwpKJDz7uLxRcPnpdaw==
X-Received: by 10.46.69.87 with SMTP id s84mr8399632lja.129.1502676632948;
 Sun, 13 Aug 2017 19:10:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Sun, 13 Aug 2017 19:10:12 -0700 (PDT)
In-Reply-To: <20170814012952.13740-2-sam@mendozajonas.com>
References: <20170814012952.13740-1-sam@mendozajonas.com>
 <20170814012952.13740-2-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2017 11:40:12 +0930
X-Google-Sender-Auth: dtYlYATfYg4oNIYP46zZ9bCjuK0
Message-ID: <CACPK8Xcs+jp39QPVVwebdo6SHwSw=wNSj49c_9PYnYFSWLrphg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net/ncsi: Fix several packet definitions
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, 
 Ratan K Gupta <ratagupt@in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Aug 2017 02:10:37 -0000

On Mon, Aug 14, 2017 at 10:59 AM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:

I asked Sam if these should be backported to stable and he said:

> These are straight up bugs except... without my changes we never call
> this code. As Ben says as time provides a lot of the current definitions
> need to be gone over, there's a few command/response code paths that are
> never triggered and could be broken in similar ways.

So we're okay here.

> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
> v2: Rebased on latest net-next
>
>  net/ncsi/ncsi-cmd.c | 10 +++++-----
>  net/ncsi/ncsi-pkt.h |  2 +-
>  net/ncsi/ncsi-rsp.c |  3 ++-
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index 5e03ed190e18..7567ca63aae2 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -139,9 +139,9 @@ static int ncsi_cmd_handler_svf(struct sk_buff *skb,
>         struct ncsi_cmd_svf_pkt *cmd;
>
>         cmd = skb_put_zero(skb, sizeof(*cmd));
> -       cmd->vlan = htons(nca->words[0]);
> -       cmd->index = nca->bytes[2];
> -       cmd->enable = nca->bytes[3];
> +       cmd->vlan = htons(nca->words[1]);
> +       cmd->index = nca->bytes[6];
> +       cmd->enable = nca->bytes[7];
>         ncsi_cmd_build_header(&cmd->cmd.common, nca);
>
>         return 0;
> @@ -153,7 +153,7 @@ static int ncsi_cmd_handler_ev(struct sk_buff *skb,
>         struct ncsi_cmd_ev_pkt *cmd;
>
>         cmd = skb_put_zero(skb, sizeof(*cmd));
> -       cmd->mode = nca->bytes[0];
> +       cmd->mode = nca->bytes[3];
>         ncsi_cmd_build_header(&cmd->cmd.common, nca);
>
>         return 0;
> @@ -228,7 +228,7 @@ static struct ncsi_cmd_handler {
>         { NCSI_PKT_CMD_AE,     8, ncsi_cmd_handler_ae      },
>         { NCSI_PKT_CMD_SL,     8, ncsi_cmd_handler_sl      },
>         { NCSI_PKT_CMD_GLS,    0, ncsi_cmd_handler_default },
> -       { NCSI_PKT_CMD_SVF,    4, ncsi_cmd_handler_svf     },
> +       { NCSI_PKT_CMD_SVF,    8, ncsi_cmd_handler_svf     },
>         { NCSI_PKT_CMD_EV,     4, ncsi_cmd_handler_ev      },
>         { NCSI_PKT_CMD_DV,     0, ncsi_cmd_handler_default },
>         { NCSI_PKT_CMD_SMA,    8, ncsi_cmd_handler_sma     },
> diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> index 3ea49ed0a935..91b4b66438df 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -104,7 +104,7 @@ struct ncsi_cmd_svf_pkt {
>         unsigned char           index;     /* VLAN table index  */
>         unsigned char           enable;    /* Enable or disable */
>         __be32                  checksum;  /* Checksum          */
> -       unsigned char           pad[14];
> +       unsigned char           pad[18];
>  };
>
>  /* Enable VLAN */
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 087db775b3dc..c1a191d790e2 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -354,7 +354,8 @@ static int ncsi_rsp_handler_svf(struct ncsi_request *nr)
>
>         /* Add or remove the VLAN filter */
>         if (!(cmd->enable & 0x1)) {
> -               ret = ncsi_remove_filter(nc, NCSI_FILTER_VLAN, cmd->index);
> +               /* HW indexes from 1 */
> +               ret = ncsi_remove_filter(nc, NCSI_FILTER_VLAN, cmd->index - 1);
>         } else {
>                 vlan = ntohs(cmd->vlan);
>                 ret = ncsi_add_filter(nc, NCSI_FILTER_VLAN, &vlan);
> --
> 2.14.0
>
