Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::22a; helo=mail-wm0-x22a.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B20fq02/"; 
 dkim-atps=neutral
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com
 [IPv6:2a00:1450:400c:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zrN8M0HfLzF1Fd
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 02:36:18 +1100 (AEDT)
Received: by mail-wm0-x22a.google.com with SMTP id 139so11460924wmn.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 07:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTI3LnOF3yjRj0ltyupsvvProebpXxQXMo6fdjy7Xeo=;
 b=B20fq02/TTTAOlelDcxOGsd5V6KYRcOmhbq3xfIFhYUG6ruFJ/6QFft1KND3e1Cmat
 IgFbfyHM2M5MhFgVWvRpPpZuflVEWH1cnr14Y+KTrBoNo9UTbk9AFYxW4NzzFJ+iO17x
 5nviEQhwuKLlqAoq07mwBgz8VfyuCudbt0TiXhyFFdt1sIny9/N2D1XYVVdD00If3wmq
 XAsXMTFsqZuyo/nr8ynedKfpVxwIG1t2EAgPkMgzhI1NlhE02txUkiIBqQSKRGIQR7CJ
 aGcg7xPnrtDkCnT0JCRHVu56QmSqaaCcdwojCGNJCpn7RHC2kWRBJj6NefozWbAzDcIT
 xgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTI3LnOF3yjRj0ltyupsvvProebpXxQXMo6fdjy7Xeo=;
 b=BSjq+cgNFywZ5kiNelwRL163KV1EBe9F1NLHBsHhQGkVznJnBfkhePYntCSiDZPo+M
 pEYlhTBIyiQdCcY99PuUZVKgPKg5AFKzC5ieeEQSYSWKQ8iCakXfW9NOV6GbH9s/QBTt
 MMYi+CYgNSqCcDw93f4KBCrJFaf8Di4/GducqsvNQV+Mhr+NRsxKFi0d2b9JCLrTTPXe
 sWEXLBOHaJu8LfYaLH7Dr8I04P2r60vbIzsSh+jNSUsH1ihkaXER1cwpMmr4A6N1MdZk
 MxWWzu6UpGw3cUcWXnlS4XCADH/KVmeB/ZjUY7LlH/Cy12B1dzRqXNUK2HvK9/Rod3JN
 rARA==
X-Gm-Message-State: APf1xPBn+FU+GkIEkokSLJf9L5R/xph2xDhhbztvdaD3JVN7GQZYLc/p
 +lryaXJcTNoAKeG4gQhRRPZERl1BZzkS723VM/63PNgc
X-Google-Smtp-Source: AG47ELvSwrXlF2lat6qgE5Rg36Qe/asFx5U1099Dcr49peVxLM0XhnbXAXyATFydV6K17hDNH1QvsbYm7IGpJ4LdL+o=
X-Received: by 10.28.51.199 with SMTP id z190mr2220747wmz.68.1519745774811;
 Tue, 27 Feb 2018 07:36:14 -0800 (PST)
MIME-Version: 1.0
References: <CACkAXSpRB4Lqhd62u+OUALeqCZpSjGD8xSPwx4yJ+WqFH7jNjA@mail.gmail.com>
 <c2cfb310-7dae-3f99-a1a3-ceac0ab9c1c8@linux.vnet.ibm.com>
In-Reply-To: <c2cfb310-7dae-3f99-a1a3-ceac0ab9c1c8@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 27 Feb 2018 15:36:00 +0000
Message-ID: <CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com>
Subject: Re: IPMI Sensor Read-only role updates.
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a114351aa0f2fd005663363f8"
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
X-List-Received-Date: Tue, 27 Feb 2018 15:36:20 -0000

--001a114351aa0f2fd005663363f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jayanath,

Find my comments inline.

It seems you may be thinking of only changes for a system specific yaml, in
which case I don't think you need to ask for permission :) But the
architecture you're discussing is already there today.

Emily

On Tue, Feb 27, 2018, 6:22 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi,
>
> Please find my comments inline
>
> Regards
>
> Ratan Gupta
>
>
>
> On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth wrote:
> > I am working on an issue openbmc/openbmc#2500 (Add support for Turbo
> > allowed sensor). As part of this issue implementation , there is a
> > requirement  to change this IPMI sensor to read only for host.
> > Currently all sensors are read/write by design and doesn=E2=80=99t have=
 way to
> > change this behavior. Planing to change this behavior by adding
> > =E2=80=9CMutability=E2=80=9D field in the config.yaml.
>
ES: The Mutability field already exists in sensor config yaml.
https://github.com/openbmc/phosphor-host-ipmid/blob/2e12a31f39d95c381a466e2=
77e510faa02c351fb/scripts/writesensor.mako.cpp#L68

