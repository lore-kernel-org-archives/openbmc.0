Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="kF7MDOz0"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jZFZ1sctzDqTN
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 12:48:18 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id i7so21756796qtj.10
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jan 2019 17:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dQS4dApOQ8D+jq9Hf+FEXLnyJvAFN5QvNThj5XsJjH8=;
 b=kF7MDOz04YfonTsmUw6Hw9Bl27lA2DYqMtZ28shJmJ5zSNJZqrIcjKW/F+FCBxz5QW
 jrc3WlNejTskjQd0vjaPpuMRAZ2YOxCsxxgdg/puoLPf7rJXzvRUKfZvjzSkn5F433Yq
 InqjzFsxXYAnX/MMZmKJA2UbahN6jy+UbD0zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQS4dApOQ8D+jq9Hf+FEXLnyJvAFN5QvNThj5XsJjH8=;
 b=fzWEhtsYf+DG0XWn+gRSh2Mg3LneD/0hmyALzt+1M+qAKugptB7Y1MMMXPJ3UAvOAl
 ZIV4VDkfdWQ1ZZuWDgc0bSnB0ao/6PNIWqOOsYc6r3i1kCIFIQMlTC/eUcdD3EIoc8rz
 cdgdg4V7Q/+W5DSklfHi3Lo6UP0NOk1+qaiO58dCKPNRLx5+iL+5hmKWIBzphKSuA0O9
 clM+y5MXXxsw3adpnCZPaM2P50VehzOQ14p5phUlg+N3pdRcrs2hKqmiA5l+S1lbvHH6
 PYXwPyzrY5nV4OWSXLvNLGOh8qPb+coIXdNp7D0fhrrqDAgJLvmtcYadSSMfonADwlyj
 of7Q==
X-Gm-Message-State: AJcUukcwLmBR1HvXngpIF8HHt8MV5npc+W5ecwDNZ8SNdtVR5y1E0coU
 rbCq2upBCUeRxap1Q8S3HbanrpFrfDakgEpgv7Q=
X-Google-Smtp-Source: ALg8bN44shxb2J0M3z9sjRCFuo4/J0aMjjxqNvJ52rP1UcA1tnGgudSEPIMVnKPVzBjGDURtQ9HSX83f/Ti71iUvX2s=
X-Received: by 2002:a0c:c927:: with SMTP id r36mr24582500qvj.51.1548035295703; 
 Sun, 20 Jan 2019 17:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
 <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
 <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com>
In-Reply-To: <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Jan 2019 12:48:04 +1100
Message-ID: <CACPK8XfFRigW9pN4JLrH+KcE6ACJUzX0qJV8xeph_DkfKWgBEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, linux-iio@vger.kernel.org, 
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
X-List-Received-Date: Mon, 21 Jan 2019 01:48:18 -0000

On Sat, 19 Jan 2019 at 02:12, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Joel,
>
> Thanks for bringing this to my attention,
>
> I think I will leave it the same way it is now because I will like to develop the reset driver and to handle the NPCM7xx SOC resets.

You could also do that.

But I was suggesting you use a phandle, so you could then find the
node you want without searching the entire device tree for the node
with the correct compatible.
