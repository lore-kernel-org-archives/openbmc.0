Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22d; helo=mail-ot0-x22d.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oPCfMl/9"; 
 dkim-atps=neutral
Received: from mail-ot0-x22d.google.com (mail-ot0-x22d.google.com
 [IPv6:2607:f8b0:4003:c0f::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Dl42703CzDrq6
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 19:58:25 +1000 (AEST)
Received: by mail-ot0-x22d.google.com with SMTP id d19-v6so14385024oti.8
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zNcoVN/bgqKagcuwvtT1H5KcgpDcnzL1vUz3nbzyLNE=;
 b=oPCfMl/9X28x9lbbONso7u/3elpwOJ0IrzOiXu+nRdia8kkE2Et+Xa/nwoyn3rj5dM
 +GSxGbKX93cCDlmN0x7ZOK3hSpdHZ+voZl4Je1ZnqTqTeb3Bx58tiomrIvEyTIggXBRO
 hG0meIsKJiihWUfAn/JvZcJl7dy9FRslDBbP3biytkn1XuGWwRr0SZjPL2QclSy1yeAt
 qvEdm55yamDYeXbeAy70uwYaN9URvHSr3bYzgEQcz/eF9qxd6Ylf0yUwAY5vWRBA2kdr
 0p3AikZkdrKrojhe1Bpn9TgGeWg6JsPQ+jf4NRmjbiEEnLmrtIZzlQUmrmrM9HvN1+Ry
 5lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zNcoVN/bgqKagcuwvtT1H5KcgpDcnzL1vUz3nbzyLNE=;
 b=n1o13eACthqc3YO+ANKEi/HT1l5D9w3++3O2RV4JcSx4k/Mxx1+y5PrlaJNeteVEmi
 39Cbo/76ZK524UBJUtNGPKiPjWMOfuYgD3Spd57PrkDjnXATOJC8ffK4ahIyVmqkhpp3
 PHQl+Uw1AFNCtS8Vd4mLIF/oOO0MPKyPZsgoESvoP05fIffHuhLNks1Y0FC2M+Pixr++
 rEjtm2wR7ND5Hn1ZcOWoowPEpp94yAqxty8nmJ0ecUyXVzGeaJUiqcMPZ/zeOzYraEs7
 qVPWgMjnhjpR/qiPtzSgkNY25u0cKbLkN7t3tMmjcLOznDqbIYfsMAPNSqTlfsv4KtWX
 N5lA==
X-Gm-Message-State: APt69E2+JdUkAKcs+my3YK94JgZKvWYVIG8nrtcw5aaDRZuV7ubaKi1m
 F0mWxCALV4Tsrm511P5+/BcgBXdqBISXGZtN0F4=
X-Google-Smtp-Source: AAOMgpcBKqs/lnMu3gAWAakf6itd08LiuqksyWuHmqQ1A5ED+jTKuXN7oKX4AAvS0+JvI29ZyDRqnNj3uZGdP0u4TQA=
X-Received: by 2002:a9d:a66:: with SMTP id 93-v6mr3019892otg.177.1529920703309; 
 Mon, 25 Jun 2018 02:58:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c87:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 02:58:22
 -0700 (PDT)
In-Reply-To: <ea56be8f-5010-ea78-12e5-3480d740e7bc@molgen.mpg.de>
References: <CAE33tLG3Fju=pvA6na5z=4dFhjX+LzutcbY8=g=psik68FYWLg@mail.gmail.com>
 <ea56be8f-5010-ea78-12e5-3480d740e7bc@molgen.mpg.de>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 25 Jun 2018 15:28:22 +0530
Message-ID: <CAE33tLFRCpk70ZYpGxtuf0wwNhRf0+UR-WmJNP-+rRgUpR_D4Q@mail.gmail.com>
Subject: Re: Unknown command gpio in u-boot
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000e2ead056f746c52"
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
X-List-Received-Date: Mon, 25 Jun 2018 09:58:27 -0000

--0000000000000e2ead056f746c52
Content-Type: text/plain; charset="UTF-8"

The BMC I used is Aspeed ast-2500 and GPIO I want to control is GPIOB0.

On Mon, Jun 25, 2018 at 3:14 PM, Paul Menzel <pmenzel@molgen.mpg.de> wrote:

> Dear Akash,
>
>
> On 06/25/18 11:42, AKASH G J wrote:
>
> > I tried to reset one GPIO using 'gpio' command in u-boot 2016.07. But it
> is
> > showing error "unknown command gpio". Please someone help, how to control
> > GPIO through u-boot.
>
> Please tell us the board and the GPIO you tried to set with the exact
> command.
>
>
> Kind regards,
>
> Paul
>
>

--0000000000000e2ead056f746c52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The BMC I used is Aspeed ast-2500 and GPIO I want to contr=
ol is GPIOB0.<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Mon, Jun 25, 2018 at 3:14 PM, Paul Menzel <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:pmenzel@molgen.mpg.de" target=3D"_blank">pmenzel@molgen.mpg=
.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dear Akash,<br>
<span class=3D""><br>
<br>
On 06/25/18 11:42, AKASH G J wrote:<br>
<br>
&gt; I tried to reset one GPIO using &#39;gpio&#39; command in u-boot 2016.=
07. But it is<br>
&gt; showing error &quot;unknown command gpio&quot;. Please someone help, h=
ow to control<br>
&gt; GPIO through u-boot.<br>
<br>
</span>Please tell us the board and the GPIO you tried to set with the exac=
t command.<br>
<br>
<br>
Kind regards,<br>
<br>
Paul<br>
<br>
</blockquote></div><br></div>

--0000000000000e2ead056f746c52--
