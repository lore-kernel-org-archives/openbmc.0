Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x235.google.com (mail-yw0-x235.google.com
 [IPv6:2607:f8b0:4002:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGdd91pdczDqpt
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 09:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ubBcwvU9"; 
 dkim-atps=neutral
Received: by mail-yw0-x235.google.com with SMTP id x125so59112876ywa.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 16:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=o7/A6EOirfFg3VVXoKGO7GvDjXQ+OvIma0jd7P1763c=;
 b=ubBcwvU9X9tvXSvcAQsRxGIzDtJvOZpZEL1LLLXlBjqs7cKqmC49fc9gw0lv0C3N4I
 Exvuvq838EYoyAYo9J7b9nkE/BXEYToAq5DAVdRkHtrsMl5ZvA8VtbFZW1luTPGm8Hyh
 gMsWRDo1GKOBCdrS7GRULINtmyyfW8uFKN95hlXWJD/sPld2G8x89bBCYwfl19zWpXxk
 RCdiazGZy+D24E3h26YD11epRU9kKuxnUEtf5IXb2yxqLS6JpcAp8odPVGQOXTytpKGU
 4wd/WOGpngTKm1yKHvDwgjXQkNFFkVJsMDi/jvV+cpG0OdD1Nzs+vygYupYMNgut0jTr
 iGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=o7/A6EOirfFg3VVXoKGO7GvDjXQ+OvIma0jd7P1763c=;
 b=g30Y5gSokSc9Rcuw4dhkohge8YwRT0uHQFemSlGLbgDxY2UJ+U68tnHL/j8h89IMfs
 4NZy8Vo0oQDIBVRVftD0FyurRQlyu8aUVCmIM7XBthRRWZG6K3ADn1hH0lcM9R5Trk3W
 0ys1DWP9Nvf+8jKg2Ny7F0vaZGa2SsM6gFI2t/LFHB4kXbjfRmVpf441p4XYJv54Hnwx
 NwPrSTKvn9+GwM2K0Mw7i9CckMFiOFvYnSURVGl3AeB/9S3TOyyDFDTyw5YUnrjFsg0t
 0YUfggFOHu2gu25KXXu1FUlwXCh1GUq/dIslQlAua7JUp38WQA49Mo17ljP7ybBrCA7O
 9AQA==
X-Gm-Message-State: AIVw110D/Pturlu5z5f8ithBuvM8e9BszWlcwy6n3Mqrpq8Gq2cc85Lh
 GTQmUWUyQuo74JjFSsAlI8O3sRxr3A==
X-Received: by 10.37.124.65 with SMTP id x62mr15201907ybc.41.1500940745866;
 Mon, 24 Jul 2017 16:59:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Mon, 24 Jul 2017 16:58:45 -0700 (PDT)
In-Reply-To: <OF84667D4E.6E526AD9-ON00258167.005AB6A0-00258167.005BACA5@notes.na.collabserv.com>
References: <OF84667D4E.6E526AD9-ON00258167.005AB6A0-00258167.005BACA5@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jul 2017 09:28:45 +0930
X-Google-Sender-Auth: Vs-mTL1rjRbM9zZ7pzvGw3qao4A
Message-ID: <CACPK8XeciDGtnTZzw-gfkjJAk311HkDGZZGttZ8MXiBotE8p1g@mail.gmail.com>
Subject: Re: VLAN support on OpenBMC
To: Ratan K Gupta <ratagupt@in.ibm.com>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 24 Jul 2017 23:59:09 -0000

On Tue, Jul 25, 2017 at 2:11 AM, Ratan K Gupta <ratagupt@in.ibm.com> wrote:
> Hi Gavin,

I think you were looking for Gavin Shan, not Shaun Gavin. I added the
correct Gavin to cc.

>
> OpenBMC has requirement to support the VLAN,After doing the necessary VLAN
> configurations we observed that the openbmc/ncsi chip is not sending the
> tagged packet out.
>
> On the other side,if I ping the openbmc machine from some other linux
> machine
> then tagged packet doesn't reach to openbmc machine.
>
> In order to simplify the testing setup,We made a direct connection with some
> linux machine to openbmc.
>
> Scenario 1: Ping test from test/linux machine to the openbmc machine.
> ========
> Observation:- We captured the packet on the test machine which shows that
> packet
> were going out from the test machine and it was having 8021.q tag
> but it was not reaching to openbmc machine.
>
> Scenario 2: Ping test from openbmc machine to test/linux machine
> ========
> Observation:- Captured packet shows that packet were going out
> from the openbmc machine and it was having 8021.q tag but it was
> not reaching to test machine.
>
> Note:- We made sure that packet were going out from the VLAN interface.
>
> Is it related to the NCSI driver? Do we have NCSI driver support on openbmc
> to create the
> VLAN.

Gavin's reply on another thread:

> Currently, NCSI stack doesn't support VLAN. It needs some code to
> support and we need someone to work on it.
>
> There has code supporting VLAN filters. With it, the NCSI channel is
> associated with one or multiple VLANs. However, we need add code in
> ftgmac100.c to support VLAN based ethernet devices.

Cheers,

Joel
