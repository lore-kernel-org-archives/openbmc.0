Return-Path: <kunyi@google.com>
Received: from mail-ua0-x22e.google.com (mail-ua0-x22e.google.com
 [IPv6:2607:f8b0:400c:c08::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3LLq4GmvzDvk8
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 04:51:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=H4wBHEJ3; 
 dkim-atps=neutral
Received: by mail-ua0-x22e.google.com with SMTP id i31so2129170uai.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AAv+qovgFkGUK7Ah604bUU7DE5HAWJroxx02fiOBUCA=;
 b=H4wBHEJ3t/XgWDpU72m0WlzAircTCAtIdiAOU6BoCdhSbrgfx/89TBArrvpviRylaJ
 jc4lbWxGoyRgEO1kCsmlkPRHUOI1oUtSiNR8pBc7pE1zMHiZwQKAoHBJZBCae5GKx0JK
 gdhQYNf/23pNRflqFxJmZp88HML8dLkVbS096/Bu7mimsMDPrMeNodbmDE5bOZ0WmU7u
 0zq7DzBRjqOTHK9pOHj/Umzso0QO2UP/n4vP1gv0JDngggm4DmLamR4W69um4VwUHChb
 UqngB7Tj61g1re000U2mxdoNieaYaVHfr4IFjMZDLMBAUkuBZUu84/IgRLQndUYIEXCL
 7Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AAv+qovgFkGUK7Ah604bUU7DE5HAWJroxx02fiOBUCA=;
 b=EpJsG8p0lKjd76kN167vSY/VY1J4JwLcOzKa0tA+1y2CrgjA1uPYlg+YIM+ClPqkXm
 FufKwvRJD8wAZfVFSlwrWoDennzrN3FU5MvRNsJ9FHUVtantbpy1EbrYPqDpeT9Vi3kz
 Aofpw839VxPmTqy/ndg+aKepjTt5ep6VsUch4jOfQs3ghFpbh78mEeNfF//Crh0YlrnF
 x0iegEYuZo7F2G1g62p/YNgsNNJCGUEZo9hwSdL08LSO7VUeNV6wOztj+oGpeCrWgntI
 50Nb7J1x1qWli5BpfkOsgN3TBTMLcEGcpRCR/SUa5iwJuTMK6lMAUuh7dfDZwuae55M0
 Bqzg==
X-Gm-Message-State: ABUngvfyEQ1CWeY6EFdH3Fk1tCwaSnypINgWNgNBvhs7ZW41GRrcru15lttrsOclSrrA+zRJ6NH0Ok+Bpo9hwi4o
X-Received: by 10.176.82.161 with SMTP id v30mr14402650uav.23.1477417904619;
 Tue, 25 Oct 2016 10:51:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.85.222 with HTTP; Tue, 25 Oct 2016 10:51:22 -0700 (PDT)
In-Reply-To: <1477351614.6373.64.camel@aj.id.au>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
 <1477278307.6373.52.camel@aj.id.au>
 <CAGMNF6XdMYX3ZTxtna7ueJcBfpvi=aEF8kaStJgz_pwY0jP2XQ@mail.gmail.com>
 <1477351614.6373.64.camel@aj.id.au>
From: Kun Yi <kunyi@google.com>
Date: Tue, 25 Oct 2016 10:51:22 -0700
Message-ID: <CAGMNF6UsbQQoJZtXGoJdQRxBFb0v9oAMMAHFhXsHp49MDmHfZg@mail.gmail.com>
Subject: Re: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs
 control
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary=94eb2c192512644914053fb42986
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
X-List-Received-Date: Tue, 25 Oct 2016 17:51:48 -0000

--94eb2c192512644914053fb42986
Content-Type: text/plain; charset=UTF-8

Thanks Andrew that was helpful! I will look into pinctrl and FMC driver
then.

Thanks,
Kun

On Mon, Oct 24, 2016 at 4:26 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Mon, 2016-10-24 at 14:22 -0700, Kun Yi wrote:
> > Hi Andrew,
> >
> > One question I have though: I think pinmux/pinctrl driver is supposed
> > to be a boot time static pin configure module and parses DT and
> > configures accordingly. Is it possible to use pinmux to dynamically
> > modify the pin states?
>
> Yes, see "Runtime pinmuxing" here (at the bottom of the document):
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/
> linux.git/tree/Documentation/pinctrl.txt
>
> So you'd need to patch the FMC driver that Milton and Cedric have been
> working on to (de)activate pin states, likely at probe() and remove()
> (this implies you'll need to somehow orchestrate a remove/switch,
> switch/probe dance). Alternatively, provide a way to suspend operations
> on the MTD and switch the pins between master and passthru in the FMC
> driver. Some complications are that this functionality is only
> available for SPI1, and you might need to do a bit of work to guarantee
> sensible outcomes for operations that might span the mode switch.
>
> Cheers,
>
> Andrew




-- 
Regards,
Kun

--94eb2c192512644914053fb42986
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Andrew that was helpful! I will look into pinctrl a=
nd FMC driver then.<div><br></div><div>Thanks,</div><div>Kun</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Oct 24, 2016=
 at 4:26 PM, Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew@=
aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">On Mon, 2016-10-24 at 14:22 -0700=
, Kun Yi wrote:<br>
&gt; Hi Andrew,<br>
&gt;<br>
&gt; One question I have though: I think pinmux/pinctrl driver is supposed<=
br>
&gt; to be a boot time static pin configure module and parses DT and<br>
&gt; configures accordingly. Is it possible to use pinmux to dynamically<br=
>
&gt; modify the pin states?<br>
<br>
</span>Yes, see &quot;Runtime pinmuxing&quot; here (at the bottom of the do=
cument):<br>
<br>
<a href=3D"https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/pinctrl.txt" rel=3D"noreferrer" target=3D"_blank">https:=
//git.kernel.org/cgit/<wbr>linux/kernel/git/torvalds/<wbr>linux.git/tree/Do=
cumentation/<wbr>pinctrl.txt</a><br>
<br>
So you&#39;d need to patch the FMC driver that Milton and Cedric have been<=
br>
working on to (de)activate pin states, likely at probe() and remove()<br>
(this implies you&#39;ll need to somehow orchestrate a remove/switch,<br>
switch/probe dance). Alternatively, provide a way to suspend operations<br>
on the MTD and switch the pins between master and passthru in the FMC<br>
driver. Some complications are that this functionality is only<br>
available for SPI1, and you might need to do a bit of work to guarantee<br>
sensible outcomes for operations that might span the mode switch.<br>
<br>
Cheers,<br>
<br>
Andrew</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
">Regards,<div>Kun</div></div></div>
</div>

--94eb2c192512644914053fb42986--
