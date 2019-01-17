Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JIvqqMjh"; 
 dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g7gn5w5yzDqg9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 13:44:05 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id y56so7107500edd.11
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 18:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=70PmUCzfxpPq5XlH9xsQtOZafbt0bfTR2JoASLkxiY4=;
 b=JIvqqMjhlbIU7eOLON6j+JwcWEjmenc0/a2/nr/Cvk4S/Xx7IjVShWc/MYKgAnaj7G
 1DVyUyv8T52G23JyNDyK/HDMznwjEZkCXItMI7RblxfdMNH2hGoWp6xx9fw8iNjYvVe5
 tLz+rM58WiBH6T8vIZ6n1CPVT7+2tQenFqjWaF75BM0QNSp1ZnY0ZoJF+CXSdUsTUPHz
 xBGx3REKyFWuDb5Q6RUIputUynuPG51jz1NsiFjmkGIY8w+mUX8MfI4zHpUZFq+qWU9/
 BjFdw5+0U5Bn00/iQPb06dzA8WFgS10C/T9mhFcTdxB+sh9OlnAp/zsCsy1myBgrkcDV
 tPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=70PmUCzfxpPq5XlH9xsQtOZafbt0bfTR2JoASLkxiY4=;
 b=cHwzUTqfdNVFGqMh7X/JKwcbAC2NSzF9GEL/iIUoXA1GMKUkrAGv13SDnm79QmhhMA
 mZV0yU86svu/Wb+wO/5GyONaCbUwfH5l/5WwbnretBR10UXqr6Ke9RIesJkmuPsElQVB
 FKtCHZvY7ojb1VagHXFGRGpCKl/11I8a71cRaNlRFyJJibBICdyZINgaHSv9xF3HfX6T
 COdrj6h7EvSc3CDi97n/ouT5/IrRSo5/zPWsbRcUpfjaquu7Eh6V7QiY4q9nZZ6P6csW
 BwiWaQnBgI7ZxtgbcR2Etq7EMRsDSyYgdO+Pd1+xzmhLyy55f0jV20Pin3XRmUOTFY3A
 8ZMw==
X-Gm-Message-State: AJcUuke4rkzC2/kbHdVwACwh8mu21wfq4qPuGwJcpfbRZA7IgH40sIPe
 Wrm65vzmBLaz4Ps2LEap3DIOYGqLrKGH9lUA41lwLw==
X-Google-Smtp-Source: ALg8bN4T0mLkUgjpesR35JVA6KdMnf94nqN+r9/lqD0FUSydi28EwnYb6fXHjNlGMxAifIyiDZUDOHu7NKmmYQ//fw0=
X-Received: by 2002:a50:d797:: with SMTP id w23mr10122016edi.19.1547693041739; 
 Wed, 16 Jan 2019 18:44:01 -0800 (PST)
MIME-Version: 1.0
References: <tencent_733318C72C90AEE322AE1889@qq.com>
In-Reply-To: <tencent_733318C72C90AEE322AE1889@qq.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 16 Jan 2019 21:43:48 -0500
Message-ID: <CABoTLcQFSzTVo8ACNxjhQ+t20e7LDBOO4iWwM1Vsuyf1imjEbw@mail.gmail.com>
Subject: Re: Re: Why can't /dev/ipmi0 on host be created stably
To: xiuzhi <1450335857@qq.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000fa0e06057f9e5de0"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2019 02:44:07 -0000

--000000000000fa0e06057f9e5de0
Content-Type: text/plain; charset="UTF-8"

Hi

I'm not sure what CA3 is, I'm afraid. Can you explain? Or do you have a
reference?

AMI BIOS can be configured to try a number of times to talk with the BMC.
To check whether it's just a timing issue, reboot the host once the BMC is
up and running. I found that just the first boot right after power on
exposed the issue. Subsequent reboots without power cycle were not fine.

Is that the case for you, too?

Also, I'm not sure whether the problem I observed is even applicable to KCS.

Oskar.

On Wed, Jan 16, 2019, 9:27 PM xiuzhi <1450335857@qq.com wrote:

