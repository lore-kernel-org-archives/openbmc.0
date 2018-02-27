Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::22b; helo=mail-wr0-x22b.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OE3xQ9QE"; 
 dkim-atps=neutral
Received: from mail-wr0-x22b.google.com (mail-wr0-x22b.google.com
 [IPv6:2a00:1450:400c:c0c::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zrSY91Q8dzF0W4
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 05:54:36 +1100 (AEDT)
Received: by mail-wr0-x22b.google.com with SMTP id v111so13744710wrb.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 10:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z1nUP+0CkaTZbxUdSb+Qoik6aR4hsJVfp2WTNTlxEZg=;
 b=OE3xQ9QEf6duD+tozHSv1kQmLUU+ak/GFbaau2tGmgcI/FjVSLJCLu6mZtgSEF2xML
 BO4lnWtUPMLcnl1ubj3Br6p7+bi+X7tedXmXVcqd1h42GUIyjz2T8vRRztJ5dkKbsUgH
 wO3JCOuBgT1R1eK6/rvmOybsZNzyynMflmX24zaU7AX17g85suZ96cpFGkNBhSsfEqif
 VrIqaZog8wumkeAcqkWNZpbspa2pcpZOvlAyq/lgMauUVe70sTpG+Ep1r1596K8ldrch
 qX92d/agZAw5rELsqTgM4ywwnIOoE/hdwmweLtTCbntkffl2qCFYFRIX68XNg6ms+X6e
 aMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z1nUP+0CkaTZbxUdSb+Qoik6aR4hsJVfp2WTNTlxEZg=;
 b=VLiOOcL5k4kBgmhxZLufZbirVGHXkjS5X73i0EKlFXtHC79sMCN3ni+GWymONFjtT1
 roUENQDkzJ+RMPVQXzcUZkYE9CEOZ8IvEVuXXZ0LKzEJbDxoujMsgSdSVKpzLNQqsMPA
 HMWmUuJSc3OwfzroileadYrwIO9clzamZUc4SpOu6ewdx3/gE8QbUMVZU48NubjlE89O
 AY8oZ55Vv+5/T9bIqke0vDYc/Hb+LkkwqTSWNx/1I9UhMkTt965S9cU9m9CmMwGbEPLD
 oo+jhhMikT/d6wDewxEwT5zmxl5ZnhyI1EI6OQ4RYm36GNiohFt4XaigcU6Mu7ohwrTt
 XwGg==
X-Gm-Message-State: APf1xPAycG5oQLU9L0ECG81bWAlW2l+CUIgobVYGAN56y586kin/7rMo
 Y/jhvQ1z5r0sXpJOxdIYwHIQd5B74H1qG6Nh5PdUQA==
X-Google-Smtp-Source: AH8x226xDFr2g2RgZULGZKjBDys8xUJXCaQpeteBIV4m3CQFCPDnNk+gzQR/WelCpFgwKGMKYdxym0byVWOfQXh0NPY=
X-Received: by 10.223.139.16 with SMTP id n16mr13137885wra.171.1519757673207; 
 Tue, 27 Feb 2018 10:54:33 -0800 (PST)
MIME-Version: 1.0
References: <CACkAXSpRB4Lqhd62u+OUALeqCZpSjGD8xSPwx4yJ+WqFH7jNjA@mail.gmail.com>
 <c2cfb310-7dae-3f99-a1a3-ceac0ab9c1c8@linux.vnet.ibm.com>
 <CAJoAoZn91rnQaB0p_hsJm6Vg4KPSxYxBQH0JAgKV_-Fo-yvqXw@mail.gmail.com>
 <bc816428-ebaa-9c3d-b1e4-ee52c9fbbc6c@linux.vnet.ibm.com>
In-Reply-To: <bc816428-ebaa-9c3d-b1e4-ee52c9fbbc6c@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 27 Feb 2018 18:54:22 +0000
Message-ID: <CAJoAoZkaRkpoa0hxxOwj+CKeu-=uHPtJ1L0PpwEgOZfnopbnng@mail.gmail.com>
Subject: Re: IPMI Sensor Read-only role updates.
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="f403045ea6b2421e490566362814"
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
X-List-Received-Date: Tue, 27 Feb 2018 18:54:38 -0000

--f403045ea6b2421e490566362814
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay, I guess I didn't understand that the proposal was for the MRW config
yaml, which is different from the config yaml which is sent to the mako
template :) Carry on.

On Tue, Feb 27, 2018 at 10:48 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi Emily,
>
> Minor correction inline.
>
> Regards
>
> Ratan
> On Tuesday 27 February 2018 09:06 PM, Emily Shaffer wrote:
>
> Hi Jayanath,
>
> Find my comments inline.
>
> It seems you may be thinking of only changes for a system specific yaml,
> in which case I don't think you need to ask for permission :) But the
> architecture you're discussing is already there today.
>
> Emily
>
> On Tue, Feb 27, 2018, 6:22 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
> wrote:
>
>> Hi,
>>
>> Please find my comments inline
>>
>> Regards
>>
>> Ratan Gupta
>>
>>
>>
>> On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth wrote:
>> > I am working on an issue openbmc/openbmc#2500 (Add support for Turbo
>> > allowed sensor). As part of this issue implementation , there is a
>> > requirement  to change this IPMI sensor to read only for host.
>> > Currently all sensors are read/write by design and doesn=E2=80=99t hav=
e way to
>> > change this behavior. Planing to change this behavior by adding
>> > =E2=80=9CMutability=E2=80=9D field in the config.yaml.
>>
> ES: The Mutability field already exists in sensor config yaml.
> https://github.com/openbmc/phosphor-host-ipmid/blob/2e12a31f39d95c381a466=
e277e510faa02c351fb/scripts/writesensor.mako.cpp#L68
>
>     RG>> Here in mako we always set the mutability property to READ as
> config YAML doesn't have the Mutability property.
>
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recip=
es-phosphor/ipmi/phosphor-ipmi-sensor-inventory-mrw-config/config.yaml
>
>     RG>>We have the Mutability check in the getSensorReading but we don't
> have that check in the setSensorReading so we can introduce that check
> there with the required changes in the config.YAML.
>
>
> >
>> > As part of this issue am planing to  Initialize  mutability with
>> > Mutability::Write|Mutability::Read for all sensors and set the
>> > required sensor mutability Mutability::Read.
>>
> ES: You're saying you'd like to ensure all sensors are readable? This
> doesn't make sense in some cases, notably fan PWM in some cases where the
> only read response would be DBus parroting back what we wrote (not an
> actual value reflecting reality).
>
>> >       - Minimal impact on testing and not breaking the existing
>> > functionality.
>> RG>>How we would be doing it? If we are planning to do introduce a check
>> for a specific sensor then we should not do like this.
>> In the current design we have not introduced any such checks and we
>> should avoid that.
>> Please correct me if I misunderstood it.
>>
>   RG>>if we add the Mutability property in the config.yaml with configure=
d
> values as READ and WRITE for all other sensor
>             Except this one(turboAllowedSensor) which is required to be
> READ
>             In this sense we are not breaking the current code as the
> interpretation in the code for all the sensor is READ and WRITE
>
> >
>> > Follow-on story is needed to fix this in generic way like
>> >   -Add =E2=80=9Cmutable=E2=80=9D field in the config.yaml and initiali=
ze the the field
>>
> ES: Today it's defaulted to read-only for all uninitialized sensors.
>
>> > based on System types also update
>> > sensorhandler.cpp->ipmi_sen_set_sensor() to do set only for write
>> > enabled sensor.
>> >     - This required system specific IPMI sensor behavior review and
>> > updates in corresponding config.yaml.
>> RG>> I agree with this approach.What do you mean by "System types"
>> here,We have already system specfic YAML in the system specfic meta
>> layers.
>>
>> >
>> > Please add your view on this.
>>
>>
>

