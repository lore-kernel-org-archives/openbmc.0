Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rsXSRV88"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gtwX60xzzF1Qn
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 12:12:12 +1000 (AEST)
Received: by mail-io0-x22b.google.com with SMTP id l7-v6so555290ioj.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 19:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJhwhETAKcZPBUUKjoyj9Ztn0vbKMIZFL3w/od/1/7Y=;
 b=rsXSRV88+h53e/DoKJikHQQo2UKFOA3Tw++FkkoNadMbCQz8EpqZmCu11D0/RTRd4N
 F9WBcKxdsYoYT5F2ex5zvat/olSeftXQ1GSL37hfIl5NrI9q6FXTb1lDL+qQA52Uf9T4
 qpT4nLGMK7+IBaNPJXTAm9Pz8zLG7B7hi25T6Y01kZ+XtctRQv+Y2FWzLxv4Kj3iWdXE
 l2QnTD7E2UhvfGf7e5WJZe2KLF4fG1i2b7gIlLxNi3wCRMiJ0n8hPFQ5Te5S0Pmck4+J
 4bUAx9OLoh/TA0d6hYF9XNCvZOomE1ApFOaEYCWXB/hpALoQHALjn4N8YszAJEaqTyZS
 0XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJhwhETAKcZPBUUKjoyj9Ztn0vbKMIZFL3w/od/1/7Y=;
 b=BgiiMRCUtKZ/3N8mhbwWpff8eeVIc2LHUg0sqq1YmUmSFyW+LWfb4GF9ZwIsEU7ukM
 +vHn6ueN9JX+tRTFGTAMrHvA/shLf9I52ct9+4HAiULSTM1yZcDpego2226ltfXrh5QM
 gACBQGvAKB5uftcEu5xU+Brrn/5rxtORiNKHmm8ABZXufcPfr17jY5c4upocxdMdPGKP
 8IonA4+KZQJdaiFDoygf5CM7COS2RaOmU2ZZy3OJKPsUt8RoBUlgo1hJ/H9sNaIHHsnv
 0hFV32FRdWg5J23RyBAZ5RXWvyvUNNNb0DYt2CI7KEGwHdK9cKiE2tTivzc+SEFqBmgX
 /7hQ==
X-Gm-Message-State: AOUpUlEW+k6EHzIwCOSbG3h2//q421lekBUnBRg0Js7PNBMkaHUvDDmx
 hNUb+Pv90zS9ARbRQ9XUEnRjsNz7Mv0e6mILnGM=
X-Google-Smtp-Source: AA+uWPxLje9i0ZvReH7IRRAyvzZVWEYNn8jC+qGONwWKRoAF1onbhA73F1Ik4WC0t6D/vHus9PDtjPrt2QphbWQdXVo=
X-Received: by 2002:a6b:88d4:: with SMTP id s81-v6mr687841ioi.98.1533175930333; 
 Wed, 01 Aug 2018 19:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
In-Reply-To: <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 2 Aug 2018 10:11:52 +0800
Message-ID: <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
Subject: Re: UART Route setting
To: osk@google.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
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
X-List-Received-Date: Thu, 02 Aug 2018 02:12:14 -0000

On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft <osk@google.com> wrote:
>
> Hi Andrew
>
> Thanks for the suggestion. I see that the register would map quite nicely to pinmux. However, the ability to change the configuration from user space is critical. How could that be done via pinmux?

I believe Andrew Jeffery's [bmc-misc-ctr][1] driver is perfect for this
requirement:
1. You can define related registers in dts and expose as sysfs attributes
2. User space is able to read/write the sysfs attributes to do what you need
   to configure.

[1]: https://patchwork.ozlabs.org/cover/942322/
