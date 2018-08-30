Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::244; helo=mail-io0-x244.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YoE/+KGo"; 
 dkim-atps=neutral
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421KJx0WpwzF37n
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 21:00:16 +1000 (AEST)
Received: by mail-io0-x244.google.com with SMTP id w11-v6so7175505iob.2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iYIA8ZN6LOFahXMhBhxrS1NMXaQGnRPdZt/fk8kV9vI=;
 b=YoE/+KGoecwIlg4NSeiyyJpsMd51H6MuAyU3QtJ9JUvJrEeMP2g2kvYitUyd6uOuhG
 a0ALHrqHOTeHun9/5Q5RIc9+8MvYqMTFZhYEkGllbL7jmCU5Wa+1568ZD/TgIYDJs1Ez
 nDdfd+3SCSoGuD/MIdBFObtoxx9lNDT/PnX0GYlP2/Q/AZ90+DgPDLO4ltuuYuv+ErEz
 7v3k5XA4pVQ4Oy4/uptaatxQPPjev2YIuwW6rt/qxBSnYF9FrxXkrX2lVh0r+hOXsRnr
 oI5xej+kP83CVqs6VwMcURhf342dfJ76nOqL4g3hFuvxQjLbBHmwquwCAJagCnpb7q77
 2hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iYIA8ZN6LOFahXMhBhxrS1NMXaQGnRPdZt/fk8kV9vI=;
 b=qEfuz2/uQgpOH26MtgI97VeVrc2FbiN3klC8Qz5vsE43MAkoMb9C2wSWR5YwwAbfi3
 SaFHah+M96sj4/dGhdBjioqDidQbUUFGvoagjFb9H4gy8Dl3UBSU0w4axSAVgV3QJ+9i
 SbGC+pPyGvZcOgD/O1DVRXx3GJY23LLf0chFsYkyA3J3xBCszQklcfzHFmYOtSjN74TO
 6SoTLLwnYd8nsXmmwjDJhd8Ekezwj7ATpeKufTajcnzfMX7f5VVwsDzumkhAttbSsVUg
 /JJuQLiQ5gFypCNi3hBUsH33wBCjra/0PJq52YQcRlYJduwZX8JWo7UZYWjqGkkDFikR
 ijbQ==
X-Gm-Message-State: APzg51Dk2vRUQ5H3J5PYW9Q20Mk5iSyRVq08Fi2AGc3Ma0NmWgHz/8gp
 nEfaulcfkKAnYChrBa+AcH95WNKGEpS10PLC/w==
X-Google-Smtp-Source: ANB0VdYlkVAImeBoN+wCEdHOslzvfqyMwB39x9L/G0uJ0Kd3BOtKOZ9lf9INDn0cPspSeTlziLPz7smZLba6UxNYPiQ=
X-Received: by 2002:a6b:3451:: with SMTP id
 b78-v6mr8492155ioa.214.1535626814752; 
 Thu, 30 Aug 2018 04:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
 <3d92122e8c42452caee0ece1769ee147@NTHCML01A.nuvoton.com>
 <7E9441B1E5EFFD4681F54958E821699345835D1C@ORSMSX114.amr.corp.intel.com>
 <b5c3a139-b2a4-6a35-9ff8-b5b43ade5086@linux.vnet.ibm.com>
In-Reply-To: <b5c3a139-b2a4-6a35-9ff8-b5b43ade5086@linux.vnet.ibm.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 30 Aug 2018 13:59:56 +0300
Message-ID: <CAKKbWA41mE22yQg0u40aTSo2ck__CeVXTcWmzi0wyZk+wr==jA@mail.gmail.com>
Subject: Re: KVM Support?
To: eajames@linux.vnet.ibm.com
Cc: Ed Tanous <ed.tanous@intel.com>, KWLIU@nuvoton.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, uri.trichter@nuvoton.com,
 eyal.cohen@nuvoton.com
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
X-List-Received-Date: Thu, 30 Aug 2018 11:00:18 -0000

On Mon, Aug 27, 2018 at 7:24 PM Eddie James <eajames@linux.vnet.ibm.com> wr=
ote:
>
>
>
> On 08/27/2018 10:59 AM, Tanous, Ed wrote:
> >> Do you have any plan to support non-jpeg video stream in obmc-iKVM?
> > I'm not sure about Eddie, but I don't think we have  a need for non-jpe=
g kvm.  With that said, everything is just running RFB underneath, so basic=
ally anything should be possible that's possible over VNC.
>
> Right, we also don't have any need for non-jpeg at the moment.

note that Nuvoton HW support Hextile compression so this should stay
on the table.

>
> >
> >> It is possible some platforms don't have hardware JPEG engine, instead=
 have
> >> the RGB video stream.
> >> If possible to support RGB video stream, I think it would be better if=
 you can
> >> add the video frame differentiation in obmc-iKVM because we don't need=
 to
> >> send the full screen to VNC client on every request, it can reduce the=
 buffer
> >> size at least. (libvncserver already has the video frame differentiati=
on)
> > While I agree it would be nice, I don't think it's a priority 1 for imp=
lementation (at least for us).  Our current AST2500 products send full buff=
er updates for every frame, and while in theory it's less efficient, we hav=
en't really gotten any complaints.  With that said, if differential mode is=
 available and works well, I'm sure we'd use it.
>
> The problem with differential compression is that you have to do that
> decoding work on the BMC so that you update the right part of the
> framebuffer. I didn't get that working but might be some performance
> concerns there... So same for us, it's not a priority right now.
>
Nuvoton chip does support tiles differerential by HW so for us it
doesn't have a performance effect nor high CPU utilization, so again
this should option should remain.

> >
> >> Also, I have implemented a KVM application for our platform(nuvoton ev=
b-
> >> npcm750) which has hardware video frame differentiation and hardware
> >> hextile engine.
> >> https://github.com/Nuvoton-Israel/obmc-ikvm
> >> https://github.com/Nuvoton-
> >> Israel/linux/commit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d
> >>
> > Cool.
> >
> >> I also enabled ED's KVM webui and added kvmws proxy in python web
> >> server.
> >> https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-
> >> addon/commit/140771b7e898dd5ca8f0364290cce669609088ac
> >>
> > I've got patches for bmcweb as well that I can get posted today.  I was=
 really hoping to have a discussion around how we want to implement the web=
 portion beforehand, but it looks like you've already done a lot of work, w=
hich is great.
> >
> >> Regarding the larger binary size, I think we need to review all config=
urations
> >> of libvncserver and check which functions should be disabled.
> >>
> > I think the most important question here is how small of a binary we ca=
n get out of libvncserver, and whether or not we can afford to have an unau=
thenticated socket open with full control of the host system.
>
> All good points. These aspects haven't been a priority for me yet, and
> I'm really not an expert with security or bmcweb, but definitely worth
> some discussion.

From our point of view it is OK to remove some libvncserver features
like security or so as long as the hextile compression and frames
differential for video stays to be used by our HW acceleration.

>
> Thanks!
> Eddie
>
> >
>


--=20
Regards,
Avi
