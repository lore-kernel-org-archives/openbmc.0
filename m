Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22a; helo=mail-ua0-x22a.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mtFs31W2"; 
 dkim-atps=neutral
Received: from mail-ua0-x22a.google.com (mail-ua0-x22a.google.com
 [IPv6:2607:f8b0:400c:c08::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xy6Bk015RzDqXy
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 03:27:41 +1000 (AEST)
Received: by mail-ua0-x22a.google.com with SMTP id 72so2107133uas.8
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8lymk/8MAgErMx8yEvydvYJuGweKlLYRU8+LbBz0kS0=;
 b=mtFs31W2NPQtQTjd+4jBimLXHS2s4cxxEGA/nWpfmEj/gPw28Krsq6nRqZVLAZhp4R
 xGLOhOxNWGQ+dZ7sKh8xKN4o64hNxNLuMqZTjhfX8NPad9tBkQYUzimul3Zr6tEvzqTT
 d2TW02PJ/Yvc0h4a9he/fCXiMdcI3oINTiZo+fcJHcjPMKa81jWx3/IxD8GwfmN7fQJC
 nvMdks+Qu4kZFOggcNTYSbdFPxxT6pNoyM+oMKVnfif2Iuw/GwN2EyVkjaji8cHpccDY
 rjTQDkOhWN7IITcf09oWn2GQ3u3bR7XMC9QPEZ3Yhe9nbrHvICVBypdpy8xBotwfJViw
 wqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8lymk/8MAgErMx8yEvydvYJuGweKlLYRU8+LbBz0kS0=;
 b=fnq20TpSdTZGQHxQfWK5eFgnjj/kFdcf7oedwSjZczAONy9Q7ZjkY75u6u8eePU3QX
 mPMTfSpicS01MjILaZUgNaBuqbQmFcfarK0LbMrd8cSGErGtyVHLL83T1eyakBAetySd
 ZhV0CdBdT92CfxzeWbS5qou7ipvSkq0P02BU619q3tSMMLnTo2EK19vsh3F7u5etMYrC
 4WmOKXEqYdTcmjSN6gxKz4zaeoiiWzuEFZyy61xP4B+BVdvzkifJZkc9o9mbv+CmpstI
 RL0nn381C8CZUBMm7NsiXCNjeDbZPbwIWmVM38oAfneEkoM8Kqqyyd3fZtWuvVJndF4F
 gk8A==
X-Gm-Message-State: AHPjjUiNA0IFPG0Ez8zEe44VcUzj486h+joUqETLvF2bNRCK8ICcUhwK
 ZzhiEfF6f8NA6CEeLqmB0iNLbrmciwKD/tdKgK1mtA==
X-Google-Smtp-Source: AOwi7QAoilWNdU2bGLsdv+Myg0rJZ/emGUQAI8Aws8cVSqyRh+czVzyc8MQBxTUYxVRenKKsYXzmcMWa6V757BKeD/M=
X-Received: by 10.159.57.88 with SMTP id i24mr5059079uag.18.1505928458248;
 Wed, 20 Sep 2017 10:27:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Wed, 20 Sep 2017 10:27:37 -0700 (PDT)
In-Reply-To: <SN1PR20MB04965156599200D28A269AD3EF610@SN1PR20MB0496.namprd20.prod.outlook.com>
References: <OF056E09BF.B373E650-ON8625818E.00432DAB-8625818E.005759D2@LocalDomain>
 <OF9FAE2656.F19C25EB-ON862581A0.005E317D-862581A0.0064A2AE@notes.na.collabserv.com>
 <SN1PR20MB04965156599200D28A269AD3EF610@SN1PR20MB0496.namprd20.prod.outlook.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 20 Sep 2017 10:27:37 -0700
Message-ID: <CAPLgG=k1WbfurkynbOMxPePZDbD=y8cWnan8XqR8wGC7LLqzMw@mail.gmail.com>
Subject: Re: RFC Adding Interfaces to OpenBMC
To: Kenneth Wilke <kenneth.wilke@rackspace.com>
Cc: Chris Austen <austenc@us.ibm.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f403043edeecd010310559a24a46"
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
X-List-Received-Date: Wed, 20 Sep 2017 17:27:42 -0000

--f403043edeecd010310559a24a46
Content-Type: text/plain; charset="UTF-8"

Agree.

On Wed, Sep 20, 2017 at 7:04 AM, Kenneth Wilke <kenneth.wilke@rackspace.com>
wrote:

> It is a pretty common practice to terminate SSL at a reverse proxy like
> NGINX. I think this model of routing http to the other daemons listening on
> localhost sockets should work well for OpenBMC.
>
>
> Kenneth
> ------------------------------
> *From:* openbmc <openbmc-bounces+kenneth.wilke=rackspace.com@lists.
> ozlabs.org> on behalf of Chris Austen <austenc@us.ibm.com>
> *Sent:* Tuesday, September 19, 2017 1:19:12 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* Re: RFC Adding Interfaces to OpenBMC
>
>
> After some discussion that did not make it to the mailing list I am
> revising the RFC to integrate with Nginx technology.  The theme is the
> same; create interfaces in a way that anyone can add/remove/replace per
> their business needs through with a prescriptive process
>
>
> Request - https ---> Nginx (Reverse-Proxy)
>                  |
>                   |http
>                   |
>                 /|\
>                 | | `-> rest_dbus   127.0.0.1:8081
>                 |  `--> webui       127.0.0.1:8082
>                  `----> redfish     127.0.0.1:8083
>
> With Nginx accepting https would there be a need for localhost
> applications incur the cost of secure https too?
>
>
> Chris Austen/Austin/IBM wrote on 09/01/2017 10:54:06 AM:
>
> > From: Chris Austen/Austin/IBM
> > To: openbmc@lists.ozlabs.org
> > Date: 09/01/2017 10:54 AM
> > Subject: RFC Adding Interfaces to OpenBMC
> >
> > I'd like to get some feed back on draft...
> >
> > It should not be any surprise that we are trying to implement a web
> > user interface and Redfish.  I think requiring every implementation
> > of OpenBMC to now support a webui and Redfish goes against the basic
> > principals of the project.  A better approach would be to allow the
> > machine configuration to determine what features/apps to support.
> > The OpenBMC core would provide the infrastructure to reverse(?)
> > proxy incoming requests to the various applications based on the
> > application defining which routes it can handle.  With those
> > thoughts in mind, the current design needs to be tweaked slightly.
> >
> > FROM:
> > | server | app (dbus) |
> > TO:
> > | server | reverse | app (dbus)    |
> > |        |  proxy  | app (web)     |
> > |        |         | app (redfish) |
> > |        |         | app (...)     |
> > Route handler added at service startup to create the proxy environment
> > (figure 1: In todays design the single app defines all routes at
> > compile time.  Adding routes to that single app forces all OpenBMC
> > machines to pick up the new routes which is undesirable)
> >
> > Note: due to legacy decisions the '/' and '/xyz' route are owned by
> > the dbus app.  (Could the dbus route be helpful here?  All browsers
> > use 'text/html' and our rest uses 'application/json', perhaps a
> > nudge/redirect the user to the correct uri)
> >
> > Security:
> > ~~~~~~~~
> > None at the proxy level
> >
> > Registering Routes:
> > ~~~~~~~~~~~~~~~
> > Route registration will happen at service start up.  An application
> > configuration file placed in to a predetermined location will be
> > parsed by the proxy code
> >
> > Application Requirements:
> > ~~~~~~~~~~~~~~~~~~~~~~
> > 1) The cfg file will be based on a common xxx format
> > - likely need a decision as to proxy or reverse proxy before
> > declaring config format type
> >
> > 2) Create a bb file in the appropriate layer.  Keep in mind the openbmc/
> > meta-phosphor/common/recipes-phosphor/interfaces/ is for core
> > functionality only.
> > i.e.    PROVIDES = 'phosphor-webui'
> >          <example of how to copy the apps config file to the correct
> > route registration location>
> >
> > 3) Declare in the appropriate machine conf file the bb file which
> > contains your application
> > i.e.    OBMC_MACHINE_FEATURES += 'phosphor-webui'
> >
> >
> > Chris Austen
> > POWER Systems Enablement Manager
> > (512) 286-5184 (T/L: 363-5184)
>

--f403043edeecd010310559a24a46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agree.</div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, Sep 20, 2017 at 7:04 AM, Kenneth Wilke <span dir=3D"ltr=
">&lt;<a href=3D"mailto:kenneth.wilke@rackspace.com" target=3D"_blank">kenn=
eth.wilke@rackspace.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">



<div>

<div id=3D"m_-828739750837930923divtagdefaultwrapper" style=3D"font-size:12=
pt;color:#000000;font-family:Calibri,Helvetica,sans-serif" dir=3D"ltr">
<p>It is a pretty common practice to terminate SSL at a reverse proxy like =
NGINX. I think this model of routing http to the other daemons listening on=
 localhost sockets should work well for OpenBMC.</p>
<p><br>
</p>
<p>Kenneth<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-828739750837930923divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
openbmc &lt;openbmc-bounces+kenneth.<wbr>wilke=3D<a href=3D"mailto:rackspac=
e.com@lists.ozlabs.org" target=3D"_blank">rackspace.com@lists.<wbr>ozlabs.o=
rg</a>&gt; on behalf of Chris Austen &lt;<a href=3D"mailto:austenc@us.ibm.c=
om" target=3D"_blank">austenc@us.ibm.com</a>&gt;<br>
<b>Sent:</b> Tuesday, September 19, 2017 1:19:12 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: RFC Adding Interfaces to OpenBMC </font>
<div>=C2=A0</div>
</div><div><div class=3D"h5">
<div>
<p><tt>After some discussion that did not make it to the mailing list I am =
revising the RFC to integrate with Nginx technology.=C2=A0 The theme is the=
 same; create interfaces in a way that anyone can add/remove/replace per th=
eir business needs through with a prescriptive
 process</tt><br>
<br>
<br>
<tt>Request - https ---&gt; Nginx (Reverse-Proxy)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|</tt><br>
<tt>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |http</t=
t><br>
<tt>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /|\ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | | `-&gt; rest_dbu=
s =C2=A0 <a href=3D"http://127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081=
</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0`--&gt; web=
ui =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://127.0.0.1:8082" target=3D"_blank"=
>127.0.0.1:8082</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`----&gt; red=
fish =C2=A0 =C2=A0 <a href=3D"http://127.0.0.1:8083" target=3D"_blank">127.=
0.0.1:8083</a></tt><br>
<br>
<font size=3D"2">With Nginx accepting https would there be a need for local=
host applications incur the cost of secure https too?</font><br>
<br>
<br>
<tt><font size=3D"2">Chris Austen/Austin/IBM wrote on 09/01/2017 10:54:06 A=
M:<br>
<br>
&gt; From: Chris Austen/Austin/IBM</font></tt><br>
<tt><font size=3D"2">&gt; To: <a href=3D"mailto:openbmc@lists.ozlabs.org" t=
arget=3D"_blank">openbmc@lists.ozlabs.org</a></font></tt><br>
<tt><font size=3D"2">&gt; Date: 09/01/2017 10:54 AM</font></tt><br>
<tt><font size=3D"2">&gt; Subject: RFC Adding Interfaces to OpenBMC </font>=
</tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; I&#39;d like to get some feed back on draft...</font></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; It should not be any surprise that we are trying to implement a web <b=
r>
&gt; user interface and Redfish.=C2=A0 I think requiring every implementati=
on <br>
&gt; of OpenBMC to now support a webui and Redfish goes against the basic<b=
r>
&gt; principals of the project.=C2=A0 A better approach would be to allow t=
he <br>
&gt; machine configuration to determine what features/apps to support. =C2=
=A0<br>
&gt; The OpenBMC core would provide the infrastructure to reverse(?) <br>
&gt; proxy incoming requests to the various applications based on the <br>
&gt; application defining which routes it can handle.=C2=A0 With those <br>
&gt; thoughts in mind, the current design needs to be tweaked slightly.</fo=
nt></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; FROM:</font></tt><br>
<tt><font size=3D"2">&gt; | server | app (dbus) |</font></tt><br>
<tt><font size=3D"2">&gt; TO:</font></tt><br>
<tt><font size=3D"2">&gt; | server | reverse | app (dbus) =C2=A0 =C2=A0|</f=
ont></tt><br>
<tt><font size=3D"2">&gt; | =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0proxy =C2=A0=
| app (web) =C2=A0 =C2=A0 |</font></tt><br>
<tt><font size=3D"2">&gt; | =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | app (redfish) |</font></tt><br>
<tt><font size=3D"2">&gt; | =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | app (...) =C2=A0 =C2=A0 |</font></tt><br>
<tt><font size=3D"2">&gt; Route handler added at service startup to create =
the proxy environment</font></tt><br>
<tt><font size=3D"2">&gt; (figure 1: In todays design the single app define=
s all routes at
<br>
&gt; compile time.=C2=A0 Adding routes to that single app forces all OpenBM=
C <br>
&gt; machines to pick up the new routes which is undesirable) </font></tt><=
br>
<tt><font size=3D"2">&gt; <br>
&gt; Note: due to legacy decisions the &#39;/&#39; and &#39;/xyz&#39; route=
 are owned by <br>
&gt; the dbus app. =C2=A0(Could the dbus route be helpful here?=C2=A0 All b=
rowsers <br>
&gt; use &#39;text/html&#39; and our rest uses &#39;application/json&#39;, =
perhaps a <br>
&gt; nudge/redirect the user to the correct uri) </font></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; Security:</font></tt><br>
<tt><font size=3D"2">&gt; ~~~~~~~~</font></tt><br>
<tt><font size=3D"2">&gt; None at the proxy level</font></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; Registering Routes:</font></tt><br>
<tt><font size=3D"2">&gt; ~~~~~~~~~~~~~~~</font></tt><br>
<tt><font size=3D"2">&gt; Route registration will happen at service start u=
p.=C2=A0 An application
<br>
&gt; configuration file placed in to a predetermined location will be <br>
&gt; parsed by the proxy code</font></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; Application Requirements:</font></tt><br>
<tt><font size=3D"2">&gt; ~~~~~~~~~~~~~~~~~~~~~~</font></tt><br>
<tt><font size=3D"2">&gt; 1) The cfg file will be based on a common xxx for=
mat</font></tt><br>
<tt><font size=3D"2">&gt; - likely need a decision as to proxy or reverse p=
roxy before
<br>
&gt; declaring config format type </font></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; 2) Create a bb file in the appropriate layer.=C2=A0 Keep in mind the o=
penbmc/<br>
&gt; meta-phosphor/common/recipes-<wbr>phosphor/interfaces/ is for core <br=
>
&gt; functionality only. =C2=A0</font></tt><br>
<tt><font size=3D"2">&gt; i.e. =C2=A0 =C2=A0PROVIDES =3D &#39;phosphor-webu=
i&#39;</font></tt><br>
<tt><font size=3D"2">&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;example of =
how to copy the apps config file to the correct<br>
&gt; route registration location&gt;</font></tt><br>
<tt><font size=3D"2">&gt; =C2=A0</font></tt><br>
<tt><font size=3D"2">&gt; 3) Declare in the appropriate machine conf file t=
he bb file which
<br>
&gt; contains your application </font></tt><br>
<tt><font size=3D"2">&gt; i.e. =C2=A0 =C2=A0OBMC_MACHINE_FEATURES +=3D &#39=
;phosphor-webui&#39;</font></tt><br>
<tt><font size=3D"2">&gt; <br>
&gt; <br>
&gt; Chris Austen<br>
&gt; POWER Systems Enablement Manager <br>
&gt; <a href=3D"tel:(512)%20286-5184" value=3D"+15122865184" target=3D"_bla=
nk">(512) 286-5184</a> (T/L: 363-5184)</font></tt><br>
</p>
</div>
</div></div></div>

</blockquote></div><br></div>

--f403043edeecd010310559a24a46--
