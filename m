Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TOVGmeVw"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WgFs2Mc8zDqGR
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 02:58:41 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id d189-v6so16242032oib.6
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V6UTAm7MgBEBINyn1Dyk2k0uIZx+49YpcWgppKd7Ix0=;
 b=TOVGmeVwEdw1QtNuvTErsPQ3U+ZaNXrSwj8M//JwtOgabKDkQReUGDic4ROaebLbwQ
 rgQvrZFnepptvGUrI1PZ7NRU7KtJzRAYwwnvvhGLubQtNMHn5o/RVrsGm9Ib1rujXAW4
 pGDugZqnH2u58DE/FKp/I6QF7jYAgdyB9i+/e1reNYpceoAekv1qmAhCTmX/O1LizaCu
 MYLCv5D+4mkEB+ZmJqZ0RFnUiv9axj102whr0zIDOnhgt3T+aqVpyXcj/3RjS1IbiwIt
 zJQfsUxyyI1GQa7it3dl6q680Pjsd/Iin8rJ84lJTc/kQm+aX3c0y6rmdTyDdmjj8NMq
 9E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V6UTAm7MgBEBINyn1Dyk2k0uIZx+49YpcWgppKd7Ix0=;
 b=R9i0nmmsGvMxtXwYrIQCmkgFiHIcx092Mpzp2GZxy33NFKzV1fsEAvM7P8ZYk5FfDZ
 6OjMgspe6mtuUYHHmmqxmCO7nkETPZQsd79hMHasj9t5zN3JOkNsi5EgGjnFOAurw/Gd
 AMmrvFARJN8cjmPgmT2+3T7dTZPcJKFWNVm00uIM9t0+A68XROezv47MtgvjPvL7ltox
 8uGgQqy4P4UvUH69wJ6ivx9DkVJF+4aEILL67iEDfmsDdQIHQ8xSh5LO4RH/Pe/dIMnE
 ybE7rWAHBXtqI0PHi6676lgEzgpMbajI7chJwkFJa5cT7+DiybprxQK4xRCTPOvEtgSV
 ODgw==
X-Gm-Message-State: AOUpUlGAhtYAi/tAKHERegXCAoHDDZFAzmVMCk32T+kvzmlUpIiwk4vj
 9rzHzf35V4fbNCurrRQRLZFIn9KKowm1fPbnaOY+Hg==
X-Google-Smtp-Source: AAOMgpei/vGsLKSLFhvs3bjgg2NmIyd2lj7qy/33x5defGTQFfhvG159FCRhxqVAUp0IM3Xvx+ZTcHOATy25fJFFPw8=
X-Received: by 2002:aca:c692:: with SMTP id
 w140-v6mr11167731oif.284.1532019518900; 
 Thu, 19 Jul 2018 09:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180626165812.4141-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g45z--ucXf-So517tgrayZT6x2TGvaUvaDF7zeRNn7CPXw@mail.gmail.com>
 <e51471e6-0f8a-bffc-34c8-1e74239fdbcf@linux.intel.com>
 <CAFd5g47j_h4ZrT8Eg1FZ8sAj5ekCUH20jUVub75ozdkg8_YW7Q@mail.gmail.com>
 <921b1ab7-9c9f-0aeb-da89-5a1a27d009f0@linux.intel.com>
 <d3f10fc1-635b-3a5d-a967-2816eac005fc@linux.intel.com>
 <CAFd5g47zdPdqqjVJtNHtFk+jKgciKbMcEH9M-W9rL4DgLM5hkg@mail.gmail.com>
 <b8232faa-58f5-f3a5-d12a-3f326cf1d03d@linux.intel.com>
 <a84da5d076924f40b1c836fe8b9d0844@TWMBX01.aspeed.com>
In-Reply-To: <a84da5d076924f40b1c836fe8b9d0844@TWMBX01.aspeed.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 19 Jul 2018 09:58:27 -0700
Message-ID: <CAFd5g44JNqaG58aAoiMRbgzfz1nE4CfsS4v2gt99=Q5LoaZA6Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-master use
 cases stably
