Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSfHp0V2QzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:03:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MtzowHmg"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id l82so5606431ywc.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 00:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8vkPZ5FpIWXcCT/05UE6+adRIEcTP6kh+v2p2OA6CMw=;
 b=MtzowHmgfcNe8QL5z8rySWo7SCc+FeW3EsfZirvAU6aP7cMNCgsKCBu4ytJ1Rcnbfl
 P1dakmMsLvRirukZc2wOjLHJIgWgSFqNb3ZDzk71uyZX7jJWgI9TcfFXwiZIsk2hh3xg
 H7YzF3Ik6jSU9gZmjqwmrwOHkZMB66t1MCzuaYIm6hBMz+QA5bNJF1Fk5f1NEkfw4Gom
 cgzGAds//FdbJ6mjXdnNIP4qWfAgmuyJ9SNoVRk9xOE4QUVQZKbrzU31hYGqUh5Gi/ZA
 +iisMp5WnvLD/5v34gnnU/7o3BgQ+yP0lqJbfJ0ttmT89WhQJnZuWFUFpti6d3fI425d
 Lxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8vkPZ5FpIWXcCT/05UE6+adRIEcTP6kh+v2p2OA6CMw=;
 b=YEcZcB9zgRFNz+cCAO8PXGwRnnbb9ZLS5Oxfwz57vvcoWMHQ3gMTYA92Xf0SCCO3Gr
 B+pMmTbQXNuZO421QwNyshwHpzSGhYkzLPDy+HzpkT9ax9f/OptOk7vwmMGMYUoAo4qu
 o6WEqEboL6ykSG/lqNGamNi47TL0kAiNAy3594DhpQKXqImwP56nN1CDopthn73n7aLj
 T6PyLVPNV8YWbkwVp8PdVrxoNDj0LwnYjkiPLaPOXqm7FBgiUt2boFRubi4ISHqq/a20
 gm6XFMNQqJCHeyzpk1SpfbbLbO4mENjnxVN5mszfec4M4QzrP1/eCek9jPm36IsHmKot
 HwpQ==
X-Gm-Message-State: AHYfb5hNql1oRr0gqpV+/qy/94qEb3PQTNnoMIoI2RZrC5z68zPHMBJy
 Zf+kjJZ8gMRw4w87QB/IxAoIJPhUOQ==
X-Received: by 10.37.17.3 with SMTP id 3mr8320974ybr.252.1502348627548; Thu,
 10 Aug 2017 00:03:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 00:03:27 -0700 (PDT)
In-Reply-To: <20170809085443.13148-3-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-3-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2017 16:33:27 +0930
X-Google-Sender-Auth: sWe_0qR-y4p-YjLrCVgn98DlMSk
Message-ID: <CACPK8Xeoyx6b4-yP-fprhZi0uPgt6UpsFwGcQJUNhtf6pWGkDg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] net/ncsi: Fix several packet definitions
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
X-List-Received-Date: Thu, 10 Aug 2017 07:03:50 -0000

On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  net/ncsi/ncsi-cmd.c | 10 +++++-----
>  net/ncsi/ncsi-pkt.h |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index db7083bfd476..1fec9fda7f60 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -146,9 +146,9 @@ static int ncsi_cmd_handler_svf(struct sk_buff *skb,
>
>         cmd = (struct ncsi_cmd_svf_pkt *)skb_put(skb, sizeof(*cmd));
>         memset(cmd, 0, sizeof(*cmd));
> -       cmd->vlan = htons(nca->words[0]);
> -       cmd->index = nca->bytes[2];
> -       cmd->enable = nca->bytes[3];
> +       cmd->vlan = htons(nca->words[1]);
> +       cmd->index = nca->bytes[6];
> +       cmd->enable = nca->bytes[7];

These look like straight up bugs. Should we send them off as fixes?

>         ncsi_cmd_build_header(&cmd->cmd.common, nca);
>
>         return 0;
> @@ -161,7 +161,7 @@ static int ncsi_cmd_handler_ev(struct sk_buff *skb,
>
>         cmd = (struct ncsi_cmd_ev_pkt *)skb_put(skb, sizeof(*cmd));
>         memset(cmd, 0, sizeof(*cmd));
> -       cmd->mode = nca->bytes[0];
> +       cmd->mode = nca->bytes[3];
>         ncsi_cmd_build_header(&cmd->cmd.common, nca);
>
>         return 0;
> @@ -240,7 +240,7 @@ static struct ncsi_cmd_handler {
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
> --
> 2.13.3
>
