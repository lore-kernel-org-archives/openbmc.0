Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT33K19mmzDr3N
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:39:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="nh1nRnKF"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N57ylqUu"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6B3663718;
 Thu, 10 Aug 2017 18:39:18 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Thu, 10 Aug 2017 18:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=YpC1RrJTQjM3lHDoa5gfEhOu+5O2TmtZ41Kk913jPY0=; b=nh1nRnKF
 6p17En1KCHjvPQY6C8Ot8lOpXZ+svNCqaDuWn3FT2MqBBvkcVdPYO+1g+RhE0BL2
 ZkmJDshxCJ9m2twnDByPPpXIna4cfO0JT7AREimHBEL7lyLiTPVe3JoFNiFpdU2V
 yck+9cTuwGd0h0RDe4N83U2+LKFW3oX1rfQF0JAa9kmdqXErDVB7dJMuBcR/Vipu
 sDmGf2I3Y+ZzoNWfM8kuXHA/j/3L9HPGyfijtWdA6G3kVyOhF0yEMpGQClf1a1Oe
 l/RIaffdJ2UwHPANPUWabjDZyPVoPr1xKMS+Yh1oRd6vpkZUX5JQ+lxRtqORFcD0
 lps5lxjcD3jIgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=YpC1RrJTQjM3lHDoa5gfEhOu+5O2TmtZ41Kk913jPY0=; b=N57ylqUu
 p5jWJ4Hf6/1M/CPyvOHVCvb0vE6Xuz5cEpNtWtPZT1ybjWflxZHyyVlyZvFvj7Jc
 hm4hlnRISAkH3oAnTlJrkS3fBNt+WqJdsw97BpyBM8CTaEYBgPgrAlHOnNshbknA
 th/h0o0LoZm5rbhhNQvldN+RWEh3E5dF9YLVqZTSkKNcq3chRtYvz7wIPEC9Gp5w
 xS8rSEOxEtmEvjF6877C+fiEwft5y/tyK7tJGGmXHwnpWpbUCb+Na99VR9iQ94Ik
 Qbm57ZJ5hkV/YtrNGElLp7js5ZEFTYfRWQaGwae9o4zw2CuvLCQIouuOYKmKzNTE
 GjAp/GRXEFf6Zg==
X-ME-Sender: <xms:luCMWXoXkyWEu35qsyilv5Czb_kHFarLcRnF4pnMpu84T_0-9bCDjQ>
X-Sasl-enc: zRe02HZ92Ilr0jdA9ZB5BqhGauHJWA7Fm1Wmuh1BSwIo 1502404757
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 403087F9CE;
 Thu, 10 Aug 2017 18:39:16 -0400 (EDT)
Message-ID: <1502404753.9340.1.camel@mendozajonas.com>
Subject: Re: [RFC PATCH 2/3] net/ncsi: Fix several packet definitions
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ravindra S Rao1
 <ravindra.s@in.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Date: Fri, 11 Aug 2017 08:39:13 +1000
In-Reply-To: <CACPK8Xeoyx6b4-yP-fprhZi0uPgt6UpsFwGcQJUNhtf6pWGkDg@mail.gmail.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-3-sam@mendozajonas.com>
 <CACPK8Xeoyx6b4-yP-fprhZi0uPgt6UpsFwGcQJUNhtf6pWGkDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 10 Aug 2017 22:39:26 -0000

On Thu, 2017-08-10 at 16:33 +0930, Joel Stanley wrote:
> On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> >  net/ncsi/ncsi-cmd.c | 10 +++++-----
> >  net/ncsi/ncsi-pkt.h |  2 +-
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> > index db7083bfd476..1fec9fda7f60 100644
> > --- a/net/ncsi/ncsi-cmd.c
> > +++ b/net/ncsi/ncsi-cmd.c
> > @@ -146,9 +146,9 @@ static int ncsi_cmd_handler_svf(struct sk_buff *skb,
> > 
> >         cmd = (struct ncsi_cmd_svf_pkt *)skb_put(skb, sizeof(*cmd));
> >         memset(cmd, 0, sizeof(*cmd));
> > -       cmd->vlan = htons(nca->words[0]);
> > -       cmd->index = nca->bytes[2];
> > -       cmd->enable = nca->bytes[3];
> > +       cmd->vlan = htons(nca->words[1]);
> > +       cmd->index = nca->bytes[6];
> > +       cmd->enable = nca->bytes[7];
> 
> These look like straight up bugs. Should we send them off as fixes?

These are straight up bugs except... without my changes we never call
this code. As Ben says as time provides a lot of the current definitions
need to be gone over, there's a few command/response code paths that are
never triggered and could be broken in similar ways.

> 
> >         ncsi_cmd_build_header(&cmd->cmd.common, nca);
> > 
> >         return 0;
> > @@ -161,7 +161,7 @@ static int ncsi_cmd_handler_ev(struct sk_buff *skb,
> > 
> >         cmd = (struct ncsi_cmd_ev_pkt *)skb_put(skb, sizeof(*cmd));
> >         memset(cmd, 0, sizeof(*cmd));
> > -       cmd->mode = nca->bytes[0];
> > +       cmd->mode = nca->bytes[3];
> >         ncsi_cmd_build_header(&cmd->cmd.common, nca);
> > 
> >         return 0;
> > @@ -240,7 +240,7 @@ static struct ncsi_cmd_handler {
> >         { NCSI_PKT_CMD_AE,     8, ncsi_cmd_handler_ae      },
> >         { NCSI_PKT_CMD_SL,     8, ncsi_cmd_handler_sl      },
> >         { NCSI_PKT_CMD_GLS,    0, ncsi_cmd_handler_default },
> > -       { NCSI_PKT_CMD_SVF,    4, ncsi_cmd_handler_svf     },
> > +       { NCSI_PKT_CMD_SVF,    8, ncsi_cmd_handler_svf     },
> >         { NCSI_PKT_CMD_EV,     4, ncsi_cmd_handler_ev      },
> >         { NCSI_PKT_CMD_DV,     0, ncsi_cmd_handler_default },
> >         { NCSI_PKT_CMD_SMA,    8, ncsi_cmd_handler_sma     },
> > diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> > index 3ea49ed0a935..91b4b66438df 100644
> > --- a/net/ncsi/ncsi-pkt.h
> > +++ b/net/ncsi/ncsi-pkt.h
> > @@ -104,7 +104,7 @@ struct ncsi_cmd_svf_pkt {
> >         unsigned char           index;     /* VLAN table index  */
> >         unsigned char           enable;    /* Enable or disable */
> >         __be32                  checksum;  /* Checksum          */
> > -       unsigned char           pad[14];
> > +       unsigned char           pad[18];
> >  };
> > 
> >  /* Enable VLAN */
> > --
> > 2.13.3
> > 
