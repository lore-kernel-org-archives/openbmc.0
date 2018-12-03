Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12c; helo=mail-it1-x12c.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NImOmuQQ"; 
 dkim-atps=neutral
Received: from mail-it1-x12c.google.com (mail-it1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437lJY09p0zDqRt
 for <openbmc@lists.ozlabs.org>; Mon,  3 Dec 2018 23:52:28 +1100 (AEDT)
Received: by mail-it1-x12c.google.com with SMTP id g85so8976373ita.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 04:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uzhXiwe9oftacfZCGuNmNlHuiTpnW84akPa4daNUWWI=;
 b=NImOmuQQ0flSo7GFpP+od3k9MWImk1l1YlwstnHk3RVvwnuUtSwZb5xSc/eyy3XutO
 9HPdBwTyeGPbcgs6IODnup1bJDbKQVVlIkep5DlzfzzKYGZbR1tp3NumXXbmTDzskRJO
 MEviYmvQO0o1YZJGQeiweaRKLQv3qqB9zNDyaxYl7Cnu/0TArfHdBlCFicXlDxpwJ+F1
 /M1RcoL7Ko6jFBFuq8qGEeem7d4ZXMwBCkTLr/jxx2Rx3yYizuFEpiSQJ0czqIkcbiHe
 NOhMGyHlHpvBNTF0cxdbwMJ8L6pgWBl7UF/5CHYJLpPHEiEFS0UXuWWG599u2ovoDIKg
 HFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uzhXiwe9oftacfZCGuNmNlHuiTpnW84akPa4daNUWWI=;
 b=lWna0UpEiRIvJRS51SKwzBQZgTG644iKBHkJtQ2sy8UY3behRmafR4/a13I+1XAu9G
 UkprMb4DSMTxwEvoJ5pC8UdZKoHQo5oIPz2mG3mU4nfxJohlmsC0ymCOTkGVKkkbpP7M
 IV7C0y6EoRiUvWaD2i0SC420JRahSOy9jrkN39pFPLDcGmozEo+cvBU+npVTjLpoLW+R
 EwmSicJvQKmZfoVWK8HoDfGIFaF8f0jKQXw55h2KLWFgOr5oEONAvyd6Rfs4IxeET7wf
 Yh38XdaPliaGHCYqSYYJvXNOXKWMsqwJRP40k4vc/BwLM2pBrWMNLk1hvIgIWxMRdmGd
 x2sA==
X-Gm-Message-State: AA+aEWa2iaE1og7u5a2UH6yv+afFL6JURog2lUnVxe/QihhJX8/LYIbp
 RYxcrpuLMPMxbhYq40B9I1htOY1LtDRqJ6vxi1g=
X-Google-Smtp-Source: AFSGD/UetYT2KhTbL++1WMIBR9ZNhKw6hXM8iktjvibl/uZZAvKxJvy8QogncatIRnhU4KrnE5otXUuy18ojZaJClIA=
X-Received: by 2002:a24:3c3:: with SMTP id e186mr7041529ite.155.1543841546337; 
 Mon, 03 Dec 2018 04:52:26 -0800 (PST)
MIME-Version: 1.0
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
In-Reply-To: <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Mon, 3 Dec 2018 20:52:14 +0800
Message-ID: <CAHkHK08+0SX5FOAziZy7hPO+LVrVQgjEJVOg9r5kHRyfF=Yepg@mail.gmail.com>
Subject: Re: [HELP] ipmi-kcs didn't work
To: jae.hyun.yoo@linux.intel.com
Cc: vijaykhemka@fb.com, chyishian.jiang@gmail.com, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 03 Dec 2018 12:52:30 -0000

On Sat, Dec 1, 2018 at 3:29 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 11/30/2018 12:57 PM, Vijay Khemka wrote:
> >
> > =EF=BB=BFOn 11/30/18, 7:31 AM, "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel=
.com> wrote:
> >
> >      On 11/29/2018 9:00 PM, Samuel Jiang wrote:
> >      > Hi Jae,
> >      >
> >      > We also encountered the same situation a month ago.
> >      > We try to enable the LPC clock on devicetree to resolve this pro=
blem not
> >      > direct modify clock driver.
> >      >
> >      > lpc_ctrl: lpc-ctrl@0 {
> >      >  compatible =3D "aspeed,ast2500-lpc-ctrl=E2=80=9D;
> >      >  reg =3D <0x0 0x80>;
> >      >  clocks =3D <&syscon ASPEED_CLK_GATE_LCLK>;
> >      >      status =3D =E2=80=9Cokay=E2=80=9D;
> >      > };
> >      >
> >      > However, I=E2=80=99m not sure which is better for LPC_CLCK setti=
ng.
> >      > Whether we should modify driver if original data is enabled or s=
hould
> >      > enable on the device tree, correct?

Samuel,
thanks for your solution. It is good for me .

-qianlihu
> >      >
> >      >


> >
> >      Hi Samuel,
> >
> >      Yes, you are right. I realized that kcs_bmc_aspeed.c doesn't have =
any
> >      clock control code so adding a clocks setting into kcs dtsi code d=
oesn't
> >      make any help. Also, it was the reason why the change is needed on
> >      clk-aspeed.c. Enabling lpc_ctrl node you suggested seems a right w=
ay.
> >
> >      Hi Vijay,
> >      Can you please try the way Samuel suggested after removing changes=
 I
> >      gave you. Samuel's solution looks good to me.
> >
> >      Thanks,
> >      Jae
> >
> > Jae,
> > I can try. We can certainly enable lpc_ctrl node but in my understandin=
g that
> > we still need this below patch to redefine ASPEED_CLK_GATE_LCLK value t=
o
> > add CRITICAL. I might be missing something here.
> >      - [ASPEED_CLK_GATE_LCLK] =3D { 8, 5, "lclk-gate", NULL, 0 }, /* LP=
C */
> >     + [ASPEED_CLK_GATE_LCLK] =3D { 8, 5, "lclk-gate", NULL, CLK_IS_CRIT=
ICAL }, /* LPC */
> >
>
> Vijay,
>
> I checked that lpc_ctrl module has clocks dt property handling code in
> the module so I think the LCLK would be enabled without the clk-aspeed.c
> fix. I can't test it now because I'm in a business trip so please test
> it. I'll also check it when I back to office a week after.

Jae,
I tested it on my platform, it worked.

-qianlihu
--
> Thanks,
> Jae
>
> >
> > Regards
> > -Vijay
> >
