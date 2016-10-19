Return-Path: <raltherr@google.com>
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szjhC5zcRzDvWJ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 07:09:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=dEWMaoxb; 
 dkim-atps=neutral
Received: by mail-yw0-x230.google.com with SMTP id u124so26479038ywg.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=d3ZxHoet1Y4O3GWxWcCkwvbtxh3AbcA/oYlTzjBTKls=;
 b=dEWMaoxbm5i2tUQe1IbUDrkloWjhDhGaBqUOghyBr/uj5XGP8U/BxxKhOADYA8k7JN
 XGR+A83lLLSs/7ewQiOf/VTifIjt8K1MsMWXPM0mRfY9+Hy/aXSyHjgR3XAwei5paZ2s
 yzotpfM+X2FnOO2wseZZ3XBzF/nMQEuJ8tXKNvkfp+RSBYjd66DQor/cqu4yWH3cSMH3
 vxE0nZAiZ3lk6mmg7GS4+Cw4rOV6WTnehV7w3iPv7crPYvVUtie/QOY5ivJ+lR56Tu/3
 RP0qJ7NViq7ed8PWRWCa1aFmOHKawLe33nBHJbo6Id/Q+MTX0+gFANQXOFnWtLmwb4F5
 /rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=d3ZxHoet1Y4O3GWxWcCkwvbtxh3AbcA/oYlTzjBTKls=;
 b=H/ro0X26XI/AAqZkM/Rdabc6NxnmPRjZIBr6IMhzdzplub/+PWDM4JBvASs/eOxeyr
 UVzPfpm897VBBXe++KyZ3pLtpTLNUyZi3TBhkRIXmtlQ2+YvN7WzBvFcK9DogKgfnoY1
 RcJXcjhA3ZXP3sw/CnIsegtJ9l4RzvK5jzsiDtLAB7BdttY1ZFSeBsRhlVsJdlmWRz+F
 EgJlsf93AmlVFvCF6K1xUeLaWUMtBAPtzIFIcQn0robJ/FxXeyKgZJ1mKA1jn/GLncpS
 MypR37bHtAm3LyYPdXQF6RJmj1nFySHnypKzSXhTx+u+sEb8Q7tfWnu6wFHr8pdLz0eK
 YoHg==
X-Gm-Message-State: AA6/9RlOpkarfycEtggm0dkN4A1xVyhHgwHz0jn85DGO7QyKE5ERfZMSNQvvchnHnT5I682C/YoGftB6vNgxIbzc
X-Received: by 10.129.53.206 with SMTP id c197mr8035288ywa.205.1476907752196; 
 Wed, 19 Oct 2016 13:09:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Wed, 19 Oct 2016 13:09:11 -0700 (PDT)
In-Reply-To: <5807B226.8090400@linux.vnet.ibm.com>
References: <5807B226.8090400@linux.vnet.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 19 Oct 2016 13:09:11 -0700
Message-ID: <CAPLgG==AWcsVvswzJQpqbqV0GBU94fN1yTb3p39SUkv5hnRo8g@mail.gmail.com>
Subject: Re: RFC for enablement of slpd on openbmc
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11421a26f0034a053f3d617a
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
X-List-Received-Date: Wed, 19 Oct 2016 20:09:16 -0000

--001a11421a26f0034a053f3d617a
Content-Type: text/plain; charset=UTF-8

Please make sure there is a distro feature for this that can be turned off
to remove SLP entirely from the image.

