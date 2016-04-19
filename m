Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqJ2X0zJwzDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 07:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cNveCqnQ; 
 dkim-atps=neutral
Received: by mail-wm0-x242.google.com with SMTP id e201so6020790wme.2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc:content-transfer-encoding;
 bh=fqoS0G8h8sUvzo+lmylnfVmsogGLipj6afXiH5nUu5A=;
 b=cNveCqnQxQC00Siy/jipjUCpPDm6/PplLV9vR6/slcxY3drsUUvcYQhW7V8yieC0fN
 EPpzGOvHm+SQbSf3gB7WlIqnN+DWJrs1DZVUyunbXo9F0DDbJGvuBpEl32BLYST4fNE9
 PGQdeJVrJsIOkeZj8yeDN3B8EfoCaclmylLRwNUKtHb0kdjzJxZKzTcclnQg3OBEVJ4e
 Y8dbh2F9G9REdb8VrZ5nUAngU+9vSwuwUCap8eYgVFWfH1RrKjoKg1BpXWahdK3oAXCi
 ATrdSuj9wSylXJr7kIyqsnGFssNi5/LJyqPVAyX/y7m1UunQU8zah9/va+Z6NTB+oUC2
 DHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:date
 :message-id:subject:from:to:cc:content-transfer-encoding;
 bh=fqoS0G8h8sUvzo+lmylnfVmsogGLipj6afXiH5nUu5A=;
 b=KHG8xHg2if/32yFIHfpbblzO4MQZjHoVknTjrq5wJ+0JNRsOvB1Pii3qYSl1FsBOeH
 2SkmfbEo9gtt/3PTB5wcZYf2dfROe4HQseVbRjmaygFRvAqurHwNmfqTc1kF9FkJ8qaD
 bOfNekRtpXHaPXawXj/pJo10ORaCiJ5VRJCaz8lpA4wDK6+FMWOu+nvgB0NV8Qv3eDX2
 D4bYcOCRkqsI1Jly473/IAKQemd9ab2ERJLKSTX3qMGH8dqqf4XEiNTIuO56fqkrg6N2
 Rwb4hMbh01+fI18M5o7Lup7+HFNlMyGEBGMJk+WQ3lKGdOKYM64FihBNaNt3PSi6r5Ep
 HfQQ==
X-Gm-Message-State: AOPr4FVwD4ucJqQgIwILJAyHpqaxg1iMWLSDQjIsqlZSJPH1MJFgm4EX37Zwr4BXbge/6g==
X-Received: by 10.28.216.14 with SMTP id p14mr5461034wmg.20.1461101120077;
 Tue, 19 Apr 2016 14:25:20 -0700 (PDT)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com.
 [74.125.82.45])
 by smtp.gmail.com with ESMTPSA id hk7sm2189525wjb.5.2016.04.19.14.25.19
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Apr 2016 14:25:19 -0700 (PDT)
Received: by mail-wm0-f45.google.com with SMTP id n3so51363915wmn.0
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:25:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.28.141.18 with SMTP id p18mr5435358wmd.57.1461101118928;
 Tue, 19 Apr 2016 14:25:18 -0700 (PDT)
Received: by 10.194.94.163 with HTTP; Tue, 19 Apr 2016 14:25:18 -0700 (PDT)
X-Originating-IP: [2620:10d:c090:200::9:b74f]
In-Reply-To: <201604192100.u3JL0ERU001593@d03av03.boulder.ibm.com>
References: <201604191645.u3JGj1BD018480@d03av04.boulder.ibm.com>
 <201604192100.u3JL0ERU001593@d03av03.boulder.ibm.com>
Date: Tue, 19 Apr 2016 14:25:18 -0700
X-Gmail-Original-Message-ID: <CADUykerH0Z+NgSRqRm8hgccRPpPc1mh6uCcxyTfEPoa3DX+D9g@mail.gmail.com>
Message-ID: <CADUykerH0Z+NgSRqRm8hgccRPpPc1mh6uCcxyTfEPoa3DX+D9g@mail.gmail.com>
Subject: Re: Several general questions
From: Teddy Reed <teddy.reed@gmail.com>
To: Chris Austen <austenc@us.ibm.com>
Cc: Norman James <njames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 21:25:26 -0000

