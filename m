Return-Path: <raltherr@google.com>
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMwyz3Qy3zDvgS
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 04:47:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h/JvyCMe"; 
 dkim-atps=neutral
Received: by mail-io0-x232.google.com with SMTP id n13so46282943ioe.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 09:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RxNa2zIXjnN7czpFCQ3Lkf3z9hJQaS+oJp/hnYloCIc=;
 b=h/JvyCMe0zueAgJQoxNIylLeHK6Y+tA/pdy/Adb2GA9t7N/WElxduN/S/IcDs6kH2v
 Tm0uwD05ssMcCKwKESaQqA7L1Cp51/wnZpXFCCCoeM8yLjO3kGO2mwsg20p68qk4GV7R
 DNzjqfNbESnMlctcP6SrP4f7rZCyLAQ1J+0oEoQu8y8UyEzFYESCbf/98OwG4R72LZ6a
 EA72d09CPWXt+TFkKL/+VKvwpaLNnIg5UnSbxdP8zZuA03xe8dmp3h/MlZ4QUCGUj+lF
 0ReMv51iZbSaCdZLiTt+wF3hEl+WZNiUhYQBanbRvlcyXQGX36IEdbK09gwuoISzDe+5
 HKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RxNa2zIXjnN7czpFCQ3Lkf3z9hJQaS+oJp/hnYloCIc=;
 b=PlBJUCdUTzqYzqZUE2q4M7jXx1wdAST54fRZq1EFQowgdHBVEKEb8vO+/8cpTDYvbA
 FXsxjc9IniC58DZNYl9dMHZVWfqOXQ1zpVF7TJ0jkjyFEPQ5TWw20exDhD4Y8/Lwe5s0
 n0LOKw3KOh1G6qDofez2vu8+urjLvm0pKF2OFbjTtPJyLeVXiLo/kQCCHs1GcYvVauMF
 RXlDcM/D5qc4RCAvRvqln39fvBiepxRGIyNVClVNBVirD+pcjYyphUc5v69IsRnyucVu
 FdYAaO69sQ38LjUY230Hymn9ykO3KSG0dZjbw1nOWuLQBIANd9JOsplZLIHez96pbnd9
 I57A==
X-Gm-Message-State: AKaTC0341G6G7XJvHVl4nvoXqcZ293EVNWNVny8kDW7qAWLqyygBraT3Elfvl+eO2S3pojihWkwZRaVuIuZlaWBf
X-Received: by 10.107.48.134 with SMTP id w128mr15540587iow.226.1479750424929; 
 Mon, 21 Nov 2016 09:47:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.154.197 with HTTP; Mon, 21 Nov 2016 09:47:04 -0800 (PST)
In-Reply-To: <1479703856.680.2.camel@gmail.com>
References: <1479703856.680.2.camel@gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 21 Nov 2016 09:47:04 -0800
Message-ID: <CAPLgG=nDDGpCMbP3NDDZxmFLMJV53Lc=gfoKpeUz5cFU80=oxA@mail.gmail.com>
Subject: Re: Restricting HOST flash access on OpenBMC
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>, 
 Abhishek Pandit <abhishekpandit@google.com>
Content-Type: multipart/alternative; boundary=001a114448d46fbf580541d33e19
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
X-List-Received-Date: Mon, 21 Nov 2016 17:47:08 -0000

--001a114448d46fbf580541d33e19
Content-Type: text/plain; charset=UTF-8

How does this work on non-LPC platforms?

On Sun, Nov 20, 2016 at 8:50 PM, Cyril Bur <cyrilbur@gmail.com> wrote:

