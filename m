Return-Path: <rlippert@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::22e; helo=mail-qt0-x22e.google.com;
 envelope-from=rlippert@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S9cqplu5"; 
 dkim-atps=neutral
Received: from mail-qt0-x22e.google.com (mail-qt0-x22e.google.com
 [IPv6:2607:f8b0:400d:c0d::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404mWV0C8czF1c4
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:35:49 +1100 (AEDT)
Received: by mail-qt0-x22e.google.com with SMTP id l25so19283346qtj.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VnRrTW3iGig/ggPghs2YbedWPo4sAh+z8/H1kIlc/90=;
 b=S9cqplu57uPjc9TwISqkYBDVNbqlEXj1H3L/o4IwE2LwarAEuJgsEVEvf9kEqzwdQV
 FvpMXh+OKLddDJh9Pbj9WFrGCOwJ0c1Xw1onZ6Z/FGpXUMxQk5otIyFm2MwN499Nbbp4
 3YfQyrHsEhj46/VAi32fnRj3S4WE3qn1U48uq/3AlyQpkQR4plt0tzCuP/fMFpsKaDes
 SzgSoaUUzkkyO1W/0/XkWbj/QdWhvXHlJoKrD5ETXZg5+wlW8U341iGAEZhzVOehYoUI
 gp00RGorOdkE0wYlILnOyVXqWcdblTvg42OpWs83a3JhzsRgFJuQN5C+xMHiJeVapYKh
 EaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VnRrTW3iGig/ggPghs2YbedWPo4sAh+z8/H1kIlc/90=;
 b=i51bOJfeMpfcGukeW5tJG3sGYt7u4skNNq739V3FRIPjb6GSE26RLIClesiws6eziL
 COMt1l6Ka+9imbu4OT+QcLGPdB8Pan/sGWy4fDSwd1+8P4WPP/zzQEfyCsk6ot9ko0+f
 yd+UwLeGWPvAhWUyQtzQ3sBVcSHnfeut5qsO0EMBoYdjnpGitWdVcubiICXYm8URv5sK
 uP/ct3vTAbcsaBog6HHsSAqSfWP8aRCIzuNwfIL1nE2oJk2oxn7JRYmbG3GNQkElhUYO
 2DEDC9AyJtIH7wLRpWc3GvfJl3BQiIs+Xy5f3Pid5UPbdoF+QTRfFAirSN2OvcSe/zmM
 eMpQ==
X-Gm-Message-State: AElRT7FL9pN/d7X5580zr7KtCW2wwujbBok4u34WyelQxQDIcJ0nl5ZO
 2+ZPP5HPr/mdfYZdZaBOGyDmscKkjV1c6gPRLYbAsQ==
X-Google-Smtp-Source: AG47ELt//LScgY07eBwfsjFfUPBCoHlc4s7CIxXMYWZVkgth2rc7xN+ukpw9yVjUD8mQWGPaz/YMx+Cmf1pW3Xry5BM=
X-Received: by 10.200.23.213 with SMTP id r21mr19749947qtk.314.1521488146463; 
 Mon, 19 Mar 2018 12:35:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.60.15 with HTTP; Mon, 19 Mar 2018 12:35:25 -0700 (PDT)
In-Reply-To: <CAJoAoZ=g9p75Y32NeVbhL8CamLbkAinqW9sDa+PVO_3f0DdfBw@mail.gmail.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
 <87y3iokp44.fsf@linux.vnet.ibm.com>
 <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
 <1c20052d-f274-f821-4a68-591517f62537@linux.vnet.ibm.com>
 <CAJoAoZ=g9p75Y32NeVbhL8CamLbkAinqW9sDa+PVO_3f0DdfBw@mail.gmail.com>
From: Rob Lippert <rlippert@google.com>
Date: Mon, 19 Mar 2018 12:35:25 -0700
Message-ID: <CAFRv3wzUsEFx7ZTkZoGaMa+AfoSXCnjqAmXhRytqA9A7kUPMfA@mail.gmail.com>
Subject: Re: IPMI SOL performance
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Bradley W Bishop <bradleyb@us.ibm.com>, jk@ozlabs.org
Content-Type: multipart/alternative; boundary="94eb2c04f022808a790567c910d1"
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
X-List-Received-Date: Mon, 19 Mar 2018 19:35:50 -0000

--94eb2c04f022808a790567c910d1
Content-Type: text/plain; charset="UTF-8"

Another related issue: https://github.com/openbmc/obmc-console/issues/10

We've worked around this problem internally with that patch mentioned in
the issue but this has the side effect of making the SSH-based console
output just as slowly as the real UART (115200 bps).
The obmc console server can provide "pushback" to the host console by not
draining the host virtual UART until all clients have consumed/ack'ed the
data but I'm not sure this is implemented yet.
But this will make your boot really slow so is a bit of a tradeoff.  Also
some BIOS/firmware I've seen has timeouts on how long it will wait for the
serial port FIFO to become available which can result in dropped characters
if your clients are really slow.

-Rob

On Mon, Mar 19, 2018 at 12:08 PM, Emily Shaffer <emilyshaffer@google.com>
wrote:

>
>
> On Mon, Mar 19, 2018 at 12:04 PM Tom Joseph <tomjose@linux.vnet.ibm.com>
> wrote:
>
>>
>>
>> On Tuesday 20 March 2018 12:17 AM, Emily Shaffer wrote:
>>
>>
>>
>> On Mon, Mar 19, 2018 at 9:27 AM Stewart Smith <stewart@linux.vnet.ibm.com>
>> wrote:
>>
>>> Emily Shaffer <emilyshaffer@google.com> writes:
>>> >> Is it a possibility to just increase the petitboot timeout? Do you
>>> have an
>>> > idea of how much we are missing it by?
>>>
>>> Worst case (may be different currently due to improvements in ipmi
>>> stack) was about 10-15 minutes.
>>
>> Yikes.
>>
>>>
>>
>>
>>> We have different issues on the SSH console though, we can end up
>>> dropping chunks of console output under load (BMC CPU load or high
>>> console usage).
>>>
>>> I think Jeremy can relive the trauma of heading into the TTY layer, but
>>> I wonder if the solution here has something to do with having a
>>> end-to-end flow control story.
>>>
>>> --
>>> Stewart Smith
>>> OPAL Architect, IBM.
>>>
>>>
>> I was looking in the spec and I saw that the packet length for SOL is
>> configurable in the session header, but I didn't find the layout for the
>> header.  It's definitely not configurable past 255B?
>>
>>
>> Even though character data field is a variable length field, the accepted
>> character count in the SOL payload is a single byte. It is based on the
>> accepted character count that console acknowledges to BMC and offset is
>> changed. That is the 255 character limitation mentioned.
>>
>>
>> It really doesn't sound like IPMI is well-suited to this task.  Tom, can
>> you post a proposal for the OEM command you'd like to see, or if you've
>> tried one internally?
>>
>> I haven't tried this option, the OEM option is to bump the accepted
>> character count field. It will need changes on the clients (like ipmitool).
>>
>> I don't know that this is the right approach, as it would break anybody
> trying to use OpenBMC with their own copy of ipmitool.  I'd rather see an
> entirely separate OEM command that we can tailor to our needs (for example,
> if we are expecting ACK/NACK with SOL in the form of another IPMI command,
> does it make more sense to just use TCP in an OEM command instead), either
> leaving the slow per-spec approach up as best-effort, or adding some
> warning to anyone trying to use it that we've added an improved OEM
> command.  Just my two cents...
>
>

--94eb2c04f022808a790567c910d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another related issue:=C2=A0<a href=3D"https://github.com/=
openbmc/obmc-console/issues/10">https://github.com/openbmc/obmc-console/iss=
ues/10</a><div><br></div><div>We&#39;ve worked around this problem internal=
ly with that patch mentioned in the issue but this has the side effect of m=
aking the SSH-based console output just as slowly as the real UART (115200 =
bps).</div><div>The obmc console server can provide &quot;pushback&quot; to=
 the host console by not draining the host virtual UART until all clients h=
ave consumed/ack&#39;ed the data but I&#39;m not sure this is implemented y=
et.</div><div>But this will make your boot really slow so is a bit of a tra=
deoff.=C2=A0 Also some BIOS/firmware I&#39;ve seen has timeouts on how long=
 it will wait for the serial port FIFO to become available which can result=
 in dropped characters if your clients are really slow.</div><div><br></div=
><div>-Rob</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Mon, Mar 19, 2018 at 12:08 PM, Emily Shaffer <span dir=3D"ltr">&lt;=
<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@g=
oogle.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><br><div class=3D"gmail_quote"><div><div class=3D"h5"><div dir=
=3D"ltr">On Mon, Mar 19, 2018 at 12:04 PM Tom Joseph &lt;<a href=3D"mailto:=
tomjose@linux.vnet.ibm.com" target=3D"_blank">tomjose@linux.vnet.ibm.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000" =
bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-6351343453046240934m_-7501088321281929050moz-cite-pref=
ix">On Tuesday 20 March 2018 12:17 AM,
      Emily Shaffer wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr">On Mon, Mar 19, 2018 at 9:27 AM Stewart Smith
            &lt;<a href=3D"mailto:stewart@linux.vnet.ibm.com" target=3D"_bl=
ank">stewart@linux.vnet.ibm.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Emily
            Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" target=
=3D"_blank">emilyshaffer@google.com</a>&gt;
            writes:<br>
            &gt;&gt; Is it a possibility to just increase the petitboot
            timeout? Do you have an<br>
            &gt; idea of how much we are missing it by?<br>
            <br>
            Worst case (may be different currently due to improvements
            in ipmi<br>
            stack) was about 10-15 minutes.</blockquote>
          <div>Yikes.=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">=C2=A0</blockquote>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <br>
            We have different issues on the SSH console though, we can
            end up<br>
            dropping chunks of console output under load (BMC CPU load
            or high<br>
            console usage).<br>
            <br>
            I think Jeremy can relive the trauma of heading into the TTY
            layer, but<br>
            I wonder if the solution here has something to do with
            having a<br>
            end-to-end flow control story.<br>
            <br>
            --<br>
            Stewart Smith<br>
            OPAL Architect, IBM.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>I was looking in the spec and I saw that the packet
            length for SOL is configurable in the session header, but I
            didn&#39;t find the layout for the header.=C2=A0 It&#39;s defin=
itely not
            configurable past 255B?</div>
        </div>
      </div>
    </blockquote>
    <br></div><div text=3D"#000000" bgcolor=3D"#FFFFFF">
    Even though character data field is a variable length field, the
    accepted character count in the SOL payload is a single byte. It is
    based on the accepted character count that console acknowledges to
    BMC and offset is changed. That is the 255 character limitation
    mentioned.</div><div text=3D"#000000" bgcolor=3D"#FFFFFF"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>It really doesn&#39;t sound like IPMI is well-suited to this
            task.=C2=A0 Tom, can you post a proposal for the OEM command
            you&#39;d like to see, or if you&#39;ve tried one internally?</=
div>
        </div>
      </div>
    </blockquote></div><div text=3D"#000000" bgcolor=3D"#FFFFFF">
    I haven&#39;t tried this option, the OEM option is to bump the accepted
    character count field. It will need changes on the clients (like
    ipmitool).<br>
    <br></div></blockquote></div></div><div>I don&#39;t know that this is t=
he right approach, as it would break anybody trying to use OpenBMC with the=
ir own copy of ipmitool.=C2=A0 I&#39;d rather see an entirely separate OEM =
command that we can tailor to our needs (for example, if we are expecting A=
CK/NACK with SOL in the form of another IPMI command, does it make more sen=
se to just use TCP in an OEM command instead), either leaving the slow per-=
spec approach up as best-effort, or adding some warning to anyone trying to=
 use it that we&#39;ve added an improved OEM command.=C2=A0 Just my two cen=
ts...</div><div>=C2=A0</div></div></div>
</blockquote></div><br></div>

--94eb2c04f022808a790567c910d1--
