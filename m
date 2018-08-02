Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q+928goY"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hCzV5M4JzF21T
 for <openbmc@lists.ozlabs.org>; Fri,  3 Aug 2018 01:00:54 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id p81-v6so3700269itp.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Aug 2018 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcNJHY6sYYUcxK4Dcb8DkSbRwYySNhH/dVfvMM/yFCc=;
 b=Q+928goY9qdiDwFWfXHL/qdQlkzRbEnco9gJJPPDC4tzVv7BbunDzdfEsZYDh3PWG+
 fzSpdlqdj3AMN+AfafTCDRxpkLm3t8KzbcYc4SoUPWKkvbygxu9VyHAEr77A9N1zQdG3
 YEN9Q7Q9DI9o+V/PRlS6uvcl3ZuWuG4pXYq3NuatG5mach14dULFpUHX6uaKSyA1LvZQ
 noSt2cIGu6B7uIquU2qOZrx8ugOzbm4mJleuSSh6FaUxtQRM1hiGwamaN38sc9Kwk8iv
 FeNYjC9wUeiaaAbOJRfcM/VnI0ZF8hly70dQrjLNqT9oGZ8ED1HYUb5ok16NthkQMVUi
 MwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcNJHY6sYYUcxK4Dcb8DkSbRwYySNhH/dVfvMM/yFCc=;
 b=M/hkgJdgszBQVH2Z2mKzENQ09Ls0w6Y0hxV0hCf2TAn0vGP3gqduQHrMUMYCUakqzL
 snHNSxHAkOhxGuuV22sonfaT3LnlY+SuVWKr5e4sZ0Fx3/Mmv5Lj4YU+DKXvNh8bdin0
 gUHwM70H7wIrr0Bl/x/iCAh/qofy7dEIgKXcRp2/f4RAlPVmGtUGtxtznd6D7FIxNi01
 Lj9BlPDDEJ8qJXiBACEvN54gxIBgVS7KgYDc1JpB0U1mzdJXOI5wr/9R8YkolWN/9vgM
 ZGWEcqGA/gKoPailghJJfbqBoz7I49VZAlKf5uT4W4urh6ea2D6HqvMFjlHyvGb7RULW
 /j0w==
X-Gm-Message-State: AOUpUlGzHC2AloecflqVsPBspuZHOHuJi0y8meAH7v4MguYCxKn7BxNu
 7385VrocQc+hscj9REQRqSvVP4528QW0qrPwdg==
X-Google-Smtp-Source: AAOMgpczW5BFQAK3RVHSS2sVOHO9RA3jmuS54VT1vmnEq8D52K73N3SCRj+yGx+V4wr+o60b1aWvOjvAHwZ9Y6foEbY=
X-Received: by 2002:a02:9b2a:: with SMTP id
 o39-v6mr2830731jak.106.1533222052207; 
 Thu, 02 Aug 2018 08:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
 <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
 <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
In-Reply-To: <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 2 Aug 2018 18:00:41 +0300
Message-ID: <CAKKbWA7bUjUAj-dzNgjbD9F+pod_CFTSqt2yFX4NpNXWi17mYA@mail.gmail.com>
Subject: Re: UART Route setting
To: Andrew Jeffery <andrew@aj.id.au>
Cc: osk@google.com, mine260309@gmail.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, henbinchang@gmail.com
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
X-List-Received-Date: Thu, 02 Aug 2018 15:00:56 -0000

On Thu, Aug 2, 2018 at 6:34 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
> > Interesting suggestion, that looks promising, thank you?
> >
> > What's the state of that driver? I.e. where do we expect it to land?
>
> If you think the bmc-misc-ctrl series is useful, please reply to the
> upstream thread to outline all of your use-cases. There's a lot of push-
> back on using the devicetree to describe these features, and I haven't
> had a lot of feedback on the acceptability of the rest (driver itself,
> userspace ABI).
>
> The more evidence we have of this being necessary/useful the better.

Oskar,
Here is the link to put your support:
https://lore.kernel.org/patchwork/patch/961584/

>
> Cheers,
>
> Andrew
>
> >
> > Thanks
> > Oskar.
> >
> > On Wed, Aug 1, 2018, 10:12 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > > On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft <osk@google.com> wrote:
> > > >
> > > > Hi Andrew
> > > >
> > > > Thanks for the suggestion. I see that the register would map quite
> > > nicely to pinmux. However, the ability to change the configuration from
> > > user space is critical. How could that be done via pinmux?
> > >
> > > I believe Andrew Jeffery's [bmc-misc-ctr][1] driver is perfect for this
> > > requirement:
> > > 1. You can define related registers in dts and expose as sysfs attributes
> > > 2. User space is able to read/write the sysfs attributes to do what you
> > > need
> > >    to configure.
> > >
> > > [1]: https://patchwork.ozlabs.org/cover/942322/
> > >



-- 
Regards,
Avi