To: gary_hsu@aspeedtech.com
Cc: jae.hyun.yoo@linux.intel.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 james.feist@linux.intel.com, 
 vernon.mauery@linux.intel.com, Benjamin Fair <benjaminfair@google.com>, 
 Patrick Venture <venture@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 19 Jul 2018 16:58:41 -0000

On Sun, Jul 15, 2018 at 8:05 PM Gary Hsu <gary_hsu@aspeedtech.com> wrote:
>
> Hi Jae,
>
> In originally, we reserved these register bits for debug purpose. But for=
 some error handling case, we found it is also useful to help to clarify so=
me error conditions. So driver also can use these fields information to che=
ck something.
> As for how driver use these information in their code, I have no comment.=
 I don=E2=80=99t understand the driver. But these information is the real c=
ontroller state, it had no problem to use information.

Okay, so it was originally only intended for debugging, but then showed its=
elf
to be useful, got it. Just out of curiosity, why did you mark it that way i=
n
the documentation? It seems as though you are trying to discourage people f=
rom
using it.

>
> Best Regards,
>
> =E8=A8=B1=E9=A6=A5=E7=96=87 Gary Hsu
>
> =E4=BF=A1=E9=A9=8A=E7=A7=91=E6=8A=80=E8=82=A1=E4=BB=BD=E6=9C=89=E9=99=90=
=E5=85=AC=E5=8F=B8
> ASPEED Technology Inc.
>
> 2F,No.15,Industry East Road 4.,Hsinchu Science Park, Hsinchu City 30077, =
Taiwan
> =E6=96=B0=E7=AB=B9=E7=A7=91=E5=AD=B8=E5=9C=92=E5=8D=80=E5=B7=A5=E6=A5=AD=
=E6=9D=B1=E5=9B=9B=E8=B7=AF 15 =E8=99=9F 2F
>
> Tel : 886-3-5789568 ext:807
> Fax : 886-3-5789586
> Web : http://www.aspeedtech.com
>
> ************* Email Confidentiality Notice ********************
> =E5=85=8D=E8=B2=AC=E8=81=B2=E6=98=8E:
> =E5=9B=A0=E6=87=89=E5=80=8B=E4=BA=BA=E8=B3=87=E6=96=99=E4=BF=9D=E8=AD=B7=
=E6=B3=95=E6=96=BD=E8=A1=8C,=E6=9C=AC=E4=BF=A1=E4=BB=B6(=E6=88=96=E5=85=B6=
=E9=99=84=E4=BB=B6)=E5=8F=AF=E8=83=BD=E5=8C=85=E5=90=AB=E6=A9=9F=E5=AF=86=
=E8=B3=87=E8=A8=8A=EF=BC=8C=E4=B8=A6=E5=8F=97=E6=B3=95=E5=BE=8B=E4=BF=9D=E8=
=AD=B7=E3=80=82=E5=A6=82 =E5=8F=B0=E7=AB=AF=E9=9D=9E=E6=8C=87=E5=AE=9A=E4=
=B9=8B=E6=94=B6=E4=BB=B6=E8=80=85=EF=BC=8C=E8=AB=8B=E4=BB=A5=E9=9B=BB=E5=AD=
=90=E9=83=B5=E4=BB=B6=E9=80=9A=E7=9F=A5=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=
=E4=BB=B6=E4=B9=8B=E7=99=BC=E9=80=81=E8=80=85, =E4=B8=A6=E8=AB=8B=E7=AB=8B=
=E5=8D=B3=E5=88=AA=E9=99=A4=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E5=
=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=92=8C=E9=8A=B7=E6=AF=80=E6=89=80=E6=9C=
=89=E8=A4=87=E5=8D=B0=E4=BB=B6=E3=80=82=E8=AC=9D=E8=AC=9D=E6=82=A8=E7=9A=84=
=E5=90=88=E4=BD=9C!
>
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or =
other confidential information. If you have received it in error, please no=
tify the sender by reply e-mail and immediately delete the e-mail and any a=
ttachments without copying or disclosing the contents. Thank you.
>
> -----Original Message-----
> From: Jae Hyun Yoo [mailto:jae.hyun.yoo@linux.intel.com]
> Sent: Saturday, July 14, 2018 2:54 AM
> To: Brendan Higgins <brendanhiggins@google.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley <joel=
@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; linux-i2c@vger.kernel.org; O=
penBMC Maillist <openbmc@lists.ozlabs.org>; Linux ARM <linux-arm-kernel@lis=
ts.infradead.org>; linux-aspeed@lists.ozlabs.org; Linux Kernel Mailing List=
 <linux-kernel@vger.kernel.org>; james.feist@linux.intel.com; vernon.mauery=
