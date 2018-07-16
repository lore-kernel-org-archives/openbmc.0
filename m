Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="cXE67nQ4"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TlkX2rm5zF35r;
 Tue, 17 Jul 2018 00:13:24 +1000 (AEST)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
 [209.85.223.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2014E2075B;
 Mon, 16 Jul 2018 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1531750402;
 bh=hObXR6thTqWNXtEz0UhMZ75M+9E8M453/qWOPlomZJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cXE67nQ4dgxPNo7Cy0h6XkqvU9SFeWQhw2JWW7JemhRlhJQIjqzLGMFhQ7sPe4ltZ
 max/lEzNRrdd8IC5XeF2Ah+HJcZ76tG4rQRr0NtZ68dvd9OAt2gp4f2Ux5jNRXAIGp
 UsjHu5JjtJnhnJcieRzJ2hLbbeY2yid0VaQfURkM=
Received: by mail-io0-f179.google.com with SMTP id l25-v6so37916776ioh.12;
 Mon, 16 Jul 2018 07:13:22 -0700 (PDT)
X-Gm-Message-State: AOUpUlEL5gOfSSobLb+25E2Dr2omCLpjDxl8IUhKUQKsu3D4bvMJlywW
 h1usL/CSVMwIhtN2IODOrQPL/SVhjeBPhMzK7A==
X-Google-Smtp-Source: AAOMgpf0nJDaQl2pO32nC1OVl0h2nNlCreo8YEkXwyYEGbSlaxQ+1AwrYg1uOjzzSDCiVdPEmkVlEQul2nKhyxme8KU=
X-Received: by 2002:a5e:c90e:: with SMTP id
 z14-v6mr41319025iol.268.1531750401580; 
 Mon, 16 Jul 2018 07:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180622043756.21158-1-benh@kernel.crashing.org>
 <20180703193017.GA23230@rob-hp-laptop>
 <23be30ebb2c661ef304c78a85cff591c515ba65b.camel@kernel.crashing.org>
 <CAL_JsqKZunLyRJQJgQrcBvv2s=HEd=E2ZG1ZgkgwTQkzJ88mcA@mail.gmail.com>
 <a6331cdbababea893bcde5f8ca9529dd89dafd67.camel@kernel.crashing.org>
 <c37eeb656151831123ec53bfc4e3c6caf718a060.camel@kernel.crashing.org>
In-Reply-To: <c37eeb656151831123ec53bfc4e3c6caf718a060.camel@kernel.crashing.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Jul 2018 08:13:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ6rEZzj+CJok1feGEFcM2DUxiYXig=h4hpJgyAOc4X5g@mail.gmail.com>
Message-ID: <CAL_JsqJ6rEZzj+CJok1feGEFcM2DUxiYXig=h4hpJgyAOc4X5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: fsi: Add optional chip-id to CFAMs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 14:13:25 -0000

On Wed, Jul 11, 2018 at 8:07 PM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Fri, 2018-07-06 at 11:48 +1000, Benjamin Herrenschmidt wrote:
> > > We've generally standardized around "label" for things like slots,
> > > ports, connectors, etc. that need to be physically identified.
> >
> > Yes, label would be an option too, probably a better one that aliases.
> >
> > > "slot-names" it seems hasn't gotten used for FDT. Since there aren't
> > > DT's published for OF based systems nor any documentation, newbies
> > > like me (that only have 8 years of DT experience) don't have any
> > > insight into how things used to be done.
> >
> > In a pretty much ad-hoc way :-) In this case, though, chip-id is a
> > simple solution and works well (and I have the code already written and
> > tested :-)
>
> I want to try to get that stuff upstream. Do you still object to the
> chip-id's after our discussion ? The labels aren't that great really...

No.

Acked-by: Rob Herring <robh@kernel.org>
