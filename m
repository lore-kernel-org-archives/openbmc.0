Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22e; helo=mail-io0-x22e.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PJvlSEOw"; 
 dkim-atps=neutral
Received: from mail-io0-x22e.google.com (mail-io0-x22e.google.com
 [IPv6:2607:f8b0:4001:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtY9p0nsbzDrV9
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 08:29:33 +1000 (AEST)
Received: by mail-io0-x22e.google.com with SMTP id w94so4207662ioi.7
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GmTV2Z8imBiTinX1xtf9bCW6kFWzkqvBYgdz1fJXLUo=;
 b=PJvlSEOw2MOCl6EAiCJ/nyt43rYDiBRS15A31PCHH9X1zdacYo6iLNLU/KcURB93Z+
 eBMbGC1J92IDW62TVAptNBXgzmsQVvsw0EXTnB/U0PoVVERzPbz+mB4Rt/bRncvx9Bua
 RWG/j3uUJ4hLXASYtTUV4j+iERi/c+/BhuP+K1+gb2ruQhq7Nu+ltdMvtpn/21Kpd1vq
 d+TjBjPwLEDQVl3OSbMN5R789rMQGVytuqthwDR7A9sOsI3rtfSCYrenJi25e6YsT2Vz
 ZvtOyO2HzEb+ZuFuTgxkwmJePYg+5jqsqd28Zo8/QvanNiWwIYhaBay4KhIP8Vbb1sWo
 RJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GmTV2Z8imBiTinX1xtf9bCW6kFWzkqvBYgdz1fJXLUo=;
 b=G0bobQgZZufwLCT4qpjN+4qzF0/ejZwI/oWlgSapfmvx1zsOI16xxzGwP6Jybv28K5
 tWhQ0k0+4sJX1THcQN1WgEBAbd3ZEnydl35C+2vv8NfKhJJIbXDLsislGcs0/b4vN+nB
 dWSNM7mLlqqTMMr9zylqs8m+NE/adqRMD975j9m261pCl5F9VU2u4IXkkpilO3skx8VG
 aZJNnxF0Jlh1lDKG9tE1HsWWiLyREDbmc3ZqMVBYXZNIFb63Fh+vw5RUO9KY0XqnNQw/
 UZvMQcSjw4UJQZGhhKH5bSF7fmYJzAFH0j8swSYuY5bDUppX/KL35zIi7TTwLEOpK433
 9e2A==
X-Gm-Message-State: AHPjjUgO9//5zwKqDO1ogZsxarJQ5yHEWf4zWXDUX8RQHj9gbMqF6+tO
 TRkNxPAAol0husE+2OVLRbpufwujJ5JVFwaER9OPLg==
X-Google-Smtp-Source: AOwi7QAjB+ii9vvXq3vHSX2d399I4CyY1Bp/QQUiUDlFkhPQ+uEcHzQJqJNyjJS9FUW4iouz/tUCiUIYJq05WzhweTw=
X-Received: by 10.107.174.97 with SMTP id x94mr5684619ioe.114.1505428171511;
 Thu, 14 Sep 2017 15:29:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.173.153 with HTTP; Thu, 14 Sep 2017 15:29:30 -0700 (PDT)
In-Reply-To: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 14 Sep 2017 15:29:30 -0700
Message-ID: <CAPLgG=kdYtNsT00uOvTxxN_sNYyvDKSofGgMJg7Mg3+U23cFLQ@mail.gmail.com>
Subject: Re: GPIO Centralized Control Daemon
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114497e86665e605592dcfdb"
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
X-List-Received-Date: Thu, 14 Sep 2017 22:29:34 -0000

--001a114497e86665e605592dcfdb
Content-Type: text/plain; charset="UTF-8"

When you do this, please use the gpio chardev interface instead of sysfs.
Ask me for details if you aren't familiar.

On Thu, Sep 14, 2017 at 3:02 PM, Patrick Venture <venture@google.com> wrote:

> I apologize if this already exists or is in the works.
>
> I propose we create a daemon that centralizes userspace GPIO access.
>
> From a high level, the daemon will implement interfaces to export or
> unexport GPIOs.  Each GPIO exported will exist on the dbus:
>
> /xyz/openbmc_project/gpio/53 and implement an interface with the following
> properties:
> value, direction, active_low, etc.
>
> Some doubts, should the gpio name on the dbus be the relative name (53),
> should it be the system specific name (G5) or the absolute name?  I'm
> thinking the relative name and let the daemon handle internalizing the
> adjustment from relative to absolute.
>
> I'm working on adding GPIO support within phosphor-hwmon so that I can
> access a voltage sensor that's gated by a GPIO, and I know there have been
> conversations and implementations of this for IPMI OEM -- and I think it
> could easily be centralized.
>
> Thoughts?
>
> Patrick
>

--001a114497e86665e605592dcfdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When you do this, please use the gpio chardev interface in=
stead of sysfs.=C2=A0 Ask me for details if you aren&#39;t familiar.</div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Sep 14, 20=
17 at 3:02 PM, Patrick Venture <span dir=3D"ltr">&lt;<a href=3D"mailto:vent=
ure@google.com" target=3D"_blank">venture@google.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I apologize if this alre=
ady exists or is in the works.<div><br></div><div>I propose we create a dae=
mon that centralizes userspace GPIO access.</div><div><br></div><div>From a=
 high level, the daemon will implement interfaces to export or unexport GPI=
Os.=C2=A0 Each GPIO exported will exist on the dbus:</div><div><br></div><d=
iv>/xyz/openbmc_project/gpio/53 and implement an interface with the followi=
ng properties:</div><div>value, direction, active_low, etc.</div><div><br><=
/div><div>Some doubts, should the gpio name on the dbus be the relative nam=
e (53), should it be the system specific name (G5) or the absolute name?=C2=
=A0 I&#39;m thinking the relative name and let the daemon handle internaliz=
ing the adjustment from relative to absolute.</div><div><br></div><div>I&#3=
9;m working on adding GPIO support within phosphor-hwmon so that I can acce=
ss a voltage sensor that&#39;s gated by a GPIO, and I know there have been =
conversations and implementations of this for IPMI OEM -- and I think it co=
uld easily be centralized.</div><div><br></div><div>Thoughts?</div><span cl=
ass=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Patrick</div></f=
ont></span></div>
</blockquote></div><br></div>

--001a114497e86665e605592dcfdb--
