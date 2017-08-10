Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSm9C1wVWzDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 21:28:30 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v7ABSEe2008491;
 Thu, 10 Aug 2017 06:28:16 -0500
Message-ID: <1502364495.2563.58.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 2/3] net/ncsi: Fix several packet definitions
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ravindra S Rao1
 <ravindra.s@in.ibm.com>, Ratan K Gupta <ratagupt@in.ibm.com>
Date: Thu, 10 Aug 2017 21:28:15 +1000
In-Reply-To: <CACPK8Xeoyx6b4-yP-fprhZi0uPgt6UpsFwGcQJUNhtf6pWGkDg@mail.gmail.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-3-sam@mendozajonas.com>
 <CACPK8Xeoyx6b4-yP-fprhZi0uPgt6UpsFwGcQJUNhtf6pWGkDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
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
X-List-Received-Date: Thu, 10 Aug 2017 11:28:32 -0000

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

This shows how completely wrong that whole "magic byte/words array
argumetns" thing is, especially when there *is* a proper struct
definitions for the packets :-( We definitely need that fixed too asap.

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
