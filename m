Return-Path: <raltherr@google.com>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com
 [IPv6:2a00:1450:400c:c0c::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whyRN4fVtzDqGr
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 02:52:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vDVbzOHC"; 
 dkim-atps=neutral
Received: by mail-wr0-x235.google.com with SMTP id v111so50266934wrc.3
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Qmij3ZdUiLUkhdNFhWKQPGXBeRJhNkOOzmvzdG1eY6A=;
 b=vDVbzOHCm/i/F64AGMBK9c8TnIshv0/p55B9NJoK+2kPtRtWfxPcZDvTDhZL++eaNF
 eryOdzQh2ZhzPgNQg4l5HxvUVgh9G7sKv9N9o8M8P5NSlJwPHd/LniKx+SYR5qslreKv
 qhmtmJ+ZGPh2cYAflfDJLDU/RUjKzs+NzqKUvJ4ncZAm/mUP7r7R9XRIv6+Kqie+vPa5
 K4lExX7IUWtIw5A0k9rbAdDZ/H5Fp1tZ/azxvyZisqV1NkgUCPBgn6rJWK9CIqKlcjpO
 Yh6zWnsl19I7qEROjIwrbwwrWcxdlDCetEql1QBJQOudvL/OmOZ073f1EaUKTyL1FhAR
 GYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Qmij3ZdUiLUkhdNFhWKQPGXBeRJhNkOOzmvzdG1eY6A=;
 b=D32dXnW5+chwo+QUcGKORNzFQUquvwBr+6T579igmHOCkMG5ckhupxUiy3GFTRMUs7
 WjxdASKRGpxT1d1+CKMa4DxoAGRasPeI6IiWAz88R96tiRA1eNBPdqNbRvF/gZEZUcLu
 P1UDnkyS3fupgq0ycRyd9BQPQ5haEEbEBi8bLZmJBHVvorBvrTrN9Z/KHJ1bpzEKHpyM
 y4fonPHZZkCvZ/w79oU5YlW7QRIWBF4/1OhLVo2y8yebyI0XxwHtpXPqArXo6OvUsk9+
 4QZPFbHPXOOulreO4uFVfjKWDXdVpSpIJfrwzy3r03oHRj6Q4vwvyxJaYBkKDF8c3GEI
 T0YQ==
X-Gm-Message-State: AODbwcApN/accwwU/VMAeL0nwjc2i7ijyZQ1ATmyARReY/7Q2SSod9ie
 KzgpViPZx372wAqIGwwmDI3OBLeAeTSm5q8=
X-Received: by 10.223.171.77 with SMTP id r13mr18010902wrc.83.1496767965529;
 Tue, 06 Jun 2017 09:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.217.7 with HTTP; Tue, 6 Jun 2017 09:52:44 -0700 (PDT)
In-Reply-To: <1496755188.31588.21.camel@kernel.crashing.org>
References: <1496755188.31588.21.camel@kernel.crashing.org>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 6 Jun 2017 09:52:44 -0700
Message-ID: <CAPLgG=nFF1W7WjZHKX7pZQ3LunsqOf5K_SGz+okkZ_yUMyMtBQ@mail.gmail.com>
Subject: Re: [RFC] USB gadget driver for AST2x00 vHub
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c1b56b4e5dd5505514d7252"
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
X-List-Received-Date: Tue, 06 Jun 2017 16:52:49 -0000

--94eb2c1b56b4e5dd5505514d7252
Content-Type: text/plain; charset="UTF-8"

Thanks for sharing this!  I've been wanting to play with the USB device
peripherals but haven't found the time to work on the driver.  I'll try to
make time soon to read this over.

On Tue, Jun 6, 2017 at 6:19 AM, Benjamin Herrenschmidt <
benh@kernel.crashing.org> wrote:

> Hi !
>
> So I've been writing a new UDC gadget driver for the vHub from scratch.
>
> It's still a work in progress as I haven't yet implement the "hub"
> functionality yet, so it's a single device UDC driver at the moment.
>
> There are also various improvements that need to be done, but overall
> it's functional enough to give me about 200Mbit/sec off hdparm -tf of a
> mass storage fed off a tmpfs file.
>
> I'll be working on it more sporadically during the next few weeks, I
> plan to have the virtual hub functionality going at some point and
> might look into further performance improvements, but it's in a state
> where some reviews/feedback could come in handy if anybody feels like
> having a look.
>
> So for the curious, look here:
>
>   https://github.com/ozbenh/linux-ast/commits/bmc
>
> This is also to make sure nobody else is duplicating the work.
>
> (This contains *no* code from any of the existing implementations I've
> seen floating around, which have some serious issues anyway, and not
> just coding style related :-) This was written from scratch from a
> blank slate, using other upstream UDC drivers as guides).
>
> Cheers,
> Ben.
>
>

--94eb2c1b56b4e5dd5505514d7252
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for sharing this!=C2=A0 I&#39;ve been wanting to pl=
ay with the USB device peripherals but haven&#39;t found the time to work o=
n the driver.=C2=A0 I&#39;ll try to make time soon to read this over.</div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 6, 20=
17 at 6:19 AM, Benjamin Herrenschmidt <span dir=3D"ltr">&lt;<a href=3D"mail=
to:benh@kernel.crashing.org" target=3D"_blank">benh@kernel.crashing.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi !<br>
<br>
So I&#39;ve been writing a new UDC gadget driver for the vHub from scratch.=
<br>
<br>
It&#39;s still a work in progress as I haven&#39;t yet implement the &quot;=
hub&quot;<br>
functionality yet, so it&#39;s a single device UDC driver at the moment.<br=
>
<br>
There are also various improvements that need to be done, but overall<br>
it&#39;s functional enough to give me about 200Mbit/sec off hdparm -tf of a=
<br>
mass storage fed off a tmpfs file.<br>
<br>
I&#39;ll be working on it more sporadically during the next few weeks, I<br=
>
plan to have the virtual hub functionality going at some point and<br>
might look into further performance improvements, but it&#39;s in a state<b=
r>
where some reviews/feedback could come in handy if anybody feels like<br>
having a look.<br>
<br>
So for the curious, look here:<br>
<br>
=C2=A0 <a href=3D"https://github.com/ozbenh/linux-ast/commits/bmc" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/ozbenh/<wbr>linux-ast/commi=
ts/bmc</a><br>
<br>
This is also to make sure nobody else is duplicating the work.<br>
<br>
(This contains *no* code from any of the existing implementations I&#39;ve<=
br>
seen floating around, which have some serious issues anyway, and not<br>
just coding style related :-) This was written from scratch from a<br>
blank slate, using other upstream UDC drivers as guides).<br>
<br>
Cheers,<br>
Ben.<br>
<br>
</blockquote></div><br></div>

--94eb2c1b56b4e5dd5505514d7252--
