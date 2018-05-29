Return-Path: <andy.shevchenko@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A2UzdeJq"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wQbF6sBvzDr4d
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 06:40:25 +1000 (AEST)
Received: by mail-qt0-x232.google.com with SMTP id g13-v6so20455092qth.8
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 13:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4H22E8rFA4tbTqhLqJCXXM7GS7WGXyD64I9VZz7aSS0=;
 b=A2UzdeJq0okdqu9V1oxZCR5ggpZEQi+nK/PlZkR5kVEIezfn9G2BXnQjZtx7UJjrII
 ZO1sd2oyPz3jpA66YpbxJLeQXI9wzTS9tUecysUrsRTU3p5muUsJeXL3PiHPZyF2NhT8
 UPcCN6FlaLm7vMdeFc9GAzXeoo0exWpseexjx/sz5z+zReRDb0pWL9HkWwAB7MrYh4xC
 R5ST+IL8eMwTIOu0q7tUrZ3MVYfTgM0dKp/l5gg+MrZFi7ntEYXo7ScJs8XTEiERXrx/
 hD0PVZTWFCwcvTdxQnWhsZDi3pbRt9CzkIJbGBhcGjF//Z3wvEBbQtG6hCVAKhykypDK
 GiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4H22E8rFA4tbTqhLqJCXXM7GS7WGXyD64I9VZz7aSS0=;
 b=qjx0cdCkmvddCRJ9X46ZsXJZHJ7sdPJjLdMufYG29iFrmj6mWSgZ00U0dZ7jbcgB/2
 tzPDUqW0LcfLAgxLGI0FrnQPWWUIYkHzfIA8kJmbRh1fhAb+OLNjCQ32LFVYvmOaDkNH
 kM8fZdv5IotCzwppbL7A0jsiAThhHzaUEdsjSXAW59UjSDQULGaY5pVd3ynURj9KEq1j
 dRcFakk0rBLaOn96BAWdXO4PHz8jfamo08rfocYuGZPVDSj6wjGaVzKH3yJ7faprL3nt
 UjSDnbHQbqXjvMyLZOzvpxAivSZlKPAWQ2qRrMoshxLxhaeXJZWk5ZkwkG6pLoRiuhLg
 8Wmg==
X-Gm-Message-State: ALKqPwegZ5nu+0NreXbs0zbWG/AYHQw98IDPajgfQSpsTrIg4GPYhDDh
 vKfNlVcPvFwpWhebXLXaTK838RBC7qk45Bx3vQE=
X-Google-Smtp-Source: ADUXVKLn3OTGmCuEj43LWIHZwL3Mw69gQvSgySfrx8HriHMbdzh81nNuEPdogvO6QlcVt4001ZjbCMT/crP/548zqmI=
X-Received: by 2002:a0c:ae2f:: with SMTP id
 y44-v6mr17542911qvc.157.1527626422739; 
 Tue, 29 May 2018 13:40:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9896:0:0:0:0:0 with HTTP; Tue, 29 May 2018 13:40:22
 -0700 (PDT)
In-Reply-To: <1527605618-15705-1-git-send-email-oleksandrs@mellanox.com>
References: <1527605618-15705-1-git-send-email-oleksandrs@mellanox.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 May 2018 23:40:22 +0300
Message-ID: <CAHp75Vf-5px=nPg1pZYp3ZrtY_puQRhsPZg97k7GcVxmFYZOzQ@mail.gmail.com>
Subject: Re: [patch v25 0/4] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, openbmc@lists.ozlabs.org, 
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Vadim Pasternak <vadimp@mellanox.com>, 
 system-sw-low-level <system-sw-low-level@mellanox.com>,
 Rob Herring <robh+dt@kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 20:40:26 -0000

On Tue, May 29, 2018 at 5:53 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:

Please, STOP spamming mailing lists. Give (potential) reviewers time
to look at this.
In any case you already missed a next cycle, so, calm down and better
collect reports and address comments thoroughly.

-- 
With Best Regards,
Andy Shevchenko
