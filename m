Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t91QC4HvrzDvRG
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 10:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=n27E1k0a; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id 128so9436134oih.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I1Ld8MjomB9MkZ6lb3GsDvK4jYOv1W412AzWNPv0o8o=;
 b=n27E1k0a9IS9IC63bqndzxXBMkkQoGTgJ9yghwn+B+rqmr0KPo4ItsF2T2nS0U2VCs
 yJMdPfyf9+FIxQ+QqbDw+ZIc3OTt4G1oNpjqstZb8PP/RCNw4sVpprGgeILJJB8fHwog
 3ew7HcSnpp0xoHiEQV7f6FVnQOWUnDjKeBPqQ3Rb2vWXB5Cr+ktmk0DfRoUS8OEe03Pf
 cQcLJxFsmKP5N/TnVg6RiH4HNp9m/c482LTbmFEUIYGNTV+etUntSm0jayV5PtvpCfzy
 A23LCesr3nXr022/U2C2bdOpWJTs3Om2d3fxJycOC/SbHtGlUCbTj/lxkc1qsOM7QQJ2
 o9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=I1Ld8MjomB9MkZ6lb3GsDvK4jYOv1W412AzWNPv0o8o=;
 b=NxMOrJtMJCyMbwIC8uLrOGfk7GvtHZcTCNLrQpvWAC0uVLCE/NPeALy+gkiYyqPGZs
 gDgJCm3CbzvR7bpUWnrjnymdw+lYOkfbBGjQw/pRaSmT5NsHx6RYOBOtMeD66K9vaqIz
 Xj9k0+CFUPuhRL1fTngq4c07dDMA+c0ePyfUkwUDbKa9hieaPZBhsSev6Drn08LgcYRc
 FyzVn1n0vsxNxvQc3Pu1C4Y1avG4kV5P3TuD55Ge7irNuDykbpfem59s763SvW+56B23
 QcMpa7rIcZk+a61BlI5ktXxUc5682aidAGaeXt50gGMeHY/vUx5RmUmLsAkyIZ6i4trb
 PTZg==
X-Gm-Message-State: ABUngvdOqBUXrICFQLCYhUZj4kC2pEtiwqRFzWSJWHrJYnYc2U255C4ySdUQDIiDYOk5uqBXlsD8c/4Itzc1FA==
X-Received: by 10.202.114.129 with SMTP id p123mr11120842oic.132.1478215761928; 
 Thu, 03 Nov 2016 16:29:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 16:29:01 -0700 (PDT)
In-Reply-To: <1478088626.27396.4.camel@aj.id.au>
References: <20161102055557.24349-1-joel@jms.id.au>
 <1478088626.27396.4.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 09:59:01 +1030
X-Google-Sender-Auth: hcUy7kHiYfq1MsOS2OfDqyp4seM
Message-ID: <CACPK8XeK3AwwVAdjEbgLjAkCj=3SsTTR+Ogd9QRmfw=B8X7XMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: aspeed: Add Romulus BMC-specific early setup
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 23:29:24 -0000

On Wed, Nov 2, 2016 at 10:40 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2016-11-02 at 16:25 +1030, Joel Stanley wrote:
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thank you.

Applied to dev-4.7.

Cheers,

Joel
