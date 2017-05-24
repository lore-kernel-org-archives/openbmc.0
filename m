Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXj2115xdzDqLM
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 16:20:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQaoDtAR"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id l14so4246133ybl.1
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 23:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zJPuCJ285/2ADP6ytcscTYoyey9dwiEVsciS7Dcd2e4=;
 b=OQaoDtARHKxCkBRxfEHXAFTwNS77YA7zlJzVppmubGxbBprbG7G5+YLJx+uIJeflda
 NdjfVI5pLKX6EL3Cl0XDTRrBOsZoAXUAmWC/uuR3CUpD9wnkAfjfdpcSKbijojIBRVFE
 BdtjPbzi8T7HW9MigsGzs1v+z6uH8rSsWoER9Mk70rtIikpdUBAI3bb+8B5ScC9MrxMP
 PfCBBbOoivqpH76/V1O2TqlyMis0v+akoJLQZRfzNFQ/YlxJ8b15xtTpRvpDU9zmB2se
 LrZ8wLo+4MWHuD1nsPxXrz7tdZ0EqUIJTfZrxw0FDjk1lHORvea63jjSS39sk+poTBKC
 3k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zJPuCJ285/2ADP6ytcscTYoyey9dwiEVsciS7Dcd2e4=;
 b=O7f2AJk+w4C+YmuJhFmku+2R4Xooj+EQ/Jz9cetOzODC9MEaoJczZETx1l3psLOJsA
 GBGlax5cxPIu7fIiOvgKcepm5az2VTxdMrrPg+Gg1JPYI32Hgqhu6qMkYa5ocC/DFwte
 dBrAsoambnZjyIoM2EMNXaOpxAv4wXyH0Rpl85O3d7GF8+MVXhtO6Td1ca2o7SLUO33/
 AIUyF/3ZPJl8MxLGU8z0Z17lo6mJz5O+HCm/YZn8zfERsw/fR4pNLk3Ong23OmhAR47g
 2K+vLNpNwH8IkHASXc34IYsWvGZdwXHU+ItwCFaAkvWHO/8vvTUkGBSFOpsNOcrPqjS1
 elIA==
X-Gm-Message-State: AODbwcBVLq+i+2ii62rQtyCSYQ4UqWBJPl5DSAKo1Hy6I7Y6IrQjEZ6A
 4RfqT2AuP2goKy8pm/FsAOfHuxXBGg==
X-Received: by 10.37.108.212 with SMTP id h203mr26521340ybc.77.1495606838620; 
 Tue, 23 May 2017 23:20:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 23 May 2017 23:20:18 -0700 (PDT)
In-Reply-To: <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
References: <20170519173412.68053-1-cbostic@linux.vnet.ibm.com>
 <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
 <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 May 2017 16:20:18 +1000
X-Google-Sender-Auth: SEmnlcTcvHkKdvo54xCrU_nSLEs
Message-ID: <CACPK8Xe_5V_c30A+h_5+ZVbZ2YEcfSbF5od-qfQgp+aGggFmJg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add IR35221 instances
 to dev tree
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 24 May 2017 06:20:41 -0000

On Wed, May 24, 2017 at 10:58 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, May 20, 2017 at 3:34 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> Add IR35221 to i2c4 and i2c5 buses.
>
> This is similar to the patch that I sent on the 2nd.
>
> I took your patch as it adds the device at 0x71 which I did not know about.
>

This breaks userspace, as userspace assumes it can access the i2c
devices through /dev/i2c-x.

Do you have a ticket opened for fixing userspace?

Cheers,

Joel
