Return-Path: <robh+dt@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="YmZz0+K3"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jxRF1hFLzDqSN
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 03:12:56 +1100 (AEDT)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B24C620989
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548087174;
 bh=h6dKq0tGJ/aO3g1QcEsyhn55UZB7OLD0Wdk8buu4F5w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YmZz0+K3Wlr0YZo0c+gc7KlJGx4xEFsRjx5/DnuvAAP0rF38wjqVzJufQ75EwijHn
 g3yz2ZdZWQhZ1hDTbUtHer8NhOYUA+70jd1HhPBQCFVnA0drRnO3UaugNDeXnaU3Dj
 ZoebhRSuSGHO7Y5IgmmAg1p1byX/Eiew5ZYhWmys=
Received: by mail-yw1-f54.google.com with SMTP id x2so8202064ywc.9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 08:12:54 -0800 (PST)
X-Gm-Message-State: AJcUukdpIFUSXfJm9L6flzf2ECrGXAgFMAFe1fLzV3kez9tiABJl7UY1
 ElNofh5pfMD9w4I7mvcOtDObJbfce2+Lji2Tpw==
X-Google-Smtp-Source: ALg8bN6GoeOGmdKZ6ggf1HGHVChgJb1ZQO+c5LNC9LZtKIv05GCMG+EcQ7N2FTx371b3598ryr5EZmu0zYLmZhtqPAA=
X-Received: by 2002:a81:ad64:: with SMTP id l36mr29310125ywk.114.1548087173909; 
 Mon, 21 Jan 2019 08:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
 <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
 <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com>
 <CACPK8XfFRigW9pN4JLrH+KcE6ACJUzX0qJV8xeph_DkfKWgBEQ@mail.gmail.com>
In-Reply-To: <CACPK8XfFRigW9pN4JLrH+KcE6ACJUzX0qJV8xeph_DkfKWgBEQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 21 Jan 2019 10:12:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLn3wCpAWDTQFsrvuPJqWurTDNcu=j988PpHWtuW4Po6w@mail.gmail.com>
Message-ID: <CAL_JsqLn3wCpAWDTQFsrvuPJqWurTDNcu=j988PpHWtuW4Po6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
To: Joel Stanley <joel@jms.id.au>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>,
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, 
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2019 16:12:58 -0000

On Sun, Jan 20, 2019 at 7:48 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Sat, 19 Jan 2019 at 02:12, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Thanks for bringing this to my attention,
> >
> > I think I will leave it the same way it is now because I will like to develop the reset driver and to handle the NPCM7xx SOC resets.
>
> You could also do that.
>
> But I was suggesting you use a phandle, so you could then find the
> node you want without searching the entire device tree for the node
> with the correct compatible.

That's not really any more efficient. You just search the entire tree
for the matching phandle number instead. Well, that was true until we
recently added the phandle cache.

In any case, it you plan to move to the reset binding (which would be
good), then it's better to have nothing in the DT and add something
rather than change the DT binding.

Rob
