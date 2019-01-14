Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="kP5Y/vz4"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dMs36zW8zDqN7
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 16:45:59 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id z18so9890647qkj.10
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jan 2019 21:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0fx6AzA/vL6vJhv4Ht1507IbdeUyvVzq1bXlczbybU=;
 b=kP5Y/vz4yfnAr4+HN/qB45Z0gE2CcjSLPvH1nJ37wCRc5AVb8PljFo2jQAhQiaJR9u
 ipWORVZA+s5oPtuVTWiE8BngU7xotmKrgi67JUwCAYVusCxYu3CEZxTpvdynyIe+BVC8
 LYz8+Ol4QO/P2nPzMzY03wPNwC+eurxrIvFmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0fx6AzA/vL6vJhv4Ht1507IbdeUyvVzq1bXlczbybU=;
 b=Mk/14LW40/TRmY0pE1kltTyTk5Xtw364Sl7iK4SxSzQocUNHIKrCBrHl545jveLZ8A
 hxAjX13yWXTtChwooe7WFcSd0Tulr5vQgyOvPpaSmfeSqRJNgAZB0gP55te5MYdzwPcn
 4/IpMi+baVAxPFge/6prs/eBjNSF9eCwGgp0KRsBXT0JLuCt/1miB0s2jo4R5GAhwQhw
 Tp/qejORhNeSxLpiHcSYrgqONQ6rZfByJdFGpBsiGV0lZdfE1nPVf28G8RLNv/HhvXX+
 n2jKUKabaT0MUdMSgd5fxX3WetHOA81Bshjtn0ZrQyMugG1jw6mQXRZydoSiZ3wAOqdZ
 uPqw==
X-Gm-Message-State: AJcUukdVq0UiJlvszuJxN6P4CqfO3DJvNteGKXAcU4rFdhWg2R0WS1Xd
 HEJkXWSM4XxDCx4DJi6VEKIKaJii+O1L1Jw9r44=
X-Google-Smtp-Source: ALg8bN5oYxyzSdOHSx7TVvTVsh7kSgUdtRG+bpH0CrYAuYJQ55xWvso9NjO1x4axv655lvvcwTQtncFvjUAcrt2HVIk=
X-Received: by 2002:a37:bc06:: with SMTP id m6mr22053004qkf.336.1547444757427; 
 Sun, 13 Jan 2019 21:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-6-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-6-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 16:15:46 +1030
Message-ID: <CACPK8Xf-54Q7s_z8J=ZBoYqiFuy7_QAvsDqgT2CO0LFOvx8tqg@mail.gmail.com>
Subject: Re: [PATCH v10 05/12] ARM: dts: aspeed: peci: Add PECI node
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>, 
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Mon, 14 Jan 2019 05:46:00 -0000

Hi Jae,

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
> aspeed-g4 and aspeed-g5.

This looks good, aside from the alias.

It will go via my aspeed tree once the bindings are merged. Send them
to linux-aspeed@lists.ozlabs.org at that time.

In the future I suggest leaving the changes to arch/arm/boot/dts until
after the bindings and driver patches have landed. They will rarely go
in before hand as the bindings need to be agreed on.


>                 serial3 = &uart4;
>                 serial4 = &uart5;
>                 serial5 = &vuart;
> +               peci0 = &peci0;

I don't think this is necessary. Can you explain why you think you need it?

Cheers,

Joel