> Hi Oskar,
>    I asked the BIOS developer, he said the BIOS read the io CA3 firstly,
> if it is not 0x00, the BIOS will think the ipmi doesn't exist.
>   I input the command " mm -io CA3" in BIOS, it return the 0x04 every
> times, so it's pointless for BIOS to wait the BMC answer.
>   I user ipmi-kcs mode.
>
> Best,
> xiuzhi
> Hi Oskar,
>    I use opensource UEFI BIOS and AMI BIOS to test. I am able to modify
> the code of UEFI BIOS.
>    How should I change the BIOS code to ensure the synchronization between
> the two sides so that I can tell my BIOS team to modify it?
>
> Best,
> xiuzhi
>
>
> ------------------ Original ------------------
> *From: * "Oskar Senft";<osk@google.com>;
> *Send time:* Wednesday, Jan 16, 2019 10:10 PM
> *To:* "xiuzhi"<1450335857@qq.com>;
> *Cc:* "openbmc"<openbmc@lists.ozlabs.org>;
> *Subject: * Re: Why can't /dev/ipmi0 on host be created stably
>
> Hi Xiuzhi
>
> The following observation may or may not be related to your problem:
>
> We're using AMI BIOS with OpenBMC using the IPMI BT mode. I found that in
> certain cases the host and BMC can get "out of sync" wrt. what the BMC put
> in the message queue and what the BIOS expects. The problem can be caused
> by the BMC responding "slowly" to an IPMI request from the BIOS where the
> BIOS times out before the BMC responds. The BMC then responds before the
> BIOS issues the next request, which causes the BIOS to read the previous
> response as the response for the latest request.
>
> This has resulted in all sorts of weird behavior for us, incl. the BIOS
> not "detecting" the BMC and therefore not exposing it in the SMBIOS tables,
> which - in our case - is the configuration source for the Linux IPMI driver.
>
> I hope this helps?
>
> What BIOS are you using? Are you able to make changes to the BIOS code?
>
> Oskar.
>
> On Tue, Jan 15, 2019 at 9:33 PM xiuzhi <1450335857@qq.com> wrote:
>
>> Hi All,
>>    I am testing the bmc ipmi-kcs reliability.
>>    The /dev/ipmi0 on host will not  be available  in several consecutive
>> bmc reboot test.  The CA3 value is 0x04 which can be got by the command "mm
>> -io ca3" on host bios shell when failing to create the ipmi0  .
>> The CA3 value 0x04 means that SMS_ATN is set to 1, which meas:
>> "Set to 1 when the BMC has one or more messages in the Receive Message
>> Queue, or when a watchdog timer pre-timeout, or event message buffer full
>> condition exists [2] . OEMs may also elect to set this flag is one of the
>> OEM 1, 2,or 3 flags from the Get Message Flags command becomes set. R/O
>> This bit is related to indicating when the BMC is the source of a system
>> interrupt. Refer to sections 9.12, KCS Communication and Non-communication
>> , 9.13, Physical Interrupt Line Sharing, and 9.14, Additional
>> Specifications for the KCS interface for additional information on the use
>> and requirements for the SMS_ATN bit."
>>  see the Table 9-, KCS Interface Status Register Bits in section 9.7 of
>> Intelligent Platform ManageBment Interface Specification .
>>    What  causes this problem?
>>  Best,
>> Xiuzhi
>>
>

