Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtPs75hzTzDqKT
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 21:59:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AanP42hX"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id d191so1147765ywe.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=So0Vk1nVqYHvBDYu+DYjC8Aq2YTOXIdtd3pExrwGxkA=;
 b=AanP42hXRstuEuW15U3fnCTE2l9e4wDiT1COIBIzegBHSFzzQfP0svk/m27Ajwvkhr
 uo7bdZFJ1yL1DRWWnq/eYjCKAPhl69zBZOUGlvEUw6a1AkwN2RbNmZjDX4+aGdVPiqJv
 XeUn6QhOu6zbS+AN9o9TAxBFVlIZ4Z6QpYroykBIbP+xSQ/ApIPdDBFFq00imgRbe5f7
 w4JBMJJncrzkSBboCtbCVCp+DqPz3aKj7lms+gVkdgo+f0L/kQTmg3VaemOMF6PzRiRh
 uEVlorh4+C6ZajC3q4oWIRZh+ZzQgWoS/6MZW+sNiKQb3TzNrGkvZDQ6sHabffhhHO5p
 cTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=So0Vk1nVqYHvBDYu+DYjC8Aq2YTOXIdtd3pExrwGxkA=;
 b=KagG70yarXwuVCFrMJQKW5cQ8NTLs+yUKkPJPaNxUCvM0NDuIQ6Q6LAIc/gO16Dpyl
 /aW9QATSkOoAbtmo9jsFaChjuNf35QQFB9pZvcKi2POO4/p2hH2A2Zl5K6FbiZo+utHg
 ajY5hP6e6n7LNbcrwFP5J/Ey6GT0tjXGeuYjjxaCIIA56cLR00oIN/NssejikGndXo17
 CgpgtafID2+xMibOizIX0YUjyXkXV/Jc7VpsgNnuxPBPmcuTdKRdsaai1jEH7dgUdii0
 hm5D3wFL1u4M6wAy0c9t3VZrWRpbxlwc3jujZ+qALJreHDYtheG+s4CEl3l1Clb0jFJM
 mZzw==
X-Gm-Message-State: AFeK/H1j8HuPn506/K/Ub7ujm71QwKrkEPYFgdvqWkoVuGaEWG+pBviAeIuusqOrn9UC5rEyXgJthtrkM4/DLQ==
X-Received: by 10.129.73.65 with SMTP id w62mr24275132ywa.288.1490785145406;
 Wed, 29 Mar 2017 03:59:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Wed, 29 Mar 2017 03:58:44 -0700 (PDT)
In-Reply-To: <20170328051226.21677-3-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Mar 2017 21:28:44 +1030
X-Google-Sender-Auth: opqcDzveee8d06tSWRHzRIIHGss
Message-ID: <CACPK8XdYNi2mna=aBbYvMroujLOPbVkPdU-DeYGrevjRBjHodQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 vz@mleia.com, mouse@mayc.ru, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Wed, 29 Mar 2017 10:59:08 -0000

On Tue, Mar 28, 2017 at 3:42 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> +static int __init aspeed_i2c_ic_of_init(struct device_node *node,
> +                                       struct device_node *parent)
> +{
> +       struct aspeed_i2c_ic *i2c_ic;
> +
> +       i2c_ic = kzalloc(sizeof(*i2c_ic), GFP_KERNEL);
> +       if (!i2c_ic)
> +               return -ENOMEM;
> +
> +       i2c_ic->base = of_iomap(node, 0);
> +       if (IS_ERR(i2c_ic->base))
> +               return PTR_ERR(i2c_ic->base);
> +
> +       i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
> +       if (i2c_ic->parent_irq < 0)
> +               return i2c_ic->parent_irq;
> +
> +       i2c_ic->irq_domain = irq_domain_add_linear(
> +                       node, ASPEED_I2C_IC_NUM_BUS,
> +                       &aspeed_i2c_ic_irq_domain_ops, NULL);
> +       if (!i2c_ic->irq_domain)
> +               return -ENOMEM;
> +
> +       i2c_ic->irq_domain->name = "ast-i2c-domain";

Nit: Make this aspeed-i2c-domain to make this consistent with the
other Aspeed drivers in the kernel tree.

Could this irq code be embedded in the i2c driver? We took a similar
approach for the Aspeed GPIO driver, which has a similar IRQ structure
of one hardware IRQ that tells the driver to check status registers
for the precise irq source. The upside being all of the i2c code is in
the same place in the kernel tree.

Cheers,

Joel
