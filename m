Return-Path: <venture@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6VlD470fzDqHj
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 13:20:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JWZVQ2Yh"; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id 194so34915947pfv.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 20:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XA2c8571KiH2i1RT5MUyVKHkRLnv1DhQpvx+wkKqULI=;
 b=JWZVQ2YhlEfE/6Ur1xl4mmgWVEhbLbn59mpZUUANKLKadhzWsPKRPIMliI/N3IxiZ0
 Y9kx56PSD+MKLFAQTufCrrLUytMbP8qYMvSivilWc3TP1rnlIUeo5geGBTUPdCga+KHX
 ws2NkNKzHbbrwFCPGhtZzDWQDjC4+8gDPnKygJ39QOnlLqwx1gNh9A3tJHYL6CX9YSEo
 h05R6waXkgDNJkTtv6KJHH2DAHjHezrVpUWggJrNzgysNKdhpRZgsCrz63Fz7px8M12N
 v4kLzDf0oxPZSg/7wBtIhA4V5eLBLN9suAqL+jmU4piMulD3qn51lFSAm66j3fKkAm7n
 gBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XA2c8571KiH2i1RT5MUyVKHkRLnv1DhQpvx+wkKqULI=;
 b=Tjc75IAgcpG7auYBllKviA+Nbgx2fPhCDnb30CrcFSeoBgEiq4r3DjHIJBF2FSzAN0
 964kk1pBPyus0GGivihXdWbNdoqKjd/1HsMJJ2Z7OVcpXHjwdIBnjqHL6lfCoH49kDKy
 ovMWo+Rywby16MLJnO8VOspUExfdUOYTpNsEW4AEyt5IyKEqeu3YBBRldUDYibnRyzja
 vGBOW41NZHBxTZjzvvxSw4xRYPy9rR9gTDymXcez/RF+pBTNwBFy8SEn1/jdjLX7Cg+F
 rhhLEp79Xbak+McQjrUG/5DSLgLRWV6TIuWx4YgwFBZKJVCG4cndU1rImJNHP7NTC8m8
 lA5A==
X-Gm-Message-State: AN3rC/6+7jPZCl2quGnxTrZCJHbXBkQTHasPAI253nTB9OMh/0FHbn68
 zSl+RDCeZkIdpcV1gKdaVdRkvRUnu9C9
X-Received: by 10.98.25.69 with SMTP id 66mr15344989pfz.84.1492485654471; Mon,
 17 Apr 2017 20:20:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.133 with HTTP; Mon, 17 Apr 2017 20:20:34 -0700 (PDT)
In-Reply-To: <20170418023159.GA25774@heinlein.lan>
References: <CAO=notwmuHO91eentG60W012rnQXtAybuTPqo+_EbY426eOwSA@mail.gmail.com>
 <20170418023159.GA25774@heinlein.lan>
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Apr 2017 20:20:34 -0700
Message-ID: <CAO=notww5QJUuMpc8qYxey+AH4mvi6eb+VXs=dqzvAyP9P1y0Q@mail.gmail.com>
Subject: Re: thermald for OpenBMC
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=94eb2c03becc44c3a6054d686512
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
X-List-Received-Date: Tue, 18 Apr 2017 03:20:57 -0000

--94eb2c03becc44c3a6054d686512
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Patrick,

>> I'm working on a thermal control loop that'll operate within the openbmc
>> framework(s) and wanted to provide a somewhat high level overview for
>> thoughts.

> We should connect you with Matt Spinler (mspinler) and Matt Barth
> (msbarth) on IRC.  They have been working on implementing the "IBM fan
> control algorithm" but I suspect there is a significant amount of
> overlap.  Our intention was that you'd be able to reuse our
> implementation and insert a different (low-level detailed) algorithm.

Definitely.  I know there's a Google algorithm we use for thermal control
that's based on proportional=E2=80=93integral=E2=80=93derivative.  I'll pin=
g them on IRC to
get a peek at their design, roadmap and timeline.  It's also possible
because of our specific data center requirements based on configurations,
it may be more work to plug-in a different low-level algorithm.  But
without seeing the design, it's impossible to say.