--000000000000fa0e06057f9e5de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m n=
ot sure what CA3 is, I&#39;m afraid. Can you explain? Or do you have a refe=
rence?</div><div dir=3D"auto"><br></div><div dir=3D"auto">AMI BIOS can be c=
onfigured to try a number of times to talk with the BMC. To check whether i=
t&#39;s just a timing issue, reboot the host once the BMC is up and running=
. I found that just the first boot right after power on exposed the issue. =
Subsequent reboots without power cycle were not fine.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Is that the case for you, too?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Also, I&#39;m not sure whether the pr=
oblem I observed is even applicable to KCS.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Oskar.</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Wed, Jan 16, 2019, 9:27 PM xiuzhi &lt;<a href=3D"mailto:14503=
35857@qq.com">1450335857@qq.com</a> wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div>Hi Oskar,</div><div>=C2=A0 =C2=A0I asked the BIOS developer, h=
e said the BIOS read the io CA3 firstly, if it is not 0x00, the BIOS will t=
hink the ipmi doesn&#39;t exist.</div><div>=C2=A0 I input the command &quot=
; mm -io CA3&quot; in BIOS, it return the 0x04 every times, so it&#39;s poi=
ntless for BIOS to wait the BMC answer.</div><div>=C2=A0 I user ipmi-kcs mo=
de.</div><div><br></div><div>Best,</div><div>xiuzhi</div><div>Hi Oskar,</di=
v><div>=C2=A0 =C2=A0I use opensource UEFI BIOS and AMI BIOS to test. I am a=
ble to modify the code of UEFI BIOS. </div><div>=C2=A0 =C2=A0How should I c=
hange the BIOS code to ensure the synchronization between the two sides so =
that I can tell my BIOS team to modify it?=C2=A0 </div><div><br></div><div>=
Best,</div><div>xiuzhi=C2=A0 =C2=A0</div><div><div><br></div><div><br></div=
><div style=3D"font-size:12px;font-family:Arial Narrow;padding:2px 0 2px 0"=
>------------------ Original ------------------</div><div style=3D"font-siz=
e:12px;background:#efefef;padding:8px"><div><b>From: </b>=C2=A0&quot;Oskar =
Senft&quot;;&lt;<a href=3D"mailto:osk@google.com" target=3D"_blank" rel=3D"=
noreferrer">osk@google.com</a>&gt;;</div><div><b>Send time:</b>=C2=A0Wednes=
day, Jan 16, 2019 10:10 PM</div><div><b>To:</b>=C2=A0&quot;xiuzhi&quot;&lt;=
<a href=3D"mailto:1450335857@qq.com" target=3D"_blank" rel=3D"noreferrer">1=
450335857@qq.com</a>&gt;; </div><div><b>Cc:</b>=C2=A0&quot;openbmc&quot;&lt=
;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noref=
errer">openbmc@lists.ozlabs.org</a>&gt;; </div><div><b>Subject: </b>=C2=A0R=
e: Why can&#39;t /dev/ipmi0 on host be created stably</div></div><div><br><=
/div><div dir=3D"ltr">Hi Xiuzhi<div><br></div><div>The following observatio=
n may or may not be related to your problem:</div><div><br></div><div>We&#3=
9;re using AMI BIOS with OpenBMC using the IPMI BT mode. I found that in ce=
rtain cases the host and BMC can get &quot;out of sync&quot; wrt. what the =
BMC put in the message queue and what the BIOS expects. The problem can be =
caused by the BMC responding &quot;slowly&quot; to an IPMI request from the=
 BIOS where the BIOS times out before the BMC responds. The BMC then respon=
ds before the BIOS issues the next request, which causes the BIOS to read t=
he previous response as the response for the latest request.</div><div><br>=
</div><div>This has resulted in all sorts of weird behavior for us, incl. t=
he BIOS not &quot;detecting&quot; the BMC and therefore not exposing it in =
the SMBIOS tables, which - in our case - is the configuration source for th=
e Linux IPMI driver.</div><div><br></div><div>I hope this helps?</div><div>=
<br></div><div>What BIOS are you using? Are you able to make changes to the=
 BIOS code?</div><div><br></div><div>Oskar.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Tue, Jan 15, 2019 at 9:33 PM xiuzhi &lt;<a h=
ref=3D"mailto:1450335857@qq.com" target=3D"_blank" rel=3D"noreferrer">14503=
35857@qq.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div>Hi All,</div><div>=C2=A0 =C2=A0I am testing the bmc ipmi-k=
cs reliability.</div><div>=C2=A0 =C2=A0The /dev/ipmi0 on host will not=C2=
=A0 be available=C2=A0 in several consecutive bmc reboot test.=C2=A0 The CA=
3 value is 0x04 which can be got by the command &quot;mm -io ca3&quot; on h=
ost bios shell when failing to create the ipmi0=C2=A0 .</div><div>The CA3 v=
alue 0x04 means that SMS_ATN is set to 1, which meas:</div><div><div>&quot;=
Set to 1 when the BMC has one or more messages in the Receive Message Queue=
, or when a watchdog timer pre-timeout, or event message buffer full condit=
ion exists [2] . OEMs may also elect to set this flag is one of the OEM 1, =
2,or 3 flags from the Get Message Flags command becomes set. R/O This bit i=
s related to indicating when the BMC is the source of a system interrupt. R=
efer to sections 9.12, KCS Communication and Non-communication , 9.13, Phys=
ical Interrupt Line Sharing, and 9.14, Additional Specifications for the KC=
S interface for additional information on the use and requirements for the =
SMS_ATN bit.&quot;</div></div><div>=C2=A0see the Table 9-, KCS Interface St=
atus Register Bits in section 9.7 of=C2=A0 Intelligent Platform ManageBment=
 Interface Specification .</div><div>=C2=A0 =C2=A0What=C2=A0 causes this pr=
oblem?</div><div>=C2=A0Best,</div><div>Xiuzhi</div></blockquote></div></div=
></blockquote></div>

--000000000000fa0e06057f9e5de0--
