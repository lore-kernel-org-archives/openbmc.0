Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::232; helo=mail-it0-x232.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DTQ6Shh6"; 
 dkim-atps=neutral
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404mVQ2blVzF1XC
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:34:51 +1100 (AEDT)
Received: by mail-it0-x232.google.com with SMTP id b136-v6so5619830iti.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dzn6bbjQsf07UeYtFEwaiJ6G9AhdxcgIe+3DtUs/qPQ=;
 b=DTQ6Shh6H+tqp11C3DEzZ0NUfLNxMoT5O7h9xP3COi2bODdkihuNYWKfhdjpsK5LC4
 SRxzc4Rokh8nusRJYNWmqIMhi0C8LZRgIWhvdTDDlhCcGx9rp2DdqRqKU6Qw5eTKdP7W
 am5DIljN4DesIUvx5/1NLnX9tIXiHR/4LFlLLoD2vz1m3EtXCe4grUlpD3EPY1u5U0VP
 wlclE8zZ0P1V2ej8f5+oLySHhBJ630ymvzDRvvNfZ52zmZ1ghkoP91HodaPQTCK8YCSY
 WDO7h0QGBN8BBBYCQ7o9z5vxGXzxmlqhcCOGAjq35fBkPQQxw1avLeGC+/V0NLbTk45e
 wtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dzn6bbjQsf07UeYtFEwaiJ6G9AhdxcgIe+3DtUs/qPQ=;
 b=YIF8RY3aQFtLoo+HXfc4GNQ5ca2glJM90w4YVYDNSoVHZCyMfp6pjsqWNQC4g7rS0g
 Lo8AVcuhG0cz2LgosGIcW5gONgo5iOVxA110vSzX+gzuNs5XKYNRKGlGmKgPF3vrTON0
 T3OtnIZlKoL9k+Z33uHbkqo2Zo1HNM8dVDLGs/BI1A/tqI2WPIbvh+f1HCe0Vm6mJKc9
 RZAzk0ZmA5/6oAzdIQr11SHWsb7oy3l8DHyfrdvPjfPCMoH/Beq9F2YHsf/7B5ZO/9/v
 Hty77c3cAL+YsLVwKZpC9Ti3vL8yA5ICo9rJAxL0dZSbJVS0fyTrRyg7mreCsSl84P78
 8LBA==
X-Gm-Message-State: AElRT7E3FbGj0sss21Xytoh3u+/fZD/4R3MLZUDM9G2cyqXyZqIXvmSE
 ANS3QAnKwGvaTr/m7O/ErRBfmM9KIEtJUB/vHxKXyw==
X-Google-Smtp-Source: AG47ELs2E0nVj3qQt75Kyk2BEd9RKMrCz5yVhtKdNpRzEYskgnaCj0LdLosMZXcYfLVnQf2ChWiuKXKh0+OZpJ0lZGE=
X-Received: by 2002:a24:7d86:: with SMTP id
 b128-v6mr13225142itc.80.1521488088426; 
 Mon, 19 Mar 2018 12:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
 <87y3iokp44.fsf@linux.vnet.ibm.com>
 <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
 <1c20052d-f274-f821-4a68-591517f62537@linux.vnet.ibm.com>
 <CAJoAoZ=g9p75Y32NeVbhL8CamLbkAinqW9sDa+PVO_3f0DdfBw@mail.gmail.com>
In-Reply-To: <CAJoAoZ=g9p75Y32NeVbhL8CamLbkAinqW9sDa+PVO_3f0DdfBw@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 19 Mar 2018 19:34:22 +0000
Message-ID: <CAGMNF6XP7Pq4A=cxPps9K7OYHEnFE2Ge2u-7nOpng5kwzZWMhQ@mail.gmail.com>
Subject: Re: IPMI SOL performance
To: Emily Shaffer <emilyshaffer@google.com>
Cc: tomjose@linux.vnet.ibm.com, stewart@linux.vnet.ibm.com, 
 vernon.mauery@linux.intel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 bradleyb@us.ibm.com
Content-Type: multipart/alternative; boundary="0000000000000b33dc0567c90d7b"
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
X-List-Received-Date: Mon, 19 Mar 2018 19:34:55 -0000

--0000000000000b33dc0567c90d7b
Content-Type: text/plain; charset="UTF-8"

SOL performance issue aside, there is also an IPMI command for selecting
the boot device. Is that command currently supported in the client in any
way? That might be a more reliable solution than relying on console alone.


On Mon, Mar 19, 2018 at 12:21 PM Emily Shaffer <emilyshaffer@google.com>
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


-- 
Regards,
Kun

--0000000000000b33dc0567c90d7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">SOL performance issue aside, there is also an IPMI command=
 for selecting the boot device. Is that command currently supported in the =
client in any way? That might be a more reliable solution than relying on c=
onsole alone.</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On M=
on, Mar 19, 2018 at 12:21 PM Emily Shaffer &lt;<a href=3D"mailto:emilyshaff=
er@google.com">emilyshaffer@google.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Mon, Mar 19, 2018 at 12:04 PM Tom Joseph &lt;<a href=3D"mai=
lto:tomjose@linux.vnet.ibm.com" target=3D"_blank">tomjose@linux.vnet.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#0000=
00" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class=3D"m_8665263374856410713m_-7501088321281929050moz-cite-prefi=
x">On Tuesday 20 March 2018 12:17 AM,
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--0000000000000b33dc0567c90d7b--