On Wed, Oct 19, 2016 at 10:49 AM, Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi All,
>
>
> *Enabling SLP Server on openBMC*
>
> What is SLP
>
> =======
>
> Service Location Protocol (SLP) is a protocol that provides a framework to
> allow networking applications to discover the existence, location, and
> configuration of networked services in enterprise networks.
>
> openSLP is widely accepted in the industry
>
> What do we need to do?
>
> ==============
>
> 1) Bring SLP(OpenSLP) in image:- Write the bitbake recipe(didn't find the
> readily available bitbake recipe)
>
> 2) Configure the services through Settings daemon.
>
> 3) Write the .service file as it needs to start after network is up(after
> networkd-online.target)
>
> How to configure the services which needs to be registered with slpd
>
> ============================================
>
> Option 1:- settingsd
>
> Note: Gives the flexibility to change the configured services @ runtime.
> Do we require this functionality?
>
> Option 2:conf file for discovery services
>
> Note: During build time we can get the service info(service-name,port)
> from the existing infra(discoveryservice.bbclass)
>
> How to register the services
> ==================
>
> 1) Static Registration:- will not work as we need ip/host-name details
> which we don't have @build time.
>
> 2) Application(new DBUS app) will register the configured services to the
> slpd on startup.
>
> We need to provide the dynamic registration support on BMC as IP of BMC
> can change any time.  Registration of services with slpd takes the URL of
> the service which includes ip and port of the service which needs to be
> registered.
>
> Create a DBUS service application
>
> =====================
>
> 1) Once the service starts it registers the configured services with slpd.
>
> 2) listening on RTNETLINK event for ip change: raise a dbus signal(for the
> IP change)
>
>      if there is IP change then dereg the old service followed by  reg
> service as the ip has changed.
>
> Regards
> Ratan Gupta
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a11421a26f0034a053f3d617a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please make sure there is a distro feature for this that c=
an be turned off to remove SLP entirely from the image.</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Oct 19, 2016 at 10:49 A=
M, Ratan Gupta <span dir=3D"ltr">&lt;<a href=3D"mailto:ratagupt@linux.vnet.=
ibm.com" target=3D"_blank">ratagupt@linux.vnet.ibm.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
 =20

   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
   =20
    Hi All,<br>
    <p style=3D"margin-bottom:0cm;line-height:100%"><br>
    </p>
    <p style=3D"margin-bottom:0cm;line-height:100%" align=3D"center"><font =
style=3D"font-size:14pt" size=3D"4"><b>Enabling
          SLP Server on openBMC</b></font></p>
    <p style=3D"margin-bottom:0cm;line-height:100%">What is SLP </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">=3D=3D=3D=3D=3D=3D=3D</=
p>
    <p style=3D"margin-bottom:0cm;line-height:100%">Service Location
      Protocol (SLP) is a protocol that provides a framework to allow
      networking applications to discover the existence, location, and
      configuration of networked services in enterprise networks.</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">openSLP is widely
      accepted in the industry</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">What do we need to
      do? </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">1) Bring
      SLP(OpenSLP) in image:- Write the bitbake recipe(didn&#39;t find the
      readily available bitbake recipe)</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">2) Configure the
      services through Settings daemon.</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">3) Write the
      .service file as it needs to start after network is up(after
      networkd-online.target)</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">How to configure
      the services which needs to be registered with slpd<br>
    </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</p>
    <p style=3D"margin-bottom:0cm;line-height:100%"> Option 1:-
      settingsd </p>
    <p style=3D"margin-bottom:0cm;line-height:100%"> Note: Gives the
      flexibility to change the configured services @ runtime. Do we
      require
      this functionality?</p>
    <p style=3D"margin-bottom:0cm;line-height:100%"> Option 2:conf
      file for discovery services </p>
    <p style=3D"margin-bottom:0cm;line-height:100%"> Note: During
      build time we can get the service info(service-name,port) from the
      existing infra(discoveryservice.<wbr>bbclass)</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">How to register the
      services<br>
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">1) Static
      Registration:- will not work as we need ip/host-name details which
      we don&#39;t have @build time.</p>
    <p style=3D"margin-bottom:0cm;line-height:100%">2)
      Application(new DBUS app) will register the configured services
      to the slpd on startup. <br>
    </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">We need to provide
      the dynamic registration support on BMC as IP of BMC can change
      any
      time.=C2=A0 Registration of services with slpd takes the URL of the
      service which includes ip and port of the service which
      needs to be registered.</p>
    <p style=3D"margin-bottom:0cm;line-height:100%"> </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">Create a DBUS
      service application </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
    </p>
    <p style=3D"margin-bottom:0cm;line-height:100%">1) Once the service
      starts it registers the configured services with slpd.<br>
    </p>
    <p style=3D"margin-bottom:0cm;line-height:100%"> 2) listening
      on RTNETLINK event for ip change: raise a dbus signal(for the IP
      change)<br>
    </p>
    =C2=A0=C2=A0=C2=A0=C2=A0 <br>
    =C2=A0=C2=A0=C2=A0=C2=A0 if there is IP change then dereg the old servi=
ce followed by=C2=A0
    reg service as the ip has changed.<br>
    <br>
    Regards<span class=3D"HOEnZb"><font color=3D"#888888"><br>
    Ratan Gupta<br>
   =20
   =20
   =20
  </font></span></div>

<br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a11421a26f0034a053f3d617a--