> Hello,
>
> Apologies, I have been working on this in a bit of a silo and I suspect
> a lot of people will be interested to know this work is going on.
>
> The aim of my work is to provide a simple interface for the host and
> the BMC to talk in order for the BMC to give controlled access to the
> flash.
>
> At the moment, the BMC maps the host LPC bus to point to the PNOR
> directly. This may be undesirable and presents security concerns. If
> the host can be taught to request access to the flash then the BMC
> could map the LPC bus into a region of its RAM and (depending on
> policy) writes wouldn't get propagated to the actual flash. Policy
> details are for later.
>
> I developed a simple protocol to allow this exchange of information
> documented in the README.md file of the userspace test daemon I wrote
> to proof of concept this: https://github.com/cyrilbur-ibm/mboxbridge/tr
> ee/newio I will no doubt move this somewhere more suitable in due
> course.
>
> I chose to use the MBOX registers on the BMC as they provide a fast
> method of data transfer and can raise interrupts on both the host and
> BMC.
>
> The aim of sharing this now is to show that the interface works and
> that implementation independent things can start to be integrated into
> skiboot and linux. Having said that, I would appreciate any feedback, I
> have had my head in this for quite some time please let me know if I've
> missed something.
>
> The implementation is only a proof of concept, some details still need
> to be worked out, especially what happens on BMC reboot. I believe the
> interface is ok in that respect, just my implementation which is
> lacking.
>
> Do try it out if you want. Of course changes need to be made to the BMC
> kernel as well as skiboot:
> https://github.com/cyrilbur-ibm/linux/tree/newio
> https://github.com/cyrilbur-ibm/skiboot/tree/newio
>
> Thanks,
>
> Cyril
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a114448d46fbf580541d33e19
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How does this work on non-LPC platforms?</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Nov 20, 2016 at 8:5=
0 PM, Cyril Bur <span dir=3D"ltr">&lt;<a href=3D"mailto:cyrilbur@gmail.com"=
 target=3D"_blank">cyrilbur@gmail.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hello,<br>
<br>
Apologies, I have been working on this in a bit of a silo and I suspect<br>
a lot of people will be interested to know this work is going on.<br>
<br>
The aim of my work is to provide a simple interface for the host and<br>
the BMC to talk in order for the BMC to give controlled access to the<br>
flash.<br>
<br>
At the moment, the BMC maps the host LPC bus to point to the PNOR<br>
directly. This may be undesirable and presents security concerns. If<br>
the host can be taught to request access to the flash then the BMC<br>
could map the LPC bus into a region of its RAM and (depending on<br>
policy) writes wouldn&#39;t get propagated to the actual flash. Policy<br>
details are for later.<br>
<br>
I developed a simple protocol to allow this exchange of information<br>
documented in the README.md file of the userspace test daemon I wrote<br>
to proof of concept this: <a href=3D"https://github.com/cyrilbur-ibm/mboxbr=
idge/tr
ee/newio" rel=3D"noreferrer" target=3D"_blank">https://github.com/cyrilbur-=
<wbr>ibm/mboxbridge/tr<br>
ee/newio</a> I will no doubt move this somewhere more suitable in due<br>
course.<br>
<br>
I chose to use the MBOX registers on the BMC as they provide a fast<br>
method of data transfer and can raise interrupts on both the host and<br>
BMC.<br>
<br>
The aim of sharing this now is to show that the interface works and<br>
that implementation independent things can start to be integrated into<br>
skiboot and linux. Having said that, I would appreciate any feedback, I<br>
have had my head in this for quite some time please let me know if I&#39;ve=
<br>
missed something.<br>
<br>
The implementation is only a proof of concept, some details still need<br>
to be worked out, especially what happens on BMC reboot. I believe the<br>
interface is ok in that respect, just my implementation which is<br>
lacking.<br>
<br>
Do try it out if you want. Of course changes need to be made to the BMC<br>
kernel as well as skiboot:<br>
<a href=3D"https://github.com/cyrilbur-ibm/linux/tree/newio" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/cyrilbur-<wbr>ibm/linux/tree/newi=
o</a><br>
<a href=3D"https://github.com/cyrilbur-ibm/skiboot/tree/newio" rel=3D"noref=
errer" target=3D"_blank">https://github.com/cyrilbur-<wbr>ibm/skiboot/tree/=
newio</a><br>
<br>
Thanks,<br>
<br>
Cyril<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div>

--001a114448d46fbf580541d33e19--
