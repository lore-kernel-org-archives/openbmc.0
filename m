Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=69.89.23.142; helo=gproxy4-pub.mail.unifiedlayer.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="T4clK/RN"; 
 dkim-atps=neutral
Received: from gproxy4-pub.mail.unifiedlayer.com
 (gproxy4-pub.mail.unifiedlayer.com [69.89.23.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 419H2C6TH8zF0fX
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 04:44:51 +1000 (AEST)
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
 by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id 298581763D5
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 12:44:47 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id VLcVfO0lqSrODVLcVfpiRb; Tue, 19 Jun 2018 12:44:47 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:
 In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=oTVpb30IDwlMnwK0A2rXVhRD5+hQN4HsgjBnDfLiR2I=; b=T4clK/RNSnrva+CiVY48urNALJ
 dUIfR98fXL8xtfPIy9l3EMdCDiPlALzm3OadRe9Apn6usYLUaamj9UArilXpOCACj0/l6QkoZN+gk
 +Mc9dNoDmbrwiE7NuNoW9ht1Y;
Received: from mail-ot0-f178.google.com ([74.125.82.178]:34089)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89_1) (envelope-from <aaron_ppus@fmad.com>)
 id 1fVLcU-0049Xp-Up
 for openbmc@lists.ozlabs.org; Tue, 19 Jun 2018 12:44:46 -0600
Received: by mail-ot0-f178.google.com with SMTP id r18-v6so860658otk.1
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 11:44:46 -0700 (PDT)
X-Gm-Message-State: APt69E1iYT3fegsadiZiAdIbLG2QAasoSNus7sbwZg6X80i5BsNUzDeT
 RgpM6tnekkiNRniAqHJ0UGnO0K2fdk2IxHUdIw==
X-Google-Smtp-Source: ADUXVKIJizl2L8XROTqMqZufREjjgoQkHsYUhSgFHQpEinanWXda5lo+nb1314rgZS4MfrSmjYa7VIwKosi9NBBDOWs=
X-Received: by 2002:a9d:538a:: with SMTP id
 w10-v6mr10283346otg.30.1529433886484; 
 Tue, 19 Jun 2018 11:44:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:7591:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 11:44:46
 -0700 (PDT)
In-Reply-To: <CAARXrtmU-kfvyyWWbmM47AHoD5219bGnqgNTNY7O8JakvVt9XA@mail.gmail.com>
References: <CABq4n+T4aZ+iPerYDOrh8KJ09rxyUC96h-Qhvvznjz0AQuQ7Rg@mail.gmail.com>
 <CAARXrtmU-kfvyyWWbmM47AHoD5219bGnqgNTNY7O8JakvVt9XA@mail.gmail.com>
From: Aaron <aaron_ppus@fmad.com>
Date: Wed, 20 Jun 2018 03:44:46 +0900
X-Gmail-Original-Message-ID: <CABq4n+SRBLfsp+_U14DzjkaC88tHEwJAxpnw2E-UAWXnur7QSg@mail.gmail.com>
Message-ID: <CABq4n+SRBLfsp+_U14DzjkaC88tHEwJAxpnw2E-UAWXnur7QSg@mail.gmail.com>
Subject: Re: Netboot full image loading AST2400
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000082f0a2056f031368"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 74.125.82.178
X-Source-L: No
X-Exim-ID: 1fVLcU-0049Xp-Up
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-ot0-f178.google.com [74.125.82.178]:34089
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 6
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
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
X-List-Received-Date: Tue, 19 Jun 2018 18:44:52 -0000

--00000000000082f0a2056f031368
Content-Type: text/plain; charset="UTF-8"

Nice thanks. Kind of curious why alot of the AST2400 BMC images limit RAM
to 210MB or so. Perhaps its so you can load the full image in the reserved
ram?

On 19 June 2018 at 11:17, Lei YU <mine260309@gmail.com> wrote:

> > It seems like there would an easy way to do this for
> development/bringup, asking instead of hacking on the code for a change.
> >
> > Im bringing up a system by loading an image via u-boot across the
> network into the upper section of ram, then booting from there. It
> relocates itself to the reset vector and generally works well.
>
> You could refer to
> https://lists.ozlabs.org/pipermail/openbmc/2017-December/010264.html
> for TFTP kernel + NFS rootfs boot.
>

--00000000000082f0a2056f031368
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nice thanks. Kind of curious why alot of the AST2400 BMC i=
mages limit RAM to 210MB or so. Perhaps its so you can load the full image =
in the reserved ram?</div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On 19 June 2018 at 11:17, Lei YU <span dir=3D"ltr">&lt;<a href=3D"=
mailto:mine260309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; It s=
eems like there would an easy way to do this for development/bringup, askin=
g instead of hacking on the code for a change.<br>
&gt;<br>
&gt; Im bringing up a system by loading an image via u-boot across the netw=
ork into the upper section of ram, then booting from there. It relocates it=
self to the reset vector and generally works well.<br>
<br>
</span>You could refer to<br>
<a href=3D"https://lists.ozlabs.org/">https://lists.ozlabs.org/</a><wbr>pip=
ermail/openbmc/2017-<wbr>December/010264.html<br>
for TFTP kernel + NFS rootfs boot.<br>
</blockquote></div><br></div>

--00000000000082f0a2056f031368--
