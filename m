Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::235; helo=mail-wr0-x235.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="narCiome"; 
 dkim-atps=neutral
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com
 [IPv6:2a00:1450:400c:c0c::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409DJq1JWBzF27q
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 12:42:02 +1100 (AEDT)
Received: by mail-wr0-x235.google.com with SMTP id z73so20725919wrb.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zEnQ2HT/P9DX4mj/c0aoAsZqhfF3FZWRvGn28voEiEE=;
 b=narCiomeMGfn+/dKD6MISOFTtvdmJgogdQzBcAKjCukYng7MZrnrtrM07betb7JZAv
 6mSBkE9/kW1TVwDTt8aykakXInXyx3E92qp98MIxUSBwSQkSaotmIAhiUlg30eT9HAMC
 D8r+QQ0/ctGdTW8mydNEOeZTPlkrGeCLADrVai+pRyYfjcjAMdFUk9/0gikPbb5Gki+N
 X4a4jqT8dvrpAznh3HvqzFpWbtG+wF/lF7HeUSm7bh1FfgOOgyaPl6SA30WVd8I0GApI
 0nQ32ncP116L1SP8VQAOYG+0Ua7CrHOkptkpwPh1hGVIW/cK1vMLPP5iJAZpL6Xc+7WQ
 mIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zEnQ2HT/P9DX4mj/c0aoAsZqhfF3FZWRvGn28voEiEE=;
 b=R1K0nPfWXG/2PeKyOlfSpS+n7RSdp0LeBDX6vZYfYaN1yab+qvlZDuhKFHda44YWG0
 LetJ9xPg5WCaNAInyYwyGpbbt/gSTqnb1GHi+eh0anQS/GSnXovOgF2RL/38Hjvd1n55
 MlcmL31BkGxWumCQzY4LR2hTGjJjzjLffOW57B7yXaF1FNjR11NznlbaA9NpnZcAPgEK
 GTTfPrehsfcy1bJYMFfDPbRDbnMG8U1mfXgWXNyI5+tHx9CYEnmjPa0sbGwwIY1Wig5B
 UlJYjr5+3XXD297V767Oua11vXDE9KIxu/5os0K+tt0lky4uvXggtTnohHYDDk93MO4D
 tO1g==
X-Gm-Message-State: AElRT7HBCaPW2/Mj4TIfVlsuEHdpQSNKuwU827AJJukB4EKWOpZBmWV9
 I44ICKQAnLabTwNVSK2XDMxv9a61xkpWB28VIs1I5sDq
X-Google-Smtp-Source: AIpwx4+T369cknymgQDRVCZCa/hBpscVSwxM2bahdRwnr61PbTlwMxcQe3D3cu0+sv+tX9Lj3sWquIOsKEGs4BJp95k=
X-Received: by 10.223.200.144 with SMTP id k16mr318910wrh.171.1522114919440;
 Mon, 26 Mar 2018 18:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
In-Reply-To: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 27 Mar 2018 01:41:48 +0000
Message-ID: <CAJoAoZnuJvrOSh7dxN7rx0o-y0_KG8w4Y4+wBwyWXKAVsxg=Dg@mail.gmail.com>
Subject: Re: Implement IPMI POH functionality
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="089e082fd69c151c2505685affd1"
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
X-List-Received-Date: Tue, 27 Mar 2018 01:42:04 -0000

--089e082fd69c151c2505685affd1
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 5:00 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi,
>
> I would be explaining a rough idea of how we plan to go about,
> This is related to https://github.com/openbmc/openbmc/issues/2979
>
> Please share your thoughts and feedback on this proposal.
>
> =>we were planning to add the property in the chassis interface
>    which tells that since how many hours chassis was powered on.
>
> =>This property gets updated by internal timer which wakes up after
>    an hour and updates this property if chassis is powered on.
>
>     1) Should we set the uptime to 0 if chassis state has been
> transitioned from
>     PowerOn-->PowerOff
>
>                               or
>
>     2) Don't update this property for the chassis power off duration and
> update
>     this property when the chassis state changes to PowerOn.
>
>     What is community view on this?
>

