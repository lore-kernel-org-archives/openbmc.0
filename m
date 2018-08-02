Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ws4iy3AF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qSjOxPRb"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gwkQ3vYGzF0pD
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 13:33:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C190A218EB;
 Wed,  1 Aug 2018 23:33:31 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 01 Aug 2018 23:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=hXAtZ8bYYEmpIonrLBLYyJSIssjID
 +3YPbDPu6Nbgk8=; b=Ws4iy3AFDMoQdBZzZ9KmNusz3E/R+mjpEPFCoIepy2nZ1
 s144hQ6t+YI3/6/VIm+ZwF0dknGGVsm16zxWS9DaHPRbrGwoXplHhvZ0FIYxAazc
 RFfHPznr3hTCbF7fLRIggET2nxjs8F+fToKhHIKtXzHQFmw9SWLJsJ40ETToQg7Y
 Uv03JI23UqMpX4eezFXtgDtUeTMDMUQUY19WjPAS8FS8eaULfKxhEJmOa3oBVPem
 3RkyfpRX+kqbNo1HNPS3h/vyc8KKUSe0kDaV+u3qjRx0gtl5xxcfoItT8G8ZJ9JS
 4BMLIIMjYaPkFAT/8WvRqD8LNoN89Xfy9wcIpAcxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hXAtZ8
 bYYEmpIonrLBLYyJSIssjID+3YPbDPu6Nbgk8=; b=qSjOxPRbaVV3xJRQizJ2bj
 Fnz5MtHubVl+InG0ULTf0N9nQpja8K6X2soYx49WaH1MVWQehw/MByx5PeOeidmm
 mMu4W6IYxi7wTxupWlOUx8AZL8YOmRHe3VUXdGY77TpKvwQ3FoTTLy2tEJEX0Iaq
 ItnSV2fZ/SD/jX7b3GDZ69WteUQ7FsemBXn43ue/deXBrHFo1BTPn/c+7f7C0NMM
 kE8fJbpCKuarx5hQNT1TD/+p/MBS/FY5vHkvrau6VKjc4LNVeE3j0QRXyKE/4hMU
 rj+gLXRDbvwFGS5CmazPlyF3Amly1vRiWkGHVysSk2Yiuj9knDKTaUqK8nKLcDWg
 ==
X-ME-Proxy: <xmx:i3tiW3rxjZzu2hfBCRRJVIyJrYrQr-Y4R8d-yw1Zr9TSpd5_GT2Kww>
 <xmx:i3tiW6-Zjsrc7C5lnfaLwDhDZKVq8rgpO7inwHi1uwM8cUtIDWLlLg>
 <xmx:i3tiWy_0mzqE6AL6dvbnM2N9vYuApWB0zG-V-sQydp0PWZpu4emYhw>
 <xmx:i3tiW16C-uxwLB-IKr_lCoYuFIblPTPVbR7xnyraDTBVAxXWGMwn2w>
 <xmx:i3tiW0ISzCXKL1r9y-llpJxvlqStUeWI2rN5IHRp_j-hpTeXxGS9iw>
 <xmx:i3tiWz8eSgWiaqC-0u5MefppawZBXDlFGogeWv235Jsr6Cl-RmuHcg>
X-ME-Sender: <xms:i3tiW5C8fyCiuQ0SXtkiQ1pvyrWxZ5IjhkN1WKxTDGrqpcgJV52Faw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 691DC9E488; Wed,  1 Aug 2018 23:33:31 -0400 (EDT)
Message-Id: <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Oskar Senft <osk@google.com>, Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?Q?=E5=BC=B5=E6=BC=A2=E5=BD=AC?= <henbinchang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2be8cd1b
Date: Thu, 02 Aug 2018 13:03:31 +0930
Subject: Re: UART Route setting
In-Reply-To: <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
 <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Aug 2018 03:33:38 -0000

On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
> Interesting suggestion, that looks promising, thank you?
> 
> What's the state of that driver? I.e. where do we expect it to land?

If you think the bmc-misc-ctrl series is useful, please reply to the
upstream thread to outline all of your use-cases. There's a lot of push-
back on using the devicetree to describe these features, and I haven't
had a lot of feedback on the acceptability of the rest (driver itself,
userspace ABI).

The more evidence we have of this being necessary/useful the better.

Cheers,

Andrew

> 
> Thanks
> Oskar.
> 
> On Wed, Aug 1, 2018, 10:12 PM Lei YU <mine260309@gmail.com> wrote:
> 
> > On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft <osk@google.com> wrote:
> > >
> > > Hi Andrew
> > >
> > > Thanks for the suggestion. I see that the register would map quite
> > nicely to pinmux. However, the ability to change the configuration from
> > user space is critical. How could that be done via pinmux?
> >
> > I believe Andrew Jeffery's [bmc-misc-ctr][1] driver is perfect for this
> > requirement:
> > 1. You can define related registers in dts and expose as sysfs attributes
> > 2. User space is able to read/write the sysfs attributes to do what you
> > need
> >    to configure.
> >
> > [1]: https://patchwork.ozlabs.org/cover/942322/
> >