>> The general design is to have a daemon that reads fans and temperatures
>> from dbus (reaching out to phosphor-hwmon) as well as being able to
receive
>> temperatures and other sensor information over an OEM IPMI command.

> Sounds good.  This is how it is suppose to work.

Good.  Yeah.  I'll end up running some performance experiments to make sure
things are handled quickly enough going through dbus for everything, but
I'm sure it will be reasonably quick.

> For the IPMI commands, the expectation would be that either the IPMI
> provider or an application fed by the IPMI provider for these OEM
> commands would implement the same xyz.openbmc_project.Sensor.Value
> interface as the phosphor-hwmon.  This way the thermal algorithm really
> doesn't need to know where the data comes from.

Right.  I just need to verify the exact design of that information
required.  Discussions today indicated I'd be provided with the temperature
margin for the fastest device and the slowest (in terms of thermal
adjustment) per zone.  The YAML definition will need to allow for
indicating whether a sensor is available to the BMC or is "outside."

>> The system will support zones defined (yes, probably in YAML).  A zone
will
>> have at least one exclusion fan, and at least one thermal sensor.  The
>> thermal sensor can be shared.  There will be defaults provided in this
>> configuration to act as fallbacks.

> There is some code available to define zones via YAML.  Matt Spinler can
> point you at these.

Ok.

>> The thermal loop will be margin based and attempt to drive the fans to
>> maintain the temperature within operating temperature of the zones.  Eac=
h
>> zone will be independently managed.

> These sounds very similar to what their intended design is as well.  For
> a zone there is a lower-threshold and an upper-threshold.  When the
> temperature is above the upper-threshold, the fan speed is increased and
> the fans are decreased when the temperature is below the
> lower-threshold.  Again, the Matts can give you details on what the "IBM
> fan control algorithm" design is.

That's the basic idea.

>> Because not all thermal sensors can necessarily be ready by the BMC, we
>> need a method of getting that information from the host.  From a previou=
s
>> project, we have the notion of sending thermal margins for slow and quic=
k
>> (heat change) devices to a controller.

> Is this the Host->BMC via IPMI you mentioned earlier or does the BMC
> need to actively query the host in some cases?  Hopefully it is always
> one direction.

The plan is for Host->BMC only.  The host just feeds thermal information on
a cycle to the BMC for those sensors out of reach.

I'm very interested in seeing the design doc, or any code that exists, and
especially a timeline.

Regards,
Patrick

On Mon, Apr 17, 2017 at 7:31 PM, Patrick Williams <patrick@stwcx.xyz> wrote=
:

> Patrick,
>
> On Mon, Apr 17, 2017 at 01:21:29PM -0700, Patrick Venture wrote:
> > I'm working on a thermal control loop that'll operate within the openbm=
c
> > framework(s) and wanted to provide a somewhat high level overview for
> > thoughts.
>
> We should connect you with Matt Spinler (mspinler) and Matt Barth
> (msbarth) on IRC.  They have been working on implementing the "IBM fan
> control algorithm" but I suspect there is a significant amount of
> overlap.  Our intention was that you'd be able to reuse our
> implementation and insert a different (low-level detailed) algorithm.
>
> > The general design is to have a daemon that reads fans and temperatures
> > from dbus (reaching out to phosphor-hwmon) as well as being able to
> receive
> > temperatures and other sensor information over an OEM IPMI command.
>
> Sounds good.  This is how it is suppose to work.
>
> For the IPMI commands, the expectation would be that either the IPMI
> provider or an application fed by the IPMI provider for these OEM
> commands would implement the same xyz.openbmc_project.Sensor.Value
> interface as the phosphor-hwmon.  This way the thermal algorithm really
> doesn't need to know where the data comes from.
>
> > The system will support zones defined (yes, probably in YAML).  A zone
> will
> > have at least one exclusion fan, and at least one thermal sensor.  The
> > thermal sensor can be shared.  There will be defaults provided in this
> > configuration to act as fallbacks.
>
> There is some code available to define zones via YAML.  Matt Spinler can
> point you at these.
>
> > The thermal loop will be margin based and attempt to drive the fans to
> > maintain the temperature within operating temperature of the zones.  Ea=
ch
> > zone will be independently managed.
>
> These sounds very similar to what their intended design is as well.  For
> a zone there is a lower-threshold and an upper-threshold.  When the
> temperature is above the upper-threshold, the fan speed is increased and
> the fans are decreased when the temperature is below the
> lower-threshold.  Again, the Matts can give you details on what the "IBM
> fan control algorithm" design is.
>
> > Because not all thermal sensors can necessarily be ready by the BMC, we
> > need a method of getting that information from the host.  From a previo=
us
> > project, we have the notion of sending thermal margins for slow and qui=
ck
> > (heat change) devices to a controller.
>
> Is this the Host->BMC via IPMI you mentioned earlier or does the BMC
> need to actively query the host in some cases?  Hopefully it is always
> one direction.
>
> --
> Patrick Williams
>