--f403045ea6b2421e490566362814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, I guess I didn&#39;t understand that the proposal wa=
s for the MRW config yaml, which is different from the config yaml which is=
 sent to the mako template :) Carry on.</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr">On Tue, Feb 27, 2018 at 10:48 AM Ratan Gupta &lt;<a href=
=3D"mailto:ratagupt@linux.vnet.ibm.com">ratagupt@linux.vnet.ibm.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hi Emily,</p>
    <p>Minor correction inline.</p>
    <p>Regards</p>
    <p>Ratan <br>
    </p></div><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"m_4260300121557723900moz-cite-prefix">On Tuesday 27 Febru=
ary 2018 09:06 PM,
      Emily Shaffer wrote:<br>
    </div>
    <blockquote type=3D"cite">Hi Jayanath,
      <div><br>
      </div>
      <div>Find my comments inline.</div>
      <div><br>
      </div>
      <div>It seems you may be thinking of only changes for a system
        specific yaml, in which case I don&#39;t think you need to ask for
        permission :) But the architecture you&#39;re discussing is already
        there today.</div>
      <div><br>
      </div>
      <div>Emily</div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr">On Tue, Feb 27, 2018, 6:22 AM Ratan Gupta &lt;<a=
 href=3D"mailto:ratagupt@linux.vnet.ibm.com" target=3D"_blank"><a class=3D"=
