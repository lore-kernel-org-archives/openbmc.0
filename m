Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aqxKfgsX"; 
 dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jrmW4hrVzDq6q
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 13:42:50 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id q66so2605281ljq.7
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 20:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vYNu0Pn+9SmuQfMtlh82tPvMiZoCubM6Dg1AO0KAlTI=;
 b=aqxKfgsXedL6jsNWM7OeEjlzy1rYTanHzuZoR7L0xFOc5LruVNUR/BzC6ohZOS9wRl
 4RG6PISkG5mgoABSW2ljmWDPG3azcKpIKRFhbkBirGMpdaNjwkUG81Ljbi0FDGRp9ub6
 Rd/ZGvO25IrpakEZefZ6gPegc5tAr8HseRVO5m8eOLg77RWkOJSog9rAe9t7k8UlN8gI
 9RCXN0b3pVdMjZOOHf+5DruKfqK/EvMYCb90VI8R7mlJmqP1ugDctKegxJhugezKdzTo
 I50Z1ycTUd4BWxJQO7U+xq07UDH5kgr0P/xOcZohkBsi3Mj3PXBAYH8wm9Y621uScqQB
 AkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vYNu0Pn+9SmuQfMtlh82tPvMiZoCubM6Dg1AO0KAlTI=;
 b=a5+TS/PzWUYMwXExkvGnP1/W/CpedqZ5OHUw+5e3EkQDdAKxof6Sun/mCtsPvbpwnu
 5pJYNHVedvtvI38RH0dCG9ixUrLZ0cLPDxsmnj1qoL+/N9ZQiSsxj6t1vTMvgMd0sgFs
 xg6PWYhHVHAeQkDOigsrtDXN7oyzQeYaewewtU2zACAKUeV7xWbCGrgU4G8yK3J8Ea/F
 +HfrUJo2KWTFla2Pu0TPXyI/We97yGTc950Mu05cfzEg+FJI4xsV0ei0eoDbGD4FqIj8
 K+6ZEwSmB0/9gNClJlR9IaNdnFk5kBSFJfV0oqk84nxdr5m4IlJfv3wHkftl/cfwwWrL
 NTbg==
X-Gm-Message-State: APjAAAVBDMZViGLFMFEizZq1LARoB7fVxUyOW/0jmfEefdoe7z98UQi2
 qdBifrbp8sECni1X5MQNDk9AgxNrfd/WTUgUJHmklg==
X-Google-Smtp-Source: APXvYqw83eNpmIHda5gLFBS2qYUMIgDhlS3PxV1DompwPAgspiax7PEYmDXcDIO2V1l0XgL3XvFYFJNh3A0C6/ZwNDU=
X-Received: by 2002:a2e:1245:: with SMTP id t66mr42375912lje.18.1555386162894; 
 Mon, 15 Apr 2019 20:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <81e4866b111a47d991f767df3c6b4b0a@quantatw.com>
 <CAO=notw_E+LJJ5jMmdACajshiTebufgZgwDOGa6op8f1-Phkxw@mail.gmail.com>
 <beecc86d0b8d41b88a96a8b06846a28f@quantatw.com>
In-Reply-To: <beecc86d0b8d41b88a96a8b06846a28f@quantatw.com>
From: William Kennington <wak@google.com>
Date: Mon, 15 Apr 2019 20:42:32 -0700
Message-ID: <CAPnigKkeN-KgA8Qfj4jq0YHwnbMKyQsQqcq-a3JkbCYqv19Ntg@mail.gmail.com>
Subject: Re: Sending I2C command via google-ipmi i2c
To: =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Cc: Patrick Venture <venture@google.com>,
 "emilyshaffer@google.com" <emilyshaffer@google.com>, 
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>, 
 "OpenBMC Maillist (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>, 
 "benjaminfair@google.com" <benjaminfair@google.com>
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
X-List-Received-Date: Tue, 16 Apr 2019 03:42:52 -0000

OEM commands currently don't work in host-ipmid. I'm testing a bunch
of random fixups to ipmid to get this kind of stuff working again
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/20622

On Mon, Apr 15, 2019 at 8:39 PM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
<George.Hung@quantatw.com> wrote:
>
> > -----Original Message-----
> > From: Patrick Venture [mailto:venture@google.com]
> > Sent: Friday, April 12, 2019 10:23 PM
> > To: George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)
> > Cc: OpenBMC Maillist (openbmc@lists.ozlabs.org); Patrick Venture
> > (venture@google.com); emilyshaffer@google.com;
> > benjaminfair@google.com; vernon.mauery@linux.intel.com;
> > tomjoseph@in.ibm.com
> > Subject: Re: Sending I2C command via google-ipmi i2c
> >
> > On Thu, Apr 11, 2019 at 10:46 PM George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC)
> > <George.Hung@quantatw.com> wrote:
> > >
> > > Hi all,
> > >
> > >
> > >
> > > I=E2=80=99m trying to sending ipmi I2C command via google-ipmi-i2c ex=
tension,
> > >
> > > but I will get the response error, =E2=80=9CUnspecified error=E2=80=
=9D from ipmitool.
> > >
> > >
> > >
> > > There are the command and response example below:
> > >
> > >
> > >
> > > # ipmitool raw 0x2e 0x02 0x79 0x2b 0x00 1 0 0x98 0 1 0 0x99 0 2
> > >
> > > Unable to send RAW command (channel=3D0x0 netfn=3D0x2e lun=3D0x0 cmd=
=3D0x2
> > > rsp=3D0xff): Unspecified error
> > >
> > >
> > >
> > > I check the error message from journal and it indicates that cannot o=
pen
> > /dev/i2c-121 and I think it used the first byte of IANA number (0x79) a=
s bus
> > number.
> >
> > I have a little breakout I use:
> > ipmitool -I dbus raw 0x2e 0x05 0xcf 0xc2 0x00 0x00 0x02 0x00 0x00 0x00
> >                                  |--|    |--|    |------------|
> > |----------------------|
> >                                  |       |        |
> > |   reqBuf
> >                                  |       |        | oem group
> >                                  |       | command
> >                                  | netfn for oem
> >
> > So 0x2e is the netfn, properly parsed.
> > So 0x02 is the command, properly parsed.
> > So 0x79 0x2b 0x00 is the OEM group
> > So 0x00 1 0 0x98 0 1 0 0x99 0 2 is the command payload
> >
> > As you say, it sounds like there's a bug in parsing the length of the O=
EM group
> > number.  We haven't rebased onto the newest ipmid downstream, so we
> > haven't tested it ourselves.  But this sounds like a bug in the new ipm=
id.
> >
> > IIRC, they weren't properly handling OEM groups and recently fixed it.
> > Please specify the SHA1 of the phosphor-host-ipmid source you're using =
to
> > build this.
>
> SHA1 Revision: c46f6cd7dc47ccafcd2e86e160a32fe1be404e7e
>
> >
> > >
> > >
> > >
> > > Has anyone ever met this situation ? or something I have to configure=
 for
> > phosphor-ipmi-host / google-ipmi-i2c ?
> > >
> > >
> > >
> > >
> > >
> > > Best Regards
> > >
> > > George Hung
>
>
> BRs
>
> George Hung