On Tue, Apr 19, 2016 at 2:00 PM, Chris Austen <austenc@us.ibm.com> wrote:
>
> I semi answered the rest.  Hoping Teddy or others can really address #5
>
>
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
>
>
>
> ----- Original message -----
> From: Norman James/Austin/IBM@IBMUS
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org=
>
> To: Shay Slobodkin <shays@mellanox.com>
> Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Subject: Re: Several general questions
> Date: Tue, Apr 19, 2016 11:45 AM
>
>
> I answered 1, 3, and 6
>
>
> Regards,
> Norman James
> IBM - POWER Systems Architect
> Phone: 1-512-286-6807 (T/L: 363-6807)
> Internet: njames@us.ibm.com
>
>
> Shay Slobodkin ---04/19/2016 10:12:49 AM---Hi, We have some general
> questions from our latest experience with the project:
>
> From: Shay Slobodkin <shays@mellanox.com>
> To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> Date: 04/19/2016 10:12 AM
> Subject: Several general questions
> Sent by: "openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>
>
> ________________________________
>
>
>
> Hi,
>
> We have some general questions from our latest experience with the projec=
t:
>
> 1. We saw some corresponding about out of the box experience and we were
> wondering how does the BMC should be burnt for the first time in producti=
on.
> Currently we have limited speed of debug UART on AST2520, also Aspeed
> recommend to use this interface for debug purpose only. We also faced a
> problem to burn BMC using Abatron BDI3000, does anyone have experience
> working with it?
>
>>> For the first time flash, an external SPI flash programmer is usually
>>> used. The DediProg SF100 works with no issues.
>
>
> 2. Several u-boot versions were mentioned this week at mailing list, we
> currently use u-boot based on 2013.7 with porting AST2520 stuff from Aspe=
ed
> EVB u-boot. Can you suggest a u-boot version to merge with?
>
>>> CA: Stay with the Teddy/Joel talk as it seems like they are just a coup=
le
>>> of weeks away from getting us up to 2016.03.
>
>
> 3. Is there some standard method performing BMC upgrade on site from host
> CPU? Is there a best practice of upgrade granularity? Meaning, do you
> suggest to upgrade whole image or maybe just specific partition (only DTB
> for example)?
>
>>> When flashing from the host, we do no currently support a partial
>>> upgrade. We boot the BMC into a mode where it doesn't use the flash
>>> filesystem and then use SOCFlash from Aspeed. You can reboot the BMC in=
to
>>> this special mode with ipmitool from host CPU. Through REST, we do supp=
ort
>>> upgrades of kernel, readonly filesystem, rw filesystem, and uboot
>>> separately. In the deploy directory, the image-* files are for this and
>>> packaged up in the tar.
>
> 4. We saw that most openbmc systems are using jffs2 file system. We thoug=
ht
> to use ubifs as it has some advantages over jffs2. Can you share the
> motivation of using jffs2 for BMC project and is there special reason for
> doing so?
>
>>> CA: simply because jffs2 was designed for flash file systems, it was
>>> known, we knew how to work with it.  Ubifs has some nice wear leveling
>>> support and that was not something we needed to be concerned about with=
 our
>>> use of PNOR flash.  We did not perform any review of ubifs, so it seems
>>> reasonable to think (barring flash image size) that ubifs could be used
>
> 5. Some Aspeed EVB drivers such as USB, PWM were not ported to openbmc
> kernel tree yet. We were planning to port them and wonder if there is any
> special reason they weren=E2=80=99t ported yet.
>
>>> CA: The only reason why they were not on the AST2400 was because we nev=
er
>>> used them.  I suspect another company on this distro does already have
>>> versions of the USB (and maybe PWM?) for the 4.1 kernel.  Joel is worki=
ng to
>>> get the AST2500 Kernel up to 4.4 however the priority for USB and PWM i=
s
>>> likely lower.  If you are pushing towards support for them on the 4.4 K=
ernel
>>> work with Teddy and his group for the design beyond basic operations.
>

I don't think we're using either, but I'm not 100% certain that all
boards wont need USB or PWM. I can check and get back to you, in all
cases it's very difficult for us to submit patches upstream. The best
I could offer is testing. :)

>
> 6. Building the project yields a lot of files under the =E2=80=9Cdeploy=
=E2=80=9D folder of
> build. We were wondering which files to use for simply flashing a system
> (using flashcp?) and which should be used for production.
>
>>> flash-[system_name] can be directly flashed with the a programmer,
>>> SOCFlash, or flashcp.
>
> Thank you for your assistance,
> Shay
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>



--=20
Teddy Reed V