m_4260300121557723900moz-txt-link-abbreviated" href=3D"mailto:ratagupt@linu=
x.vnet.ibm.com" target=3D"_blank">ratagupt@linux.vnet.ibm.com</a></a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi,<br>
            <br>
            Please find my comments inline<br>
            <br>
            Regards<br>
            <br>
            Ratan Gupta<br>
            <br>
            <br>
            <br>
            On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth
            wrote:<br>
            &gt; I am working on an issue openbmc/openbmc#2500 (Add
            support for Turbo<br>
            &gt; allowed sensor). As part of this issue implementation ,
            there is a<br>
            &gt; requirement=C2=A0 to change this IPMI sensor to read only
            for host.<br>
            &gt; Currently all sensors are read/write by design and
            doesn=E2=80=99t have way to<br>
            &gt; change this behavior. Planing to change this behavior
            by adding<br>
            &gt; =E2=80=9CMutability=E2=80=9D field in the config.yaml.<br>
          </blockquote>
        </div>
        <div>ES: The Mutability field already exists in sensor config
          yaml.=C2=A0<a href=3D"https://github.com/openbmc/phosphor-host-ip=
mid/blob/2e12a31f39d95c381a466e277e510faa02c351fb/scripts/writesensor.mako.=
cpp#L68" target=3D"_blank">https://github.com/openbmc/phosphor-host-ipmid/b=
lob/2e12a31f39d95c381a466e277e510faa02c351fb/scripts/writesensor.mako.cpp#L=
68</a></div>
      </div>
    </blockquote></div><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    =C2=A0=C2=A0=C2=A0 RG&gt;&gt; Here in mako we always set the mutability=
 property to
    READ as config YAML doesn&#39;t have the Mutability property.<br>
    =C2=A0=C2=A0=C2=A0
<a class=3D"m_4260300121557723900moz-txt-link-freetext" href=3D"https://git=
hub.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/i=
pmi/phosphor-ipmi-sensor-inventory-mrw-config/config.yaml" target=3D"_blank=
">https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recip=
es-phosphor/ipmi/phosphor-ipmi-sensor-inventory-mrw-config/config.yaml</a><=
br>
    <br>
    =C2=A0=C2=A0=C2=A0 RG&gt;&gt;We have the Mutability check in the getSen=
sorReading
    but we don&#39;t have that check in the setSensorReading so we can
    introduce that check there with the required changes in the
    config.YAML.=C2=A0=C2=A0=C2=A0 <br></div><div bgcolor=3D"#FFFFFF" text=
=3D"#000000">
    =C2=A0=C2=A0 <br>
    <blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            &gt;<br>
            &gt; As part of this issue am planing to=C2=A0 Initialize=C2=A0
            mutability with<br>
            &gt; Mutability::Write|Mutability::Read for all sensors and
            set the<br>
            &gt; required sensor mutability Mutability::Read.<br>
          </blockquote>
        </div>
        <div dir=3D"auto">ES: You&#39;re saying you&#39;d like to ensure al=
l
          sensors are readable? This doesn&#39;t make sense in some cases,
          notably fan PWM in some cases where the only read response
          would be DBus parroting back what we wrote (not an actual
          value reflecting reality).</div>
        <div class=3D"gmail_quote" dir=3D"auto">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Minimal impact on testing and =
not breaking the
            existing<br>
            &gt; functionality.<br>
            RG&gt;&gt;How we would be doing it? If we are planning to do
            introduce a check<br>
            for a specific sensor then we should not do like this.<br>
            In the current design we have not introduced any such checks
            and we<br>
            should avoid that.<br>
            Please correct me if I misunderstood it.<br>
          </blockquote>
        </div>
      </div>
    </blockquote></div><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    =C2=A0 RG&gt;&gt;if we add the Mutability property in the config.yaml
    with configured values as READ and WRITE for all other sensor<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Exce=
pt this one(turboAllowedSensor) which is required to
    be READ<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In t=
his sense we are not breaking the current code as
    the interpretation in the code for all the sensor is READ and WRITE</di=
v><div bgcolor=3D"#FFFFFF" text=3D"#000000"><br>
    <blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote" dir=3D"auto">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            &gt;<br>
            &gt; Follow-on story is needed to fix this in generic way
            like<br>
            &gt;=C2=A0 =C2=A0-Add =E2=80=9Cmutable=E2=80=9D field in the co=
nfig.yaml and
            initialize the the field<br>
          </blockquote>
        </div>
        <div dir=3D"auto">ES: Today it&#39;s defaulted to read-only for all
          uninitialized sensors.</div>
        <div class=3D"gmail_quote" dir=3D"auto">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            &gt; based on System types also update<br>
            &gt; sensorhandler.cpp-&gt;ipmi_sen_set_sensor() to do set
            only for write<br>
            &gt; enabled sensor.<br>
            &gt;=C2=A0 =C2=A0 =C2=A0- This required system specific IPMI se=
nsor
            behavior review and<br>
            &gt; updates in corresponding config.yaml.<br>
            RG&gt;&gt; I agree with this approach.What do you mean by
            &quot;System types&quot;<br>
            here,We have already system specfic YAML in the system
            specfic meta layers.<br>
            <br>
            &gt;<br>
            &gt; Please add your view on this.<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </div></blockquote></div>

--f403045ea6b2421e490566362814--