IMO, it depends on whether clients might be using this uptime to determine
whether the host is on now; or maybe whether they might need to capture the
latest uptime during some crash log that begins after the host goes down.
My gut feeling is that it's correct to set it to zero when it powers off,
and start incrementing it again starting when it powers on.  But I also
suppose it's not feasible to use uptime to determine current host state, if
the value is stored in hours, since it would be almost one full hour before
the value could report the host as "on"....

Is there a use case where someone might want to read the previous uptime,
while the host is still down?


>
>     Our opinion is that we should go with option 2 as other
> implementation(AMI)
>     does the same.
>
> => In factory reset case this property will reset to 0.
>
> =>If BMC has been rebooted due to any reason,This property will not
>    get updated for that duration and when BMC comes back,This timer
>    kicks off and updates this property and it would be cumulative
>    on what was the earlier value before BMC reboot.
>
> => Chassis object would be saved in nonvolatile storage to keep the last
> POH counter value.
>

Would it make sense to store also the real time when it was last updated,
so in case of BMC reboot like above, we could update the value to our best
guess (assuming the host did not also restart while BMC was offline)?


>
> => Get functionality would be allowed,set would not be allowed from IPMI
> interface.
>


>
> Regards
> Ratan Gupta
>
>
>

--089e082fd69c151c2505685affd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Mar 26, 2018 at 5:00 AM Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.=
vnet.ibm.com">ratagupt@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi,<br>
<br>
I would be explaining a rough idea of how we plan to go about,<br>
This is related to <a href=3D"https://github.com/openbmc/openbmc/issues/297=
9" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/=
issues/2979</a><br>
<br>
Please share your thoughts and feedback on this proposal.<br>
<br>
=3D&gt;we were planning to add the property in the chassis interface<br>
=C2=A0 =C2=A0which tells that since how many hours chassis was powered on.<=
br>
<br>
=3D&gt;This property gets updated by internal timer which wakes up after<br=
>
=C2=A0 =C2=A0an hour and updates this property if chassis is powered on.<br=
>
<br>
=C2=A0 =C2=A0 1) Should we set the uptime to 0 if chassis state has been<br=
>
transitioned from<br>
=C2=A0 =C2=A0 PowerOn--&gt;PowerOff<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or<br>
<br>
=C2=A0 =C2=A0 2) Don&#39;t update this property for the chassis power off d=
uration and<br>
update<br>
=C2=A0 =C2=A0 this property when the chassis state changes to PowerOn.<br>
<br>
=C2=A0 =C2=A0 What is community view on this?<br></blockquote><div><br></di=
v><div>IMO, it depends on whether clients might be using this uptime to det=
ermine whether the host is on now; or maybe whether they might need to capt=
ure the latest uptime during some crash log that begins after the host goes=
 down.=C2=A0 My gut feeling is that it&#39;s correct to set it to zero when=
 it powers off, and start incrementing it again starting when it powers on.=
=C2=A0 But I also suppose it&#39;s not feasible to use uptime to determine =
current host state, if the value is stored in hours, since it would be almo=
st one full hour before the value could report the host as &quot;on&quot;..=
..</div><div><br></div><div>Is there a use case where someone might want to=
 read the previous uptime, while the host is still down?</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 Our opinion is that we should go with option 2 as other<br>
implementation(AMI)<br>
=C2=A0 =C2=A0 does the same.<br>
<br>
=3D&gt; In factory reset case this property will reset to 0.<br>
<br>
=3D&gt;If BMC has been rebooted due to any reason,This property will not<br=
>
=C2=A0 =C2=A0get updated for that duration and when BMC comes back,This tim=
er<br>
=C2=A0 =C2=A0kicks off and updates this property and it would be cumulative=
<br>
=C2=A0 =C2=A0on what was the earlier value before BMC reboot.<br>
<br>
=3D&gt; Chassis object would be saved in nonvolatile storage to keep the la=
st<br>
POH counter value.<br></blockquote><div><br></div><div>Would it make sense =
to store also the real time when it was last updated, so in case of BMC reb=
oot like above, we could update the value to our best guess (assuming the h=
ost did not also restart while BMC was offline)?</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
=3D&gt; Get functionality would be allowed,set would not be allowed from IP=
MI<br>
interface.<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards<br>
Ratan Gupta<br>
<br>
<br>
</blockquote></div></div>

--089e082fd69c151c2505685affd1--