--94eb2c03becc44c3a6054d686512
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-im" style=3D"font-size:12.8px"><=
span style=3D"font-size:12.8px">Patrick,</span></span></div><span class=3D"=
gmail-im" style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"><div>=
<span class=3D"gmail-im" style=3D"font-size:12.8px"><span style=3D"font-siz=
e:12.8px"><br></span></span></div>&gt;</span>&gt; I&#39;m working on a ther=
mal control loop that&#39;ll operate within the openbmc<br><span style=3D"f=
ont-size:12.8px">&gt;</span>&gt; framework(s) and wanted to provide a somew=
hat high level overview for<br><span style=3D"font-size:12.8px">&gt;</span>=
&gt; thoughts.<br><br></span><span style=3D"font-size:12.8px">&gt; We shoul=
d connect you with Matt Spinler (mspinler) and Matt Barth</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">&gt;=C2=A0</span><sp=
an style=3D"font-size:12.8px">(msbarth) on IRC.=C2=A0 They have been workin=
g on implementing the &quot;IBM fan</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12=
.8px">control algorithm&quot; but I suspect there is a significant amount o=
f</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">&gt=
;=C2=A0</span><span style=3D"font-size:12.8px">overlap.=C2=A0 Our intention=
 was that you&#39;d be able to reuse our</span><br style=3D"font-size:12.8p=
x"><span style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-si=
ze:12.8px">implementation and insert a different (low-level detailed) algor=
ithm.</span><div><br></div><div>Definitely.=C2=A0 I know there&#39;s a Goog=
le algorithm we use for thermal control that&#39;s based on=C2=A0proportion=
al=E2=80=93integral=E2=80=93<span class=3D"gmail-im">derivative.=C2=A0 I&#3=
9;ll ping them on IRC to get a peek at their design, roadmap and timeline.=
=C2=A0 It&#39;s also possible because of our specific data center requireme=
nts based on configurations, it may be more work to plug-in a different low=
-level algorithm.=C2=A0 But without seeing the design, it&#39;s impossible =
to say.</span></div><div><span class=3D"gmail-im"><br><span style=3D"font-s=
ize:12.8px">&gt;&gt; The general design is to have a daemon that reads fans=
 and temperatures</span><br><span style=3D"font-size:12.8px">&gt;&gt; from =
dbus (reaching out to phosphor-hwmon) as well as being able to receive</spa=
n><br><span style=3D"font-size:12.8px">&gt;&gt; temperatures and other sens=
or information over an OEM IPMI command.</span><br><br></span><span style=
=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">Sou=
nds good.=C2=A0 This is how it is suppose to work.</span></div><div><br></d=
iv><div>Good.=C2=A0 Yeah.=C2=A0 I&#39;ll end up running some performance ex=
periments to make sure things are handled quickly enough going through dbus=
 for everything, but I&#39;m sure it will be reasonably quick.<br style=3D"=
font-size:12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-size:1=
2.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">For the IPMI comma=
nds, the expectation would be that either the IPMI</span><br style=3D"font-=
size:12.8px"><span style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=
=3D"font-size:12.8px">provider or an application fed by the IPMI provider f=
or these OEM</span><br style=3D"font-size:12.8px"><span style=3D"font-size:=
12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">commands would im=
plement the same xyz.openbmc_project.Sensor.</span><wbr style=3D"font-size:=
12.8px"><span style=3D"font-size:12.8px">Value</span><br style=3D"font-size=
:12.8px"><span style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"f=
ont-size:12.8px">interface as the phosphor-hwmon.=C2=A0 This way the therma=
l algorithm really</span><br style=3D"font-size:12.8px"><span style=3D"font=
-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">doesn&#39;t=
 need to know where the data comes from.</span><br style=3D"font-size:12.8p=