> >
> > As part of this issue am planing to  Initialize  mutability with
> > Mutability::Write|Mutability::Read for all sensors and set the
> > required sensor mutability Mutability::Read.
>
ES: You're saying you'd like to ensure all sensors are readable? This
doesn't make sense in some cases, notably fan PWM in some cases where the
only read response would be DBus parroting back what we wrote (not an
actual value reflecting reality).

> >       - Minimal impact on testing and not breaking the existing
> > functionality.
> RG>>How we would be doing it? If we are planning to do introduce a check
> for a specific sensor then we should not do like this.
> In the current design we have not introduced any such checks and we
> should avoid that.
> Please correct me if I misunderstood it.
> >
> > Follow-on story is needed to fix this in generic way like
> >   -Add =E2=80=9Cmutable=E2=80=9D field in the config.yaml and initializ=
e the the field
>
ES: Today it's defaulted to read-only for all uninitialized sensors.

> > based on System types also update
> > sensorhandler.cpp->ipmi_sen_set_sensor() to do set only for write
> > enabled sensor.
> >     - This required system specific IPMI sensor behavior review and
> > updates in corresponding config.yaml.
> RG>> I agree with this approach.What do you mean by "System types"
> here,We have already system specfic YAML in the system specfic meta layer=
s.
>
> >
> > Please add your view on this.
>
>

--001a114351aa0f2fd005663363f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jayanath,<div><br></div><div>Find my comments inline.</div><div><br></di=
v><div>It seems you may be thinking of only changes for a system specific y=
aml, in which case I don&#39;t think you need to ask for permission :) But =
the architecture you&#39;re discussing is already there today.</div><div><b=
r></div><div>Emily</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Tue, Feb 27, 2018, 6:22 AM Ratan Gupta &lt;<a href=3D"mailto:ratagupt@=
linux.vnet.ibm.com">ratagupt@linux.vnet.ibm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Hi,<br>
<br>
Please find my comments inline<br>
<br>
Regards<br>
<br>
Ratan Gupta<br>
<br>
<br>
<br>
On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth wrote:<br>
&gt; I am working on an issue openbmc/openbmc#2500 (Add support for Turbo<b=
r>
&gt; allowed sensor). As part of this issue implementation , there is a<br>
&gt; requirement=C2=A0 to change this IPMI sensor to read only for host.<br=
>
&gt; Currently all sensors are read/write by design and doesn=E2=80=99t hav=
e way to<br>
&gt; change this behavior. Planing to change this behavior by adding<br>
&gt; =E2=80=9CMutability=E2=80=9D field in the config.yaml.<br></blockquote=
></div><div>ES: The Mutability field already exists in sensor config yaml.=
=C2=A0<a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/2e12a3=
1f39d95c381a466e277e510faa02c351fb/scripts/writesensor.mako.cpp#L68">https:=
//github.com/openbmc/phosphor-host-ipmid/blob/2e12a31f39d95c381a466e277e510=
faa02c351fb/scripts/writesensor.mako.cpp#L68</a></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
&gt;<br>
&gt; As part of this issue am planing to=C2=A0 Initialize=C2=A0 mutability =
with<br>
&gt; Mutability::Write|Mutability::Read for all sensors and set the<br>
&gt; required sensor mutability Mutability::Read.<br></blockquote></div><di=
v dir=3D"auto">ES: You&#39;re saying you&#39;d like to ensure all sensors a=
re readable? This doesn&#39;t make sense in some cases, notably fan PWM in =
some cases where the only read response would be DBus parroting back what w=
e wrote (not an actual value reflecting reality).</div><div class=3D"gmail_=
quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Minimal impact on testing and not breaking=
 the existing<br>
&gt; functionality.<br>
RG&gt;&gt;How we would be doing it? If we are planning to do introduce a ch=
eck<br>
for a specific sensor then we should not do like this.<br>
In the current design we have not introduced any such checks and we<br>
should avoid that.<br>
Please correct me if I misunderstood it.<br>
&gt;<br>
&gt; Follow-on story is needed to fix this in generic way like<br>
&gt;=C2=A0 =C2=A0-Add =E2=80=9Cmutable=E2=80=9D field in the config.yaml an=
d initialize the the field<br></blockquote></div><div dir=3D"auto">ES: Toda=
y it&#39;s defaulted to read-only for all uninitialized sensors.</div><div =
class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; based on System types also update<br>
&gt; sensorhandler.cpp-&gt;ipmi_sen_set_sensor() to do set only for write<b=
r>
&gt; enabled sensor.<br>
&gt;=C2=A0 =C2=A0 =C2=A0- This required system specific IPMI sensor behavio=
r review and<br>
&gt; updates in corresponding config.yaml.<br>
RG&gt;&gt; I agree with this approach.What do you mean by &quot;System type=
s&quot;<br>
here,We have already system specfic YAML in the system specfic meta layers.=
<br>
<br>
&gt;<br>
&gt; Please add your view on this.<br>
<br>
</blockquote></div></div>

--001a114351aa0f2fd005663363f8--
