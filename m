Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x231.google.com (mail-yb0-x231.google.com
 [IPv6:2607:f8b0:4002:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vV0h34TBfzDqGv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:55:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MhxOEwER"; 
 dkim-atps=neutral
Received: by mail-yb0-x231.google.com with SMTP id a5so3147527ybb.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 21:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XYlZe60azqElwQk2XvhSR8l8P8we3S51amhROHh98Fc=;
 b=MhxOEwER4rLVSw2wdaXdRQCLf1Bzq7gCa/Ywzv7iJND29yD/d21yN8EMdI6cEgyVDG
 NbiOVoNo/Q3xFF0LEUj0A5sTRg+swBQBrbkVmUE8XSjMlT+y975qdpOO85wGqwCkIzGx
 VVTWZwzUDR8idrdXJr8UkmIkLdDhwuK2+n6CdjaWom54xFQfbhTsJ96CaDCvGURp44t+
 +M9ZqLGDps0t4+c2fQqEFZbUesfbLFMof/xM9eAVYePeQbH4mGQd1h+ew6G5V71R17cq
 GyN2ytxb9KvR65AKJpSZNoKl5Wv1urtqDj23+XEYdt+XSZGz7u9SeOQnQXpE5uDJKp2+
 XffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XYlZe60azqElwQk2XvhSR8l8P8we3S51amhROHh98Fc=;
 b=ss/DPphtNbz5VvReMkYxwGUfKAnF0ip+V6Y9aCY9qGJUFYXJLvAypSDIhLdqPhIumN
 QzbEudv+OCf7SedrmLk5vc+6NvkARKFo4HviiFsLYTio9s+VF7ebl94UCjhHYwjtydqQ
 pNHmAALqBNItKH2Kb8qlwdXu1Wb66CTrxHWhFeaNU6jkUllq11FFkNcgmrcyETEYB2xQ
 ErshGk9OFCWT1K623jdIlsBLAtHwGkInpDDlrhkcTH6DpuR7XLidNSTziLDQS8M8ERlo
 ASo9ZFJvTm3cXCS8fIMoekUrUkWPDVDOuETQ6X2T/iI7CEVfVUrefSxzkWqIjMQ345LT
 nHag==
X-Gm-Message-State: AMke39m6VKgXblG9syEexEfjbQVPXdKKmDr56IQoZ1inciGXMrZn/bsqFhz6B6w6kUVHPkDUmhVlgq0kKaVGeQ==
X-Received: by 10.37.25.70 with SMTP id 67mr584136ybz.15.1487915729012; Thu,
 23 Feb 2017 21:55:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 21:55:08 -0800 (PST)
In-Reply-To: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
References: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 16:25:08 +1030
X-Google-Sender-Auth: svAY08Bm07U0mjoKiy_8fJ9ve5U
Message-ID: <CACPK8Xft4jUdp6cimoTQB6=-58Xm0Po1+AKZyto9XfgWGm-mQQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-bmc-opp-romulus:
 Enable mailbox and LPC control nodes
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 24 Feb 2017 05:55:32 -0000

On Tue, Feb 14, 2017 at 5:55 PM, Lei YU <mine260309@gmail.com> wrote:
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
> +&mbox {
> +       status = "okay";
> +};
> +

Lei,

I applied this part of the patch as the other part was applied as part
of "ARM: dts: aspeed: Reserve RAM on P9 machines".

Cheers,

Joel
