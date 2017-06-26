Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x231.google.com (mail-yw0-x231.google.com
 [IPv6:2607:f8b0:4002:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wwzRD1vKNzDr0c
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 16:19:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UBLSZ82B"; 
 dkim-atps=neutral
Received: by mail-yw0-x231.google.com with SMTP id j11so13252310ywa.2
 for <openbmc@lists.ozlabs.org>; Sun, 25 Jun 2017 23:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DhwpFi6Wh5QuXVUPNz+GmbSe5Ma4WO1UWRJb+pMWWPA=;
 b=UBLSZ82Bqaix0/3zRijNa/T5WcPeT+FAg4e5WEoqemQ4zK4dUqzZaCaaWbVjfJhv5d
 bW3o7yqgKQqOBpS6PLXrp2qoxeKpdRdlEkX0ewi1lezl1bwd5YhPhhd7qZScQLR4qWuj
 1pcU4zbwohBVSA9c18dW8NbZxRk7zzAbz4lBJvnS0GvbSNZE+i3T4Ai0YE/JJ9awSKQH
 YvEf3aMl0LHf+DdhZk4Pp0U80oCCuD6C1zx62ohQyHzNxMd8pI6YV642Ea6WjVHiAFxk
 6eIU7t/kkv+2oF/8vksLxgPQPn1e+wKga6jCJcYOpX3Kpt4/9Tra5uTv3l0789SAI8KD
 YcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DhwpFi6Wh5QuXVUPNz+GmbSe5Ma4WO1UWRJb+pMWWPA=;
 b=SqavsmMMawrTtuSO+MKFwJKQDuT+fbCouLSC6Qjv1PfrZvfsmW1Pg6Cx/BEppN6a4i
 FOvfEakBfRbz5aZdt3bswpveDd7O2c6U9SAOswBzX3Ix8NbP2SsM68OxbOFIAiwD8Fb2
 MfHHe2ojrjYvTnJ0EZ09SdjxvvtSDXpxiwPAuaVfHbwbzLDVuE21aH1/zRNnrY7QAEET
 KjzaJDxXQQfZUGqkFL0c9LNHnnFOQoerLwCYDOj19tFAvs/uR6oiEv53Ckt7HNkFA7cN
 fbSO/rlRF30gvry8/Pa7s3Ncqw76hCXVUznlBbqozTYF6s0gTH832AlaIjQSZYx4QYdx
 fX/Q==
X-Gm-Message-State: AKS2vOz07mBiS6lqMge4wDO7ncr/bHIHXhKCXvWhmEK2Q87T7yuELvJ+
 XhIyI0q9Ks7/3gd5N8FVlaqTXRbBkQ==
X-Received: by 10.13.233.195 with SMTP id s186mr14149673ywe.329.1498457958062; 
 Sun, 25 Jun 2017 23:19:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Sun, 25 Jun 2017 23:18:57 -0700 (PDT)
In-Reply-To: <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 15:48:57 +0930
X-Google-Sender-Auth: mTLsuBj2W9GZuqh2U7XCVYPCaWc
Message-ID: <CACPK8XepziqsQVC6R_97s24=8o5F-TZCO1+opZxBJW8SNHRHkg@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Greg KH <gregkh@linuxfoundation.org>, 
 "David S . Miller" <davem@davemloft.net>, mchehab@kernel.org,
 martin.petersen@oracle.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-i2c@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Mon, 26 Jun 2017 06:19:20 -0000

On Sat, Jun 24, 2017 at 4:13 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Tue, Jun 20, 2017 at 02:15:15PM -0700, Brendan Higgins wrote:
>> Added initial master support for Aspeed I2C controller. Supports
>> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Applied to for-next, thanks for all the hard work!

Congratulations Brendan. It's great to see this driver in the tree.

Cheers,

Joel