x"><span class=3D"gmail-im" style=3D"font-size:12.8px"><br>Right.=C2=A0 I j=
ust need to verify the exact design of that information required.=C2=A0 Dis=
cussions today indicated I&#39;d be provided with the temperature margin fo=
r the fastest device and the slowest (in terms of thermal adjustment) per z=
one.=C2=A0 The YAML definition will need to allow for indicating whether a =
sensor is available to the BMC or is &quot;outside.&quot;<br><br><span styl=
e=3D"font-size:12.8px">&gt;</span>&gt; The system will support zones define=
d (yes, probably in YAML).=C2=A0 A zone will<br><span style=3D"font-size:12=
.8px">&gt;</span>&gt; have at least one exclusion fan, and at least one the=
rmal sensor.=C2=A0 The<br><span style=3D"font-size:12.8px">&gt;</span>&gt; =
thermal sensor can be shared.=C2=A0 There will be defaults provided in this=
<br><span style=3D"font-size:12.8px">&gt;</span>&gt; configuration to act a=
s fallbacks.<br><br></span><span style=3D"font-size:12.8px">&gt;=C2=A0</spa=
n><span style=3D"font-size:12.8px">There is some code available to define z=
ones via YAML.=C2=A0 Matt Spinler can</span><br style=3D"font-size:12.8px">=
<span style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:=
12.8px">point you at these.</span></div><div><br></div><div>Ok.<br style=3D=
"font-size:12.8px"><span class=3D"gmail-im" style=3D"font-size:12.8px"><br>=
<span style=3D"font-size:12.8px">&gt;</span>&gt; The thermal loop will be m=
argin based and attempt to drive the fans to<br><span style=3D"font-size:12=
.8px">&gt;</span>&gt; maintain the temperature within operating temperature=
 of the zones.=C2=A0 Each<br><span style=3D"font-size:12.8px">&gt;</span>&g=
t; zone will be independently managed.<br><br></span><span style=3D"font-si=
ze:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">These sounds v=
ery similar to what their intended design is as well.=C2=A0 For</span><br s=
tyle=3D"font-size:12.8px"><span style=3D"font-size:12.8px">&gt;=C2=A0</span=
><span style=3D"font-size:12.8px">a zone there is a lower-threshold and an =
upper-threshold.=C2=A0 When the</span><br style=3D"font-size:12.8px"><span =
style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px=
">temperature is above the upper-threshold, the fan speed is increased and<=
/span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">&gt;=
=C2=A0</span><span style=3D"font-size:12.8px">the fans are decreased when t=
he temperature is below the</span><br style=3D"font-size:12.8px"><span styl=
e=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-size:12.8px">lo=
wer-threshold.=C2=A0 Again, the Matts can give you details on what the &quo=
t;IBM</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"=
>&gt;=C2=A0</span><span style=3D"font-size:12.8px">fan control algorithm&qu=
ot; design is.</span></div><div><br></div><div>That&#39;s the basic idea.<b=
r style=3D"font-size:12.8px"><span class=3D"gmail-im" style=3D"font-size:12=
.8px"><br><span style=3D"font-size:12.8px">&gt;</span>&gt; Because not all =
thermal sensors can necessarily be ready by the BMC, we<br><span style=3D"f=
ont-size:12.8px">&gt;</span>&gt; need a method of getting that information =
from the host.=C2=A0 From a previous<br><span style=3D"font-size:12.8px">&g=
t;</span>&gt; project, we have the notion of sending thermal margins for sl=
ow and quick<br>&gt;&gt; (heat change) devices to a controller.<br><br></sp=
an><span style=3D"font-size:12.8px">&gt;=C2=A0</span><span style=3D"font-si=
ze:12.8px">Is this the Host-&gt;BMC via IPMI you mentioned earlier or does =
the BMC</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8p=
x">&gt;=C2=A0</span><span style=3D"font-size:12.8px">need to actively query=
 the host in some cases?=C2=A0 Hopefully it is always</span><br style=3D"fo=
