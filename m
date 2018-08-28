Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="YmRdG95G"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420JkN4HcQzDrdf
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 05:30:19 +1000 (AEST)
Received: by mail-qt0-x230.google.com with SMTP id r37-v6so3112052qtc.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fyQj5hvbU90Luh99PKlc39a9bqAc6vcjIRCamXv6vw=;
 b=YmRdG95Gw9gr34WDIJo4sxrSZtz0+p8sWeRfMZr2rAOz13e438t+AKTzuD8ylUBuah
 Nc/LX4sgBYD0kgM1ShjYYN8qYDMK37J9DOwuHN0+aju2naRnmowNclvK1PSAhJfHCCMC
 4rJvB13hAkzQ0HoYV1rEf6oNPB/Y1sn1kgQSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fyQj5hvbU90Luh99PKlc39a9bqAc6vcjIRCamXv6vw=;
 b=GzfJTSjJI6VJuRJ0UOxLaxUHaQGswP0x0LYivK3ExtdTNoZ50GbIj/39uqB7LQBq+g
 SsXsfl0WDzID0CUoIf41Rzhp+uOuJwg4O0s4aZlNgtA1MhYDPfAaFjbQjlb2EsPLp9Sm
 NIgYKlSSTSb1/xXwJSYX2lmlU405nchIdCFHkWka7XznIJjJLggv96GoHVyHLOMqqc7k
 UjM47/vCIOfzDPI4FHRkkQwTsJ8FYL2NCIftJ/0LF5TpO2YK0wtEYLLtnO+eE0+lQ9Y3
 9dV91gSLzihCFmO+UivPoCZRIrFKWb57zzh0rqyDmi81rjBJoLFkT+qLkJ+VF9GDnnIP
 j7Lw==
X-Gm-Message-State: APzg51Cm4QMeEj1aJiEwEzDze+wh/HtbKlxhcG+Pbk7X60F7+d0yBwgb
 O618EGGFgF+p5l1VskbFge/vsOWz2+CihtJsXhELsCmO
X-Google-Smtp-Source: ANB0Vda3sASsQ86XhD9pRcIN4SBQYaSNn451uVwuEVMKhic0jkhRKu30Su+zkdTAsOjf7Ow/RYHsrx7FNPE3rZ9W1Ho=
X-Received: by 2002:a0c:d7c3:: with SMTP id g3-v6mr3169383qvj.85.1535484617520; 
 Tue, 28 Aug 2018 12:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
In-Reply-To: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Aug 2018 12:30:06 -0700
Message-ID: <CACPK8XdnZLoLhLLX5jKEd7StWLFdE8ujXdQMFb2w0N7asnY7=w@mail.gmail.com>
Subject: Re: Linux kernel: Moving to 4.18
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Eddie James <eajames.ibm@gmail.com>, Tomer Maimon <tomer.maimon@nuvoton.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 19:30:22 -0000

On Tue, 21 Aug 2018 at 18:21, Joel Stanley <joel@jms.id.au> wrote:
> With the expected release of 4.19-rc1 this coming weekend a lot of our
> recent kernel work will have hit the mainline tree. I will use this as
> the trigger to create a 4.18 based tree (creatively named "dev-4.18").

The dev-4.18 branch has been pushed to openbmc/linux. I have boot
tested Palmetto and Romulus (representing ast2400 and ast2500
respectively), and all appears well. Here are the bumps in Gerrit:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-nuvoton/+/12189
 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/12183

I would appreciate input from the Nuvoton crew.

Cheers,

Joel
