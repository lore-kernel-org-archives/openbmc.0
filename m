Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bWU+TA0a"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gg9p1hlkzDqSl
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 00:23:41 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id t16so5231119plo.0
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KbiISPbH7Jqiwf8En4lh3iez9OQxxAQepHS7FZwZi2g=;
 b=bWU+TA0aihG8mahiwokpJo7t+sYnO1ebKp2vpu2JIrHBvWJz2LZwzovdGLvD0+shP4
 C0kVMcpc0YaYoJtdw73XsTZNrqIHx7dOg/2tocDaM/dI5GTMtwFKIAm/CO2J79rcXJxn
 OQ74JHurNyH3oT5F0zqvvd7vOJAd5cx2kd4TAaN+m5+Za724xwC/YSAF+gTltBs6kSTZ
 hjN54+6S0TfqoYPfE+L+fa5SWO4DjNVD+O6gPzce1sU5XGkPrBHkNhI19QWwa7elk3VO
 B8R6C6LcJlOB1/VVJkeYZb8nR0fQJ4605r0H2FrL3/f6lIYGgZg/1G+RX3hp7fRYpTBt
 0A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KbiISPbH7Jqiwf8En4lh3iez9OQxxAQepHS7FZwZi2g=;
 b=pA5He1ASzXZNakHCtGmtcSzo1fC6SBtCSe94n9SgGnqGpWJcim5YAz+njsi6vDXALG
 o3VnNhBu5KYEuQF93hXKKa6cCguD4SgTvCY9GsluvnB4lHUzKLW9hTC/jDx/le6lYlhG
 FrSo4fRoE+ycmdDqM99bF+Qv4/hFjdLKCLrf/oNVof3jL5dezGrKpHQQYb0yCZnJiqJZ
 K4KLanqClbw7fKX3lRfXXsgkzKnHFOb+Zy9+ON+MGh7dgWzUvWoiCei6NOHcPBfj0Yav
 7GQwFHCx7j5EVhzTYZauPWjGwg4+/4kj9E/yea61YTzFKNoMSW1o+iHY4lqTqhMqLwP9
 Okkg==
X-Gm-Message-State: APjAAAXEr7ccHACmni12NGCyGYqg+aN/U1bdWtKm0i2+fCZNPUg3223F
 hBbwVcXTYniSYjSi4CUyesncq3sCf/GJvgqs3+dd6A==
X-Google-Smtp-Source: APXvYqwbQkwmbZXj7gyC1V6u5gAyjZMVTFEJvDhkw5A5vV4XibvRpYpddPNT4oKgtBLUoXRh/lgEYA5kgwFp01P4qvo=
X-Received: by 2002:a17:902:854c:: with SMTP id
 d12mr10423253plo.150.1555079017158; 
 Fri, 12 Apr 2019 07:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <81e4866b111a47d991f767df3c6b4b0a@quantatw.com>
In-Reply-To: <81e4866b111a47d991f767df3c6b4b0a@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 12 Apr 2019 07:23:25 -0700
Message-ID: <CAO=notw_E+LJJ5jMmdACajshiTebufgZgwDOGa6op8f1-Phkxw@mail.gmail.com>
Subject: Re: Sending I2C command via google-ipmi i2c
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Cc: "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>, 
 "Patrick Venture (venture@google.com)" <venture@google.com>,
 "emilyshaffer@google.com" <emilyshaffer@google.com>, 
 "benjaminfair@google.com" <benjaminfair@google.com>, 
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 tomjoseph@in.ibm.com
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
X-List-Received-Date: Fri, 12 Apr 2019 14:23:43 -0000

On Thu, Apr 11, 2019 at 10:46 PM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> Hi all,
>
>
>
> I=E2=80=99m trying to sending ipmi I2C command via google-ipmi-i2c extens=
ion,
>
> but I will get the response error, =E2=80=9CUnspecified error=E2=80=9D fr=
om ipmitool.
>
>
>
> There are the command and response example below:
>
>
>
> # ipmitool raw 0x2e 0x02 0x79 0x2b 0x00 1 0 0x98 0 1 0 0x99 0 2
>
> Unable to send RAW command (channel=3D0x0 netfn=3D0x2e lun=3D0x0 cmd=3D0x=
2 rsp=3D0xff): Unspecified error
>
>
>
> I check the error message from journal and it indicates that cannot open =
/dev/i2c-121 and I think it used the first byte of IANA number (0x79) as bu=
s number.

I have a little breakout I use:
ipmitool -I dbus raw 0x2e 0x05 0xcf 0xc2 0x00 0x00 0x02 0x00 0x00 0x00
                                 |--|    |--|    |------------|
|----------------------|
                                 |       |        |              |   reqBuf
                                 |       |        | oem group
                                 |       | command
                                 | netfn for oem

So 0x2e is the netfn, properly parsed.
So 0x02 is the command, properly parsed.
So 0x79 0x2b 0x00 is the OEM group
So 0x00 1 0 0x98 0 1 0 0x99 0 2 is the command payload

As you say, it sounds like there's a bug in parsing the length of the
OEM group number.  We haven't rebased onto the newest ipmid
downstream, so we haven't tested it ourselves.  But this sounds like a
bug in the new ipmid.

IIRC, they weren't properly handling OEM groups and recently fixed it.
Please specify the SHA1 of the phosphor-host-ipmid source you're using
to build this.

>
>
>
> Has anyone ever met this situation ? or something I have to configure for=
 phosphor-ipmi-host / google-ipmi-i2c ?
>
>
>
>
>
> Best Regards
>
> George Hung
