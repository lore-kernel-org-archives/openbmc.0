Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::232; helo=mail-yw0-x232.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ctk/ZRl4"; 
 dkim-atps=neutral
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418yH82SW2zDrcd
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 16:09:55 +1000 (AEST)
Received: by mail-yw0-x232.google.com with SMTP id 81-v6so6491662ywb.6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 23:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VMOWWDlgG+8Gn1406EVk5D7V6CSeXnWc1VXIH6tKGtk=;
 b=Ctk/ZRl425hUxhNoow1sUt9NmnZXBCg/JQ9CLm+tbo1FE1SsiqN3kArZM8Cb2Nie+8
 fWuWOLcHLDvEw714qeacqMOfBp/RGWaR59xd7ciCx+5R7m+Nw5KmaqI9twVeQ9hqPIcW
 y5yAP5QM8Hytr3KGxWz7GfiwYZomINZCHpr1MLU8palbHVimoMlFafQurIA8SqPvFlG1
 lmq4vBGvoi4Jb+TAW6EOQPvZ0b3ioIxj3jT9K1pIuN/1XPsWuTbXblhYvzm/5Ormf0Zb
 /vRK502+1BCHxNWM3cv4zfnQexwk//O3v84RCU5uAb4JtidWTLpcGxAvUH0jIHFUZk6W
 K8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMOWWDlgG+8Gn1406EVk5D7V6CSeXnWc1VXIH6tKGtk=;
 b=HxmVm1zT5bDr4EEV6jfBBCUxTcBZ1iezLk5jymFCeR6s2ik12BeYjryv2kM30fa37i
 /4NMkxo8dSX/1d5xBZpOm2BhA2wXvZEpo5n3t07Dc+c2WLt1Hzg7aTJ0Qi84eFOt/+jK
 xCpR2tzZUJjNw5s1S8J5XiQYSh7j2b6nV/4aocUzxMiMarq7RRfczpVfiY17j9ua+BsM
 e/M41UywIownQPcW8gCSV59IChVNDp8jPhhpSg1SKn0r6vmzYaFfa1g99d1Z+kr+zCxR
 Yz53XeqIoDf3D/KBLEiZbFMgZmnvcbuC4mVzzabTe6jrNzieNjTq2zmFZ+nSTjbG+tlp
 7nlw==
X-Gm-Message-State: APt69E02bDAeT+6r5haDZK7VKhChOss27kfV2bIOYPXg6oSDRVue9t4J
 HKH3XNRHByzLVLqjWGij9WR3caISIkbTYnkO/e0=
X-Google-Smtp-Source: ADUXVKKocS+pQIcM9fA9kZMZlPs4UjlXZRc+hR73EHwBq4xio7Ze83RUSr2Kw0EhfVrx8c/wThfvEgJdfOxTNsRl5k8=
X-Received: by 2002:a81:8483:: with SMTP id
 u125-v6mr7317798ywf.246.1529388593148; 
 Mon, 18 Jun 2018 23:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ebc0ca056ef350df@google.com>
 <1529384519.3876096.1412667488.17D5361D@webmail.messagingengine.com>
 <CADy_Pt2rWNu7NuTfQWfP5T+mzfVW3FCbc_8j_Ss+zOwiy68sRA@mail.gmail.com>
 <c7333926d7df413ba2bb8c21e3987552@TWMBX02.aspeed.com>
In-Reply-To: <c7333926d7df413ba2bb8c21e3987552@TWMBX02.aspeed.com>
From: James Mihm <james.mihm@gmail.com>
Date: Mon, 18 Jun 2018 23:09:16 -0700
Message-ID: <CADy_Pt2hQ8854nQfcZQxSPCcXGfHngPi-1yGcRXkrWSyYJXg2w@mail.gmail.com>
Subject: Re: Poll - Fall 2018 OpenBMC Hackathon
To: luke_chen@aspeedtech.com
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 19 Jun 2018 06:09:57 -0000

Great, thanks for letting me know!
On Mon, Jun 18, 2018 at 11:08 PM Luke Chen <luke_chen@aspeedtech.com> wrote:
>
> Dear James
>
> Thank you for sending me the email, I already filled out the form.
> And I also subscribed on OpenBMC for the mailing list just now.
>
>
> Best wishes
>
> Luke Chen
> (O) : +886-3-5789568
> (M) : +886-935-592-892
>
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+luke_chen=aspeedtech.com@lists.ozlabs.org> On Behalf Of James Mihm
> Sent: Tuesday, June 19, 2018 1:57 PM
> To: andrew@aj.id.au
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Poll - Fall 2018 OpenBMC Hackathon
>
> Andrew, Great idea...just added either and neither.
>
> James.
> On Mon, Jun 18, 2018 at 10:02 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > On Tue, 19 Jun 2018, at 09:26, james.mihm@gmail.com wrote:
> > > I've invited you to fill out the following form:
> > > OpenBMC Hackathon
> > >
> > > To fill it out, visit:
> > > https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=0&amp;w=1&amp;usp=mail_form_link
> > >
> > > I&#39;ve invited you to fill out a form:
> > >
> > > Google Forms: Create and analyze surveys.
> >
> > Maybe we should add 'either' and 'neither' options so people can register their interest appropriately?
> >
> > Cheers,
> >
> > Andrew
