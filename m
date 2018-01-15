Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::231; helo=mail-qk0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DXo+Safu"; 
 dkim-atps=neutral
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zL3Dx0sPgzF0RD
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 06:24:00 +1100 (AEDT)
Received: by mail-qk0-x231.google.com with SMTP id a5so15286448qkg.10
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 11:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=/9VgzuKLp6LmGmQTvTNilzbGvHvz8zMMQ/cpmP847T8=;
 b=DXo+Safuh+4gH90Qzs9PjbeiFLBzDxcg1iBId+2M3qHQYmeHV2Y0v1/nGmZejOxrgJ
 PqVsfJdFSBNa5swgbUoHUSVOTnJsHP3RzQCWaBy91JuNjwUCfQmPl3iPpcWtIptWWB0p
 px7F86djuHKRmCWl0sWHm6VUQkGxvT3gpLUYVGp/SGxhafP3G4ecZBDQp2IYdNMqr0+1
 eHU7HCKjzAHjDhUWHDccFVe/exH1GibWQGbqG61mGq1wZNI8JNU/UcW7E7QdHr9yCvhS
 V5wENstI3A2b7IuiXxxLuNBckqdgTFmsJ+jXniIlmmXKMk4b+MoS8VFSbHJgXIopThhs
 xtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=/9VgzuKLp6LmGmQTvTNilzbGvHvz8zMMQ/cpmP847T8=;
 b=skwmMJSeDmPuzOAonUTyxgtVf43X06+eJH3MeGUSnp/0oPnXEqAAob1WUUJhnjmW6I
 c6uSWcuxwWuhaxCCVqQZIs8V/YNLATGpa+/EMl/OzF0OyCk5gR5DOPQdvA+8eMSVoFhe
 NvolY5bV/2JYI7fGVHWrc9Q6ALSLScXP/m/DhkJ18fG0UUG8f+XHVpYO2JE+ITKevhzI
 8netjI7CQnjWfFKZuCy3CHH2FO/MUGwCc6PFNrTuGemlJbpTdeFIm4XKeCUb0V6MeKMF
 q5CqPlYlBpgosUBvn2SRPPDJYymPv6ZRYHZY68BU/Ug694TYrcUYEzZSiPd2+aDw5ubL
 2cbQ==
X-Gm-Message-State: AKwxytfIzm3EozahgjweJ1wigcAL0xcCbOE2nlSdxgz/66zaEkccK3Qp
 hMm8ZutbTWzqBfE3rnofwbbmDpI4GuZun+icGH4=
X-Google-Smtp-Source: ACJfBostW4DPL2cK3zWVt8QZryTEEP2LE6vPhwW/G90VBW8g+jg+iqGf6QvxnhcEtWdTYBA2frte3wzQ8ZGYrenBC7g=
X-Received: by 10.55.182.2 with SMTP id g2mr47216720qkf.273.1516044237924;
 Mon, 15 Jan 2018 11:23:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Mon, 15 Jan 2018 11:23:37 -0800 (PST)
In-Reply-To: <703062ea845f4553be9065a2d5b6eb61@ausx13mpc109.AMER.DELL.COM>
References: <703062ea845f4553be9065a2d5b6eb61@ausx13mpc109.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Jan 2018 11:23:37 -0800
X-Google-Sender-Auth: -cD3EGmgi1LzV3rND5B-DfQjZXY
Message-ID: <CACPK8XeVo23u+o55tu0YW_eT8ncZjBmVhisFpCbBNCvoJ7h7Vg@mail.gmail.com>
Subject: Re: Issue with flash space overflow? Maybe?
To: Balaji.B.Rao@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 19:24:01 -0000

On Mon, Jan 15, 2018 at 8:57 AM,  <Balaji.B.Rao@dell.com> wrote:
> On Palmetto, when I flash a build, I get this error. Netboot from the sam=
e
> image works, however when I flash by copying the static.mtd image, I see
> this issue. I=E2=80=99m trying to add a bunch of python packages to the b=
uild. Could
> it be a flash space issue? Please advise if anybody has any thoughts on t=
his
> and how this can be overcome?

> [    8.060000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
> found at 0x0000000c: 0x6a89 instead

You need to ensure the JFFS2 kernel options are the same for both your
netboot and flashed kernels. The warnings you see below about
jffs2_scan_eraseblock are due to a mismatch between the settings.

Cheers,

Joel
