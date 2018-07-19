Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::243; helo=mail-oi0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XZ+j9vXA"; 
 dkim-atps=neutral
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41WgFL3dd5zDqCb
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jul 2018 02:58:13 +1000 (AEST)
Received: by mail-oi0-x243.google.com with SMTP id l10-v6so16255670oii.0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f/EGZWrw/5L1g+8904iz7K5t3cfl40L0fWSKattk5n8=;
 b=XZ+j9vXAHcdAzGq1NIEMlHiNE4BKmuGtkp0613SSy0339oHwzWurcuFvhBvmQPSe6c
 jvMAQeul44Gyd6yuIXRBZ+IADDp1Dy5ldFTHB0qHKHgKAmZaDYfOrKdg6QGBkRCiKn0k
 echdMhjea9pdvi2EXs3m553+XkLnsC2SWXZGe7Za9MZF/DjmV0bReEKWmDmN23PBcSlA
 Ku+y+/j2uf1DwCJXnPCgB/nms0J+E3x83cjQZNAtjHSs2GmQLUqN7mNnwP50aUwewqAd
 8boGvtILEOVnTyAiDSz+5EF7Ao1STuGlwN1NuATlhxWAAbuYTkiTipA27dVFXeszjA16
 VnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/EGZWrw/5L1g+8904iz7K5t3cfl40L0fWSKattk5n8=;
 b=BdBgYl8amnz4gcejtu5bQ5NurBwZrIF81wJO+qwH2Kd8YSQRZtJlnooCIMhTosmUKM
 FCc+JjJ8R4SkrOvMjGKnp3cgf6xGThLvJvhPbXigwTDP74gYZPKUDaz5Ys7gJcDNk24J
 jOoIMNObkQDH9gfpJpVEKCBK3qlyWLtXBx+tWn8UX0epFXmmSZTIe5Tj5xW6ZVTZesdf
 aCxjAPd7B9WTC1cSkkz0KECyMRMnNjpEw+z4vicKaUF0uf8kEknFEMZMs4klp2f7WGj8
 RpBgcTOQwEj3NXfpqtxc4BJiIR+ZXJV/V8Zj5Dp6YkTUy1eoGLaHZl86XAsRZCar/wXH
 EZww==
X-Gm-Message-State: AOUpUlGsIt5clFQqqR55TzU5qgYeCOs+AD9xhmlLOk2noIkYVs5GmmJE
 7ipTgPAiSpdiI5LQHRu9Od1GkyQ5PsShIoXBQcuV1g==
X-Google-Smtp-Source: AAOMgpe9TgaUlkPQgPO/Sj70/2a+oT8k+SNmjf5lyclXjI9F66EUg+nA7cEKOj870fltw1qGLrGo5GNZZzhYgdHdb1g=
X-Received: by 2002:aca:c2c1:: with SMTP id
 s184-v6mr12507277oif.117.1532019490933; 
 Thu, 19 Jul 2018 09:58:10 -0700 (PDT)
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
 <26400cb7-972e-7be9-81ba-8e08d42abd4e@linux.intel.com>
In-Reply-To: <26400cb7-972e-7be9-81ba-8e08d42abd4e@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 19 Jul 2018 09:57:59 -0700
Message-ID: <CAFd5g46=DhGKC59i+Tu3DNGupVvFh4buJPQ_0NWZZbgcpV=6NA@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-master use
 cases stably
To: jae.hyun.yoo@linux.intel.com
Cc: gary_hsu@aspeedtech.com, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, 
 james.feist@linux.intel.com, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Patrick Venture <venture@google.com>, vernon.mauery@linux.intel.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
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
X-List-Received-Date: Thu, 19 Jul 2018 16:58:15 -0000

