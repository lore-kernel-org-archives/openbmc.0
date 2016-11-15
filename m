Return-Path: <jaghu@google.com>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com
 [IPv6:2a00:1450:400c:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJK350K3lzDvj0
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 07:38:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DK6rRABh"; 
 dkim-atps=neutral
Received: by mail-wm0-x236.google.com with SMTP id g23so192539336wme.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 12:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wcoSZfo9usWV2obZd0qo92DgkxTN40uL4YO5x/iVNV4=;
 b=DK6rRABhU4KN2js31+/YimabYrSKjCJJxBy44jThPcHXaci4wHLsZi3iGdANEZD/wa
 jEI1WGJaeoSORv1a2jbcLUFrEvYd8QNCA9lR+hs+Atb9DAWlt8vCeB/KRqIBLdM/0J7N
 FZcfEzpThNGv1gzHw+P0HutnU77kRbkD7UssDZJKio0nNmYV4ZtDPhD/QJQBR7vuxYFr
 ktQpZrGYqyMvvuVQn6PeB8J9EufV9qB11fMgA6LiH9PAsMIdFhCmUf7RBYar4u2Qh8PU
 JDwbkbsJcDXXWjdRw4ZsG7UWcy1czOchHEkk2EKPOoSdKxM6NAoGeMAS3DQwaNUUQ68b
 89fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wcoSZfo9usWV2obZd0qo92DgkxTN40uL4YO5x/iVNV4=;
 b=Ytf8qI3ou+s/Te/iUTB5G4+FMYj+3xOrsRx1qu3Tsyp/Zo7ye8apfj+M8NAU/92kCx
 1oNJE7XPDlScCD4SdgKaqv2LzeHyt/hG0p6JQ7iAlnkm94lkYv9ahBa8FyWo5Sr1cNqV
 Ol0TRYq3/FFLdNcpmfE7i7FvTLulYg9Cwrsj4sSuH+psJnTdgJswCByDM/RsZ5xOjMx8
 2keFb1zPe8yZ9jBgRstwbAcOJfEQjUepLF5AXfUAfpGeW4Ax05sCxVBpAPluH0F4I+C+
 TDrkpo20qB6V7L3hb2SCX8eNMrA7NOFktJYiU0NEvMKQsEVJqad+tYO//xy9F5D3bglE
 PTQQ==
X-Gm-Message-State: ABUngvcWmhxaZ8eDBbj7En7r0bRwbVEwMRpOMePAXbNbCJq3TlemSm5jeYEdbW2d9Vz5S8dpDM5QKygfVzGWxd5t
X-Received: by 10.194.146.228 with SMTP id tf4mr25405760wjb.183.1479242285982; 
 Tue, 15 Nov 2016 12:38:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Tue, 15 Nov 2016 12:37:45 -0800 (PST)
In-Reply-To: <1478117865-32103-1-git-send-email-jaghu@google.com>
References: <1478117865-32103-1-git-send-email-jaghu@google.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Tue, 15 Nov 2016 12:37:45 -0800
Message-ID: <CANsWYUXufCoWDwAcQ-Eq1Ase1FKQPfxfkQFDxNok9kYzd63t3w@mail.gmail.com>
Subject: Re: [PATCH linux v4 0/3] Seven segment display support
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Content-Type: multipart/alternative; boundary=089e01177bedfe84c805415ceee5
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
X-List-Received-Date: Tue, 15 Nov 2016 20:38:09 -0000

--089e01177bedfe84c805415ceee5
Content-Type: text/plain; charset=UTF-8

Hi Joel,

Could you please provide feedback for this driver.

Thanks,
Jagha


On Wed, Nov 2, 2016 at 1:17 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> This patchset includes:
>
> Character device driver which implements the user-space API for letting a
> user
> write to two 7-segment displays including any conversion methods necessary
> to map the user input to two 7-segment displays.
>
> Platform device driver which provides an API for displaying on two
> 7-segment
> displays, and implements the required bit-banging. The hardware assumed is
> 74HC164 wired to two 7-segment displays.
>
> Adding clock, data and clear signal lines in the devicetree to control
> seven segment display on zaius platform.
>
> A changelog between versions is included in the individual patches. Please
> provide feedback.
>
> Thanks,
> Jagha
>
> Jaghathiswari Rankappagounder Natarajan (3):
>   drivers: misc: Character device driver for seven segment display
>   drivers: misc: Platform driver for seven segment display support
>   devicetree: Add devicetree changes to support seven segment display on
>     zaius
>
>  .../bindings/misc/seven_segment_gpio.txt           |  23 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
>  drivers/misc/Kconfig                               |  16 ++
>  drivers/misc/Makefile                              |   2 +
>  drivers/misc/seven_seg_disp.c                      | 198
> ++++++++++++++++++
>  drivers/misc/seven_seg_disp.h                      |  35 ++++
>  drivers/misc/seven_seg_gpio.c                      | 225
> +++++++++++++++++++++
>  7 files changed, 507 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/seven_segment_
> gpio.txt
>  create mode 100644 drivers/misc/seven_seg_disp.c
>  create mode 100644 drivers/misc/seven_seg_disp.h
>  create mode 100644 drivers/misc/seven_seg_gpio.c
>
> --
> 2.8.0.rc3.226.g39d4020
>
>

--089e01177bedfe84c805415ceee5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Could you please provide feedb=
ack for this driver.</div><div><br></div><div>Thanks,</div><div>Jagha</div>=
<div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 2, 2016 at 1:17 PM, Jaghathiswari Rankappagounder Natarajan=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blank=
">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
This patchset includes:<br>
<br>
Character device driver which implements the user-space API for letting a u=
ser<br>
write to two 7-segment displays including any conversion methods necessary<=
br>
to map the user input to two 7-segment displays.<br>
<br>
Platform device driver which provides an API for displaying on two 7-segmen=
t<br>
displays, and implements the required bit-banging. The hardware assumed is<=
br>
74HC164 wired to two 7-segment displays.<br>
<br>
Adding clock, data and clear signal lines in the devicetree to control<br>
seven segment display on zaius platform.<br>
<br>
A changelog between versions is included in the individual patches. Please<=
br>
provide feedback.<br>
<br>
Thanks,<br>
Jagha<br>
<br>
Jaghathiswari Rankappagounder Natarajan (3):<br>
=C2=A0 drivers: misc: Character device driver for seven segment display<br>
=C2=A0 drivers: misc: Platform driver for seven segment display support<br>
=C2=A0 devicetree: Add devicetree changes to support seven segment display =
on<br>
=C2=A0 =C2=A0 zaius<br>
<br>
=C2=A0.../bindings/misc/seven_<wbr>segment_gpio.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 23 +++<br>
=C2=A0arch/arm/boot/dts/aspeed-bmc-<wbr>opp-zaius.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
=C2=A0drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++=
<br>
=C2=A0drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<=
br>
=C2=A0drivers/misc/seven_seg_disp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 198 ++++++++++++++++++<br>
=C2=A0drivers/misc/seven_seg_disp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 35 ++++<br>
=C2=A0drivers/misc/seven_seg_gpio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 225 +++++++++++++++++++++<br>
=C2=A07 files changed, 507 insertions(+)<br>
=C2=A0create mode 100644 Documentation/devicetree/<wbr>bindings/misc/seven_=
segment_<wbr>gpio.txt<br>
=C2=A0create mode 100644 drivers/misc/seven_seg_disp.c<br>
=C2=A0create mode 100644 drivers/misc/seven_seg_disp.h<br>
=C2=A0create mode 100644 drivers/misc/seven_seg_gpio.c<br>
<br>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
</blockquote></div><br></div>

--089e01177bedfe84c805415ceee5--