@linux.intel.com; Benjamin Fair <benjaminfair@google.com>; Patrick Venture =
<venture@google.com>; Gary Hsu <gary_hsu@aspeedtech.com>; Ryan Chen <ryan_c=
hen@aspeedtech.com>
> Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-master =
use cases stably
>
> On 7/13/2018 11:12 AM, Brendan Higgins wrote:
> > On Fri, Jul 13, 2018 at 10:22 AM Jae Hyun Yoo
> > <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> On 7/12/2018 11:21 AM, Jae Hyun Yoo wrote:
> >>> On 7/12/2018 2:33 AM, Brendan Higgins wrote:
> >>>> On Wed, Jun 27, 2018 at 10:55 AM Jae Hyun Yoo
> >>>> <jae.hyun.yoo@linux.intel.com> wrote:
> > <snip>
> >>>> <snip>
> >>>>>>> +       for (;;) {
> >>>>>>> +               if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> >>>>>>> +                     (ASPEED_I2CD_BUS_BUSY_STS |
> >>>>>>> +                      ASPEED_I2CD_XFER_MODE_STS_MASK)))
> >>>>>>
> >>>>>> Is using the Transfer Mode State Machine bits necessary? The
> >>>>>> documentation marks it as "for debugging purpose only," so
> >>>>>> relying on it makes me nervous.
> >>>>>>
> >>>>>
> >>>>> As you said, the documentation marks it as "for debugging purpose o=
nly."
> >>>>> but ASPEED also uses this way in their SDK code because it's the
> >>>>> best way for checking bus busy status which can cover both single
> >>>>> and multi-master use cases.
> >>>>>
> >>>>
> >>>> Well, it would also be really nice to have access to this bit if
> >>>> someone wants to implement MCTP. Could we maybe check with Aspeed
> >>>> what them meant by "for debugging purposes only" and document it
> >>>> here? It makes me nervous to rely on debugging functionality for
> >>>> normal usage.
> >>>>
> >>>
> >>> Okay, I'll check it with Aspeed. Will let you know their response.
> >>>
> >>
> >> I've checked it with Gary Hsu <gary_hsu@aspeedtech.com> and he
> >> confirmed that the bits reflect real information and good to be used
> >> in practical code.
> >
> > Huh. For my own edification, could you ask them why they said "for
> > debugging purpose only" in the documentation? I am just really curious
> > what they meant by that. I would be satisfied if you just CC'ed me on
> > your email thread with Gary, and I can ask him myself.
> >
>
> I've already CC'ed Gary and Ryan in this thread.
>
> Hi Gary,
>
> Can you explain why the documentation says that the bit field is 'for deb=
ugging purpose only'? Any plan to change the description?
>
> Thanks,
>
> Jae
>
> >>
> >> I'll add a comment like below:
> >>
> >> /*
> >>    * This is marked as 'for debugging purpose only' in datasheet but
> >>    * ASPEED confirmed that this reflects real information and good
> >>    * to be used in practical code.
> >>    */
> >>
> >> Is it acceptable then?
> >
> > Yeah, that's fine.
> >
> > <snip>
> >
> > Cheers
> >