On Tue, Jul 17, 2018 at 9:18 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
>
> On 7/15/2018 8:05 PM, Gary Hsu wrote:
> > Hi Jae,
> >
> > In originally, we reserved these register bits for debug purpose. But f=
or some error handling case, we found it is also useful to help to clarify =
some error conditions. So driver also can use these fields information to c=
heck something.
> > As for how driver use these information in their code, I have no commen=
t. I don=E2=80=99t understand the driver. But these information is the real=
 controller state, it had no problem to use information.
> >
>
> Thanks Gary!
>
> Hi Brendan,
> Is it acceptable now if I add this as a comment like below?

Yep, that's fine. I didn't mean to hold you up. I was just curious.

>
> Thanks,
> Jae
>
> > Best Regards,
> >
> > =E8=A8=B1=E9=A6=A5=E7=96=87 Gary Hsu
> >
> > =E4=BF=A1=E9=A9=8A=E7=A7=91=E6=8A=80=E8=82=A1=E4=BB=BD=E6=9C=89=E9=99=
=90=E5=85=AC=E5=8F=B8
> > ASPEED Technology Inc.
> >
> > 2F,No.15,Industry East Road 4.,Hsinchu Science Park, Hsinchu City 30077=
, Taiwan
> > =E6=96=B0=E7=AB=B9=E7=A7=91=E5=AD=B8=E5=9C=92=E5=8D=80=E5=B7=A5=E6=A5=
=AD=E6=9D=B1=E5=9B=9B=E8=B7=AF 15 =E8=99=9F 2F
> >
> > Tel : 886-3-5789568 ext:807
> > Fax : 886-3-5789586
> > Web : http://www.aspeedtech.com
> >
> > ************* Email Confidentiality Notice ********************
> > =E5=85=8D=E8=B2=AC=E8=81=B2=E6=98=8E:
> > =E5=9B=A0=E6=87=89=E5=80=8B=E4=BA=BA=E8=B3=87=E6=96=99=E4=BF=9D=E8=AD=
=B7=E6=B3=95=E6=96=BD=E8=A1=8C,=E6=9C=AC=E4=BF=A1=E4=BB=B6(=E6=88=96=E5=85=
=B6=E9=99=84=E4=BB=B6)=E5=8F=AF=E8=83=BD=E5=8C=85=E5=90=AB=E6=A9=9F=E5=AF=
=86=E8=B3=87=E8=A8=8A=EF=BC=8C=E4=B8=A6=E5=8F=97=E6=B3=95=E5=BE=8B=E4=BF=9D=
=E8=AD=B7=E3=80=82=E5=A6=82 =E5=8F=B0=E7=AB=AF=E9=9D=9E=E6=8C=87=E5=AE=9A=
=E4=B9=8B=E6=94=B6=E4=BB=B6=E8=80=85=EF=BC=8C=E8=AB=8B=E4=BB=A5=E9=9B=BB=E5=
=AD=90=E9=83=B5=E4=BB=B6=E9=80=9A=E7=9F=A5=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=
=B5=E4=BB=B6=E4=B9=8B=E7=99=BC=E9=80=81=E8=80=85, =E4=B8=A6=E8=AB=8B=E7=AB=
=8B=E5=8D=B3=E5=88=AA=E9=99=A4=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=
=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=92=8C=E9=8A=B7=E6=AF=80=E6=89=80=E6=
=9C=89=E8=A4=87=E5=8D=B0=E4=BB=B6=E3=80=82=E8=AC=9D=E8=AC=9D=E6=82=A8=E7=9A=
=84=E5=90=88=E4=BD=9C!
> >
> > DISCLAIMER:
> > This message (and any attachments) may contain legally privileged and/o=
r other confidential information. If you have received it in error, please =
notify the sender by reply e-mail and immediately delete the e-mail and any=
 attachments without copying or disclosing the contents. Thank you.
