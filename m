Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::231; helo=mail-wr0-x231.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kPJwaytM"; 
 dkim-atps=neutral
Received: from mail-wr0-x231.google.com (mail-wr0-x231.google.com
 [IPv6:2a00:1450:400c:c0c::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404lw1510tzDqwd
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:08:32 +1100 (AEDT)
Received: by mail-wr0-x231.google.com with SMTP id n12so19770437wra.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8EMZftjZZxm++fayykAElNegnpaZisqkiX7FWCEOQ3g=;
 b=kPJwaytMdB8kucqpvKhMYS9XOQrWIQ/HHu9W3+TX+ynRcA8QqOAj085JY+x0mxLLJC
 wLt5BL5cFrtbSNcX363kDZTJaf8C9kewKKUNNRkUXq6bvY21VEJqS6hGqiUqJkcGXZYF
 1TSpLminFx1MV+L4y3y97nNzd/l5S81taBy7Qc1RRu31rJU/chq98vZVktnBU7cShjim
 gh9F6BQtLStMXjG9zGDhPjhveDYYAbVWWH+nWrX/R4rmokeBz8GBXwVQfnDkxyVW8n1l
 ZOK/hHNkrw5/JPiT8SVT8fWGhm6WIo/h77teQ5SbRHeEqfxftQYQm6UqX4RpIbd42TBN
 QJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8EMZftjZZxm++fayykAElNegnpaZisqkiX7FWCEOQ3g=;
 b=t7xzLshQ44mUHiPxsd5Pi0U9tOHy/ns6qEiWjknJ278mCj02vgdbG0MiJlNzHGkHou
 VXtAFVK3kPUF5oGi/1ZKVJ9NDa4DajWdkCwyBTYOn+H5wGW4fK8tLPQM9oCbomeIsMVs
 Oqx49t5uemJKg5TuDCHqbvuONJ/y2u0VWUN0Sk+I5k4IY9rKdS7vYJE+Lf4U5mLLJyMr
 OFZbiEtavGAXkOLyOeCFeYOeHSO9taTbzrd/5AB2wRGSFJ6x9xIzYbF46usodGwyUGRb
 IipY7WFSdqmN18eef5wP+TQ3mtSVCf6wK38sXh8R9LhU5X33gqZHOvJNW/7mKixWHxgB
 Av1A==
X-Gm-Message-State: AElRT7EnjlR+Ic00fNVhco3yfQy6eT2/MNVdlhSiNFoNRdjuSPWqaEVd
 Oq++Ud/LO3Z1wtHVQ3I/xlvUm/hwr9vi3EGyGE59Xw==
X-Google-Smtp-Source: AG47ELtsuO0pJCCeO3fODlCIYZcvCEJWl2bclaD7qJf06lIZoDVhD9pE11M56RDA/ThpUp/3z20m1dA7DU4cgAL/A+U=
X-Received: by 10.223.173.197 with SMTP id w63mr11215379wrc.83.1521486509660; 
 Mon, 19 Mar 2018 12:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
 <87y3iokp44.fsf@linux.vnet.ibm.com>
 <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
 <1c20052d-f274-f821-4a68-591517f62537@linux.vnet.ibm.com>
In-Reply-To: <1c20052d-f274-f821-4a68-591517f62537@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 19 Mar 2018 19:08:18 +0000
Message-ID: <CAJoAoZ=g9p75Y32NeVbhL8CamLbkAinqW9sDa+PVO_3f0DdfBw@mail.gmail.com>
Subject: Re: IPMI SOL performance
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Bradley W Bishop <bradleyb@us.ibm.com>
Content-Type: multipart/alternative; boundary="f403045cf398f0e5a90567c8ae6e"
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
X-List-Received-Date: Mon, 19 Mar 2018 19:08:35 -0000

--f403045cf398f0e5a90567c8ae6e
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 12:04 PM Tom Joseph <tomjose@linux.vnet.ibm.com>
wrote:

>
>
> On Tuesday 20 March 2018 12:17 AM, Emily Shaffer wrote:
>
>
>
> On Mon, Mar 19, 2018 at 9:27 AM Stewart Smith <stewart@linux.vnet.ibm.com>
> wrote:
>
>> Emily Shaffer <emilyshaffer@google.com> writes:
>> >> Is it a possibility to just increase the petitboot timeout? Do you
>> have an
>> > idea of how much we are missing it by?
>>
>> Worst case (may be different currently due to improvements in ipmi
>> stack) was about 10-15 minutes.
>
> Yikes.
>
>>
>
>
>> We have different issues on the SSH console though, we can end up
>> dropping chunks of console output under load (BMC CPU load or high
>> console usage).
>>
>> I think Jeremy can relive the trauma of heading into the TTY layer, but
>> I wonder if the solution here has something to do with having a
>> end-to-end flow control story.
>>
>> --
>> Stewart Smith
>> OPAL Architect, IBM.
>>
>>
> I was looking in the spec and I saw that the packet length for SOL is
> configurable in the session header, but I didn't find the layout for the
> header.  It's definitely not configurable past 255B?
>
>
> Even though character data field is a variable length field, the accepted
> character count in the SOL payload is a single byte. It is based on the
> accepted character count that console acknowledges to BMC and offset is
> changed. That is the 255 character limitation mentioned.
>
>
> It really doesn't sound like IPMI is well-suited to this task.  Tom, can
> you post a proposal for the OEM command you'd like to see, or if you've
> tried one internally?
>
> I haven't tried this option, the OEM option is to bump the accepted
> character count field. It will need changes on the clients (like ipmitool).
>
> I don't know that this is the right approach, as it would break anybody
trying to use OpenBMC with their own copy of ipmitool.  I'd rather see an
entirely separate OEM command that we can tailor to our needs (for example,
if we are expecting ACK/NACK with SOL in the form of another IPMI command,
does it make more sense to just use TCP in an OEM command instead), either
leaving the slow per-spec approach up as best-effort, or adding some
warning to anyone trying to use it that we've added an improved OEM
command.  Just my two cents...

--f403045cf398f0e5a90567c8ae6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Mar 19, 2018 at 12:04 PM Tom Joseph &lt;<a href=3D"mailto:tomjose@linux.v=
net.ibm.com">tomjose@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-7501088321281929050moz-cite-prefix">On Tuesday 20 Marc=
h 2018 12:17 AM,
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
    <br></div></blockquote><div>I don&#39;t know that this is the right app=
roach, as it would break anybody trying to use OpenBMC with their own copy =
of ipmitool.=C2=A0 I&#39;d rather see an entirely separate OEM command that=
 we can tailor to our needs (for example, if we are expecting ACK/NACK with=
 SOL in the form of another IPMI command, does it make more sense to just u=
se TCP in an OEM command instead), either leaving the slow per-spec approac=
h up as best-effort, or adding some warning to anyone trying to use it that=
 we&#39;ve added an improved OEM command.=C2=A0 Just my two cents...</div><=
div>=C2=A0</div></div></div>

--f403045cf398f0e5a90567c8ae6e--
