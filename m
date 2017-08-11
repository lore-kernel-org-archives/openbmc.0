Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT55r323CzDr1s
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 10:11:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f/H90W5U"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id t139so1389142ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ESG6StA8pahvGB2o8lssM+rLgPcnDQUdaHVE7acWw6Y=;
 b=f/H90W5UJpYW+c9HA/KHEZ1N6fNiB8felx22eLFVDhaTJtQ8tLrMCWat5dS4PN+1Wb
 N8CHIc14oo98MTPfv2UaRbpW+M77Q+aJC6t8w1E9CR98MU0TXr88CE8IFfspKsv2IiTH
 t9y5jJHjTWYzfRj3o4ckw6yHub+sWOwojQn12WpOJOX2BuQhh77BsR0fhQBhFm9RLVtI
 P2lwBIiAnjzV8tt3ls2Yy4YVU7l+cKmW2oRVwtwkoadGe4Sa10S5WWg18ALjRvU/WgN+
 ymVrhzHnEffCKL5NIQ7I5duKngpY5VX/+yYEeCvdp7zyYJbtDYXtiTUCAbxX42Wxa4ls
 QsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ESG6StA8pahvGB2o8lssM+rLgPcnDQUdaHVE7acWw6Y=;
 b=nkDNZtyHKmqfsW8dlYd6745GQlDc9F95HSZsC7pwVvU/PosoAKQ6vA83tjIR4vClJ7
 N46JYMVjISif4mjvzaJM6zuFT5Djzt2l8CQgDLpw9zH6CF1sZgjAbYw6QObu6hwTTNo1
 YTwMfwOJyAxgjMr9XM2xi+nCvEUeh49vWBzvpmiRKYamVUurneuMYp19NZjIksF3QfQb
 z8FdMDtHzxK9OjXC9yMbXAXgTOdHj7LKYQ6XYgJvzOR9foxr58hk2iUOFDcmFiESb242
 DSVA1dj2oZsLF47KMmnq9lxJ9HQUgcG9TRLNCzxGXm/mrQINkDwQdX41fGYBkzAEQ9HL
 ZYSQ==
X-Gm-Message-State: AHYfb5iBUhJ4lXcCfkJD5VpI1xkEP91SgYk9OQM14lZZqdYP092IbTEe
 CMBS/wPdj6pk4jVyP1DU/AXo0GQrQP07IYU=
X-Received: by 10.37.54.5 with SMTP id d5mr11376566yba.270.1502410302504; Thu,
 10 Aug 2017 17:11:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 17:11:21 -0700 (PDT)
In-Reply-To: <1502404753.9340.1.camel@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-3-sam@mendozajonas.com>
 <CACPK8Xeoyx6b4-yP-fprhZi0uPgt6UpsFwGcQJUNhtf6pWGkDg@mail.gmail.com>
 <1502404753.9340.1.camel@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Aug 2017 09:41:21 +0930
X-Google-Sender-Auth: tDd6q23DtKeLJu9tOuG60dIDXTQ
Message-ID: <CACPK8XdqSV0-9kwtNuao+YTs=cuOOe92E4kx0Fe0PBh+bvvJYg@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 00:11:45 -0000

On Fri, Aug 11, 2017 at 8:09 AM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> On Thu, 2017-08-10 at 16:33 +0930, Joel Stanley wrote:
>> On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
>> <sam@mendozajonas.com> wrote:
>> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
>> > ---
>> >  net/ncsi/ncsi-cmd.c | 10 +++++-----
>> >  net/ncsi/ncsi-pkt.h |  2 +-
>> >  2 files changed, 6 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
>> > index db7083bfd476..1fec9fda7f60 100644
>> > --- a/net/ncsi/ncsi-cmd.c
>> > +++ b/net/ncsi/ncsi-cmd.c
>> > @@ -146,9 +146,9 @@ static int ncsi_cmd_handler_svf(struct sk_buff *skb,
>> >
>> >         cmd = (struct ncsi_cmd_svf_pkt *)skb_put(skb, sizeof(*cmd));
>> >         memset(cmd, 0, sizeof(*cmd));
>> > -       cmd->vlan = htons(nca->words[0]);
>> > -       cmd->index = nca->bytes[2];
>> > -       cmd->enable = nca->bytes[3];
>> > +       cmd->vlan = htons(nca->words[1]);
>> > +       cmd->index = nca->bytes[6];
>> > +       cmd->enable = nca->bytes[7];
>>
>> These look like straight up bugs. Should we send them off as fixes?
>
> These are straight up bugs except... without my changes we never call
> this code. As Ben says as time provides a lot of the current definitions
> need to be gone over, there's a few command/response code paths that are
> never triggered and could be broken in similar ways.

Okay. So we can do the cleanup once the vlan fire has been put out?

Makes sense to me. Unless we start hitting strange bugs, in which case
the cleanup might expose other issues.

Cheers,

Joel