> >
> > -----Original Message-----
> > From: Jae Hyun Yoo [mailto:jae.hyun.yoo@linux.intel.com]
> > Sent: Saturday, July 14, 2018 2:54 AM
> > To: Brendan Higgins <brendanhiggins@google.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>; Joel Stanley <jo=
el@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; linux-i2c@vger.kernel.org;=
 OpenBMC Maillist <openbmc@lists.ozlabs.org>; Linux ARM <linux-arm-kernel@l=
ists.infradead.org>; linux-aspeed@lists.ozlabs.org; Linux Kernel Mailing Li=
st <linux-kernel@vger.kernel.org>; james.feist@linux.intel.com; vernon.maue=
ry@linux.intel.com; Benjamin Fair <benjaminfair@google.com>; Patrick Ventur=
e <venture@google.com>; Gary Hsu <gary_hsu@aspeedtech.com>; Ryan Chen <ryan=
_chen@aspeedtech.com>
> > Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-maste=
r use cases stably
> >
> > On 7/13/2018 11:12 AM, Brendan Higgins wrote:
> >> On Fri, Jul 13, 2018 at 10:22 AM Jae Hyun Yoo
> >> <jae.hyun.yoo@linux.intel.com> wrote:
> >>>
> >>> On 7/12/2018 11:21 AM, Jae Hyun Yoo wrote:
> >>>> On 7/12/2018 2:33 AM, Brendan Higgins wrote:
> >>>>> On Wed, Jun 27, 2018 at 10:55 AM Jae Hyun Yoo
> >>>>> <jae.hyun.yoo@linux.intel.com> wrote:
> >> <snip>
> >>>>> <snip>
> >>>>>>>> +       for (;;) {
> >>>>>>>> +               if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> >>>>>>>> +                     (ASPEED_I2CD_BUS_BUSY_STS |
> >>>>>>>> +                      ASPEED_I2CD_XFER_MODE_STS_MASK)))
> >>>>>>>
> >>>>>>> Is using the Transfer Mode State Machine bits necessary? The
> >>>>>>> documentation marks it as "for debugging purpose only," so
> >>>>>>> relying on it makes me nervous.
> >>>>>>>
> >>>>>>
> >>>>>> As you said, the documentation marks it as "for debugging purpose =
only."
> >>>>>> but ASPEED also uses this way in their SDK code because it's the
> >>>>>> best way for checking bus busy status which can cover both single
> >>>>>> and multi-master use cases.
> >>>>>>
> >>>>>
> >>>>> Well, it would also be really nice to have access to this bit if
> >>>>> someone wants to implement MCTP. Could we maybe check with Aspeed
> >>>>> what them meant by "for debugging purposes only" and document it
> >>>>> here? It makes me nervous to rely on debugging functionality for
> >>>>> normal usage.
> >>>>>
> >>>>
> >>>> Okay, I'll check it with Aspeed. Will let you know their response.
> >>>>
> >>>
> >>> I've checked it with Gary Hsu <gary_hsu@aspeedtech.com> and he
> >>> confirmed that the bits reflect real information and good to be used
> >>> in practical code.
> >>
> >> Huh. For my own edification, could you ask them why they said "for
> >> debugging purpose only" in the documentation? I am just really curious
> >> what they meant by that. I would be satisfied if you just CC'ed me on
> >> your email thread with Gary, and I can ask him myself.
> >>
> >
> > I've already CC'ed Gary and Ryan in this thread.
> >
> > Hi Gary,
> >
> > Can you explain why the documentation says that the bit field is 'for d=
ebugging purpose only'? Any plan to change the description?
> >
> > Thanks,
> >
> > Jae
> >
> >>>
> >>> I'll add a comment like below:
> >>>
> >>> /*
> >>>     * This is marked as 'for debugging purpose only' in datasheet but
> >>>     * ASPEED confirmed that this reflects real information and good
> >>>     * to be used in practical code.
> >>>     */
> >>>
> >>> Is it acceptable then?
> >>
> >> Yeah, that's fine.
> >>
> >> <snip>
> >>
> >> Cheers
> >>
