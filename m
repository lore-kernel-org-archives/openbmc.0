Return-Path: <raltherr@google.com>
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCXpC3ktNzDq9d
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 04:10:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mrmPVkxK"; 
 dkim-atps=neutral
Received: by mail-io0-x22a.google.com with SMTP id j13so136259383iod.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=38QxyLauyiWQrQ9PDw3ltmOqlGL8BaOzfgEVIMIUJZA=;
 b=mrmPVkxK0hNw5JR0C7kVAkX2S9bL0BHkIG4gPQ8jm4GUcW70cWsgs9zuaRVP4mb2Fw
 dkqGptEc60WH4+T6ryglZh+dwP9kTPgSfwc6/2sAB6IicxRCWKjKVbuI5LJU19oYPtby
 UVgsV8t0sW5pX5D1nLtIQGeOPysDQcYSpe1XMSDv7fhz9ZpGEkngQpOD342WCWfzN4MV
 uwJPzTl3XMQy2quR6OeOp+W4kb8oYS+MRn/v3BU+ghSyw8g759s1/AVFqQXrX0xCNgPU
 C4nqUK4yEfka74kxHTUl3j4uHeUsmmDKSdqHRUlbvuTMoXsKrmRJvYtJ6pX/GRkPzAic
 +o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=38QxyLauyiWQrQ9PDw3ltmOqlGL8BaOzfgEVIMIUJZA=;
 b=rDPYcskDiAZePmkuSmvXO3yUNir5KkfVw0Ur0I6NToSsaW0R/MhR4bHVypaoHN7r//
 xPeNhBnHYSoKs0pW6bfx3zjyFaOHTlBHfP5XP3oKIsf9ERMoDaedEMSPjwqIo1Mf1EZs
 Vz0dtRk6S/ncHnUGZAIbQXLpROyniQJVoutsdQlpgKJDRuTFzfdCMGMA+0vBRd3HL3QV
 1Tk9V3lcjtSBD+j5mDoKhVPtnAwe46t5MQYIz/NeYUmCctaEz/QOs7cjEd5i6/M//dvQ
 k9RyN5XiZLT4x25Wx4xQ4LyYA5pijj0P4QwoKrhYA37iLCuOXFTfQ9m0NcXgnIqwvCSR
 xu8A==
X-Gm-Message-State: AIkVDXKCE2Y65Ys+YyBwWPbu+5hpXYQkUWH72qbElUiXRd/Q+4fc9CKGg15SFuLytCXbN8VsTaeD3xb/GwCtv+dl
X-Received: by 10.107.180.8 with SMTP id d8mr24302356iof.101.1485882640427;
 Tue, 31 Jan 2017 09:10:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Tue, 31 Jan 2017 09:10:39 -0800 (PST)
In-Reply-To: <0b4e0ee9-c10a-a443-f2a0-8f5a26f5c63c@elsoft.ch>
References: <0b4e0ee9-c10a-a443-f2a0-8f5a26f5c63c@elsoft.ch>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 31 Jan 2017 09:10:39 -0800
Message-ID: <CAPLgG=mZJ8b-A4u1PKj-Gt0=_3rNCAJwiU=em4rJ1-aR7OtAKQ@mail.gmail.com>
Subject: Re: Update strategy?
To: =?UTF-8?Q?David_M=C3=BCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c05a656f636a205476702c3
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
X-List-Received-Date: Tue, 31 Jan 2017 17:10:44 -0000

--94eb2c05a656f636a205476702c3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

https://github.com/openbmc/docs/blob/master/code-update.md

On Tue, Jan 31, 2017 at 2:42 AM, David M=C3=BCller (ELSOFT AG) <
d.mueller@elsoft.ch> wrote:

> Hello
>
> Is there an "official" way to update/upgrade an OpenBMC installation out
> in the field?
>
> Dave
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c05a656f636a205476702c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/docs/blob/master/cod=
e-update.md">https://github.com/openbmc/docs/blob/master/code-update.md</a>=
<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue,=
 Jan 31, 2017 at 2:42 AM, David M=C3=BCller (ELSOFT AG) <span dir=3D"ltr">&=
lt;<a href=3D"mailto:d.mueller@elsoft.ch" target=3D"_blank">d.mueller@elsof=
t.ch</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello<br>
<br>
Is there an &quot;official&quot; way to update/upgrade an OpenBMC installat=
ion out<br>
in the field?<br>
<br>
Dave<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div>

--94eb2c05a656f636a205476702c3--