nt-size:12.8px"><span style=3D"font-size:12.8px">&gt;=C2=A0</span><span sty=
le=3D"font-size:12.8px">one direction.</span></div><div><span style=3D"font=
-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">The pl=
an is for Host-&gt;BMC only.=C2=A0 The host just feeds thermal information =
on a cycle to the BMC for those sensors out of reach.</span></div><div><spa=
n style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size=
:12.8px">I&#39;m very interested in seeing the design doc, or any code that=
 exists, and especially a timeline.<br></span><div><span style=3D"font-size=
:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">Regards,</s=
pan></div><div><span style=3D"font-size:12.8px">Patrick</span></div></div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr =
17, 2017 at 7:31 PM, Patrick Williams <span dir=3D"ltr">&lt;<a href=3D"mail=
to:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Patrick,<br>
<span class=3D""><br>
On Mon, Apr 17, 2017 at 01:21:29PM -0700, Patrick Venture wrote:<br>
&gt; I&#39;m working on a thermal control loop that&#39;ll operate within t=
he openbmc<br>
&gt; framework(s) and wanted to provide a somewhat high level overview for<=
br>
&gt; thoughts.<br>
<br>
</span>We should connect you with Matt Spinler (mspinler) and Matt Barth<br=
>
(msbarth) on IRC.=C2=A0 They have been working on implementing the &quot;IB=
M fan<br>
control algorithm&quot; but I suspect there is a significant amount of<br>
overlap.=C2=A0 Our intention was that you&#39;d be able to reuse our<br>
implementation and insert a different (low-level detailed) algorithm.<br>
<span class=3D""><br>
&gt; The general design is to have a daemon that reads fans and temperature=
s<br>
&gt; from dbus (reaching out to phosphor-hwmon) as well as being able to re=
ceive<br>
&gt; temperatures and other sensor information over an OEM IPMI command.<br=
>
<br>
</span>Sounds good.=C2=A0 This is how it is suppose to work.<br>
<br>
For the IPMI commands, the expectation would be that either the IPMI<br>
provider or an application fed by the IPMI provider for these OEM<br>
commands would implement the same xyz.openbmc_project.Sensor.<wbr>Value<br>
interface as the phosphor-hwmon.=C2=A0 This way the thermal algorithm reall=
y<br>
doesn&#39;t need to know where the data comes from.<br>
<span class=3D""><br>
&gt; The system will support zones defined (yes, probably in YAML).=C2=A0 A=
 zone will<br>
&gt; have at least one exclusion fan, and at least one thermal sensor.=C2=
=A0 The<br>
&gt; thermal sensor can be shared.=C2=A0 There will be defaults provided in=
 this<br>
&gt; configuration to act as fallbacks.<br>
<br>
</span>There is some code available to define zones via YAML.=C2=A0 Matt Sp=
inler can<br>
point you at these.<br>
<span class=3D""><br>
&gt; The thermal loop will be margin based and attempt to drive the fans to=
<br>
&gt; maintain the temperature within operating temperature of the zones.=C2=
=A0 Each<br>
&gt; zone will be independently managed.<br>
<br>
</span>These sounds very similar to what their intended design is as well.=
=C2=A0 For<br>
a zone there is a lower-threshold and an upper-threshold.=C2=A0 When the<br=
>
temperature is above the upper-threshold, the fan speed is increased and<br=
>
the fans are decreased when the temperature is below the<br>
lower-threshold.=C2=A0 Again, the Matts can give you details on what the &q=
uot;IBM<br>
fan control algorithm&quot; design is.<br>
<span class=3D""><br>
&gt; Because not all thermal sensors can necessarily be ready by the BMC, w=
e<br>
&gt; need a method of getting that information from the host.=C2=A0 From a =
previous<br>
&gt; project, we have the notion of sending thermal margins for slow and qu=
ick<br>
&gt; (heat change) devices to a controller.<br>
<br>
</span>Is this the Host-&gt;BMC via IPMI you mentioned earlier or does the =
BMC<br>
need to actively query the host in some cases?=C2=A0 Hopefully it is always=
<br>
one direction.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--94eb2c03becc44c3a6054d686512--
